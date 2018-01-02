using wServer.networking;

namespace wServer.realm.worlds
{
    public class SpriteWorld : World
    {
        public SpriteWorld()
        {
            Name = "Glowing Portal";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(60 * 1000);
        }
        protected override void Init()
        {
            FromWorldMap(typeof(RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.SpriteWorld.wmap"));
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new SpriteWorld());
        }
    }
}


