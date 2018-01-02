using wServer.networking;

namespace wServer.realm.worlds
{
    public class AdminTestWorld : World
    {
        public AdminTestWorld()
        {
            Name = "Testing and Stuff";
            Background = 0;
            SetMusic("Haunted Cemetary");
            AllowTeleport = true;
            SetRemovalMS(20 * 1000);
        }

        protected override void Init()
        {
            base.FromWorldMap(typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.pvp.wmap"));
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new AdminTestWorld());
        }
    }
}