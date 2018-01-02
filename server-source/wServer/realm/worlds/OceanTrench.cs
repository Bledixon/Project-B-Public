using wServer.networking;

namespace wServer.realm.worlds
{
    public class OceanTrench : World
    {
        public OceanTrench()
        {
            Name = "Ocean Trench";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(60 * 1000);
            RayDungeon = true;
        }
        protected override void Init()
        {
            base.FromWorldMap(typeof(RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.OceanTrench.wmap"));
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new OceanTrench());
        }
    }
}

