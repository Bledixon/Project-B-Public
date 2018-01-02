﻿using wServer.realm;

namespace wServer.logic.transitions
{
    internal class PlayerWithinTransition : Transition
    {
        //State storage: none

        private readonly double dist;

        public PlayerWithinTransition(double dist, string targetState)
            : base(targetState)
        {
            this.dist = dist;
        }

        protected override bool TickCore(Entity host, RealmTime time, ref object state)
        {
            return host.GetNearestEntity(dist, null) != null;
        }
    }
}