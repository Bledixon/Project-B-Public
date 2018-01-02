using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.loot
{
    public interface ILootDef
    {
        void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat,
            Random rand, IList<LootDef> lootDefs);
    }

    public class ItemLoot : ILootDef
    {
        private readonly string item;
        private readonly double probability;

        public ItemLoot(string item, double probability)
        {
            this.item = item;
            this.probability = probability;
        }

        public void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat,
            Random rand, IList<LootDef> lootDefs)
        {
            if (playerDat != null) return;
            XmlData dat = manager.GameData;
            lootDefs.Add(new LootDef(dat.Items[dat.IdToObjectType[item]], probability));
        }
    }

    public enum ItemType
    {
        Weapon,
        Ability,
        Armor,
        Ring,
        Potion
    }

    public class TierLoot : ILootDef
    {
        public static readonly int[] WeaponT = { 1, 2, 3, 8, 17, 24, 26 };
        public static readonly int[] AbilityT = { 4, 5, 11, 12, 13, 15, 16, 18, 19, 20, 21, 22, 23, 25, 27, 28, 29 };
        public static readonly int[] ArmorT = { 6, 7, 14 };
        public static readonly int[] RingT = { 9 };
        public static readonly int[] PotionT = { 10 };
        private readonly double probability;

        private readonly byte tier;
        private readonly int[] types;

        public TierLoot(byte tier, ItemType type, double probability)
        {
            this.tier = tier;
            switch (type)
            {
                case ItemType.Weapon:
                    types = WeaponT;
                    break;
                case ItemType.Ability:
                    types = AbilityT;
                    break;
                case ItemType.Armor:
                    types = ArmorT;
                    break;
                case ItemType.Ring:
                    types = RingT;
                    break;
                case ItemType.Potion:
                    types = PotionT;
                    break;
                default:
                    throw new NotSupportedException(type.ToString());
            }
            this.probability = probability;
        }

        public void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat,
            Random rand, IList<LootDef> lootDefs)
        {
            if (playerDat != null) return;
            Item[] candidates = manager.GameData.Items
                .Where(item => Array.IndexOf(types, item.Value.SlotType) != -1)
                .Where(item => item.Value.Tier == tier)
                .Select(item => item.Value)
                .ToArray();
            foreach (Item i in candidates)
                lootDefs.Add(new LootDef(i, probability / candidates.Length));
        }
    }

    public class Threshold : ILootDef
    {
        private readonly ILootDef[] children;
        private readonly double threshold;

        public Threshold(double threshold, params ILootDef[] children)
        {
            this.threshold = threshold;
            this.children = children;
        }

        public void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat,
            Random rand, IList<LootDef> lootDefs)
        {
            if (playerDat != null && playerDat.Item2 / (double)enemy.ObjectDesc.MaxHP >= threshold)
            {
                foreach (ILootDef i in children)
                    i.Populate(manager, enemy, null, rand, lootDefs);
            }
        }
    }

    internal class MostDamagers : ILootDef
    {
        private readonly ILootDef[] loots;
        private readonly int amount;

        public MostDamagers(int amount, params ILootDef[] loots)
        {
            this.amount = amount;
            this.loots = loots;
        }

        public void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat, Random rand, IList<LootDef> lootDefs)
        {
            var data = enemy.DamageCounter.GetPlayerData();
            var mostDamage = GetMostDamage(data);
            foreach (var loot in mostDamage.Where(pl => pl.Equals(playerDat)).SelectMany(pl => loots))
                loot.Populate(manager, enemy, null, rand, lootDefs);
        }

        private IEnumerable<Tuple<Player, int>> GetMostDamage(IEnumerable<Tuple<Player, int>> data)
        {
            var damages = data.Select(_ => _.Item2).ToList();
            var len = damages.Count < amount ? damages.Count : amount;
            for (var i = 0; i < len; i++)
            {
                var val = damages.Max();
                yield return data.FirstOrDefault(_ => _.Item2 == val);
                damages.Remove(val);
            }
        }
    }

    public class KeyLoot : ILootDef
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(KeyLoot));

        private readonly int maxKeys;
        private readonly int minKeys;

        public KeyLoot(int minKeys, int maxKeys)
        {
            this.maxKeys = maxKeys;
            this.minKeys = minKeys;
        }

        public void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat,
            Random rand, IList<LootDef> lootDefs)
        {
            if (playerDat == null)
                return;
            for (int i = 0; i < 3; i++)
                playerDat.Item1.Owner.BroadcastPacket(new ShowEffectPacket()
                {
                    EffectType = EffectType.Flow,
                    Color = new ARGB(0xFFB7410E),
                    TargetId = playerDat.Item1.Id,
                    PosA = new Position() { X = enemy.X, Y = enemy.Y }
                }, null);
            playerDat.Item1.Keys =
                playerDat.Item1.Client.Account.Keys =
                    playerDat.Item1.Client.ClientDatabase.UpdateKeys(playerDat.Item1.Client.Account,
                        rand.Next(minKeys, maxKeys + 1));
            playerDat.Item1.UpdateCount++;
        }
    }
    public class GoldLoot : ILootDef
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(KeyLoot));

        private readonly int maxGold;
        private readonly int minGold;

        public GoldLoot(int minGold, int maxGold)
        {
            this.maxGold = maxGold;
            this.minGold = minGold;
        }

        public void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat,
            Random rand, IList<LootDef> lootDefs)
        {
            if (playerDat == null)
                return;
            for (int i = 0; i < 3; i++)
                playerDat.Item1.Owner.BroadcastPacket(new ShowEffectPacket()
                {
                    EffectType = EffectType.Flow,
                    Color = new ARGB(0xccac00),
                    TargetId = playerDat.Item1.Id,
                    PosA = new Position() { X = enemy.X, Y = enemy.Y }
                }, null);
            playerDat.Item1.Credits =
                playerDat.Item1.Client.Account.Credits =
                    playerDat.Item1.Client.ClientDatabase.UpdateCredit(playerDat.Item1.Client.Account,
                        rand.Next(minGold, maxGold + 1));
            playerDat.Item1.UpdateCount++;
        }
    }
    public class FameLoot : ILootDef
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(KeyLoot));

        private readonly int maxFame;
        private readonly int minFame;

        public FameLoot(int minFame, int maxFame)
        {
            this.maxFame = maxFame;
            this.minFame = minFame;
        }

        public void Populate(RealmManager manager, Enemy enemy, Tuple<Player, int> playerDat,
            Random rand, IList<LootDef> lootDefs)
        {
            if (playerDat == null) return;
            for (int i = 0; i < 3; i++)
                playerDat.Item1.Owner.BroadcastPacket(new ShowEffectPacket()
                {
                    EffectType = EffectType.Flow,
                    Color = new ARGB(0xffa500),
                    TargetId = playerDat.Item1.Id,
                    PosA = new Position() { X = enemy.X, Y = enemy.Y }
                }, null);
            playerDat.Item1.Client.Account.Credits =
                playerDat.Item1.Client.ClientDatabase.UpdateFame(playerDat.Item1.Client.Account,
                    rand.Next(minFame, maxFame + 1));
            playerDat.Item1.UpdateCount++;
        }
    }
}