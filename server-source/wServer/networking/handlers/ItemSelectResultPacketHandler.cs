using log4net;
using wServer.networking.cliPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class ItemSelectResultPacketHandler : PacketHandlerBase<ItemSelectResultPacket>
    {
        private static ILog log = LogManager.GetLogger(typeof(ItemSelectResultPacketHandler));

        public override PacketID ID
        {
            get { return PacketID.ItemSelectResult; }
        }

        protected override void HandlePacket(Client client, ItemSelectResultPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet.Slot));
        }

        private void Handle(Player player, int slot)
        {
            player.SelectResult(slot);
        }
    }
}