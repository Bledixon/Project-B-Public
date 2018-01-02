using wServer.networking;

namespace wServer.realm.worlds
{
    public class ElderAbyss : World
    {
        public const string ELDERABYSS = "wServer.realm.worlds.ElderAbyss.jm";

        public ElderAbyss()
        {
            Id = ELDER_ABYSS;
            Name = "Elder Abyss of Demons";
            Background = 0;
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(ELDERABYSS, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new ElderAbyss());
        }
    }
}
