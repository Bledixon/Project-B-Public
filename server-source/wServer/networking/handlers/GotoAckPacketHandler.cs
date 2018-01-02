using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    internal class GotoAckPacketHandler : PacketHandlerBase<GotoAckPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.GotoAck; }
        }

        protected override void HandlePacket(Client client, GotoAckPacket packet)
        {
            //TODO: implement something
        }
    }
}