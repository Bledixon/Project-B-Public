using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using GeoAPI.Geometries;
using NetTopologySuite.GeometriesGraph;

namespace terrain
{
    internal class Terrain
    {
        public const int Size = 2048;

        private static void Show(IEnumerable<MapPolygon> polys, IEnumerable<MapNode> plot)
        {
            var map = new Bitmap(Size, Size);
            using (Graphics g = Graphics.FromImage(map))
            {
                foreach (MapPolygon poly in polys)
                {
                    g.FillPolygon(
                        new SolidBrush(Color.FromArgb(
                            poly.DistanceToCoast == 0 ? 128 : (int) (poly.DistanceToCoast*255), Color.Blue)),
                        poly.Nodes.Select(_ => new PointF((float) (_.X + 1)/2*Size, (float) (_.Y + 1)/2*Size)).ToArray());
                    for (int j = 0; j < poly.Nodes.Length; j++)
                    {
                        MapNode curr = poly.Nodes[j];
                        MapNode prev = j == 0 ? poly.Nodes[poly.Nodes.Length - 1] : poly.Nodes[j - 1];
                        g.DrawLine(Pens.White,
                            (float) (prev.X + 1)/2*Size, (float) (prev.Y + 1)/2*Size,
                            (float) (curr.X + 1)/2*Size, (float) (curr.Y + 1)/2*Size);
                    }
                }
                if (plot != null)
                    foreach (MapNode i in plot)
                        g.FillRectangle(Brushes.Black, (float) (i.X + 1)/2*Size - 2, (float) (i.Y + 1)/2*Size - 2, 4, 4);
            }
            Test.Show(map);
        }

        private static int MinDistToMapEdge(PlanarGraph graph, Node n, int limit)
        {
            if (n.Coordinate.X == 0 || n.Coordinate.X == Size ||
                n.Coordinate.Y == 0 || n.Coordinate.Y == Size)
                return 0;

            int ret = int.MaxValue;
            var stack = new Stack<Tuple<int, Node>>();
            var visited = new HashSet<Node>();
            stack.Push(new Tuple<int, Node>(0, n));
            do
            {
                Tuple<int, Node> state = stack.Pop();
                if (state.Item2.Coordinate.X == 0 || state.Item2.Coordinate.X == Size ||
                    state.Item2.Coordinate.Y == 0 || state.Item2.Coordinate.Y == Size)
                {
                    if (state.Item1 < ret)
                        ret = state.Item1;
                    if (ret == 0) return 0;

                    continue;
                }
                visited.Add(state.Item2);

                if (state.Item1 > limit) continue;
                foreach (EdgeEnd i in state.Item2.Edges)
                {
                    Node node = graph.Find(i.DirectedCoordinate);
                    if (!visited.Contains(node))
                        stack.Push(new Tuple<int, Node>(state.Item1 + 1, node));
                }
            } while (stack.Count > 0);
            return ret;
        }

        private static Bitmap RenderColorBmp(TerrainTile[,] tiles)
        {
            int w = tiles.GetLength(0);
            int h = tiles.GetLength(1);
            var bmp = new Bitmap(w, h);
            var buff = new BitmapBuffer(bmp);
            buff.Lock();
            for (int y = 0; y < w; y++)
                for (int x = 0; x < h; x++)
                    buff[x, y] = TileTypes.color[tiles[x, y].TileId];
            buff.Unlock();
            return bmp;
        }

        private static Bitmap RenderTerrainBmp(TerrainTile[,] tiles)
        {
            int w = tiles.GetLength(0);
            int h = tiles.GetLength(1);
            var bmp = new Bitmap(w, h);
            var buff = new BitmapBuffer(bmp);
            buff.Lock();
            for (int y = 0; y < w; y++)
                for (int x = 0; x < h; x++)
                {
                    buff[x, y] = TileTypes.terrainColor[tiles[x, y].Terrain];
                }
            buff.Unlock();
            return bmp;
        }

        private static Bitmap RenderMoistBmp(TerrainTile[,] tiles)
        {
            int w = tiles.GetLength(0);
            int h = tiles.GetLength(1);
            var bmp = new Bitmap(w, h);
            var buff = new BitmapBuffer(bmp);
            buff.Lock();
            for (int y = 0; y < w; y++)
                for (int x = 0; x < h; x++)
                {
                    uint color = 0x00ffffff;
                    color |= (uint) (tiles[x, y].Moisture*255) << 24;
                    buff[x, y] = color;
                }
            buff.Unlock();
            return bmp;
        }

        private static Bitmap RenderEvalBmp(TerrainTile[,] tiles)
        {
            int w = tiles.GetLength(0);
            int h = tiles.GetLength(1);
            var bmp = new Bitmap(w, h);
            var buff = new BitmapBuffer(bmp);
            buff.Lock();
            for (int y = 0; y < w; y++)
                for (int x = 0; x < h; x++)
                {
                    uint color = 0x00ffffff;
                    color |= (uint) ((byte) (tiles[x, y].Elevation*255) << 24);
                    buff[x, y] = color;
                }
            buff.Unlock();
            return bmp;
        }

