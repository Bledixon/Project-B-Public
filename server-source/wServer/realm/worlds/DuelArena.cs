using log4net;
using System;
using System.Collections.Generic;
using wServer.networking;
using wServer.networking.svrPackets;
using wServer.realm.entities;
using wServer.realm.terrain;

namespace wServer.realm.worlds
{
    public class DuelArena : World
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(DuelArena));

        public static Dictionary<Player, DuelArena> QueuedPlayers = new Dictionary<Player, DuelArena>();

        private Player duelist1;
        private Player duelist2;
        private bool finished;
        private bool started;

        private int timeLeft;
        private int waitingNotif;

        public DuelArena()
        {
            Name = "Duel Arena";
            Background = 0;
            Difficulty = 5;
            SetMusic("Undead Lair");
            AllowTeleport = false;
            AllowAbilityTeleport = false;
            PvP = false;
            SetRemovalMS(2 * 60 * 1000);
        }

        public static World GetBestDuelArena(Player player)
        {
            // Partner's level must be +/- (5 + 10%) of player and partner must have same max
            // A 5/8 level 40 could only join a 5/8 player between levels 31 - 49
            foreach (var i in QueuedPlayers)
            {
                if (i.Key.Level >= (player.Level - 5) - Math.Floor(player.Level*.1) &&
                    i.Key.Level <= (player.Level + 5) + Math.Floor(player.Level*.1) &&
                    i.Key.GetMaxed().Count == player.GetMaxed().Count)
                    return i.Value;
            }
            return player.Manager.AddWorld(new DuelArena());
        }

        protected override void Init()
        {
            base.FromWorldMap(
                typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.DuelArena.wmap"));
            timeLeft = 5*10;
        }

        public override void Tick(RealmTime time)
        {
            base.Tick(time);
            if (!started && duelist1 != null)
            {
                waitingNotif--;
                if (waitingNotif <= 0)
                {
                    duelist1.Client.SendPacket(new NotificationPacket
                    {
                        Color = new ARGB(0xFF2222FF),
                        ObjectId = duelist1.Id,
                        Text = "Waiting for duelist..."
                    });
                    waitingNotif = 2*10;
                }
            }
            if (started && QueuedPlayers.ContainsKey(duelist1))
                QueuedPlayers.Remove(duelist1);
            if (started && timeLeft > 0)
            {
                if (timeLeft%Manager.Logic.TPS == 0)
                {
                    if (timeLeft/Manager.Logic.TPS == 5)
                    {
                        duelist1.SendInfo("Duel begun with " + duelist2.Name + ".");
                        duelist2.SendInfo("Duel begun with " + duelist1.Name + ".");
                    }
                    foreach (Player i in Players.Values)
                        i.Client.SendPacket(new NotificationPacket
                        {
                            Color = timeLeft/Manager.Logic.TPS == 5 ? new ARGB(0xFFFF00FF) : new ARGB(0xFFFF0000),
                            ObjectId = i.Id,
                            Text = timeLeft/Manager.Logic.TPS == 5
                                ? duelist1.Name + " vs. " + duelist2.Name
                                : timeLeft/Manager.Logic.TPS == 4
                                    ? "Duel beginning in..."
                                    : (timeLeft/Manager.Logic.TPS).ToString()
                        });
                }
                timeLeft--;
            }
            else if (started && timeLeft == 0)
            {
                AllowAbilityTeleport = true;
                PvP = true;
                foreach (Player i in Players.Values)
                {
                    i.Client.SendPacket(new NotificationPacket
                    {
                        Color = new ARGB(0xFF770000),
                        ObjectId = i.Id,
                        Text = "Fight!"
                    });
                    i.PvP = true;
                    i.UpdateCount++;
                }
                foreach (IntPoint point in Map.Regions[TileRegion.Hallway])
                {
                    WmapTile tile = Map[point.X, point.Y].Clone();
                    tile.ObjType = 0;
                    Map[point.X, point.Y] = tile;
                }
                timeLeft = -1;
            }
        }

        public override void LeaveWorld(Entity entity)
        {
            if (entity is Player)
            {
                if (!started)
                    QueuedPlayers.Remove(duelist1);
                else if (!finished)
                {
                    if (!entity.isDead)
                        (entity == duelist1 ? duelist2 : duelist1).SendInfo(
                            "Your opponent has disconnected.");
                    base.LeaveWorld(entity);
                    finished = true;
                    foreach (var i in Players.Values)
                    {
                        i.CanNexus = true;
                        i.UpdateCount++;
                    }
                    return;
                }
            }
            base.LeaveWorld(entity);
        }

        public override int EnterWorld(Entity entity)
        {
            int ret = base.EnterWorld(entity);
            if (entity is Player)
            {
                if (Players.Count == 1)
                {
                    duelist1 = entity as Player;
                    QueuedPlayers.Add(duelist1, this);
                }
                else
                {
                    duelist2 = entity as Player;
                    QueuedPlayers.Remove(duelist1);
                    foreach (var i in Players.Values)
                    {
                        i.CanNexus = false;
                        i.UpdateCount++;
                    }
                    started = true;
                }
            }
            return ret;
        }

        public override void SpawnEntity(Entity entity)
        {
            var tile = new IntPoint(0, 0);
            if (Players.Count == 1)
                tile = GetRandomTile(TileRegion.Hallway_1);
            else if (Players.Count == 2)
                tile = GetRandomTile(TileRegion.Hallway_2);
            entity.Move(tile.X + 0.5f, tile.Y + 0.5f);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new DuelArena());
        }
    }
}