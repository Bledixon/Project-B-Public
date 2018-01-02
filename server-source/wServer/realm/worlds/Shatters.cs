using wServer.networking;

namespace wServer.realm.worlds
{
    public class Shatters : World
    {
        public const string SHATTERSMAP = "wServer.realm.worlds.Shatters.jm";

        public Shatters()
        {
            Id = SHATTERS_ID;
            Name = "The Shatters";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(20 * 1000);
            RayDungeon = true;
            Petless = true;
        }
        protected override void Init()
        {
            LoadMap(SHATTERSMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Shatters());
        }
    }
}
