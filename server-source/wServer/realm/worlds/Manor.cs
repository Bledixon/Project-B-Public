using wServer.networking;

namespace wServer.realm.worlds
{
    public class Manor : World
    {
        public Manor()
        {
            Name = "Manor of the Immortals";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(60 * 1000);
        }

        protected override void Init()
        {
            base.FromWorldMap(typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.Manor.wmap"));
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new Manor());
        }
    }
}

