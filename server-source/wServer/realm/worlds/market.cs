using wServer.networking;

namespace wServer.realm.worlds
{
    public class Market : World
    {
        public const string MARKETMAP = "wServer.realm.worlds.market.jm"; //easy access

        public Market()
        {
            Id = MARKET_ID;
            Name = "Market";
            Background = 0;
            AllowTeleport = true;
        }
        protected override void Init()
        {
            LoadMap(MARKETMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Market());
        }
    }
}

