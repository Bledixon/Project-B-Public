using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    internal class ShootAckPacketHandler : PacketHandlerBase<ShootAckPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.ShootAck; }
        }

        protected override void HandlePacket(Client client, ShootAckPacket packet)
        {
            //TODO: implement something
        }
    }
}