using System;
using System.Collections.Generic;
using System.Linq;
using wServer.networking;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.behaviors
{
    internal class NexusHealHp : Behavior
    {
        //State storage: cooldown timer

        private readonly int amount;
        private readonly double range;
        private Cooldown coolDown;

        public NexusHealHp(double range, int amount, Cooldown coolDown = new Cooldown())
        {
            this.range = (float) range;
            this.amount = amount;
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
				if (host.HasConditionEffect(ConditionEffects.Sick)) return;
				
                var entity = host.GetNearestEntity(range, null) as Player;
                if (entity != null)
                {
                    int maxHp = entity.Stats[0] + entity.Boost[0];
                    int newHp = Math.Min(maxHp, entity.HP + amount);
                    if (newHp != entity.HP)
                    {
                        int n = newHp - entity.HP;
                        entity.HP = newHp;
                        entity.UpdateCount++;
                        entity.Owner.BroadcastPacket(new ShowEffectPacket
                        {
                            EffectType = EffectType.Potion,
                            TargetId = entity.Id,
                            Color = new ARGB(0xffffffff)
                        }, null);
                        entity.Owner.BroadcastPacket(new ShowEffectPacket
                        {
                            EffectType = EffectType.Trail,
                            TargetId = host.Id,
                            PosA = new Position {X = entity.X, Y = entity.Y},
                            Color = new ARGB(0xffffffff)
                        }, null);
                        entity.Owner.BroadcastPacket(new NotificationPacket
                        {
                            ObjectId = entity.Id,
                            Text = "+" + n,
                            Color = new ARGB(0xff00ff00)
                        }, null);
                    }
                }
                cool = coolDown.Next(Random);
            }
            else
                cool -= time.thisTickTimes;

            state = cool;
        }
    }

    internal class NexusHealHpAOE : Behavior
    {
        //State storage: cooldown timer

        private readonly int amount;
        private readonly float radius;
        private Cooldown coolDown;

        public NexusHealHpAOE(double radius, int amount,
            Cooldown coolDown = new Cooldown())
        {
            this.radius = (float)radius;
            this.amount = amount;
            this.coolDown = coolDown.Normalize();
//            if (Char != Decoy)
//            {
//            	radius = 0;
//            }
        }
        

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            state = 0;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            var cool = (int)state;

            if (cool <= 0)
            {
                if (host.HasConditionEffect(ConditionEffects.Sick)) return;

                if(host.GetNearestEntity(radius, null) != null)
                {
                    var pkts = new List<Packet>();
                    foreach (var player in host.GetNearestEntities(radius, null).Select(p => (p as Player)).Where(player => player.Stats[0] + player.Boost[0] != player.HP))
                    {
                        player.EntityHealHp(player, host, amount, pkts);
                        pkts.Add(new ShowEffectPacket
                        {
                            EffectType = EffectType.Trail,
                            TargetId = host.Id,
                            PosA = new Position {X = player.X, Y = player.Y},
                            Color = new ARGB(0xffffffff)
                        });
                    }
                    host.Owner.BroadcastPackets(pkts, null);
                }
                cool = coolDown.Next(Random);
            }
            else
                cool -= time.thisTickTimes;

            state = cool;
        }
    }
}