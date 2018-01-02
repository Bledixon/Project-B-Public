using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using db;
using log4net;
using wServer.logic;
using wServer.networking;
using wServer.realm.commands;
using wServer.realm.entities;
using wServer.realm.worlds;
using System.Threading.Tasks;

namespace wServer.realm
{
    public struct RealmTime
    {
        public int thisTickCounts;
        public int thisTickTimes;
        public long tickCount;
        public long tickTimes;
    }

    public class TimeEventArgs : EventArgs
    {
        public TimeEventArgs(RealmTime time)
        {
            Time = time;
        }

        public RealmTime Time { get; private set; }
    }

    public enum PendingPriority
    {
        Emergent,
        Destruction,
        Networking,
        Normal,
        Creation,
    }

    public class RealmManager
    {
        public const int MAX_CLIENT = 100;
        public const int MAX_INREALM = 85;
        private static readonly ILog log = LogManager.GetLogger(typeof (RealmManager));

        public static List<string> realmNames = new List<string>
        {
            "Elder Realm"
        };

        public static List<string> CurrentRealmNames = new List<string>();

        public readonly ConcurrentDictionary<int, Client> Clients = new ConcurrentDictionary<int, Client>();

       // public ConcurrentDictionary<string, GuildHall> GuildHalls { get; private set; }

        public readonly ConcurrentDictionary<int, World> Worlds = new ConcurrentDictionary<int, World>();
        public ConcurrentDictionary<int, World> PlayerWorldMapping = new ConcurrentDictionary<int, World>();
        private Thread logic;
        private Thread network;
        private Thread save;
        private int nextWorldId;

        public RealmManager(int maxClient, int tps)
        {
            MaxClient = maxClient;
            TPS = tps;
          //  GuildHalls = new ConcurrentDictionary<string, GuildHall>();
        }

        public int MaxClient { get; private set; }
        public int TPS { get; private set; }

        public RealmPortalMonitor Monitor { get; private set; }
        public NetworkTicker Network { get; private set; }
        public LogicTicker Logic { get; private set; }
        public DatabaseTicker GameDB { get; private set; }
        public AutoSave Save { get; private set; }

        public XmlData GameData { get; private set; }
        public BehaviorDb Behaviors { get; private set; }

        public ChatManager Chat { get; private set; }
        public CommandManager Commands { get; private set; }
        public bool Terminating { get; private set; }

        public int TimeOut = 60;
        public int conTimes = 1;

        public bool TryConnect(Client client)
        {
            return Clients.TryAdd(client.Account.AccountId, client);
        }

        public void Disconnect(Client psr)
        {
            psr?.Save();
            Clients.TryRemove(psr.Account.AccountId, out psr);
        }

        public World AddWorld(int id, World world)
        {
            if (world.Manager != null)
                throw new InvalidOperationException("World already added.");
            world.Id = id;
            Worlds[id] = world;
            OnWorldAdded(world);
            return world;
        }

        public World AddWorld(World world, int? id = null)
        {
            if (world.Manager != null)
                throw new InvalidOperationException("World already added.");
            world.Id = id == null ? Interlocked.Increment(ref nextWorldId) : (int)id;
            Worlds[world.Id] = world;
            OnWorldAdded(world);
            return world;
        }

        public void CloseWorld(World world)
        {
            Monitor.WorldRemoved(world);
        }

        public bool RemoveWorld(World world)
        {
            if (world.Manager == null)
            {
                log.ErrorFormat("RealmManager tried to remove an uninitialized world!");
                return false;
            }
            if (!world.isDisposing)
                return false;
            World dummy;
            if (Worlds.TryRemove(world.Id, out dummy))
            {
                OnWorldRemoved(dummy);
                world?.Dispose();
            }
            return false;
        }

        public World GetWorld(int id)
        {
            World ret;
            if (!Worlds.TryGetValue(id, out ret)) return null;
            if (ret.Id == 0) return null;
            return ret;
        }

        public Player FindPlayer(string name)
        {
            if (name.Split(' ').Length > 1)
                name = name.Split(' ')[1];
            return (from i in Worlds
                where i.Key != 0
                from e in i.Value.Players
                where String.Equals(e.Value.Client.Account.Name, name, StringComparison.CurrentCultureIgnoreCase)
                select e.Value).FirstOrDefault();
        }

