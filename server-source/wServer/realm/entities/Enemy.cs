using System.Collections.Generic;
using System.Linq;
using wServer.logic;
using wServer.networking.svrPackets;
using wServer.realm.terrain;

namespace wServer.realm.entities
{
    public class Enemy : Character
    {
        private DamageCounter counter;
        private readonly bool nonDamage;
        private float bleeding;
        private Position? pos;

        public Enemy(RealmManager manager, ushort objType)
            : base(manager, objType, new wRandom())
        {
            nonDamage = ObjectDesc.MaxHP == 0;
            MaxHP = ObjectDesc.MaxHP;
            Defense = ObjectDesc.Defense;
            counter = new DamageCounter(this);
        }

        public int Defense { get; set; }
        public int MaxHP { get; set; }

        public DamageCounter DamageCounter
        {
            get { return counter; }
        }

        public WmapTerrain Terrain { get; set; }

        public int AltTextureIndex { get; set; }
        public string LootState { get; set; }

        public Position SpawnPoint
        {
            get { return pos ?? new Position {X = X, Y = Y}; }
        }

        protected override void ExportStats(IDictionary<StatsType, object> stats)
        {
            stats[StatsType.AltTextureIndex] = AltTextureIndex;

            stats[StatsType.Defense] = Defense;
            stats[StatsType.HP] = HP;
            stats[StatsType.MaximumHP] = MaxHP;

            base.ExportStats(stats);
        }

        public override void Init(World owner)
        {
            base.Init(owner);
            if (ObjectDesc.StasisImmune)
                ApplyConditionEffect(new ConditionEffect
                {
                    Effect = ConditionEffectIndex.StasisImmune,
                    DurationMS = -1
                });
        }

        public void Death(RealmTime time)
        {
            if (isDead) return;
            isDead = true;
            counter.Death(time);
            if (CurrentState != null)
                CurrentState.OnDeath(new BehaviorEventArgs(this, time));
            Owner.LeaveWorld(this);
        }

        public void SetDamageCounter(DamageCounter counter, Enemy enemy)
        {
            this.counter = counter;
            this.counter.UpdateEnemy(enemy);
        }

        public int Damage(Player from, RealmTime time, int dmg, bool noDef, bool fromProjectile, Projectile proj, params ConditionEffect[] effs)
        {
            if (nonDamage || isDead) return 0;
            if (HasConditionEffect(ConditionEffects.Invincible))
                return 0;
            if (!HasConditionEffect(ConditionEffects.Paused) && !HasConditionEffect(ConditionEffects.Stasis))
            {
                var effDmg = (int)StatsManager.GetEnemyDamage(this, dmg, 0);
                if (!noDef)
                    effDmg = (int)StatsManager.GetEnemyDamage(this, dmg, Defense);

                HP -= effDmg;
                ApplyConditionEffect(effs);
                Owner.BroadcastPacket(new DamagePacket
                {
                    TargetId = Id,
                    Effects = 0,
                    Damage = (ushort)effDmg,
                    Killed = HP <= 0,
                    BulletId = 0,
                    ObjectId = from.Id
                }, fromProjectile ? from : null);

                if (from.IsValid()) counter.HitBy(from, time, proj, effDmg);

                if (HP <= 0 && Owner != null)
                {
                    Death(time);
                }

                UpdateCount++;
                return effDmg;
            }
            return 0;
        }

        public int AdminKill(Player from, RealmTime time)
        {
            if (nonDamage || isDead) return 0;

            if (from.IsValid()) counter.HitBy(from, time, null, MaxHP + 1);
            Death(time);
            UpdateCount++;
            return MaxHP + 1;
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            if (nonDamage) return false;
            if (HasConditionEffect(ConditionEffects.Invincible))
                return false;
            if (projectile.ProjectileOwner is Player &&
                !HasConditionEffect(ConditionEffects.Paused) &&
                !HasConditionEffect(ConditionEffects.Stasis))
            {
                int def = ObjectDesc.Defense;
                if (projectile.Descriptor.ArmorPiercing)
                    def = 0;
                var dmg = projectile.Damage;
                if (!HasConditionEffect(ConditionEffects.Invulnerable))
                    HP -= dmg;
                foreach (ConditionEffect effect in projectile.Descriptor.Effects.Where(effect => (effect.Effect != ConditionEffectIndex.Stunned || !ObjectDesc.StunImmune) && (effect.Effect != ConditionEffectIndex.Paralyzed || !ObjectDesc.ParalyzedImmune)))
                    ApplyConditionEffect(effect);
                
                Owner.BroadcastPacket(new DamagePacket
                {
                    TargetId = Id,
                    Effects = projectile.ConditionEffects,
                    Damage = (ushort) dmg,
                    Killed = HP < 0,
                    BulletId = projectile.ProjectileId,
                    ObjectId = projectile.ProjectileOwner.Self.Id
                }, projectile.ProjectileOwner as Player);

                counter.HitBy(projectile.ProjectileOwner as Player, time, projectile, dmg);

                if (HP < 0 && Owner != null)
                {
                    Death(time);
                }
                UpdateCount++;
                return true;
            }
            return false;
        }

        public override void Tick(RealmTime time)
        {
            if (pos == null)
                pos = new Position {X = X, Y = Y};

            if (!nonDamage && HasConditionEffect(ConditionEffects.Bleeding))
            {
                if (bleeding > 1)
                {
                    HP -= (int) bleeding;
                    bleeding -= (int) bleeding;
                    UpdateCount++;
                }
                bleeding += 28*(time.thisTickTimes/1000f);
            }
            base.Tick(time);
        }
    }
}