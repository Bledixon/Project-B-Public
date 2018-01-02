using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using log4net;
using wServer.networking;
using wServer.networking.svrPackets;
using wServer.realm.entities;
using wServer.realm.terrain;
using wServer.realm.worlds;
using static wServer.networking.svrPackets.MapInfoPacket;

namespace wServer.realm
{
    public abstract class World: IDisposable
    {
        public const int TUT_ID = -1;
        public const int NEXUS_ID = -2;
        public const int RAND_REALM = -3;
        public const int NEXUS_LIMBO = -4;
        public const int VAULT_ID = -5;
        public const int TEST_ID = -6;
        public const int GUILD_ID = -7;
        public const int SHOP_ID = -8;

        public const int PVP = -10;
        public const int ABYSS = -11;
        public const int MARKET_ID = -12;
        public const int EARENA_ID = -14;
        public const int ARENA_ID = -15;
        public const int GMARKET_ID = -16;
        public const int XP_GIFT = -17;
        public const int CLAND_ID = -19;
        public const int VIPLOUNGE = -20;
        public const int HALLOWEEN = -21;
        public const int DONORPETS_ID = -22;
        public const int EEARENA_ID = -23;
        public const int ELDER_SNAKE = -24;
        public const int ELDER_ABYSS = -25;
        public const int ELDER_UDL = -26;
        public const int HIVE_ID = -27;
        public const int RAIDONE_ID = -28;
        public const int RAIDTWO_ID = -29;
        public const int EPCAVE_ID = -30;
        public const int CMARKET_ID = -31;
        public const int SHAITAN_ID = -32;
        public const int SHATTERS_ID = -33;
        public const int RAIDLOBBY_ID = -34;
        public const int HALLOWEENRAID_ID = -35;
        private static readonly ILog log = LogManager.GetLogger(typeof (World));
        public bool dungeon = false;
        private int entityInc;
        private RealmManager manager;
        public bool RayDungeon = false;
        public bool Petless = false;
        private RealmTime time;

        protected World()
        {
            ConMessage = "";
            Players = new ConcurrentDictionary<int, Player>();
            Enemies = new ConcurrentDictionary<int, Enemy>();
            Quests = new ConcurrentDictionary<int, Enemy>();
            Pets = new ConcurrentDictionary<int, Entity>();
            Projectiles = new ConcurrentDictionary<Tuple<int, byte>, Projectile>();
            StaticObjects = new ConcurrentDictionary<int, StaticObject>();
            Timers = new List<WorldTimer>();
            ExtraXML = Empty<string>.Array;
            AllowTeleport = true;
            AllowNexus = true;
            AllowAbilityTeleport = true;
            ShowDisplays = true;
            SetMusic("Menu");
            PvP = false;
        }

        public bool IsLimbo { get; protected set; }
        public bool PvP { get; protected set; }

        public RealmManager Manager
        {
            get { return manager; }
            internal set
            {
                manager = value;
                if (manager != null)
                    Init();
            }
        }

        public int Id { get; internal set; }
        public string Name { get; protected set; }
        public string ConMessage { get; protected set; }
        public string[] Music { get; set; }
        public Weather Weather { get; protected set; }
        public string[] DefaultMusic { get; set; }

        public ConcurrentDictionary<int, Player> Players { get; private set; }
        public ConcurrentDictionary<int, Enemy> Enemies { get; private set; }
        public ConcurrentDictionary<int, Entity> Pets { get; private set; }
        public ConcurrentDictionary<Tuple<int, byte>, Projectile> Projectiles { get; private set; }
        public ConcurrentDictionary<int, StaticObject> StaticObjects { get; private set; }
        public List<WorldTimer> Timers { get; private set; }
        public int Background { get; protected set; }
        public int Difficulty { get; protected set; }

        public CollisionMap<Entity> EnemiesCollision { get; private set; }
        public CollisionMap<Entity> PlayersCollision { get; private set; }
        public CollisionMap<Entity> PetsCollision { get; private set; }

        public bool AllowTeleport { get; protected set; }
        public bool ShowDisplays { get; protected set; }
        public string[] ExtraXML { get; protected set; }
        public bool AllowNexus { get; protected set; }
        public bool AllowAbilityTeleport { get; protected set; }