        private static Bitmap RenderNoiseBmp(int w, int h)
        {
            var bmp = new Bitmap(w, h);
            var buff = new BitmapBuffer(bmp);
            buff.Lock();
            var noise = new Noise(Environment.TickCount);
            for (int y = 0; y < w; y++)
                for (int x = 0; x < h; x++)
                {
                    uint color = 0x00ffffff;
                    color |= (uint) (noise.GetNoise(x/(double) w*2, y/(double) h*2, 0)*255) << 24;
                    buff[x, y] = color;
                }
            buff.Unlock();
            return bmp;
        }

        public static void Generate()
        {
            //while (true)
            //    Test.Show(RenderNoiseBmp(500, 500));
            while (true)
            {
                int seed = Environment.TickCount;
                //seed = 21409625;
                seed = 14727484;
                var rand = new Random(seed);
                var map = new PolygonMap(rand.Next());
                map.Generate(Size*15);

                TerrainTile[,] dat = CreateTerrain(rand.Next(), map);
                new Biome(rand.Next(), map).ComputeBiomes(dat);

                new TerrainDisplay(dat).ShowDialog();
                //Test.Show(RenderMoistBmp(dat));
                //Test.Show(RenderEvalBmp(dat));

                map = null;
                dat = null;
                GC.WaitForFullGCComplete(-1);
                GC.Collect();
            }
        }

        private static TerrainTile[,] CreateTerrain(int seed, PolygonMap map)
        {
            var rasterizer = new Rasterizer<TerrainTile>(Size, Size);
            //Set all to ocean
            rasterizer.Clear(new TerrainTile
            {
                PolygonId = -1,
                Elevation = 0,
                Moisture = 1,
                TileId = TileTypes.DeepWater,
                TileObj = null
            });
            //Render lands poly
            foreach (MapPolygon poly in map.Polygons.Where(_ => !_.IsWater))
            {
                uint color = 0x00ffffff;
                color |= (uint) (poly.DistanceToCoast*255) << 24;
                rasterizer.FillPolygon(
                    poly.Nodes.SelectMany(_ =>
                    {
                        return new[]
                        {
                            (_.X + 1)/2*Size,
                            (_.Y + 1)/2*Size
                        };
                    }).Concat(new[]
                    {
                        (poly.Nodes[0].X + 1)/2*Size,
                        (poly.Nodes[0].Y + 1)/2*Size
                    }).ToArray(),
                    new TerrainTile
                    {
                        PolygonId = poly.Id,
                        Elevation = (float) poly.DistanceToCoast,
                        Moisture = -1,
                        TileId = TileTypes.Grass,
                        TileObj = null
                    });
            }
            var fea = new MapFeatures(map, seed);
            //Render roads
            IEnumerable<Coordinate[]> roads = fea.GenerateRoads();
            foreach (var i in roads)
            {
                rasterizer.DrawClosedCurve(i.SelectMany(_ => new[]
                {
                    (_.X + 1)/2*Size, (_.Y + 1)/2*Size
                }).ToArray(),
                    1, t =>
                    {
                        t.TileId = TileTypes.Road;
                        return t;
                    }, 3);
            }
            //Render waters poly
            foreach (MapPolygon poly in map.Polygons.Where(_ => _.IsWater))
            {
                var tile = new TerrainTile
                {
                    PolygonId = poly.Id,
                    Elevation = (float) poly.DistanceToCoast,
                    TileObj = null
                };
                if (poly.IsCoast)
                {
                    tile.TileId = TileTypes.MovingWater;
                    tile.Moisture = 0;
                }
                else
                {
                    tile.TileId = TileTypes.DeepWater;
                    tile.Moisture = 1;
                }
                rasterizer.FillPolygon(
                    poly.Nodes.SelectMany(_ =>
                    {
                        return new[]
                        {
                            (_.X + 1)/2*Size,
                            (_.Y + 1)/2*Size
                        };
                    }).Concat(new[]
                    {
                        (poly.Nodes[0].X + 1)/2*Size,
                        (poly.Nodes[0].Y + 1)/2*Size
                    }).ToArray(), tile);
            }
            //Render rivers
            IEnumerable<MapNode[]> rivers = fea.GenerateRivers();
            var edges = new Dictionary<Tuple<MapNode, MapNode>, int>();
            foreach (var i in rivers)
            {
                for (int j = 1; j < i.Length; j++)
                {
                    var edge = new Tuple<MapNode, MapNode>(i[j - 1], i[j]);
                    int count;
                    if (edges.TryGetValue(edge, out count))
                        count++;
                    else
                        count = 1;
                    edges[edge] = count;
                }
            }
            foreach (var i in edges)
            {
                i.Key.Item1.IsWater = true;
                i.Key.Item1.RiverValue = i.Value + 1;
                i.Key.Item2.IsWater = true;
                i.Key.Item2.RiverValue = i.Value + 1;
                rasterizer.DrawLineBresenham(
                    (i.Key.Item1.X + 1)/2*Size, (i.Key.Item1.Y + 1)/2*Size,
                    (i.Key.Item2.X + 1)/2*Size, (i.Key.Item2.Y + 1)/2*Size,
                    t =>
                    {
                        t.TileId = TileTypes.Water;
                        t.Elevation = (float) (i.Key.Item1.DistanceToCoast + i.Key.Item2.DistanceToCoast)/2;
                        t.Moisture = 1;
                        return t;
                    }, 3*Math.Min(2, i.Value));
            }

            return rasterizer.Buffer;
        }
    }
}