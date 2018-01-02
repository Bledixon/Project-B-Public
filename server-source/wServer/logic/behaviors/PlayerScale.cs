using System;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.behaviors
{
    internal class PlayerScaleHealth : Behavior
    {
        //State storage: none

        private readonly int amount;

        public PlayerScaleHealth(int amountperplayer)
        {
            amount = amountperplayer;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            if (state != null || host.Owner == null) return;

            state = true;

            (host as Enemy).HP += amount*Math.Max(host.Owner.Players.Count - 1, 0);
            (host as Enemy).MaxHP += amount*Math.Max(host.Owner.Players.Count - 1, 0);
            host.UpdateCount++;
        }
    }

    internal class PlayerScaleDefense : Behavior
    {
        //State storage: none

        private readonly int amount;

        public PlayerScaleDefense(int amountperplayer)
        {
            amount = amountperplayer;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            if (state != null || host.Owner == null) return;

            state = true;

            (host as Enemy).Defense += amount*Math.Max(host.Owner.Players.Count - 1, 0);
            host.UpdateCount++;
        }
    }
}