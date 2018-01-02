using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    internal class SquareHitPacketHandler : PacketHandlerBase<SquareHitPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.SquareHit; }
        }

        protected override void HandlePacket(Client client, SquareHitPacket packet)
        {
            //TODO: implement something
        }
    }
}