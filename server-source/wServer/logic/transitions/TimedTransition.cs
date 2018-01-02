﻿using wServer.realm;

namespace wServer.logic.transitions
{
    internal class TimedTransition : Transition
    {
        //State storage: cooldown timer

        private readonly bool randomized;
        private readonly int time;

        public TimedTransition(int time, string targetState, bool randomized = false)
            : base(targetState)
        {
            this.time = time;
            this.randomized = randomized;
        }

        protected override bool TickCore(Entity host, RealmTime time, ref object state)
        {
            int cool;
            if (state == null) cool = randomized ? Random.Next(this.time) : this.time;
            else cool = (int) state;

            bool ret = false;
            if (cool <= 0)
            {
                ret = true;
                cool = this.time;
            }
            else
                cool -= time.thisTickTimes;

            state = cool;
            return ret;
        }
    }
}