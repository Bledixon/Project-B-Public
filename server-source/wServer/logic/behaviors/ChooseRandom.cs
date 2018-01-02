using wServer.realm;

namespace wServer.logic.behaviors
{
    internal class ChooseRandom : Behavior
    {
        private readonly Behavior[] choices;

        public ChooseRandom(params Behavior[] choices)
        {
            this.choices = choices;
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            state = null;
            foreach (Behavior i in choices)
                i.OnStateEntry(host, time);
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            if (state == null)
                state = choices[Random.Next(0, choices.Length)];
            (state as Behavior).Tick(host, time);
        }
    }
}