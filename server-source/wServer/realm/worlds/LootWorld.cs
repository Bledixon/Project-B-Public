using wServer.networking;

namespace wServer.realm.worlds
{
    public class LootWorld : World
    {
        public LootWorld()
        {
            Name = "Max Level Loot World";
            Background = 0;
            AllowTeleport = true;
            SetRemovalMS(2 * 60 * 1000);
        }

        protected override void Init()
        {
            base.FromWorldMap(typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.LootWorld.wmap"));
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new LootWorld());
        }
    }
}

