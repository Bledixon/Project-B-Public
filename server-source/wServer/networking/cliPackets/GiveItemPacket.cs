using db;
namespace wServer.networking.cliPackets
{
    public class GiveItemPacket : ClientPacket
    {
        public int ItemType { get; set; }
        public ItemData ItemData { get; set; }

        public override PacketID ID
        {
            get { return PacketID.GiveItem; }
        }

        public override Packet CreateInstance()
        {
            return new GiveItemPacket();
        }

        protected override void Read(NReader rdr)
        {
            ItemType = rdr.ReadInt32();
            ItemData = ItemData.CreateData(rdr.ReadUTF());
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(ItemType);
            wtr.WriteUTF(ItemData.GetJson());
        }
    }
}

