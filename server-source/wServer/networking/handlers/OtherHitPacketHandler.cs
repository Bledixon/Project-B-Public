using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    internal class OtherHitPacketHandler : PacketHandlerBase<OtherHitPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.OtherHit; }
        }

        protected override void HandlePacket(Client client, OtherHitPacket packet)
        {
            //TODO: implement something
        }
    }
}