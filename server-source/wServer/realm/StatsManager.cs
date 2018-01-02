using System;
using wServer.realm.entities;

namespace wServer.realm
{
    public class StatsManager
    {
        public SQLRandom Random { get; }
        private readonly Player player;
        private static readonly Random rnd = new Random();
        public int success;

        public StatsManager(Player player, uint seed)
        {
            this.player = player;
            Random = new SQLRandom(seed);
        }

        public int GetStats(int id)
        {
            return player.Stats[id] + player.Boost[id];
        }

        public float GetAttackDamage(int min, int max, int percent = 0)
        {
            return Random.NextUInt2((uint)min, (uint)max) * DamageModifier() * (float)(1 + (percent * 0.01));
        }

        public float DamageModifier()
        {
            if (player.HasConditionEffect(ConditionEffects.Weak))
                return 0.5f;
            if (player.HasConditionEffect(ConditionEffects.Damaging))
                return (0.5f + GetStats(2) / 50f) * 1.5f;
            if (player.HasConditionEffect(ConditionEffects.Paused) || player.HasConditionEffect(ConditionEffects.Stasis))
                return 0;
            if (rnd.Next(0, 100) < 3 && player.Stats[9] >= 1)
            {
                success++;
                return (0.5f + GetStats(2) / 50f) * (GetStats(9) * 1.5f);
            }
            else
                success = 0;
            return 0.5f + GetStats(2) / 50f;
        }

        public static float GetEnemyDamage(Entity host, int dmg, int def)
        {
            if (host.HasConditionEffect(ConditionEffects.Invulnerable))
                return 0;
            if (host.HasConditionEffect(ConditionEffects.ArmorBroken))
                def = 0;
            if (host.HasConditionEffect(ConditionEffects.Armored))
                def *= 2;
            return Math.Max(dmg * 0.15f, dmg - def);
        }

        public float GetPlayerDamage(int dmg, bool trueDamage)
        {
            if (player.HasConditionEffect(ConditionEffects.Invulnerable) || player.HasConditionEffect(ConditionEffects.Invincible))
                return 0;
            if (trueDamage || player.HasConditionEffect(ConditionEffects.ArmorBroken))
                return dmg;
            if (player.HasConditionEffect(ConditionEffects.Armored))
                return Math.Max(dmg * 0.15f, dmg - (GetStats(3) * 2));
            return Math.Max(dmg * 0.15f, dmg - GetStats(3));
        }

        public static float GetSpeed(Entity entity, float stat)
        {
            if (entity.HasConditionEffect(ConditionEffects.Paralyzed))
                return 0;
            if (entity.HasConditionEffect(ConditionEffects.Slowed))
                return 4;
            if (entity.HasConditionEffect(ConditionEffects.Speedy))
                return (4 + 5.6f * (stat / 75f)) * 1.5f;
            return 4 + 5.6f * (stat / 75f);
        }

        public float GetSpeed()
        {
            return GetSpeed(player, GetStats(4));
        }

        public float GetHPRegen()
        {
            if (player.HasConditionEffect(ConditionEffects.Sick))
                return 0;
            return 1 + GetStats(5) / 6.5f;
        }

        public float GetMPRegen()
        {
            if (player.HasConditionEffect(ConditionEffects.Quiet))
                return 0;
            return 0.8f + GetStats(6) / 13.5f;
        }

        public float GetDex()
        {
            if (player.HasConditionEffect(ConditionEffects.Stunned))
                return 0;
            if (player.HasConditionEffect(ConditionEffects.Dazed))
                return 1.5f;
            if (player.HasConditionEffect(ConditionEffects.Berserk))
                return (1.5f + 6.5f * (GetStats(7) / 75f)) * 1.5f;
            return 1.5f + 6.5f * (GetStats(7) / 75f);
        }

        public static int StatsNameToIndex(string name)
        {
            switch (name)
            {
                case "MaxHitPoints":
                    return 0;
                case "MaxMagicPoints":
                    return 1;
                case "Attack":
                    return 2;
                case "Defense":
                    return 3;
                case "Speed":
                    return 4;
                case "HpRegen":
                    return 5;
                case "MpRegen":
                    return 6;
                case "Dexterity":
                    return 7;
                case "Luck":
                    return 8;
                case "Crit":
                    return 9;
            }
            return -1;
        }

        public static string StatsIndexToName(int index)
        {
            switch (index)
            {
                case 0:
                    return "MaxHitPoints";
                case 1:
                    return "MaxMagicPoints";
                case 2:
                    return "Attack";
                case 3:
                    return "Defense";
                case 4:
                    return "Speed";
                case 5:
                    return "HpRegen";
                case 6:
                    return "MpRegen";
                case 7:
                    return "Dexterity";
                case 8:
                    return "Luck";
                case 9:
                    return "Crit";
            }
            return null;
        }

        /// <summary>
        /// Contains tools for sequential randomness.
        /// </summary>
        public class SQLRandom
        {
            //Note: This class requires the storage of a seed to emulate sequential randomness;
            //      You can use the static functions to create similar results, but they will NOT be sequential.
            public SQLRandom(uint seed = 1)
            {
                Seed = seed;
            }

            public uint Seed { get; private set; }

            public static uint NextUInt()
            {
                return (uint)Math.Round(new Random().NextDouble() * (uint.MaxValue - 1) + 1);
            }

            private uint Reseed()
            {
                var a = 16807 * (Seed & 65535);
                var b = 16807 * (Seed >> 16);
                a = a + ((b & 32767) << 16);
                a = a + (b >> 15);
                if (a > 2147483647)
                    a = a - 2147483647;
                return Seed = a;
            }

            public static uint ReseedStatic(uint Seed)
            {
                var a = 16807 * (Seed & 65535);
                var b = 16807 * (Seed >> 16);
                a = a + ((b & 32767) << 16);
                a = a + (b >> 15);
                if (a > 2147483647)
                    a = a - 2147483647;
                return a;
            }

            public float NextSingle()
            {
                return Reseed() / 2147483647;
            }

            public static float NextSingleStatic()
            {
                return ReseedStatic(NextUInt()) / 2147483647;
            }

            public float NextSingle2(float @base = 0.0f, float range = 1.0f)
            {
                return @base + (float)Math.Sqrt(-2 * (float)Math.Log(Reseed() / 2147483647)) * (float)Math.Cos(2 * (Reseed() / 2147483647) * Math.PI) * range;
            }

            public static float NextSingle2Static(float @base = 0.0f, float range = 1.0f)
            {
                return @base + (float)Math.Sqrt(-2 * (float)Math.Log(ReseedStatic(NextUInt()) / 2147483647)) * (float)Math.Cos(2 * (ReseedStatic(NextUInt()) / 2147483647) * Math.PI) * range;
            }

            public uint NextUInt2(uint min, uint max)
            {
                if (min == max) return min;
                return min + Reseed() % (max - min);
            }

            public static uint NextUInt2Static(uint Seed, uint min, uint max)
            {
                if (min == max) return min;
                return min + ReseedStatic(Seed) % (max - min);
            }

            public float NextSingle3(float min, float max)
            {
                return min + (max - min) * NextSingle();
            }

            public static float NextSingle3Static(float min, float max)
            {
                return min + (max - min) * NextSingleStatic();
            }
        }
    }
}