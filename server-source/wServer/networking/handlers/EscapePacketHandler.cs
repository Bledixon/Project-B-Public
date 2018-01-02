using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;
using wServer.realm.worlds;

namespace wServer.networking.handlers
{
    internal class EscapePacketHandler : PacketHandlerBase<EscapePacket>
    {
        public override PacketID ID
        {
            get { return PacketID.Escape; }
        }

        protected override void HandlePacket(Client client, EscapePacket packet)
        {
            if (client.Player.Owner is Nexus)
            {
                client.Player.SendInfo("You are already in the Nexus!");
                return;
            }
            if (client.Player.connecting_Paused == 1) return;
            client.Player.SendInfo("You will be connected shortly...");
            client.Player.connecting_Paused = 1;
            client.Player.ApplyConditionEffect(new ConditionEffect
            {
                Effect = ConditionEffectIndex.Paused,
                DurationMS = 5000
            });
            client.Save();
            client.Player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet))
            ));
        }

        private void Handle(Player player, EscapePacket packet)
        {
            if (!player.Owner.AllowNexus)
            {
                if (player.Owner is PvpArena && player.Owner.Players.Count == 1)
                {
                    player.Client.Reconnect(new ReconnectPacket
                    {
                        Host = "",
                        Port = 2050,
                        GameId = World.NEXUS_ID,
                        Name = "Nexus",
                        Key = Empty<byte>.Array,
                    });
                    return;
                }
                player.SendInfo("You cannot nexus now!");
            }
            else
            {
                player.Client.Save();
                player.Client.Reconnect(new ReconnectPacket
                {
                     Host = "",
                     Port = 2050,
                     GameId = World.NEXUS_ID,
                     Name = "Nexus",
                     Key = Empty<byte>.Array,
                });
            }
        }
    }
}