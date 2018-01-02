namespace wServer.networking.cliPackets
{
    public class EscapePacket : ClientPacket
    {
        public override PacketID ID
        {
            get { return PacketID.Escape; }
        }

        public override Packet CreateInstance()
        {
            return new EscapePacket();
        }

        protected override void Read(NReader rdr)
        {
        }

        protected override void Write(NWriter wtr)
        {
        }
    }
}