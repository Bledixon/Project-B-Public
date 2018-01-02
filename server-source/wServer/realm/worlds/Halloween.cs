using wServer.networking;

namespace wServer.realm.worlds
{
    public class Halloween : World
    {
        public const string HALLOWEENMAP = "wServer.realm.worlds.Halloweenie.jm";

        public Halloween()
        {
            SetMusic("GhostlyCaverns");
            Id = CLAND_ID;
            Name = "Halloween";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(60 * 1000);
        }
        protected override void Init()
        {
            LoadMap(HALLOWEENMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Halloween());
        }
    }
}
