﻿using wServer.realm;

namespace wServer.logic.transitions
{
    internal class EntityNotExistsTransition : Transition
    {
        //State storage: none

        private readonly double dist;
        private readonly ushort target;

        public EntityNotExistsTransition(string target, double dist, string targetState)
            : base(targetState)
        {
            this.dist = dist;
            this.target = BehaviorDb.InitGameData.IdToObjectType[target];
        }

        protected override bool TickCore(Entity host, RealmTime time, ref object state)
        {
            return host.GetNearestEntity(dist, target) == null;
        }
    }
}