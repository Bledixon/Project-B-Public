namespace wServer.networking.svrPackets
{
    public class TradeRequestedPacket : ServerPacket
    {
        public string Name { get; set; }

        public override PacketID ID
        {
            get { return PacketID.TradeRequested; }
        }

        public override Packet CreateInstance()
        {
            return new TradeRequestedPacket();
        }

        protected override void Read(NReader rdr)
        {
            Name = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
        }
    }
}