        public Player FindPlayerRough(string name)
        {
            Player dummy;
            foreach (var i in Worlds)
                if (i.Key != 0)
                    if ((dummy = i.Value.GetUniqueNamedPlayerRough(name)) != null)
                        return dummy;
            return null;
        }

        private void OnWorldAdded(World world)
        {
            world.Manager = this;
            if (world is GameWorld)
                Monitor.WorldAdded(world);
            log.InfoFormat("World {0}({1}) added.", world.Id, world.Name);
        }

        private void OnWorldRemoved(World world)
        {
            world.Manager = null;
            if (world is GameWorld)
                Monitor.WorldRemoved(world);
            log.InfoFormat("World {0}({1}) removed.", world.Id, world.Name);
        }


        public void Initialize()
        {
            log.Info("Initializing Realm Manager...");

            GameData = new XmlData();
            Behaviors = new BehaviorDb(this);

            AddWorld(World.NEXUS_ID, Worlds[0] = new Nexus());
            Monitor = new RealmPortalMonitor(this);

            AddWorld(World.TUT_ID, new Tutorial(true));
            AddWorld(World.NEXUS_LIMBO, new NexusLimbo());
            AddWorld(World.VAULT_ID, new Vault(true));
            AddWorld(World.TEST_ID, new Test());
            AddWorld(World.RAND_REALM, new RandomRealm());
            AddWorld(World.MARKET_ID, new Market());
            AddWorld(World.EARENA_ID, new EventArena());
            AddWorld(World.ARENA_ID, new Arena());
            AddWorld(World.GMARKET_ID, new GoldMarket());
            AddWorld(World.XP_GIFT, new XpGift());
            AddWorld(World.VIPLOUNGE, new VIPLounge());
            AddWorld(World.DONORPETS_ID, new DonorPets());
            AddWorld(World.RAIDONE_ID, new RaidOne());
            AddWorld(World.RAIDTWO_ID, new RaidTwo());
            AddWorld(World.CMARKET_ID, new ClothMarket());
            AddWorld(World.RAIDLOBBY_ID, new RaidLobby());

            if (Program.Settings.GetValue<bool>("hasRealm"))
                Task.Factory.StartNew(() => { AddWorld(GameWorld.AutoName(1, true)); }); //I added this in so the server doesn't wait for the realm to finish loading. This speeds up starting a lot. :)
               

            Chat = new ChatManager(this);
            Commands = new CommandManager(this);

            UnusualEffects.Init();

            log.Info("Realm Manager initialized.");
        }

        public void Run()
        {
            log.Info("Starting Realm Manager...");

            Network = new NetworkTicker(this);
            Logic = new LogicTicker(this);
            GameDB = new DatabaseTicker(this);
            Save = new AutoSave(this);
            network = new Thread(Network.TickLoop)
            {
                Name = "Network",
                CurrentCulture = CultureInfo.InvariantCulture
            };
            logic = new Thread(Logic.TickLoop)
            {
                Name = "Logic",
                CurrentCulture = CultureInfo.InvariantCulture
            };
            save = new Thread(Save.TickLoop)
            {
                Name = "Save",
                CurrentCulture = CultureInfo.InvariantCulture
            };
            //Start logic loop first
            logic.Start();
            network.Start();
            save.Start();

            log.Info("Realm Manager started.");
        }

        public void Stop()
        {
            log.Info("Stopping Realm Manager...");


            Terminating = true;
            List<Client> saveAccountUnlock = new List<Client>();
            foreach (Client c in Clients.Values)
            {
                saveAccountUnlock.Add(c);
                c.Disconnect();
            }
            //To prevent a buggy Account in use.
            using (var db = new Database(Program.Settings.GetValue("conn")))
                foreach (Client c in saveAccountUnlock)
                    db.UnlockAccount(c.Account);

            GameData.Dispose();
            logic.Join();
            save.Join();
            network.Join();

            log.Info("Realm Manager stopped.");
        }
    }
}