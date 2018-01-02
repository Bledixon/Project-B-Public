using wServer.networking;

namespace wServer.realm.worlds
{
    public class PirateTreasureCove : World
    {
        public const string EPCAVEMAP = "wServer.realm.worlds.elderpcave.jm";

        public PirateTreasureCove()
        {
            Id = EPCAVE_ID;
            Name = "Pirate Treasure Cove";
            Background = 0;
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(EPCAVEMAP, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new PirateTreasureCove());
        }
    }
}
