using wServer.networking;

namespace wServer.realm.worlds
{
    public class HalloweenRaid : World
    {
        public const string HALLOWEENRAID = "wServer.realm.worlds.HalloweenRaid.jm";

        public HalloweenRaid()
        {
            Id = HALLOWEENRAID_ID;
            Name = "Halloween Raid";
            Background = 0;
            AllowTeleport = true;
            RayDungeon = true;
            SetRemovalMS(30 * 1000);
        }
        protected override void Init()
        {
            LoadMap(HALLOWEENRAID, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new HalloweenRaid());
        }
    }
}
