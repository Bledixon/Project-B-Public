using db;
using wServer.networking;

namespace wServer.realm.worlds
{
    public class GuildHall : World
    {
       /* public const string GM1 = "wServer.realm.worlds.ghall0.jm";
        public const string GM2 = "wServer.realm.worlds.ghall1.jm";
        public const string GM3 = "wServer.realm.worlds.ghall2.jm";
        public const string GM4 = "wServer.realm.worlds.ghall3.jm";

        public string Guild { get; set; }
        public int GuildLevel { get; set; }

        public GuildHall(string guild)
        {
            Id = GUILD_ID;
            Guild = guild;
            Name = "Guild Hall";
            Background = 0;
            Difficulty = 0;
            SetMusic("Guild Hall");
            AllowTeleport = true;
            SetRemovalMS(60 * 1000);
        }

        protected override void Init()
        {
            Manager.GameDB.AddDatabaseOperation(db =>
            {
                switch (Level(db))
                {
                    case 0:
                        LoadMap(GM1, MapType.Json); break;
                    case 1:
                        LoadMap(GM2, MapType.Json); break;
                    case 2:
                        LoadMap(GM3, MapType.Json); break;
                    default:
                        LoadMap(GM4, MapType.Json); break;
                }
            }); 
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new GuildHall(Guild));
        }

        public int Level(Database db)
        {
            return db.GetGuildLevel(db.GetGuildId(Guild));
        } */
    }
}