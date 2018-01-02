using wServer.networking;

namespace wServer.realm.worlds
{
    public class Hive : World
    {
        public const string HIVE = "wServer.realm.worlds.hive.jm";

        public Hive()
        {
            Id = HIVE_ID;
            Name = "Hive";
            Background = 0;
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(HIVE, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new Hive());
        }
    }
}
