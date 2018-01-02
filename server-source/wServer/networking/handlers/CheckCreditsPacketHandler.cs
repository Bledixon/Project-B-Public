using wServer.networking.cliPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class CheckCreditsPacketHandler : PacketHandlerBase<CheckCreditsPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.CheckCredits; }
        }

        protected override void HandlePacket(Client client, CheckCreditsPacket packet)
        {
            client.AddDatabaseOpperation(db => db.ReadStats(client.Account));
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player));
        }

        private void Handle(Player player)
        {
            player.Credits = player.Client.Account.Credits;
            player.UpdateCount++;
        }
    }
}