using wServer.realm;

namespace wServer.logic.behaviors
{
    internal class SwitchMusic : CycleBehavior
    {
        //State storage: time

        private readonly string[] music;

        public SwitchMusic(params string[] music)
        {
            this.music = music;
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            state = null;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            if (state != null) return;

            host.Owner.SwitchMusic(music);
        }
    }
}