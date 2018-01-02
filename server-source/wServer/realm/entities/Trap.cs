using System.Collections.Generic;
using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    internal class Trap : StaticObject
    {
        private const int LIFETIME = 10;

        private readonly int dmg;
        private readonly int duration;
        private readonly ConditionEffectIndex effect;
        private readonly Player player;
        private readonly float radius;

        private int p;
        private int t;

        public Trap(Player player, float radius, int dmg, ConditionEffectIndex eff, float effDuration)
            : base(player.Manager, 0x0711, LIFETIME*1000, true, true, false)
        {
            this.player = player;
            this.radius = radius;
            this.dmg = dmg;
            effect = eff;
            duration = (int) (effDuration*1000);
        }

        public override void Tick(RealmTime time)
        {
            if (t/500 == p)
            {
                Owner.BroadcastPacket(new ShowEffectPacket
                {
                    EffectType = EffectType.Trap,
                    Color = new ARGB(0xff9000ff),
                    TargetId = Id,
                    PosA = new Position {X = radius/2}
                }, null);
                p++;
                if (p == LIFETIME*2)
                {
                    Explode(time);
                    return;
                }
            }
            t += time.thisTickTimes;

            bool monsterNearby = false;
            if (player.PvP)
                this.AOE(radius/2, true, enemy =>
                {
                    var plr = (enemy as Player);
                    if (!plr.PvP || (plr.PvP && plr.Team != 0 && plr.Team == player.Team) || plr == player)
                        return;
                    monsterNearby = true;
                });
            this.AOE(radius/2, false, enemy => monsterNearby = true);
            if (monsterNearby && !HasConditionEffect(ConditionEffects.Invincible))
                Explode(time);

            base.Tick(time);
        }

        private void Explode(RealmTime time)
        {
            Owner.BroadcastPacket(new ShowEffectPacket
            {
                EffectType = EffectType.AreaBlast,
                Color = new ARGB(0xff9000ff),
                TargetId = Id,
                PosA = new Position {X = radius}
            }, null);
            this.AOE(radius, false, enemy =>
            {
                (enemy as Enemy).Damage(player, time, dmg, false, false, null, new ConditionEffect
                {
                    Effect = effect,
                    DurationMS = duration
                });
            });
            if (player.PvP)
            {
                this.AOE(radius, true, enemy =>
                {
                    var plr = (enemy as Player);
                    if (!plr.PvP || (plr.PvP && plr.Team != 0 && plr.Team == player.Team) || plr == player)
                        return;
                    var targets = new List<Player>();
                    if ((enemy as Player).Id != player.Id)
                        targets.Add(enemy as Player);
                    foreach (Player i in targets)
                    {
                        i.Damage(dmg, i, false, true, 0.20f);
                        i.ApplyConditionEffect(new ConditionEffect
                        {
                            Effect = effect,
                            DurationMS = duration
                        });
                    }
                });
            }
            Owner.LeaveWorld(this);
        }
    }
}