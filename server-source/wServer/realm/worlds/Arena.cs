using System;
using System.Collections.Generic;
using wServer.networking;
using wServer.networking.svrPackets;

using wServer.realm.terrain;
using wServer.realm.entities;

namespace wServer.realm.worlds
{
    public class Arena : World
    {
        public const string ARENAMAP = "wServer.realm.worlds.ArenaOne.jm";
        public const string HALLOWEENARENAMAP = "wServer.realm.worlds.ArenaHalloween.jm";

        private bool _ready = true;
        private bool _waiting;
        public int Wave = 1;

        public List<string> Participants = new List<string>();

        public Arena()
        {
            Id = ARENA_ID;
            Name = "Arena";
            Background = 1;
            AllowTeleport = false;
            SetMusic("Halloween2");
            // Blocking = true;
            // Difficulty = 5;
        }
        protected override void Init()
        {
            LoadMap(ARENAMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Arena());
        }
        private readonly string[] WeakEnemies =
           {
            "Flamer King", "Lair Skeleton King", "Native Fire Sprite", "Native Ice Sprite", "Native Magic Sprite", "Nomadic Shaman", "Ogre King", "Orc King", "Red Spider", "Sand Phantom",
            "Swarm", "Tawny Warg", "Vampire Bat", "Wasp Queen", "Weretiger"
        };
        private readonly string[] NormalEnemies =
        {
            "Aberrant of Oryx", "Abomination of Oryx", "Adult White Dragon", "Assassin of Oryx", "Bile of Oryx", "Gigacorn",
            "Great Lizard", "Minotaur", "Monstrosity of Oryx", "Phoenix Reborn", "Shambling Sludge", "Urgle"
        };
        private readonly string[] Gods =
        {
            "Beholder", "Ent God", "Flying Brain", "Djinn", "Ghost God", "Leviathan", "Medusa", "Slime God", "Sprite God", "White Demon"
        };
        private readonly string[] Bosses =
        {
            //"Tomb Defender", "Tomb Attacker", "Tomb Support", 
            "Archdemon Malphas", "Crystal Prisoner", "Grand Sphinx", "Limon the Sprite God",
            "Lord Ruthven", "Septavius the Ghost God", "Stheno the Snake Queen", "Thessal the Mermaid Goddess",
        };

        public override void Tick(RealmTime time)
        {
            base.Tick(time);
           // CheckOutOfBounds();

            if (CheckPopulation())
            {
                if (_ready)
                {
                    if (_waiting) return;
                    _ready = false;
                    Wave++;
                    foreach (KeyValuePair<int, Player> i in Players)
                    {
                        i.Value.Client.SendPacket(new NotificationPacket
                        {
                            Color = new ARGB(0xffff00ff),
                            ObjectId = i.Value.Id, //Can be disabled/enabled depending on solo/multiplayer
                            Text = "Wave " + Wave.ToString() + " - Next round begins in: 5 Seconds"

                        });
                    }
                    _waiting = true;
                    Timers.Add(new WorldTimer(5000, (world, t) =>
                    {
                        _ready = false;
                        SpawnEnemies();
                        SpawnBosses(); //Only activate every 10th round.
                        _waiting = false;
                    }));
                }
                _ready = true;
            }
        }
        private void SpawnEnemies() //Spawn function, using wmap.pos.
        {

            try
            {
                List<string> enems = new List<string>();
                Random r = new Random();

                for (int i = 0; i < Wave / 3 + 1; i++)
                {
                    enems.Add(Gods[r.Next(0, Gods.Length)]);
                }
                for (int i = 0; i < Wave / 3 + 1; i++)
                {
                    enems.Add(NormalEnemies[r.Next(0, NormalEnemies.Length)]);
                }
                for (int i = 0; i < Wave / 3 + 1; i++)
                {
                    enems.Add(WeakEnemies[r.Next(0, WeakEnemies.Length)]);
                }
                Random r2 = new Random();
                foreach (string i in enems)
                {
                    ushort id = Manager.GameData.IdToObjectType[i];
                    int xloc = r2.Next(10, Map.Width) - 6;
                    int yloc = r2.Next(10, Map.Height) - 6;
                    Entity enemy = Entity.Resolve(Manager, id);
                    enemy.Move(xloc, yloc);
                    EnterWorld(enemy);
                }
            }
            catch // (Exception ex)
            {
                //  Log.Error(ex);
            }
        }

        private void SpawnBosses()
        {
            List<string> enems = new List<string>();
            Random r = new Random();
            for (int i = 0; i < (1); i++)
            {
                enems.Add(Bosses[r.Next(0, Bosses.Length)]);
            }
            Random r2 = new Random();
            foreach (string i in enems)
            {
                ushort id = Manager.GameData.IdToObjectType[i];
                int xloc = r2.Next(10, Map.Width) - 6;
                int yloc = r2.Next(10, Map.Height) - 6;
                Entity enemy = Entity.Resolve(Manager, id);
                enemy.Move(xloc, yloc);
                EnterWorld(enemy);
            }
        }

        private bool CheckPopulation()
        {
            if (Enemies.Count < 1 + Pets.Count)
                return true;
            return false;
        }

        private void CheckOutOfBounds()
        {
            foreach (var i in Enemies.Values)
            {
                var MobX = (int)i.X;
                var MobY = (int)i.Y;
                if (Map[MobX, MobY].Region == TileRegion.Outside_Arena)
                    i.Move(i.SpawnPoint.X, i.SpawnPoint.Y);
            }
        } 
    }
}
