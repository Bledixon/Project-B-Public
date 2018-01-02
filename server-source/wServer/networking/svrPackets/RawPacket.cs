namespace wServer.networking.svrPackets
{
    public class RawPacket : ServerPacket
    {
        private PacketID id;
        public byte[] Content { get; set; }

        public PacketID PktID
        {
            set { id = value; }
        }

        public override PacketID ID
        {
            get { return id; }
        }

        public override Packet CreateInstance()
        {
            return new RawPacket();
        }

        protected override void Read(NReader rdr)
        {
            //
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Content);
        }
    }
}