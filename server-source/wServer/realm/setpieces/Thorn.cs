using System;

namespace wServer.realm.setpieces
{
    internal class Thorn : ISetPiece
    {

        private static readonly string Floor = "shtrs Shattered Floor";
        private static readonly string Central = "Pool";
        private static readonly string Lava = "n Magma Floor6";

        private readonly Random rand = new Random();

        public int Size
        {
            get { return 50; }
        } 

        public void RenderSetPiece(World world, IntPoint pos)
        {
            XmlData dat = world.Manager.GameData;
            int DarkGrassradiu = 17;
            int sandRadius = 17;
            int waterRadius = 14;

        //    List<IntPoint> border = new List<IntPoint>();

            int[,] o = new int[Size, Size];
            int[,] t = new int[Size, Size];

            for (int y = 0; y < Size; y++)      //Outer
                for (int x = 0; x < Size; x++)
                {
                    double dx = x - (Size / 2.0);
                    double dy = y - (Size / 2.0);
                    double r = Math.Sqrt(dx * dx + dy * dy);
                    if (r <= sandRadius)
                        t[x, y] = 2;
                }
            for (int y = 0; y < Size; y++)      //Water
                for (int x = 0; x < Size; x++)
                {
                    double dx = x - (Size / 2.0);
                    double dy = y - (Size / 2.0);
                    double r = Math.Sqrt(dx * dx + dy * dy);
                    if (r <= waterRadius)
                    {
                        t[x, y] = 3;
                    }
                }

            for (int x = 0; x < Size; x++)
                for (int y = 0; y < Size; y++)
                {
                    if (((x > 5 && x < DarkGrassradiu) || (x < Size - 5 && x > Size - DarkGrassradiu) ||
                         (y > 5 && y < DarkGrassradiu) || (y < Size - 5 && y > Size - DarkGrassradiu)) &&
                        o[x, y] == 0 && t[x, y] == 1)
                    {
                        t[x, y] = 4;
                    }
                }
            for (int x = 0; x < Size; x++)
                for (int y = 0; y < Size; y++)
                {
                    if (t[x, y] == 1)
                    {
                        var tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.ObjId = dat.IdToObjectType[Lava];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }
                    else if (t[x, y] == 2)
                    {
                        var tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Floor];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }
                    else if (t[x, y] == 3)
                    {
                        var tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Central];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }
                    else if (t[x, y] == 4)
                    {
                        var tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.ObjId = dat.IdToObjectType[Lava];
                        if (tile.ObjId == 0) tile.ObjId = world.GetNextEntityId();
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }
                }

            Entity thorn = Entity.Resolve(world.Manager, "Thorn Dragco Nimissime");
            thorn.Move(pos.X + Size / 2f, pos.Y + Size / 2f);
            world.EnterWorld(thorn);
        } 
    }
}
