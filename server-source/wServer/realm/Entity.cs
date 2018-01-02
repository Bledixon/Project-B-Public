using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using log4net;
using wServer.logic;
using wServer.realm.entities;

namespace wServer.realm
{
    public class Entity : IProjectileOwner, ICollidable<Entity>, IDisposable
    {
        private const int EFFECT_COUNT = 28;
        private static readonly ILog log = LogManager.GetLogger(typeof (Entity));

        private ObjectDesc desc;
        private int[] effects;
        private Position[] posHistory;
        private Projectile[] projectiles;
        public bool isDead = false;
        public bool isPet;
        public Player playerOwner;
        private byte posIdx;
        protected byte projectileId;
        private bool stateEntry;
        private State stateEntryCommonRoot;
        private Dictionary<object, object> states;
        private bool tickingEffects;

        protected Entity(RealmManager manager, ushort objType)
        {
            ObjectType = objType;
            Name = "";
            Size = 100;
            Manager = manager;
            isPet = false;
            manager.Behaviors.ResolveBehavior(this);
  //          prevStats = new Dictionary<int, Dictionary<StatsType, object>>();

            manager.GameData.ObjectDescs.TryGetValue(ObjectType, out desc);
            if (desc != null && (desc.Player || desc.Enemy))
            {
                posHistory = new Position[256];
                projectiles = new Projectile[256];
                effects = new int[EFFECT_COUNT];
            }
        }

        public RealmManager Manager { get; private set; }

        public ObjectDesc ObjectDesc
        {
            get { return desc; }
        }

        public World Owner { get; internal set; }

        public int UpdateCount { get; set; }

        public ushort ObjectType { get; private set; }
        public int Id { get; internal set; }
        public string Name { get; set; }
        public int Size { get; set; }
        public ConditionEffects ConditionEffects { get; set; }

        public IDictionary<object, object> StateStorage
        {
            get
            {
                if (states == null) states = new Dictionary<object, object>();
                return states;
            }
        }

        public State CurrentState { get; private set; }
        public float X { get; private set; }
        public float Y { get; private set; }


        public CollisionNode<Entity> CollisionNode { get; set; }
        public CollisionMap<Entity> Parent { get; set; }

        Entity IProjectileOwner.Self
        {
            get { return this; }
        }

        Projectile[] IProjectileOwner.Projectiles
        {
            get { return projectiles; }
        }

        public bool IsValid()
        {
            return (this != null && Owner != null);
        }

        public Entity Move(float x, float y)
        {
            if (Owner != null && !(this is Projectile) &&
                (!(this is StaticObject) || (this as StaticObject).Hittestable))
                (this is Enemy ? Owner.EnemiesCollision : Owner.PlayersCollision)
                    .Move(this, x, y);
            X = x;
            Y = y;
            return this;
        }
        //Stats
        protected virtual void ExportStats(IDictionary<StatsType, object> stats)
        {
            stats[StatsType.Name] = Name ?? "";
            stats[StatsType.Size] = Size;
            stats[StatsType.Effects] = (int) ConditionEffects;
        }

        public virtual void Dispose()
        {
            Manager = null;
            Owner = null;
            Name = null;
            states = null;
            CurrentState = null;
            CollisionNode = null;
            Parent = null;
            projectiles = null;
            posHistory = null;
        }

        public ObjectDef ToDefinition()  //int requester
        {
            return new ObjectDef
            {
                ObjectType = ObjectType,
                Stats = ExportStats() //requester
            };
        }

        public virtual void Init(World owner)
        {
            Owner = owner;
        }

        public virtual void Tick(RealmTime time)
        {
            if (this is Projectile || Owner == null) return;
            if (CurrentState != null && Owner != null)
            {
                if (!HasConditionEffect(ConditionEffects.Stasis))
                    TickState(time);
            }
            if (posHistory != null)
                posHistory[posIdx++] = new Position {X = X, Y = Y};
            if (effects != null)
                ProcessConditionEffects(time);
        }


        public void SwitchTo(State state)
        {
            State origState = CurrentState;

            CurrentState = state;
            GoDeeeeeeeep();

            stateEntryCommonRoot = State.CommonParent(origState, CurrentState);
            stateEntry = true;
        }

        private void GoDeeeeeeeep()
        {
            //always the first deepest sub-state
            if (CurrentState == null) return;
            while (CurrentState.States.Count > 0)
                CurrentState = CurrentState = CurrentState.States[0];
        }

