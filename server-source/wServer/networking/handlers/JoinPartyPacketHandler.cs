using wServer.networking.cliPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class JoinPartyPacketHandler : PacketHandlerBase<JoinPartyPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.JoinParty; }
        }

        protected override void HandlePacket(Client client, JoinPartyPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet));
        }

        private void Handle(Player player, JoinPartyPacket packet)
        {
            Party party = Party.GetParty(packet.PartyID);
            if (party == null)
            {
                player.SendError("Party no longer exists!");
                return;
            }
            if (!party.Invitations.Contains(player.AccountId))
            {
                player.SendInfo("You must be invited to join a party!");
                return;
            }
            if (player.Party != null)
                if (player.Party.Leader == player)
                    player.Party.Disband();
                else
                    player.Party.RemoveMember(player);
            party.AddMember(player);
        }
    }
}