namespace wServer.realm.worlds
{
    public class Shop : World
    {
        public Shop()
        {
            Id = SHOP_ID;
            Name = "Shop";
            Background = 0;
            Difficulty = 0;
            SetMusic("Vault");
        }

        protected override void Init()
        {
            base.FromWorldMap(typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.Shop.wmap"));
        }
    }
}