        public void ExitState(RealmTime time)
        {
            //State exit
            State s = CurrentState;
            while (s != null && s != stateEntryCommonRoot)
            {
                foreach (Behavior i in s.Behaviors)
                    i.OnStateExit(this, time);
                s = s.Parent;
            }
        }

        private void TickState(RealmTime time)
        {
            if (stateEntry)
            {
                //State entry
                State s = CurrentState;
                while (s != null && s != stateEntryCommonRoot)
                {
                    foreach (Behavior i in s.Behaviors)
                        i.OnStateEntry(this, time);
                    s = s.Parent;
                }
                stateEntryCommonRoot = null;
                stateEntry = false;
            }

            State origState = CurrentState;
            State state = CurrentState;
            bool transited = false;
            while (state != null)
            {
                if (!transited)
                    foreach (Transition i in state.Transitions)
                        if (i.Tick(this, time))
                        {
                            transited = true;
                            break;
                        }

                foreach (Behavior i in state.Behaviors)
                {
                    if (Owner == null) break;
                    i.Tick(this, time);
                }
                if (Owner == null) break;

                state = state.Parent;
            }
            if (transited)
            {
                //State exit
                State s = origState;
                while (s != null && s != stateEntryCommonRoot)
                {
                    foreach (Behavior i in s.Behaviors)
                        i.OnStateExit(this, time);
                    s = s.Parent;
                }
            }
        }


        public Position? TryGetHistory(long timeAgo)
        {
            if (posHistory == null) return null;
            long tickPast = timeAgo*Manager.Logic.TPS/1000;
            if (tickPast > 255) return null;
            return posHistory[(byte) (posIdx - (byte) tickPast)];
        }


        /* Projectile
         * Sign
         * Wall
         * ConnectedWall
         * MoneyChanger
         * CharacterChanger
         * Stalagmite
         * NameChanger
         * GuildRegister
         * GuildChronicle
         * GuildBoard
         * CaveWall
         * Player
         * Dye
         * ClosedVaultChest
         * Merchant
         * GuildHallPortal
         * SpiderWeb
         * GuildMerchant
         * Portal
         * Equipment
         * Container
         * GameObject
         * Character
         */

        public static Entity Resolve(RealmManager manager, string name)
        {
            ushort id;
            if (!manager.GameData.IdToObjectType.TryGetValue(name, out id))
                return null;
            return Resolve(manager, id);
        }

        public static Entity Resolve(RealmManager manager, ushort id)
        {
            XElement node = manager.GameData.ObjectTypeToElement[id];
            string type = node.Element("Class").Value;
            switch (type)
            {
                case "Projectile":
                    throw new Exception("Projectile should not instantiated using Entity.Resolve");
                case "Sign":
                    return new Sign(manager, id);
                case "Wall":
                case "DoubleWall":
                    return new Wall(manager, id, node);
                case "ConnectedWall":
                case "CaveWall":
                    return new ConnectedObject(manager, id);
                case "GameObject":
                case "CharacterChanger":
                case "MoneyChanger":
                case "NameChanger":
                case "Stalagmite":
                    return new StaticObject(manager, id, StaticObject.GetHP(node), true, false, true);
                case "MarketplaceGround":
                case "GuildRegister":
                case "GuildChronicle":
                case "GuildBoard":
                case "SpiderWeb":
                    return new StaticObject(manager, id, null, false, false, false);
                case "Container":
                    return new Container(manager, id);
                case "Reforge":
                case "Forge":
                    return new Container(manager, id, true);
                case "Player":
                    throw new Exception("Player should not instantiated using Entity.Resolve");
                case "Character": //Other characters means enemy
                    return new Enemy(manager, id);
                case "Portal":
                case "GuildHallPortal":
                    return new Portal(manager, id, null);
                case "ClosedVaultChest":
                case "ClosedGiftChest":
                case "Merchant":
                    return new Merchant(manager, id);
                case "GuildMerchant":
                    return new GuildMerchant(manager, id);
                default:
                    log.WarnFormat("Not supported type: {0}", type);
                    return new Entity(manager, id);
            }
        }

