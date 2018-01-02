using System;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;
using wServer.realm;

namespace wServer.networking.handlers
{
    internal class CreateGuildPacketHandler : PacketHandlerBase<CreateGuildPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.CreateGuild; }
        }

        protected override void HandlePacket(Client client, CreateGuildPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client, packet));
        }

        void Handle(Client client, CreateGuildPacket packet)
        {
            try
            {
                client.AddDatabaseOpperation(db =>
                {
                    Player player = client.Player;
                    var name = packet.Name.ToString();
                    if (player.Client.Account.Stats.Fame >= 1000)
                    {
                        if (name != "")
                        {
                            if (db.GetGuild(name) != null)
                            {
                                player.Client.SendPacket(new CreateGuildResultPacket()
                                {
                                    Success = false,
                                    ResultMessage = "Guild already exists."
                                });
                                return;
                            }
                            try
                            {
                                if (player.Client.Account.Guild.Name == "")
                                {
                                    if (packet.Name != "")
                                    {
                                        var g = db.CreateGuild(player.Client.Account, packet.Name);
                                        player.Client.Account.Guild.Name = g.Name;
                                        player.Client.Account.Guild.Rank = g.Rank;
                                        player.Guild = GuildManager.Add(player, g);
                                        player.Client.SendPacket(new CreateGuildResultPacket()
                                        {
                                            Success = true,
                                            ResultMessage = "Success!"
                                        });
                                        player.CurrentFame = player.Client.Account.Stats.Fame = db.UpdateFame(player.Client.Account, -1000);
                                        player.UpdateCount++;
                                        return;
                                    }
                                    else
                                    {
                                        player.Client.SendPacket(new CreateGuildResultPacket()
                                        {
                                            Success = false,
                                            ResultMessage = "Guildname cannot be blank."
                                        });
                                        return;
                                    }
                                }
                                else
                                {
                                    player.Client.SendPacket(new CreateGuildResultPacket()
                                    {
                                        Success = false,
                                        ResultMessage = "You cannot create a guild as a guild member."
                                    });
                                    return;
                                }
                            }
                            catch (Exception e)
                            {
                                player.Client.SendPacket(new CreateGuildResultPacket()
                                {
                                    Success = false,
                                    ResultMessage = "Error " + e
                                });
                                return;
                            }
                        }
                        else
                        {
                            player.Client.SendPacket(new CreateGuildResultPacket()
                            {
                                Success = false,
                                ResultMessage = "Guild name cannot be blank."
                            });
                        }
                    }
                    else
                    {
                        player.Client.SendPacket(new CreateGuildResultPacket()
                        {
                            Success = false,
                            ResultMessage = "Not enough Fame."
                        });
                    }
                });
            }
            catch (Exception e)
            {
                client.SendPacket(new CreateGuildResultPacket()
                {
                    Success = false,
                    ResultMessage = "Error " + e
                });
            }
        }
    }
}