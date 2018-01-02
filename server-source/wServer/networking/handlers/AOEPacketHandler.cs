using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    internal class AOEAckPacketHandler : PacketHandlerBase<AOEAckPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.AOEAck; }
        }

        protected override void HandlePacket(Client client, AOEAckPacket packet)
        {
            //TODO: implement something
        }
    }
}