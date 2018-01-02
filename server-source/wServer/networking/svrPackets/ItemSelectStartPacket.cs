namespace wServer.networking.svrPackets
{
    public class ItemSelectStartPacket : ServerPacket
    {
        public TradeItem[] MyItems { get; set; }

        public override PacketID ID
        {
            get { return PacketID.ItemSelectStart; }
        }

        public override Packet CreateInstance()
        {
            return new ItemSelectStartPacket();
        }

        protected override void Read(NReader rdr)
        {
            MyItems = new TradeItem[rdr.ReadInt16()];
            for (int i = 0; i < MyItems.Length; i++)
                MyItems[i] = TradeItem.Read(rdr);
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((short) MyItems.Length);
            foreach (TradeItem i in MyItems)
                i.Write(wtr);
        }
    }
}