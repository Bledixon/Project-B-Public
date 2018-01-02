using wServer.networking;

namespace wServer.realm.worlds
{
    public class PvpArena : World
    {
        public PvpArena()
        {
            Id = PVP;
            Name = "PVP Arena";
            Background = 0;
            Difficulty = 5;
            SetMusic("Haunted Cemetary");
            AllowTeleport = false;
            PvP = true;
            SetRemovalMS(2 * 60 * 1000);
        }

        protected override void Init()
        {
            base.FromWorldMap(typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.pvp.wmap"));
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new PvpArena());
        }
    }
}