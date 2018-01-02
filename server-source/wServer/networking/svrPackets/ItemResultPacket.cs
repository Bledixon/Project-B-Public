namespace wServer.networking.svrPackets
{
    public class ItemResultPacket : ServerPacket
    {
        public uint ItemID { get; set; }
        public string Data { get; set; }

        public override PacketID ID
        {
            get { return PacketID.ItemResult; }
        }

        public override Packet CreateInstance()
        {
            return new ItemResultPacket();
        }

        protected override void Read(NReader rdr)
        {
            ItemID = rdr.ReadUInt32();
            Data = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(ItemID);
            wtr.WriteUTF(Data);
        }
    }
}