        public Wmap Map { get; private set; }
        public ConcurrentDictionary<int, Enemy> Quests { get; private set; }

        public bool disposable { get; private set; }
        public int RemovalMS { get; private set; }
        public bool isDisposing { get; set; }

        public virtual World GetInstance(Client client)
        {
            return null;
        }

        public bool IsPassable(int x, int y)
        {
            WmapTile tile = Map[x, y];
            ObjectDesc desc;
            if (Manager.GameData.Tiles[tile.TileId].NoWalk)
                return false;
            if (Manager.GameData.ObjectDescs.TryGetValue(tile.ObjType, out desc))
            {
                if (!desc.Static)
                    return false;
                if (desc.OccupySquare || desc.EnemyOccupySquare || desc.FullOccupy)
                    return false;
            }
            return true;
        }

        public bool NoTesting(Player player)
        {
            if (player.Client.Account.Rank < 7)
                return false;
            else
                return true;
        }

        public int GetNextEntityId()
        {
            return Interlocked.Increment(ref entityInc);
        }

        public void SwitchMusic(params string[] music)
        {
            if (music.Length == 0)
                Music = DefaultMusic;
            else
                Music = music;
            BroadcastPacket(new SwitchMusicPacket
            {
                Music = Music[new wRandom().Next(0, Music.Length)]
            }, null);
        }

        public void SetRemovalMS(int ms)
        {
            RemovalMS = ms;
            return;
        }

        public void SetMusic(params string[] music)
        {
            Music = music;
            DefaultMusic = music;
        }

        public string GetMusic(wRandom rand = null)
        {
            if (Music.Length == 0)
                return "null";
            if (rand == null)
                rand = new wRandom();
            return Music[rand.Next(0, Music.Length)];
        }

        public bool Delete()
        {
            lock (this)
            {
                if (Players.Count > 0) return false;
                Id = 0;
            }
            Map = null;
            Players = null;
            Enemies = null;
            Projectiles = null;
            StaticObjects = null;
            return true;
        }

        protected virtual void Init() { }

        public virtual void TileEvent(Player player, WmapTile tile) { }

        protected void FromWorldMap(Stream dat)
        {
            log.InfoFormat("Loading map for world {0}({1})...", Id, Name);

            Map = new Wmap(Manager.GameData);
            entityInc = 0;
            entityInc += Map.Load(dat, 0);

            int w = Map.Width, h = Map.Height;
            EnemiesCollision = new CollisionMap<Entity>(0, w, h);
            PlayersCollision = new CollisionMap<Entity>(1, w, h);
            PetsCollision = new CollisionMap<Entity>(1, w, h);

            Projectiles.Clear();
            StaticObjects.Clear();
            Enemies.Clear();
            Players.Clear();
            Pets.Clear();
            foreach (Entity i in Map.InstantiateEntities(Manager))
            {
                EnterWorld(i);
            }
            CheckDisposable();
        }

        public virtual int EnterWorld(Entity entity)
        {
            if (entity is Player)
            {
                entity.Id = GetNextEntityId();
                entity.Init(this);
                Players.TryAdd(entity.Id, entity as Player);
                PlayersCollision.Insert(entity);
                SpawnEntity(entity);
                if (entity.Owner.PvP)
                {
                    (entity as Player).PvP = true;
                    (entity as Player).SendHelp("You have entered a PvP world!");
                }
                else
                    (entity as Player).PvP = false;
                if (entity.Owner.Petless)
                    (entity as Player).SendInfo("This dungeon does not allow Pet. Enjoy!");
            }
            else if (entity is Enemy)
            {
                entity.Id = GetNextEntityId();
                entity.Init(this);
                Enemies.TryAdd(entity.Id, entity as Enemy);
                EnemiesCollision.Insert(entity);
                if (entity.ObjectDesc.Quest)
                    Quests.TryAdd(entity.Id, entity as Enemy);

                if (entity.isPet && !Petless)
                {
                    Pets.TryAdd(entity.Id, entity);
                    SpawnEntity(entity);
                }
            }
            else if (entity is Projectile)
            {
                entity.Init(this);
                var prj = entity as Projectile;
                Projectiles[new Tuple<int, byte>(prj.ProjectileOwner.Self.Id, prj.ProjectileId)] = prj;
            }
            else if (entity is StaticObject)
            {
                entity.Id = GetNextEntityId();
                entity.Init(this);
                StaticObjects.TryAdd(entity.Id, entity as StaticObject);
                if (entity is Decoy)
                    PlayersCollision.Insert(entity);
                else
                    EnemiesCollision.Insert(entity);
            }
            return entity.Id;
        }

