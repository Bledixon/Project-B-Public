﻿using System;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.behaviors
{
    internal class Grenade : Behavior
    {
        //State storage: cooldown timer

        private readonly int damage;
        private readonly float radius;
        private readonly double range;
        private Cooldown coolDown;
        private double? fixedAngle;

        public Grenade(double radius, int damage, double range = 5,
            double? fixedAngle = null, Cooldown coolDown = new Cooldown())
        {
            this.radius = (float) radius;
            this.damage = damage;
            this.range = range;
            this.fixedAngle = fixedAngle*Math.PI/180;
            this.coolDown = coolDown.Normalize();
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            state = 0;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            var cool = (int) state;

            if (cool <= 0)
            {
                if (host.HasConditionEffect(ConditionEffects.Stunned)) return;

                Entity player = host.GetNearestEntity(range, null);
                if (player != null || fixedAngle != null)
                {
                    Position target;
                    if (fixedAngle != null)
                        target = new Position
                        {
                            X = host.X + (float)(range * Math.Cos(fixedAngle.Value)),
                            Y = host.Y + (float)(range * Math.Sin(fixedAngle.Value)),
                        };
                    else
                        target = new Position
                        {
                            X = player.X,
                            Y = player.Y,
                        };
                    host.Owner.BroadcastPacket(new ShowEffectPacket
                    {
                        EffectType = EffectType.Throw,
                        Color = new ARGB(0xffff0000),
                        TargetId = host.Id,
                        PosA = target
                    }, null);
                    host.Owner.Timers.Add(new WorldTimer(1500, (world, t) =>
                    {
                        if (host != null && player != null)
                        {
                            try
                            {
                                world.BroadcastPacket(new AOEPacket
                                {
                                    Position = target,
                                    Radius = radius,
                                    Damage = (ushort)damage,
                                    EffectDuration = 0,
                                    Effects = 0,
                                    OriginType = host.ObjectType
                                }, null);
                                world.AOE(target, radius, true, p => { (p as IPlayer).Damage(damage, host as Character, false); });
                            }
                            catch { }
                        }
                    }));
                }
                cool = coolDown.Next(Random);
            }
            else
                cool -= time.thisTickTimes;

            state = cool;
        }
    }
}