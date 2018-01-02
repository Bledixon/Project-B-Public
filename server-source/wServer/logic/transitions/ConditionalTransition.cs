using wServer.realm;

namespace wServer.logic.transitions
{
    internal class ConditionalTransition : Transition
    {
        //State storage: none

        private readonly ConditionalBehavior condition;

        public ConditionalTransition(ConditionalBehavior condition, string targetState)
            : base(targetState)
        {
            this.condition = condition;
        }

        protected override bool TickCore(Entity host, RealmTime time, ref object state)
        {
            condition.Tick(host, time);
            return condition.Result;
        }
    }
}