using wServer.networking;

namespace wServer.realm.worlds
{
    public class ElderEventArena : World
    {
        public const string ELDEREVENTARENA = "wServer.realm.worlds.elderevent.jm";

        public ElderEventArena()
        {
            Id = EEARENA_ID;
            Name = "Elder Event Arena";
            Background = 0;
            SetMusic("earena");
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(ELDEREVENTARENA, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new ElderEventArena());
        }
    }
}
