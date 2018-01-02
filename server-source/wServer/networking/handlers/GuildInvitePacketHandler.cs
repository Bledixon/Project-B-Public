using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class GuildInvitePacketHandler : PacketHandlerBase<GuildInvitePacket>
    {
        public override PacketID ID
        {
            get { return PacketID.GuildInvite; }
        }

        protected override void HandlePacket(Client client, GuildInvitePacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet));
        }

        void Handle(Player player, GuildInvitePacket packet)
        {
            if (player.Guild.IsDefault)
            {
                player.SendInfo("You are not in a guild");
                return;
            }
            if (player.Guild[player.AccountId].Rank >= 20)
            {
                foreach (var i in player.Owner.Players.Values)
                {
                    Player target = player;

                    if (target == null)
                    {
                        player.SendError("Cannot find {player}, player must have a unique name and be nearby to invite");
                        return;
                    }
                    if (!target.NameChosen || player.Dist(target) > 20)
                    {
                        player.SendError("Cannot find {player}, player must have a unique name and be nearby to invite");
                        return;
                    }

                    if (target.Guild.IsDefault)
                    {
                        if (target.Ignored.Contains(player.Client.Account.AccountId)) return;
                        target.Client.SendPacket(new InvitedToGuildPacket()
                        {
                            Name = player.Name,
                            GuildName = player.Guild[player.AccountId].Name
                        });
                        target.Invited = true;
                        player.SendInfo("{ player} has been invited to join { guild}");
                        return;
                    }
                    else
                        player.SendError("Player is already in a guild!");
                }
            }
            else
                player.SendInfo("Members and initiates cannot invite!");
        }
    }
}