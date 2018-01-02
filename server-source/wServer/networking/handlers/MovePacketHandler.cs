using wServer.networking.cliPackets;
using wServer.realm;
using wServer.realm.entities;
using wServer.networking.svrPackets;

namespace wServer.networking.handlers
{
    internal class MovePacketHandler : PacketHandlerBase<MovePacket>
    {
        public override PacketID ID
        {
            get { return PacketID.Move; }
        }

        protected override void HandlePacket(Client client, MovePacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet));
        }

        private void Handle(Player player, MovePacket packet)
        {
            if (player.Owner == null) return;

            player.Flush();
            if (packet.Position.X == -1 || packet.Position.Y == -1) return;

            double newX = player.X;
            double newY = player.Y;
            if (newX != packet.Position.X)
            {
                newX = packet.Position.X;
                player.UpdateCount++;
            }
            if (newY != packet.Position.Y)
            {
                newY = packet.Position.Y;
                player.UpdateCount++;
            }

            CheckLabConditions(player, packet);

            player.Move((float) newX, (float) newY);
        }

        private static void CheckLabConditions(Player player, MovePacket packet)
        {
            var tile = player.Owner.Map[(int)packet.Position.X, (int)packet.Position.Y];
            switch (tile.TileId)
            {
                case 0x9f:
                    if (tile.ObjId != 0) return;
                    if (!player.HasConditionEffect(ConditionEffects.Speedy))
                    {
                        player.ApplyConditionEffect(new ConditionEffect
                        {
                            Effect = ConditionEffectIndex.Speedy,
                            DurationMS = 0
                        });
                    }
                    break;
                case 0x45:
                    if (tile.ObjId != 0) return;
                    if (player.connecting_Paused == 1) return;
                    player.SendInfo("You will be connected shortly...");
                    player.connecting_Paused = 1;
                    player.ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = 5000
                    });
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                    {
                        player.Client.Save();
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = World.GMARKET_ID,
                            Name = "Gold Market",
                            Key = Empty<byte>.Array,
                        });
                    }));
                    break;
                case 0x44:
                    if (tile.ObjId != 0) return;
                    if (player.connecting_Paused == 1) return;
                    player.SendInfo("You will be connected shortly...");
                    player.connecting_Paused = 1;
                    player.ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = 5000
                    });
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                    {
                        player.Client.Save();
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = World.MARKET_ID,
                            Name = "Market",
                            Key = Empty<byte>.Array,
                        });
                    }));
                    break;
                case 0x71:
                    if (tile.ObjId != 0) return;
                    if (player.connecting_Paused == 1) return;
                    player.SendInfo("You will be connected shortly...");
                    player.connecting_Paused = 1;
                    player.ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = 5000
                    });
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                    {
                        player.Client.Save();
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = World.ARENA_ID,
                            Name = "Battle Arena",
                            Key = Empty<byte>.Array,
                        });
                    }));
                    break;
                case 0x28:
                    if (tile.ObjId != 0) return;
                    if (player.connecting_Paused == 1) return;
                    player.SendInfo("You will be connected shortly...");
                    player.connecting_Paused = 1;
                    player.ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = 5000
                    });
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                    {
                        player.Client.Save();
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = World.CMARKET_ID,
                            Name = "Cloth Market",
                            Key = Empty<byte>.Array,
                        });
                    }));
                    break;
            }
        }
    }
}