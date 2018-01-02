namespace wServer.networking.cliPackets
{
    public class GotoAckPacket : ClientPacket
    {
        public int Time { get; set; }

        public override PacketID ID
        {
            get { return PacketID.GotoAck; }
        }

        public override Packet CreateInstance()
        {
            return new GotoAckPacket();
        }

        protected override void Read(NReader rdr)
        {
            Time = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Time);
        }
    }
}