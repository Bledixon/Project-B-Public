using System;
using System.Linq;
using wServer.logic.loot;
using wServer.realm.entities;
using wServer.realm.terrain;

namespace wServer.realm.setpieces
{
    internal class ArchMage : ISetPiece
    {
        private static readonly string Lava = "Lava Blend";
        private static readonly string Floor = "Firey Floor";

        private static readonly Loot chest = new Loot(
            new TierLoot(9, ItemType.Weapon, 0.3),
            new TierLoot(10, ItemType.Weapon, 0.2),
            new TierLoot(11, ItemType.Weapon, 0.1),
            new TierLoot(10, ItemType.Armor, 0.3),
            new TierLoot(11, ItemType.Armor, 0.2),
            new TierLoot(12, ItemType.Armor, 0.1),
            new TierLoot(3, ItemType.Ability, 0.3),
            new TierLoot(4, ItemType.Ability, 0.2),
            new TierLoot(5, ItemType.Ability, 0.1),
            new TierLoot(3, ItemType.Ring, 0.25),
            new TierLoot(4, ItemType.Ring, 0.15),
            new TierLoot(2, ItemType.Potion, 0.5)
            );

        private readonly Random rand = new Random();

        public int Size
        {
            get { return 11; }
        }

        public void RenderSetPiece(World world, IntPoint pos)
        {
            var t = new int[11, 11];

            for (int x = 0; x < 11; x++) //Moats
                for (int y = 0; y < 11; y++)
                    if (x == 0 || x == 10 || y == 0 || y == 10)
                    {
                        t[x, y] = t[x, y] = 1;
                        t[x, y] = t[x, y] = 1;
                    }

            for (int x = 1; x < 10; x++) //Floor
                for (int y = 1; y < 10; y++)
                    t[x, y] = 2;

            //Boss & Chest
            t[5, 5] = 7;
            t[5, 6] = 8;

            int r = rand.Next(0, 4);
            for (int i = 0; i < r; i++) //Rotation
                t = SetPieces.rotateCW(t);
            int w = t.GetLength(0), h = t.GetLength(1);

            XmlData dat = world.Manager.GameData;
            for (int x = 0; x < w; x++) //Rendering
                for (int y = 0; y < h; y++)
                {
                    if (t[x, y] == 1)
                    {
                        WmapTile tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Lava];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }

                    else if (t[x, y] == 2)
                    {
                        WmapTile tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Floor];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;
                    }

                    else if (t[x, y] == 7)
                    {
                        WmapTile tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Floor];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;

                        var container = new Container(world.Manager, 0x0501, null, false);
                        Item[] items = chest.GetLoots(world.Manager, 5, 8).ToArray();
                        for (int i = 0; i < items.Length; i++)
                            container.Inventory[i] = items[i];
                        container.Move(pos.X + x + 0.5f, pos.Y + y + 0.5f);
                        world.EnterWorld(container);
                    }
                    else if (t[x, y] == 8)
                    {
                        WmapTile tile = world.Map[x + pos.X, y + pos.Y].Clone();
                        tile.TileId = dat.IdToTileType[Floor];
                        tile.ObjType = 0;
                        world.Map[x + pos.X, y + pos.Y] = tile;

                        Entity mage = Entity.Resolve(world.Manager, "Forgotten Archmage of Flame");
                        mage.Move(pos.X + x, pos.Y + y);
                        world.EnterWorld(mage);
                    }
                }
        }
    }
}