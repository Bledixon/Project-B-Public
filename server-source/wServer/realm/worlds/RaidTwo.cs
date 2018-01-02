using wServer.networking;

namespace wServer.realm.worlds
{
    public class RaidTwo : World
    {
        public const string RAIDTWOMAP = "wServer.realm.worlds.raidtwo.jm";

        public RaidTwo()
        {
            Id = RAIDTWO_ID;
            Name = "Raid Level: Two";
            Background = 0;
            Difficulty = 0;
        }

        protected override void Init()
        {
            LoadMap(RAIDTWOMAP, MapType.Json);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new RaidTwo());
        }
    }
}