        public virtual void LeaveWorld(Entity entity)
        {
            if (entity == null) return;

            if (entity is Player)
            {
                Player dummy;
                Players.TryRemove(entity.Id, out dummy);
                PlayersCollision.Remove(entity);
            }
            else if (entity is Enemy)
            {
                Enemy dummy;
                Enemies.TryRemove(entity.Id, out dummy);
                EnemiesCollision.Remove(entity);
                if (entity.ObjectDesc.Quest)
                    Quests.TryRemove(entity.Id, out dummy);
                if (entity.isPet)
                {
                    Entity dummy2;
                    Pets.TryRemove(entity.Id, out dummy2);
                    RemoveEntity(entity);
                } 
            }
            else if (entity is Projectile)
            {
                var p = entity as Projectile;
                Projectiles.TryRemove(new Tuple<int, byte>(p.ProjectileOwner.Self.Id, p.ProjectileId), out p);
            }
            else if (entity is StaticObject)
            {
                StaticObject dummy;
                StaticObjects.TryRemove(entity.Id, out dummy);
                if (entity is Decoy)
                    PlayersCollision.Remove(entity);
                else
                    EnemiesCollision.Remove(entity);
            }
            entity.Owner = null;
            entity.Dispose();
        }
        public void Dispose()
        {
            Players.Clear();
            Enemies.Clear();
            Quests.Clear();
            Pets.Clear();
            Projectiles.Clear();
            StaticObjects.Clear();
            Timers.Clear();
        }

        public Entity GetEntity(int id)
        {
            Player ret1;
            if (Players.TryGetValue(id, out ret1)) return ret1;
            Enemy ret2;
            if (Enemies.TryGetValue(id, out ret2)) return ret2;
            StaticObject ret3;
            if (StaticObjects.TryGetValue(id, out ret3)) return ret3;
            return null;
        }

        public IntPoint GetRandomTile(TileRegion region)
        {
            if (!Map.Regions.ContainsKey(region))
                return new IntPoint(0, 0);
            var rand = new Random();
            List<IntPoint> tiles = Map.Regions[region];
            return tiles[rand.Next(0, tiles.Count)];
        }

        public virtual void SpawnEntity(Entity entity)
        {
            IntPoint tile = GetRandomTile(TileRegion.Spawn);
            entity.Move(tile.X + 0.5f, tile.Y + 0.5f);
        }

        public virtual void RemoveEntity(Entity entity)
        {
            entity.Move(-1, -1);
        }

        public Player GetUniqueNamedPlayer(string name)
        {
            foreach (var i in Players)
            {
                if (i.Value.NameChosen && i.Value.Name.Equals(name, StringComparison.InvariantCultureIgnoreCase))
                    return i.Value;
            }
            return null;
        }

        public Player GetUniqueNamedPlayerRough(string name)
        {
            foreach (var i in Players)
            {
                if (i.Value.CompareName(name))
                    return i.Value;
            }
            return null;
        }

        public void BroadcastPacket(Packet pkt, Player exclude)
        {
            foreach (var i in Players)
                if (i.Value != exclude)
                    i.Value.Client.SendPacket(pkt);
        }

        public void BroadcastPackets(IEnumerable<Packet> pkts, Player exclude)
        {
            foreach (var i in Players)
                if (i.Value != exclude)
                    i.Value.Client.SendPackets(pkts);
        }

        public void TileTeleport(Player player, float X, float Y)
        {
            BroadcastPacket(new GotoPacket
            {
                ObjectId = player.Id,
                Position = new Position
                {
                    X = X,
                    Y = Y
                }
            }, null);
            BroadcastPacket(new ShowEffectPacket
            {
                EffectType = EffectType.Trail,
                TargetId = player.Id,
                PosA = new Position {X = player.X, Y = player.Y},
                Color = new ARGB(0xffffffff)
            }, null);
            BroadcastPacket(new ShowEffectPacket
            {
                EffectType = EffectType.AreaBlast,
                Color = new ARGB(0xff416B2B),
                TargetId = player.Id,
                PosA = new Position {X = 2}
            }, null);
        }

