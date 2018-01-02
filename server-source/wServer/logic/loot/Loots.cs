using db;
using System;
using System.Collections.Generic;
using System.Linq;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.loot
{
    public struct LootDef
    {
        public readonly Item Item;
        public readonly double Probabilty;

        public LootDef(Item item, double probabilty)
        {
            Item = item;
            Probabilty = probabilty;
        }
    }

    public class Loot : List<ILootDef>
    {
        private static readonly Random rand = new Random();

        public Loot()
        {
        }

        public Loot(params ILootDef[] lootDefs) //For independent loots(e.g. chests)
        {
            AddRange(lootDefs);
        }

        public IEnumerable<Item> GetLoots(RealmManager manager, int min, int max) //For independent loots(e.g. chests)
        {
            var consideration = new List<LootDef>();
            foreach (ILootDef i in this)
                i.Populate(manager, null, null, rand, consideration);

            int retCount = rand.Next(min, max);
            foreach (LootDef i in consideration)
            {
                if (rand.NextDouble() < i.Probabilty)
                {
                    yield return i.Item;
                    retCount--;
                }
                if (retCount == 0)
                    yield break;
            }
        }

        public void Handle(Enemy enemy, RealmTime time)
        {
            var consideration = new List<LootDef>();

            var sharedLoots = new List<Item>();
            foreach (ILootDef i in this)
                i.Populate(enemy.Manager, enemy, null, rand, consideration);
            foreach (LootDef i in consideration)
            {
                if (rand.NextDouble() < i.Probabilty)
                    sharedLoots.Add(i.Item);
            }

            Tuple<Player, int>[] dats = enemy.DamageCounter.GetPlayerData();
            Dictionary<Player, IList<Item>> loots = enemy.DamageCounter.GetPlayerData().ToDictionary(
                d => d.Item1, d => (IList<Item>) new List<Item>());

            foreach (Item loot in sharedLoots.Where(item => item.Soulbound))
                loots[dats[rand.Next(dats.Length)].Item1].Add(loot);

            foreach (var dat in dats)
            {
                int LuckStat = dat.Item1.Client.Character.Luck;
                consideration.Clear();
                foreach (ILootDef i in this)
                    i.Populate(enemy.Manager, enemy, dat, rand, consideration);

                IList<Item> playerLoot = loots[dat.Item1];
                foreach (LootDef i in consideration)
                {
                    if (LuckStat > 5) return;
                    double luck_propability = LuckStat > 0 ? i.Probabilty * (LuckStat - (0.9 * LuckStat) + 1) : i.Probabilty;
                    if (rand.NextDouble() < luck_propability)
                        playerLoot.Add(i.Item);
                }
            }

            AddBagsToWorld(enemy, sharedLoots, loots);
        }

        private void AddBagsToWorld(Enemy enemy, IList<Item> shared, IDictionary<Player, IList<Item>> soulbound)
        {
            var pub = new List<Player>(); //only people not getting soulbound
            foreach (var i in soulbound)
            {
                if (i.Value.Count > 0)
                    ShowBags(enemy, i.Value, i.Key);
                else
                    pub.Add(i.Key);
            }
            if (pub.Count > 0 && shared.Count > 0)
                ShowBags(enemy, shared, pub.ToArray());
        }

        private void ShowBags(Enemy enemy, IEnumerable<Item> loots, params Player[] owners)
        {
            int[] ownerIds = owners.Select(x => x.AccountId).ToArray();
            int bagType = 0;
            var items = new Item[8];
            int idx = 0;

            foreach (Item i in loots)
            {
                if (i.BagType > bagType) bagType = i.BagType;
                items[idx] = i;
                idx++;

                if (idx == 8)
                {
                    ShowBag(enemy, ownerIds, bagType, items);

                    bagType = 0;
                    items = new Item[8];
                    idx = 0;
                }
            }

            if (idx > 0)
                ShowBag(enemy, ownerIds, bagType, items);
        }

        private static void ShowBag(Enemy enemy, int[] owners, int bagType, Item[] items)
        {
            ushort bag = 0x0500;
            switch (bagType)
            {
                case 0:
                    bag = 0x0500;
                    break;
                case 1:
                    bag = 0x0503;
                    break;
                case 2:
                    bag = 0x0507;
                    break;
                case 3:
                    bag = 0x0508;
                    break;
                case 4:
                    bag = 0x0509;
                    break;
                case 5:
                    bag = 0x0510;
                    break;
                case 6:
                    bag = 0x0511;
                    break;
            }
            var container = new Container(enemy.Manager, bag, 1000*60, true);
            for (int j = 0; j < 8; j++)
            {
                container.Inventory[j] = items[j];
                if (items[j] == null || items[j].Projectiles == null)
                    continue;
                if (items[j].Projectiles.Length > 0 && rand.Next(0, 100) < 10)
                {
                    container.Inventory.Data[j] = new ItemData
                    {
                        NamePrefix = "Strange",
                        NameColor = 0xFF5A28,
                        Strange = true
                    };
                }
            }
            container.BagOwners = owners;
            container.Move(
                enemy.X + (float) ((rand.NextDouble()*2 - 1)*0.5),
                enemy.Y + (float) ((rand.NextDouble()*2 - 1)*0.5));
            container.Size = 80;
            enemy.Owner.EnterWorld(container);
        }
    }
}