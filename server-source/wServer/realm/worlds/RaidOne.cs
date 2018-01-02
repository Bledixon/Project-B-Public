using wServer.networking;

namespace wServer.realm.worlds
{
    public class RaidOne : World
    {
        public const string RAIDONEMAP = "wServer.realm.worlds.raidone.jm";

        public RaidOne()
        {
            Id = RAIDONE_ID;
            Name = "Raid Level: One";
            Background = 0;
            Difficulty = 0;
        }

        protected override void Init()
        {
            LoadMap(RAIDONEMAP, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new RaidOne());
        }
    }
}
