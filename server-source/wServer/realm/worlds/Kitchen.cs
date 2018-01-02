using wServer.networking;

namespace wServer.realm.worlds
{
    public class Kitchen : World
    {
        public Kitchen()
        {
            Name = "Kitchen";
            Background = 0;
            Difficulty = 1;
            SetMusic("Undead Lair");
            SetRemovalMS(60 * 1000);
        }

        protected override void Init()
        {
            base.FromWorldMap(
                typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.kitchen.wmap"));
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new Kitchen());
        }
    }
}