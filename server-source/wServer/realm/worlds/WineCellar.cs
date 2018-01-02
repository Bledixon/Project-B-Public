using wServer.networking;

namespace wServer.realm.worlds
{
    public class WineCellar : World
    {
        public const string ORYXCHAMBER = "wServer.realm.worlds.oryxchamber.jm";

        public WineCellar()
        {
            Name = "Wine Cellar";
            Background = 0;
            SetMusic("Wine Cellar");
            AllowTeleport = false;
            SetRemovalMS(2 * 60 * 1000);
        }

        protected override void Init()
        {
            LoadMap(ORYXCHAMBER, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new WineCellar());
        }
    }
}