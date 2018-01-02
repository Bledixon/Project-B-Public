using wServer.networking;

namespace wServer.realm.worlds
{
    public class XpGift : World
    {
        public const string XPGIFTMAP = "wServer.realm.worlds.xpgift.jm"; //easy access

        public XpGift()
        {
         	Id = XP_GIFT;
            Name = "XP Spawn";
            Background = 0;
            SetMusic("xpgift");
            AllowTeleport = true;
        }

        protected override void Init()
        {
            LoadMap(XPGIFTMAP, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new XpGift());
        }
    }
} 

