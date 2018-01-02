﻿using System;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.behaviors
{
    internal class Shoot : CycleBehavior
    {
        //State storage: cooldown timer

        private readonly double angleOffset;
        private readonly int coolDownOffset;
        private readonly int count;
        private readonly double? fixedAngle;
        private readonly double predictive;
        private readonly int projectileIndex;
        private readonly double radius;
        private readonly double shootAngle;
        private Cooldown coolDown;
        private double? defaultAngle;

        public Shoot(double radius, int count = 1, double? shootAngle = null,
            int projectileIndex = 0, double? fixedAngle = null,
            double angleOffset = 0, double? defaultAngle = null,
            double predictive = 0, int coolDownOffset = 0,
            Cooldown coolDown = new Cooldown())
        {
            this.radius = radius;
            this.count = count;
            this.shootAngle = count == 1 ? 0 : (shootAngle ?? 360.0/count)*Math.PI/180;
            this.fixedAngle = fixedAngle*Math.PI/180;
            this.angleOffset = angleOffset*Math.PI/180;
            this.defaultAngle = defaultAngle*Math.PI/180;
            this.projectileIndex = projectileIndex;
            this.predictive = predictive;
            this.coolDownOffset = coolDownOffset;
            this.coolDown = coolDown.Normalize();
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            state = coolDownOffset;
        }

        private static double Predict(Entity host, Entity target, ProjectileDesc desc)
        {
            Position? history = target.TryGetHistory(100);
            if (history == null)
                return 0;

            double originalAngle = Math.Atan2(history.Value.Y - host.Y, history.Value.X - host.X);
            double newAngle = Math.Atan2(target.Y - host.Y, target.X - host.X);


            float bulletSpeed = desc.Speed/100f;
            double dist = target.Dist(host);
            double angularVelo = (newAngle - originalAngle)/(100/1000f);
            return angularVelo*bulletSpeed;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            if (state == null)
                return;
            var cool = (int) state;
            Status = CycleStatus.NotStarted;

            if (cool <= 0)
            {
                if (host.HasConditionEffect(ConditionEffects.Stunned)) return;

                Entity player = host.GetNearestEntity(radius, null);
                if (player != null || defaultAngle != null || fixedAngle != null)
                {
                    ProjectileDesc desc = host.ObjectDesc.Projectiles[projectileIndex];

                    double a = fixedAngle ??
                               (player == null ? defaultAngle.Value : Math.Atan2(player.Y - host.Y, player.X - host.X));
                    a += angleOffset;
                    if (predictive != 0 && player != null)
                        a += Predict(host, player, desc)*predictive;

                    int dmg;
                    if (host is Character)
                        dmg = (host as Character).Random.Next(desc.MinDamage, desc.MaxDamage);
                    else
                        dmg = Random.Next(desc.MinDamage, desc.MaxDamage);

                    double startAngle = a - shootAngle*(count - 1)/2;
                    byte prjId = 0;
                    var prjPos = new Position {X = host.X, Y = host.Y};
                    for (int i = 0; i < count; i++)
                    {
                        Projectile prj = host.CreateProjectile(
                            desc, host.ObjectType, dmg, time.tickTimes,
                            prjPos, (float) (startAngle + shootAngle*i));
                        host.Owner.EnterWorld(prj);
                        if (i == 0)
                            prjId = prj.ProjectileId;
                    }

                    host.Owner.BroadcastPacket(new MultiShootPacket
                    {
                        BulletId = prjId,
                        OwnerId = host.Id,
                        Position = prjPos,
                        Angle = (float) startAngle,
                        Damage = (short) dmg,
                        BulletType = (byte) (desc.BulletType),
                        AngleIncrement = (float) shootAngle,
                        NumShots = (byte) count,
                    }, null);
                }
                cool = coolDown.Next(Random);
                Status = CycleStatus.Completed;
            }
            else
            {
                cool -= time.thisTickTimes;
                Status = CycleStatus.InProgress;
            }

            state = cool;
        }
    }
}