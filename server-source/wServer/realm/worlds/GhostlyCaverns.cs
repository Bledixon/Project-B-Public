using wServer.networking;

namespace wServer.realm.worlds
{
    public class GhostlyCaverns : World
    {
        public GhostlyCaverns()
        {
            Name = "Ghostly Caverns";
            Background = 0;
            SetMusic("GhostlyCaverns");
            AllowTeleport = true;
            SetRemovalMS(20 * 1000);
        }
        protected override void Init()
        {
            base.FromWorldMap(typeof(RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.GhostlyCaverns.wmap"));
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new GhostlyCaverns());
        }
    }
}