        public Projectile CreateProjectile(ProjectileDesc desc, ushort container, int dmg, long time, Position pos,
            float angle, int slotId = -1)
        {
            var ret = new Projectile(Manager, desc) //Assume only one
            {
                ProjectileOwner = this,
                ProjectileId = projectileId++,
                SlotId = slotId,
                Container = container,
                Damage = dmg,
                BeginTime = time,
                BeginPos = pos,
                Angle = angle,
                X = pos.X,
                Y = pos.Y
            };
            if (projectiles[ret.ProjectileId] != null)
                projectiles[ret.ProjectileId].Destroy(true);
            projectiles[ret.ProjectileId] = ret;
            return ret;
        }

        public virtual bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            //Console.WriteLine("HIT! " + Id);
            if (ObjectDesc == null)
                return true;
            return ObjectDesc.Enemy || ObjectDesc.Player;
        }

        public virtual void ProjectileHit(Projectile projectile, Entity target)
        {
        }


        private void ProcessConditionEffects(RealmTime time)
        {
            if (effects == null || !tickingEffects) return;

            ConditionEffects newEffects = 0;
            tickingEffects = false;
            for (int i = 0; i < effects.Length; i++)
                if (effects[i] > 0)
                {
                    effects[i] -= time.thisTickTimes;
                    if (effects[i] > 0)
                        newEffects |= (ConditionEffects) (1 << i);
                    else
                        effects[i] = 0;
                    tickingEffects = true;
                }
                else if (effects[i] != 0)
                    newEffects |= (ConditionEffects) (1 << i);
            if (newEffects != ConditionEffects)
            {
                ConditionEffects = newEffects;
                UpdateCount++;
            }
        }

        public bool HasConditionEffect(ConditionEffects eff)
        {
            return (ConditionEffects & eff) != 0;
        }

        public void ApplyConditionEffect(params ConditionEffect[] effs)
        {
            foreach (ConditionEffect i in effs)
            {
                if (i.Effect == ConditionEffectIndex.Stunned &&
                    HasConditionEffect(ConditionEffects.StunImmune))
                    continue;
                if (i.Effect == ConditionEffectIndex.Stasis &&
                    HasConditionEffect(ConditionEffects.StasisImmune))
                    continue;
                if (effects != null) effects[(int) i.Effect] = i.DurationMS;
                if (i.DurationMS != 0)
                    ConditionEffects |= (ConditionEffects) (1 << (int) i.Effect);
            }
            tickingEffects = true;
            UpdateCount++;
        }

        public ObjectStats ExportStats()
        {
            var currentStats = new Dictionary<StatsType, object>();
            ExportStats(currentStats);
            return new ObjectStats
            {
                Id = Id,
                Position = new Position { X = X, Y = Y },
                Stats = currentStats.ToArray()
            };
        }

        public virtual ObjectStats ExportStats(Player player)
        {
            var stats = new Dictionary<StatsType, object>();
            var statsToSend = new Dictionary<StatsType, object>();
            ExportStats(stats);

            if (!player.firstExport)
            {
                if (player.oldStats.ContainsKey(this))
                {
                    foreach (var i in stats)
                    {
                        statsToSend[i.Key] = i.Value;
                        player.oldStats[this][i.Key] = i.Value;
                    }
                }
                else
                {
                    player.oldStats.Add(this, new Dictionary<StatsType, object>());
                    foreach (var i in stats)
                    {
                        statsToSend[i.Key] = i.Value;
                        player.oldStats[this][i.Key] = i.Value;
                    }
                }
                player.firstExport = true;
            }
            else
            {
                if (player.oldStats.ContainsKey(this))
                {
                    foreach (var i in stats)
                    {
                        if (player.oldStats[this].ContainsKey(i.Key))
                        {
                            if (player.oldStats[this][i.Key].ToString() != i.Value.ToString())
                            {
                                statsToSend[i.Key] = i.Value;
                                player.oldStats[this][i.Key] = i.Value;
                            }
                        }
                        else
                        {
                            statsToSend[i.Key] = i.Value;
                            player.oldStats[this][i.Key] = i.Value;
                        }
                    }
                }
                else
                {
                    player.oldStats.Add(this, new Dictionary<StatsType, object>());
                    foreach (var i in stats)
                    {
                        statsToSend[i.Key] = i.Value;
                        player.oldStats[this][i.Key] = i.Value;
                    }
                }
            }

            return new ObjectStats
            {
                Id = Id,
                Position = new Position { X = X, Y = Y },
                Stats = statsToSend.ToArray()
            };
        }
    }
}