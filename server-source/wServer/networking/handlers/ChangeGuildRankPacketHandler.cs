using System;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class ChangeGuildRankPacketHandler : PacketHandlerBase<ChangeGuildRankPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.ChangeGuildRank; }
        }

        protected override void HandlePacket(Client client, ChangeGuildRankPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client, packet));
        }

        void Handle(Client client, ChangeGuildRankPacket packet)
        {
            client.AddDatabaseOpperation(db =>
            {
                if (client.Player.Guild[client.Player.AccountId].Rank >= 20)
                {
                    var other = client.Player.Manager.FindPlayer(packet.Name);
                    if (other != null && other.Guild.Name == client.Player.Guild.Name)
                    {
                        other.Guild[other.AccountId].Rank = packet.GuildRank;
                        other.Client.Account.Guild.Rank = packet.GuildRank;
                        db.ChangeGuild(other.Client.Account, other.Client.Account.Guild.Id, other.Guild[other.AccountId].Rank, other.Client.Account.Guild.Fame, false);
                        other.UpdateCount++;
                        foreach (Player p in client.Player.Guild)
                            p.SendInfo(other.Name + " has become a " + client.Player.ResolveRankName(packet.GuildRank));
                    }
                    else
                    {
                        try
                        {
                            var acc = db.GetAccountByName(packet.Name, client.Manager.GameData);
                            if (acc.Guild.Name == client.Player.Guild.Name)
                            {
                                db.ChangeGuild(acc, acc.Guild.Id, packet.GuildRank, acc.Guild.Fame, false);
                                foreach (Player p in client.Player.Guild)
                                    p.SendInfo(acc.Name + " has become a " + client.Player.ResolveRankName(packet.GuildRank));
                            }
                            else
                                client.Player.SendInfo("You can only change a player in your guild.");
                        }
                        catch (Exception e)
                        {
                            client.Player.SendError(e.Message);
                        }
                    }
                }
                else
                    client.Player.SendInfo("Members and initiates cannot promote!");

                client.SendPacket(new CreateGuildResultPacket()
                {
                    Success = true,
                    ResultMessage = ""
                });
            });
        }
    }
}