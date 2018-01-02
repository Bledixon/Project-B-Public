using System;
using System.Collections.Generic;
using wServer.realm.terrain;

namespace wServer.realm.setpieces
{
    internal class Gauntlet : ISetPiece
    {
        private static readonly string Lava = "Lava Blend";
        private static readonly string Floor = "Iron Ground";
        private static readonly string Bush = "Bush";

        private readonly Random rand = new Random();

        public int Size
        {
            get { return 45; }
        }

        public void RenderSetPiece(World world, IntPoint pos)
        {
            int outerRadius = 13;
            int waterRadius = 5;
            int islandRadius = 8;
            var border = new List<IntPoint>();

            var t = new int[Size, Size];
            for (int y = 0; y < Size; y++) //Outer
                for (int x = 0; x < Size; x++)
                {
                    double dx = x - (Size/2.0);
                    double dy = y - (Size/2.0);
                    double r = Math.Sqrt(dx*dx + dy*dy);
                    if (r <= outerRadius)
                        t[x, y] = 1;
                }

            for (int y = 0; y < Size; y++) //Water
                for (int x = 0; x < Size; x++)
                {
                    double dx = x - (Size/2.0);
                    double dy = y - (Size/2.0);
                    double r = Math.Sqrt(dx*dx + dy*dy);
                    if (r <= waterRadius)
                    {
                        t[x, y] = 2;
                        if (waterRadius - r < 1)
                            border.Add(new IntPoint(x, y));
                    }
                }

            for (int y = 0; y < Size; y++) //Island
                for (int x = 0; x < Size; x++)
                {
                    double dx = x - (Size/2.0);
                    double dy = y - (Size/2.0);
                    double r = Math.Sqrt(dx*dx + dy*dy);
                    if (r <= islandRadius)
                    {
                        t[x, y] = 1;
                        if (islandRadius - r < 1)
                            border.Add(new IntPoint(x, y));
                    }
                }

            var trees = new HashSet<IntPoint>();
            while (trees.Count < border.Count*0.5)
                trees.Add(border[rand.Next(0, border.Count)]);

            foreach (IntPoint i in trees)
                t[i.X, i.Y] = 3;

            XmlData dat = world.Manager.GameData;
            for (int x = 0; x < Size; x++)
                for (int y = 0; y < Size; y++)
                {
                    if (t[x, y] == 1)
                    {
                        WmapTile tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Floor];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }
                        //else if (t[x, y] == 2)
                        //{
                        //    var tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        //    tile.TileId = dat.IdToTileType[Lava]; tile.ObjType = 0;
                        //    world.Map[x + pos.X, y + pos.Y] = tile;
                        //}
                    else if (t[x, y] == 3)
                    {
                        WmapTile tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Lava];
                        tile.ObjType = dat.IdToObjectType[Bush];
                        tile.Name = "size:" + (rand.Next()%2 == 0 ? 0 : 0);
                        if (tile.ObjId == 0) tile.ObjId = world.GetNextEntityId();
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }
                }
            Entity mage = Entity.Resolve(world.Manager, "Forgotten Archmage of Flame");
            mage.Move(pos.X + 23.0f, pos.Y + 23.0f);
            world.EnterWorld(mage);
        }
    }
}