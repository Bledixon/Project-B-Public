using wServer.networking;

namespace wServer.realm.worlds
{
    public class ElderWineCellar : World
    {
        public const string EORYXCHAMBER = "wServer.realm.worlds.elderoryxchamber.jm";

        public ElderWineCellar()
        {
            Name = "Elder Wine Cellar";
            Background = 0;
            SetMusic("Wine Cellar");
            AllowTeleport = false;
            SetRemovalMS(60 * 1000);
        }

        protected override void Init()
        {
            LoadMap(EORYXCHAMBER, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new ElderWineCellar());
        }
    }
}

