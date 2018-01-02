using wServer.networking;

namespace wServer.realm.worlds
{
    public class UndeadLair : World
    {
        public UndeadLair()
        {
            Name = "Undead Lair";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(60 * 1000);
        }
        protected override void Init()
        {
            base.FromWorldMap(typeof(RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.UndeadLair.wmap"));
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new UndeadLair());
        }
    }
}

