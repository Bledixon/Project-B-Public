using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.transitions
{
    internal class HpLessTransition : Transition
    {
        //State storage: none

        private readonly double threshold;

        public HpLessTransition(double threshold, string targetState)
            : base(targetState)
        {
            this.threshold = threshold;
        }

        protected override bool TickCore(Entity host, RealmTime time, ref object state)
        {
            return ((double) (host as Enemy).HP/host.ObjectDesc.MaxHP) < threshold;
        }
    }
}