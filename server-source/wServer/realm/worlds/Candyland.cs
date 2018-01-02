using wServer.networking;

namespace wServer.realm.worlds
{
    public class Candyland : World
    {
        public const string CANDYLANDMAP = "wServer.realm.worlds.candyland.jm";

        public Candyland()
        {
            Id = CLAND_ID;
            Name = "Candyland";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(20 * 1000);
        }
        protected override void Init()
        {
            LoadMap(CANDYLANDMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Candyland());
        }
    }
}
