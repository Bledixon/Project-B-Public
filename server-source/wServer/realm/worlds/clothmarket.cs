using wServer.networking;

namespace wServer.realm.worlds
{
    public class ClothMarket : World
    {
        public const string CLOTHMARKETMAP = "wServer.realm.worlds.clothmarket.jm"; //easy access

        public ClothMarket()
        {
            Id = CMARKET_ID;
            Name = "Cloth Market";
            Background = 0;
            AllowTeleport = true;
        }
        protected override void Init()
        {
            LoadMap(CLOTHMARKETMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Market());
        }
    }
}
