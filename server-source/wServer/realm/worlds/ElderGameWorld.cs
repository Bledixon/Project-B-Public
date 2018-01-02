/* using System;
using log4net;
using wServer.realm.entities;
using wServer.realm.setpieces;

namespace wServer.realm.worlds
{
    internal class ElderGameWorld : World
    {
        private static readonly ILog log = LogManager.GetLogger(typeof (ElderGameWorld));

        private readonly int mapId;
        private readonly bool oryxPresent;

        public ElderGameWorld(int mapId, string name, bool oryxPresent)
        {
            Name = name;
            Background = 0;
            Difficulty = 0;
            SetMusic("Elder Overworld");
            this.oryxPresent = oryxPresent;
            this.mapId = mapId;
        }

        public Oryx Overseer { get; private set; }

        public static ElderGameWorld AutoName(int mapId, bool oryxPresent)
        {
            string name = RealmManager.realmNames[new Random().Next(RealmManager.realmNames.Count)];
            RealmManager.realmNames.Remove(name);
            return new ElderGameWorld(mapId, name, oryxPresent);
        }

        protected override void Init()
        {
            log.InfoFormat("Initializing Elder Game World {0}({1}) from map {2}...", Id, Name, mapId);
            base.FromWorldMap(
                typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.ElderRealm.wmap"));
            SetPieces.ApplySetPieces(this);
            if (oryxPresent)
            {
                Overseer = new ElderOryx(this);
                Overseer.Init();
            }
            else
                Overseer = null;
            log.Info("Elder Game World initalized.");
        }

        public override void Tick(RealmTime time)
        {
            base.Tick(time);
            if (Overseer != null)
                Overseer.Tick(time);
        }
        

        public void EnemyKilled(Enemy enemy, Player killer)
        {
            if (Overseer != null)
                Overseer.OnEnemyKilled(enemy, killer);
        }

        public override int EnterWorld(Entity entity)
        {
            int ret = base.EnterWorld(entity);
            if (entity is Player)
                Overseer.OnPlayerEntered(entity as Player);
            return ret;
        }
    }
} */

