namespace wServer.networking.cliPackets
{
    public class ItemSelectResultPacket : ClientPacket
    {
        public int Slot { get; set; }

        public override PacketID ID
        {
            get { return PacketID.ItemSelectResult; }
        }

        public override Packet CreateInstance()
        {
            return new ItemSelectResultPacket();
        }

        protected override void Read(NReader rdr)
        {
            Slot = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Slot);
        }
    }
}