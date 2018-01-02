using System.Collections.Generic;
using wServer.networking;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic
{
    internal class PetHeal : Behavior
    {
        //State storage: cooldown timer

        private readonly int Hitpoints;
        private readonly int Magicpoints;
        private readonly float radius;
        private Cooldown coolDown;

        public PetHeal(double radius, int Hitpoints, int Magicpoints,
            Cooldown coolDown = new Cooldown())
        {
            this.radius = (float)radius;
            this.Hitpoints = Hitpoints;
            this.Magicpoints = Magicpoints;
            this.coolDown = coolDown.Normalize();
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            state = 0;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            if (host.playerOwner.Owner.Name == "Nexus")
                return;
            var cool = (int)state;
            if (host == null || host.playerOwner == null || host.playerOwner.Client == null || host.playerOwner.Client.Character == null)
                return;

            if (cool <= 0)
            {
                if (host.HasConditionEffect(ConditionEffects.Sick)) return;

                Player player = host.playerOwner;
                {
                    var pkts = new List<Packet>();
                    {
                        if (player.Client.Character.HitPoints == player.Client.Character.MaxHitPoints)
                            return;
                        if (player == null || host == null ||Hitpoints < 0 || pkts == null) return;
                        player.EntityHealHp(player, host, Hitpoints, pkts);
                        if (player.Stats[0] + player.Boost[0] != player.HP)
                            pkts.Add(new ShowEffectPacket
                            {
                                EffectType = EffectType.Trail,
                                TargetId = host.Id,
                                PosA = new Position { X = player.X, Y = player.Y },
                                Color = new ARGB(0xff000000)
                            });
                        player.EntityHealMp(player, host, Magicpoints, pkts);
                        if (player.Stats[1] + player.Boost[1] != player.MP)
                            pkts.Add(new ShowEffectPacket
                            {
                                EffectType = EffectType.Trail,
                                TargetId = host.Id,
                                PosA = new Position { X = player.X, Y = player.Y },
                                Color = new ARGB(0xff000000)
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