using System.Collections.Generic;
using wServer.networking;
using wServer.realm.entities;

namespace wServer.realm.worlds
{
    public class RaidLobby : World
    {
        public const string RAIDLOBBYMAP = "wServer.realm.worlds.Raidlobby.jm";
        public const string HALLOWEENRAIDLOBBY = "wServer.realm.worlds.HalloweenRaidlobby.jm";
        private bool done;
        private bool loading;

        public RaidLobby()
        {
            Id = RAIDLOBBY_ID;
            Name = "Raid Lobby";
            Background = 0;
            AllowTeleport = true;
        }
        protected override void Init()
        {
            LoadMap(HALLOWEENRAIDLOBBY, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new RaidLobby());
        }

        public override void Tick(RealmTime time)
        {
            base.Tick(time); //normal world tick

            if (!done)
                CheckPlayers();
        }

        public void CheckPlayers()
        {
            World w = null;
            foreach (KeyValuePair<int, Player> i in Players)
            {
                if (i.Value.Owner.Id == Id && i.Value.Owner.Players.Count > 1)
                {
                    done = true;
                    if (!loading)
                    {
                        loading = true;
                        w = i.Value.Client.Player.Manager.AddWorld(new HalloweenRaid());
                    }

                    i.Value.Client.Player.SendInfo("You'll be connected in 5 Seconds.");
                    i.Value.Client.Player.Owner.Timers.Add(new WorldTimer(5000, (world, RealmTime) =>
                    {
                        i.Value.Manager.PlayerWorldMapping.TryAdd(i.Value.Client.Player.AccountId, i.Value.Client.Player.Owner);
                        i.Value.Client.Reconnect(new networking.svrPackets.ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = w.Id,
                            Name = "Halloween Raid",
                            Key = Empty<byte>.Array,
                        });
                    }));

                    i.Value.Client.Player.Owner.Timers.Add(new WorldTimer(6000, (world, RealmTime) =>
                    {
                        done = false;
                    }));
                }
            }
        }
    }
}