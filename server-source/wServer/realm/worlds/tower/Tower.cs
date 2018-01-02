using System;
using System.Collections.Generic;
using wServer.networking;
using wServer.realm.entities;
using wServer.realm.terrain;

namespace wServer.realm.worlds.tower
{
    public class Tower : World
    {
        public static int FLOORS = 2;

        public int Floor { get; set; }
        public bool Cleared { get; set; }
        public Player MainPlayer { get; set; }

        public Tower(int floor)
        {
            Floor = floor;
            Name = "The Tower";
            ConMessage = "Now entering floor " + Floor.ToString() + "...";
            Background = 0;
            Difficulty = (int)Math.Floor((double)(Floor + 10) / 10);
            SetMusic("dungeon/Haunted Cemetary");
            Cleared = false;
        }

        public Dictionary<int, string> FloorBosses = new Dictionary<int, string>()
        {
            {1, "Tower Golem Boss"},
            {2, "Super Tower Warrior"}
        };

        public override void Tick(RealmTime time)
        {
            base.Tick(time);
            if (MainPlayer == null)
                return;
            if (Cleared)
                return;
            bool foundBoss = false;
            foreach (var i in Enemies.Values)
                if (i.ObjectDesc != null && i.ObjectDesc.ObjectId == FloorBosses[Floor])
                    foundBoss = true;
            if(foundBoss)
                return;
            if(MainPlayer.Floors < Floor)
            {
                if (Floor == Tower.FLOORS)
                    foreach (var i in Manager.Clients.Values)
                        if (i.Player != null)
                            i.Player.SendInfo(MainPlayer.Name + " has cleared the tower!");
                MainPlayer.Floors = Floor;
                //MainPlayer.SaveToCharacter();
                MainPlayer.Client.Save();
            }
            Cleared = true;
        }

        public override int EnterWorld(Entity entity)
        {
            int ret = base.EnterWorld(entity);
            if (entity is Player && MainPlayer == null)
                if ((entity as Player).Party == null || ((entity as Player).Party.Leader == (entity as Player)))
                    Cleared = (MainPlayer = (entity as Player)).Floors >= Floor;
            return ret;
        }

        protected override void Init()
        {
            base.FromWorldMap(
                typeof (RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.tower.floor" + Floor.ToString() + ".wmap"));

            IntPoint descendPos = GetRandomTile(TileRegion.Spawn);
            TowerPortal descend = new TowerPortal(Manager, Floor - 1);
            descend.Move(descendPos.X + 0.5f, descendPos.Y + 0.5f);
            EnterWorld(descend);
        }

        public override World GetInstance(Client client)
        {
            return Manager.AddWorld(new Tower(1));
        }
    }
}