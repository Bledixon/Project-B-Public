using wServer.networking;

namespace wServer.realm.worlds
{
    public class Abyss : World
    {
        public const string ABYSSMAP = "wServer.realm.worlds.Abyss.wmap";

        public Abyss()
        {
            Id = ABYSS;
            Name = "Abyss of Demons";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(20 * 1000);
        }
        protected override void Init()
        {
            LoadMap(ABYSSMAP, MapType.Wmap);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Abyss());
        }
    }
}

