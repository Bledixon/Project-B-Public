using wServer.networking;

namespace wServer.realm.worlds
{
    public class Shaitan : World
    {
        public const string SHAITANMAP = "wServer.realm.worlds.shaitan.jm";

        public Shaitan()
        {
            Id = SHAITAN_ID;
            Name = "Lair of Shaitan";
            Background = 0;
            AllowTeleport = false;
            SetRemovalMS(20 * 1000);
        }
        protected override void Init()
        {
            LoadMap(SHAITANMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Shaitan());
        }
    }
}

