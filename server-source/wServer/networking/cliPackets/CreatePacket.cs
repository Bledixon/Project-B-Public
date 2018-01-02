namespace wServer.networking.cliPackets
{
    public class CreatePacket : ClientPacket
    {
        public ushort ObjectType { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Create; }
        }

        public override Packet CreateInstance()
        {
            return new CreatePacket();
        }

        protected override void Read(NReader rdr)
        {
            ObjectType = rdr.ReadUInt16();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(ObjectType);
        }
    }
}