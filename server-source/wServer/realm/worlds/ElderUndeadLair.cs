using wServer.networking;

namespace wServer.realm.worlds
{
    public class ElderUndeadLair : World
    {
        public const string ELDERUDL = "wServer.realm.worlds.ElderUDL.jm";

        public ElderUndeadLair()
        {
            Id = ELDER_UDL;
            Name = "Elder Undead Lair";
            Background = 0;
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(ELDERUDL, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new ElderUndeadLair());
        }
    }
}
