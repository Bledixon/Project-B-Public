using wServer.networking;

namespace wServer.realm.worlds
{
    public class GoldMarket : World
    {
        public const string GOLDMARKETMAP = "wServer.realm.worlds.goldmarket.jm";

        public GoldMarket()
        {
            Id = GMARKET_ID;
            Name = "Gold Market";
            Background = 0;
            AllowTeleport = true;
        }
        protected override void Init()
        {
            LoadMap(GOLDMARKETMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Market());
        }
    }
}
