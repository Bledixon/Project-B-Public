using wServer.realm;

namespace wServer.logic.behaviors
{
    internal class OnDeath : Behavior
    {
        private readonly Behavior[] behaviors;

        public OnDeath(params Behavior[] behaviors)
        {
            this.behaviors = behaviors;
        }

        protected internal override void Resolve(State parent)
        {
            parent.Death += (sender, e) =>
            {
                if (e.Host.CurrentState.Is(parent))
                {
                    foreach (var i in behaviors)
                        i.Tick(e.Host, e.Time);
                }
            };
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
        }
    }
}