        public void CheckDisposable()
        {
            if (this is GameWorld || IsLimbo)
            {
                disposable = false;
                return;
            }
            switch (Id)
            {
                case TUT_ID:
                case NEXUS_ID:
                case RAND_REALM:
                case NEXUS_LIMBO:
                case VAULT_ID:
                case TEST_ID:
                case GUILD_ID:
                case SHOP_ID:
                case MARKET_ID:
                case EARENA_ID:
                case ARENA_ID:
                case GMARKET_ID:
                case XP_GIFT:
                case VIPLOUNGE:
                case DONORPETS_ID:
                case EEARENA_ID:
                case RAIDONE_ID:
                case RAIDTWO_ID:
                case CMARKET_ID:
                case RAIDLOBBY_ID:
                    disposable = false;
                    break;
                default:
                    disposable = true;
                    break;
            }
            return;
        }

        public virtual void Tick(RealmTime time)
        {
            if (IsLimbo) return;

            if (disposable)
            {
                if (Players.Count <= 0 && !isDisposing)
                {
                    isDisposing = true;
                    if  (RemovalMS < 25000)
                    {
                    //    log.WarnFormat("World \"{0}\" does not have a valid RemovalMS: {1}! Please allow at least 25 seconds. Default: 25000 ms", Name, RemovalMS);
                        RemovalMS = 25000;
                    }
                  //  log.InfoFormat("World {0}, ID:{1} is unused and will dispose in {2}MS.", Name, Id, RemovalMS);
                    WorldTimer timer = new WorldTimer(RemovalMS, (w, t) =>
                    {
                        manager.RemoveWorld(w);
                    });
                    Timers.Add(timer);
                }
                else if (isDisposing && Players.Count >= 1)
                {
                    isDisposing = false;
              //      log.InfoFormat("World {0}, ID:{1} is in use and has cancelled disposal.", Name, Id);
                }
            }

            if (Timers != null && Timers.Count > 0)
            {
                for (int i = 0; i < Timers.Count; i++)
                    if (Timers[i].Tick(this, time) && Timers.Count > 0)
                    {
                        Timers.RemoveAt(i);
                        i--;
                    }
            }

            try //entity ticking now, possible huge range of issues that i can't yet remove the try catch - jade
            {
                foreach (var i in Players)
                    i.Value.Tick(time);

                if (isDisposing) return;

                if (EnemiesCollision != null)
                {
                    foreach (Entity i in EnemiesCollision.GetActiveChunks(PlayersCollision))
                        i.Tick(time);
                    foreach (var i in StaticObjects.Where(x => x.Value is Decoy))
                        i.Value.Tick(time);
                }
                else
                {
                    foreach (var i in Enemies)
                        i.Value.Tick(time);
                    foreach (var i in StaticObjects)
                        i.Value.Tick(time);
                }
                foreach (var i in Projectiles)
                    i.Value.Tick(time);
            }
            catch (Exception e)
            {
                log.Error(e);
            }
        }

        protected void LoadMap(string embeddedResource, MapType type)
        {
            if (embeddedResource == null) return;
            var stream = typeof(RealmManager).Assembly.GetManifestResourceStream(embeddedResource);
            if (stream == null) throw new ArgumentException("Resource not found", nameof(embeddedResource));

            switch (type)
            {
                case MapType.Wmap:
                    FromWorldMap(stream);
                    break;
                case MapType.Json:
                    FromWorldMap(new MemoryStream(Json2Wmap.Convert(Manager, new StreamReader(stream).ReadToEnd())));
                    break;
                default:
                    throw new ArgumentException("Invalid MapType");
            }
        }
        protected void LoadMap(string json)
        {
            FromWorldMap(new MemoryStream(Json2Wmap.Convert(Manager, json)));
        }
        public enum MapType
        {
            Wmap,
            Json
        }
    }
}