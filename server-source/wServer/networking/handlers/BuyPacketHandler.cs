using wServer.networking.cliPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class BuyPacketHandler : PacketHandlerBase<BuyPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.Buy; }
        }

        protected override void HandlePacket(Client client, BuyPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet.ObjectId));
        }

        private void Handle(Player player, int objId)
        {
            if (player.Owner == null) return;

            var obj = player.Owner.GetEntity(objId) as SellableObject;
            if (obj != null)
                obj.Buy(player);
        }
    }
}