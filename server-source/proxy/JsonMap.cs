using System.Collections.Generic;
using System.IO;
using Ionic.Zlib;
using Newtonsoft.Json;

namespace wServer.realm
{
    internal class JsonMap
    {
        private readonly XmlData dat;

        public JsonMap(XmlData dat)
        {
            this.dat = dat;
        }

        public int Width { get; set; }
        public int Height { get; set; }
        public Tile[][] Tiles { get; private set; }
        public ObjectDef[][][] Entities { get; private set; }

        public void Init(int w, int h)
        {
            Width = w;
            Height = h;
            Tiles = new Tile[w][];
            for (int i = 0; i < w; i++) Tiles[i] = new Tile[h];
            Entities = new ObjectDef[w][][];
            for (int i = 0; i < w; i++)
            {
                Entities[i] = new ObjectDef[h][];
                for (int j = 0; j < h; j++)
                {
                    Entities[i][j] = new ObjectDef[0];
                }
            }
        }

        public void FromJson(string json)
        {
            var obj = JsonConvert.DeserializeObject<json_dat>(json);
            byte[] dat = ZlibStream.UncompressBuffer(obj.data);
            Init(obj.width, obj.height);
            using (var rdr = new NReader(new MemoryStream(dat)))
                for (int y = 0; y < obj.height; y++)
                    for (int x = 0; x < obj.width; x++)
                    {
                        loc loc = obj.dict[rdr.ReadInt16()];
                        if (loc.ground != null)
                            Tiles[x][y] = (Tile) this.dat.IdToTileType[loc.ground];
                        else
                            Tiles[x][y] = (Tile) 0xff;
                        if (loc.objs != null)
                        {
                            //Entities[x][y] = new Entity[loc.objs.Length];
                            //int i = 0;
                            //foreach (var z in loc.objs)
                            //{
                            //    Entities[x][y][i] = new Entity() { ObjectType = Objects.id2type[z.id], X = x, Y = y };
                            //}
                        }
                    }
        }

        public string ToJson()
        {
            var obj = new json_dat();
            obj.width = Width;
            obj.height = Height;
            var locs = new List<loc>();
            var ms = new MemoryStream();
            using (var wtr = new NWriter(ms))
                for (int y = 0; y < obj.height; y++)
                    for (int x = 0; x < obj.width; x++)
                    {
                        var loc = new loc();
                        loc.ground = dat.TileTypeToId[(byte) Tiles[x][y]];
                        loc.objs = new obj[Entities[x][y].Length];
                        for (int i = 0; i < loc.objs.Length; i++)
                        {
                            ObjectDef en = Entities[x][y][i];
                            var o = new obj
                            {
                                id = dat.ObjectTypeToId[en.ObjectType]
                            };
                            string s = "";
                            var vals = new Dictionary<StatsType, object>();
                            foreach (var z in en.Stats.Stats) vals.Add(z.Key, z.Value);
                            if (vals.ContainsKey(StatsType.Name))
                                s += ";name:" + vals[StatsType.Name];
                            if (vals.ContainsKey(StatsType.Size))
                                s += ";size:" + vals[StatsType.Size];
                            if (vals.ContainsKey(StatsType.ObjectConnection))
                                s += ";conn:0x" + ((int) vals[StatsType.ObjectConnection]).ToString("X8");
                            if (vals.ContainsKey(StatsType.MerchantMerchandiseType))
                                s += ";mtype:" + vals[StatsType.MerchantMerchandiseType];
                            if (vals.ContainsKey(StatsType.MerchantRemainingCount))
                                s += ";mcount:" + vals[StatsType.MerchantRemainingCount];
                            if (vals.ContainsKey(StatsType.MerchantRemainingMinute))
                                s += ";mtime:" + vals[StatsType.MerchantRemainingMinute];
                            if (vals.ContainsKey(StatsType.NameChangerStar))
                                s += ";nstar:" + vals[StatsType.NameChangerStar];
                            o.name = s.Trim(';');
                            loc.objs[i] = o;
                        }

                        int ix = -1;
                        for (int i = 0; i < locs.Count; i++)
                        {
                            if (locs[i].ground != loc.ground) continue;
                            if (!((locs[i].objs != null && loc.objs != null) ||
                                  (locs[i].objs == null && loc.objs == null))) continue;
                            if (locs[i].objs != null)
                            {
                                if (locs[i].objs.Length != loc.objs.Length) continue;
                                bool b = false;
                                for (int j = 0; j < loc.objs.Length; j++)
                                    if (locs[i].objs[j].id != loc.objs[j].id ||
                                        locs[i].objs[j].name != loc.objs[j].name)
                                    {
                                        b = true;
                                        break;
                                    }
                                if (b)
                                    continue;
                            }
                            ix = i;
                            break;
                        }
                        if (ix == -1)
                        {
                            ix = locs.Count;
                            locs.Add(loc);
                        }
                        wtr.Write((short) ix);
                    }
            obj.data = ZlibStream.CompressBuffer(ms.ToArray());
            obj.dict = locs.ToArray();
            return JsonConvert.SerializeObject(obj);
        }

        private struct json_dat
        {
            public byte[] data;
            public loc[] dict;
            public int height;
            public int width;
        }

        private struct loc
        {
            public string ground;
            public obj[] objs;
            public obj[] regions;
        }

        private struct obj
        {
            public string id;
            public string name;
        }
    }
}