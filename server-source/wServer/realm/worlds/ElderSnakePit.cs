using wServer.networking;

namespace wServer.realm.worlds
{
    public class ElderSnakePit : World
    {
        public const string ELDERSNAKE = "wServer.realm.worlds.ElderSnakePit.jm";

        public ElderSnakePit()
        {
            Id = ELDER_SNAKE;
            Name = "Elder Snake Pit";
            Background = 0;
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(ELDERSNAKE, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new ElderSnakePit());
        }
    }
}