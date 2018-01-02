using wServer.networking;

namespace wServer.realm.worlds
{
    public class ChristmasCellar : World
    {
        public ChristmasCellar()
        {
            Name = "Christmas Cellar";
            Background = 0;
            SetMusic("winter1");
            AllowTeleport = false;
            SetRemovalMS(60 * 1000);
        }

        protected override void Init()
        {
            base.FromWorldMap(
        		typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.ChristmasCellar.wmap"));
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new ChristmasCellar());
        }
    }
}

