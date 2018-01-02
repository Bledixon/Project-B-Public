using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class PartyInvitePacketHandler : PacketHandlerBase<PartyInvitePacket>
    {
        public override PacketID ID
        {
            get { return PacketID.PartyInvite; }
        }

        protected override void HandlePacket(Client client, PartyInvitePacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet));
        }

        private void Handle(Player player, PartyInvitePacket packet)
        {
            Player invited;
            if((invited = player.Owner.GetUniqueNamedPlayer(packet.Name)) == null)
            {
                player.SendError("Player not found: " + packet.Name + "!");
                return;
            }
            if (invited.Party != null)
            {
                player.SendInfo("The player is already in a party!");
                return;
            }
            if (invited.Client == null)
                return;
            if (player.Party == null)
            {
                player.Party = new Party(player);
                player.UpdateCount++;
            }
            if (player.Party.Leader == player)
            {
                player.Party.Invitations.Add(invited.AccountId);
                player.Party.SendPacket(new TextPacket
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "",
                    Recipient = "*Party*",
                    Text = invited.Name + " was invited to the party"
                }, null);
                invited.Client.SendPacket(new InvitedToPartyPacket
                {
                    Name = player.Name,
                    PartyID = player.Party.ID
                });
            }
        }
    }
}