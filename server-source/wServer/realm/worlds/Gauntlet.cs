using wServer.networking;

namespace wServer.realm.worlds
{
    public class Gauntlet : World
    {
        public Gauntlet()
        {
            Id = PVP;
            Name = "The Gauntlet";
            Background = 0;
            Difficulty = 1;
            SetMusic("Haunted Cemetary");
            SetRemovalMS(2 * 60 * 1000);
        }

        protected override void Init()
        {
            base.FromWorldMap(
                typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.Gauntlet.wmap"));
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new Gauntlet());
        }
    }
}