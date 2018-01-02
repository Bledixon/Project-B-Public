using wServer.networking;

namespace wServer.realm.worlds
{
    public class SnakePit : World
    {
        public const string SNAKEPIT = "wServer.realm.worlds.snakepit.jm";

        public SnakePit()
        {
            Name = "Snake Pit";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(60 * 1000);
        }
        protected override void Init()
        {
            LoadMap(SNAKEPIT, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new SnakePit());
        }
    }
}

