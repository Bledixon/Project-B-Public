using wServer.networking;

namespace wServer.realm.worlds
{
    public class EventArena : World
    {
        public const string EVENTARENA = "wServer.realm.worlds.eventarena.jm";

        public EventArena()
        {
        	Id = EARENA_ID;
            Name = "Event Arena";
            Background = 0;
            SetMusic("earena");
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(EVENTARENA, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new EventArena());
        }
    }
}

