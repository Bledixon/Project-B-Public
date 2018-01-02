using System;
using System.Collections.Generic;
using System.IO;
using Ionic.Zlib;
using wServer.realm.entities;

namespace wServer.realm.terrain
{
    public enum WmapTerrain : byte
    {
        None,
        Mountains,
        HighSand,
        HighPlains,
        HighForest,
        MidSand,
        MidPlains,
        MidForest,
        LowSand,
        LowPlains,
        LowForest,
        ShoreSand,
        ShorePlains,
    }

    public struct WmapTile
    {
        public byte Elevation;
        public string Name;
        public int ObjId;
        public ushort ObjType;
        public TileRegion Region;
        public WmapTerrain Terrain;
        public ushort TileId;
        public byte UpdateCount;
        public ObjectDesc ObjectDesc;

        public ObjectDef ToDef(int x, int y)
        {
            var stats = new List<KeyValuePair<StatsType, object>>();
            if (!string.IsNullOrEmpty(Name))
                foreach (string item in Name.Split(';'))
                {
                    string[] kv = item.Split(':');
                    switch (kv[0])
                    {
                        case "name":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.Name, kv[1]));
                            break;
                        case "size":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.Size, Utils.FromString(kv[1])));
                            break;
                        case "eff":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.Effects, Utils.FromString(kv[1])));
                            break;
                        case "conn":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.ObjectConnection,
                                Utils.FromString(kv[1])));
                            break;
                        case "mtype":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.MerchantMerchandiseType,
                                Utils.FromString(kv[1])));
                            break;
                        case "mcount":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.MerchantRemainingCount,
                                Utils.FromString(kv[1])));
                            break;
                        case "mtime":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.MerchantRemainingMinute,
                                Utils.FromString(kv[1])));
                            break;
                        case "stars":
                            stats.Add(new KeyValuePair<StatsType, object>(StatsType.SellableRankRequirement,
                                Utils.FromString(kv[1])));
                            break;
                            //case "nstar":
                            //    stats.Add(new KeyValuePair<StatsType, object>(StatsType.NameChangerStar, Utils.FromString(kv[1]))); break;
                    }
                }
            return new ObjectDef
            {
                ObjectType = ObjType,
                Stats = new ObjectStats
                {
                    Id = ObjId,
                    Position = new Position
                    {
                        X = x + 0.5f,
                        Y = y + 0.5f
                    },
                    Stats = stats.ToArray()
                }
            };
        }

        public WmapTile Clone()
        {
            return new WmapTile
            {
                UpdateCount = (byte) (UpdateCount + 1),
                TileId = TileId,
                Name = Name,
                ObjType = ObjType,
                Terrain = Terrain,
                Region = Region,
                ObjId = ObjId,
                ObjectDesc = ObjectDesc
            };
        }
    }

    public class Wmap
    {
        private readonly XmlData dat;
        public Dictionary<TileRegion, List<IntPoint>> Regions = new Dictionary<TileRegion, List<IntPoint>>();

        private Tuple<IntPoint, ushort, string>[] entities;
        private WmapTile[,] tiles;

        public Wmap(XmlData dat)
        {
            this.dat = dat;
        }

        public int Width { get; set; }
        public int Height { get; set; }

        public WmapTile this[int x, int y]
        {
            get { return tiles[x, y]; }
            set { tiles[x, y] = value; }
        }

        public int Load(Stream stream, int idBase)
        {
            int ver = stream.ReadByte();
            using (var rdr = new BinaryReader(new ZlibStream(stream, CompressionMode.Decompress)))
            {
                if (ver == 0) return LoadV0(rdr, idBase);
                if (ver == 1) return LoadV1(rdr, idBase);
                if (ver == 2) return LoadV2(rdr, idBase);
                throw new NotSupportedException("WMap version " + ver);
            }
        }

        private int LoadV0(BinaryReader reader, int idBase)
        {
            var dict = new List<WmapTile>();
            short c = reader.ReadInt16();
            for (short i = 0; i < c; i++)
            {
                var tile = new WmapTile();
                tile.TileId = reader.ReadUInt16();
                string obj = reader.ReadString();
                tile.ObjType = string.IsNullOrEmpty(obj) ? (ushort) 0 : dat.IdToObjectType[obj];
                tile.Name = reader.ReadString();
                tile.Terrain = (WmapTerrain) reader.ReadByte();
                tile.Region = (TileRegion) reader.ReadByte();
                dat.ObjectDescs.TryGetValue(tile.ObjType, out tile.ObjectDesc);
                dict.Add(tile);
            }
            Width = reader.ReadInt32();
            Height = reader.ReadInt32();
            tiles = new WmapTile[Width, Height];
            int enCount = 0;
            var entities = new List<Tuple<IntPoint, ushort, string>>();
            for (int y = 0; y < Height; y++)
                for (int x = 0; x < Width; x++)
                {
                    WmapTile tile = dict[reader.ReadInt16()];
                    tile.UpdateCount = 1;

                    var desc = tile.ObjectDesc;
                    if (tile.ObjType != 0 &&
                        (!dat.ObjectDescs.TryGetValue(tile.ObjType, out desc) ||
                         !desc.Static || desc.Enemy))
                    {
                        entities.Add(new Tuple<IntPoint, ushort, string>(new IntPoint(x, y), tile.ObjType, tile.Name));
                        tile.ObjType = 0;
                    }

                    if (tile.ObjType != 0)
                    {
                        enCount++;
                        tile.ObjId = idBase + enCount;
                    }


                    tiles[x, y] = tile;
                    AddRegion(tile.Region, x, y);
                }
            this.entities = entities.ToArray();
            return enCount;
        }

        private int LoadV1(BinaryReader reader, int idBase)
        {
            var dict = new List<WmapTile>();
            short c = reader.ReadInt16();
            for (short i = 0; i < c; i++)
            {
                var tile = new WmapTile();
                tile.TileId = reader.ReadUInt16();
                string obj = reader.ReadString();
                tile.ObjType = string.IsNullOrEmpty(obj) ? (ushort) 0 : dat.IdToObjectType[obj];
                tile.Name = reader.ReadString();
                tile.Terrain = (WmapTerrain) reader.ReadByte();
                tile.Region = (TileRegion) reader.ReadByte();
                tile.Elevation = reader.ReadByte();
                dat.ObjectDescs.TryGetValue(tile.ObjType, out tile.ObjectDesc);
                dict.Add(tile);
            }
            Width = reader.ReadInt32();
            Height = reader.ReadInt32();
            tiles = new WmapTile[Width, Height];
            int enCount = 0;
            var entities = new List<Tuple<IntPoint, ushort, string>>();
            for (int y = 0; y < Height; y++)
                for (int x = 0; x < Width; x++)
                {
                    WmapTile tile = dict[reader.ReadInt16()];
                    tile.UpdateCount = 1;

                    var desc = tile.ObjectDesc;
                    if (tile.ObjType != 0 &&
                        (!dat.ObjectDescs.TryGetValue(tile.ObjType, out desc) ||
                         !desc.Static || desc.Enemy))
                    {
                        entities.Add(new Tuple<IntPoint, ushort, string>(new IntPoint(x, y), tile.ObjType, tile.Name));
                        tile.ObjType = 0;
                    }

                    if (tile.ObjType != 0)
                    {
                        enCount++;
                        tile.ObjId = idBase + enCount;
                    }


                    tiles[x, y] = tile;
                    AddRegion(tile.Region, x, y);
                }
            this.entities = entities.ToArray();
            return enCount;
        }

        private int LoadV2(BinaryReader reader, int idBase)
        {
            var dict = new List<WmapTile>();
            short c = reader.ReadInt16();
            for (short i = 0; i < c; i++)
            {
                var tile = new WmapTile();
                tile.TileId = reader.ReadUInt16();
                string obj = reader.ReadString();
                tile.ObjType = string.IsNullOrEmpty(obj) ? (ushort) 0 : dat.IdToObjectType[obj];
                tile.Name = reader.ReadString();
                tile.Terrain = (WmapTerrain) reader.ReadByte();
                tile.Region = (TileRegion) reader.ReadByte();
                dat.ObjectDescs.TryGetValue(tile.ObjType, out tile.ObjectDesc);
                dict.Add(tile);
            }
            Width = reader.ReadInt32();
            Height = reader.ReadInt32();
            tiles = new WmapTile[Width, Height];
            int enCount = 0;
            var entities = new List<Tuple<IntPoint, ushort, string>>();
            for (int y = 0; y < Height; y++)
                for (int x = 0; x < Width; x++)
                {
                    WmapTile tile = dict[reader.ReadInt16()];
                    tile.UpdateCount = 1;
                    tile.Elevation = reader.ReadByte();

                    var desc = tile.ObjectDesc;
                    if (tile.ObjType != 0 &&
                        (!dat.ObjectDescs.TryGetValue(tile.ObjType, out desc) ||
                         !desc.Static || desc.Enemy))
                    {
                        entities.Add(new Tuple<IntPoint, ushort, string>(new IntPoint(x, y), tile.ObjType, tile.Name));
                        tile.ObjType = 0;
                    }

                    if (tile.ObjType != 0)
                    {
                        enCount++;
                        tile.ObjId = idBase + enCount;
                    }


                    tiles[x, y] = tile;
                    AddRegion(tile.Region, x, y);
                }
            this.entities = entities.ToArray();
            return enCount;
        }

        private void AddRegion(TileRegion region, int x, int y)
        {
            if (Regions.ContainsKey(region))
                Regions[region].Add(new IntPoint(x, y));
            else
                Regions.Add(region, new List<IntPoint> {new IntPoint(x, y)});
        }

        public IEnumerable<Entity> InstantiateEntities(RealmManager manager)
        {
            foreach (var i in entities)
            {
                Entity entity = Entity.Resolve(manager, i.Item2);
                entity.Move(i.Item1.X + 0.5f, i.Item1.Y + 0.5f);
                if (i.Item3 != null)
                    foreach (string item in i.Item3.Split(';'))
                    {
                        string[] kv = item.Split(':');
                        switch (kv[0])
                        {
                            case "name":
                                entity.Name = kv[1];
                                break;
                            case "size":
                                entity.Size = Utils.FromString(kv[1]);
                                break;
                            case "eff":
                                entity.ConditionEffects = (ConditionEffects) Utils.FromString(kv[1]);
                                break;
                            case "conn":
                                (entity as ConnectedObject).Connection =
                                    ConnectionInfo.Infos[(uint) Utils.FromString(kv[1])];
                                break;
                            case "mtype":
                                (entity as Merchant).custom = true;
                                (entity as Merchant).mType = Utils.FromString(kv[1]);
                                break;
                            case "mcount":
                                (entity as Merchant).mRemaining = Utils.FromString(kv[1]);
                                break;
                            case "mtime":
                                (entity as Merchant).mTime = Utils.FromString(kv[1]);
                                break;
                            case "mcost":
                                (entity as SellableObject).Price = Utils.FromString(kv[1]);
                                break;
                            case "mcur":
                                (entity as SellableObject).Currency = (CurrencyType) Utils.FromString(kv[1]);
                                break;
                            case "stars":
                                (entity as SellableObject).RankReq = Utils.FromString(kv[1]);
                                break;
                                //case "nstar":
                                //    entity.Stats[StatsType.NameChangerStar] = Utils.FromString(kv[1]); break;
                        }
                    }
                yield return entity;
            }
        }
    }
}