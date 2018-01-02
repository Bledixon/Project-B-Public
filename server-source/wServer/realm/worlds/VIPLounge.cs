using wServer.networking;

namespace wServer.realm.worlds
{
    public class VIPLounge : World
    {
        public const string VIPLOUNGEMAP = "wServer.realm.worlds.viplounge.jm";

        public VIPLounge()
        {
            Id = VIPLOUNGE;
            Name = "VIP Lounge";
            Background = 0;
            AllowTeleport = true;
        }
        protected override void Init()
        {
            LoadMap(VIPLOUNGEMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new VIPLounge());
        }
    }
}
