using wServer.networking;

namespace wServer.realm.worlds
{
    public class TombAncients : World
    {
        public TombAncients()
        {
            Name = "Tomb of the Ancients";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(2 * 60 * 1000);
        }
        protected override void Init()
        {
            base.FromWorldMap(typeof(RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.TombAncients.wmap"));
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new TombAncients());
        }
    }
}

