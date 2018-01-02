using db;
using System.Collections.Generic;
namespace wServer.networking.cliPackets
{
    public class MarketCreatePacket : ClientPacket
    {
        public int[] IncludedSlots { get; set; }
        public int[] RequestItems { get; set; }
        public ItemData[] RequestDatas { get; set; }

        public override PacketID ID
        {
            get { return PacketID.MarketCreate; }
        }

        public override Packet CreateInstance()
        {
            return new MarketCreatePacket();
        }

        protected override void Read(NReader rdr)
        {
            List<int> slots = new List<int>();
            int length = rdr.ReadInt32();
            for (int i = 0; i < length; i++)
                slots.Add(rdr.ReadInt32());
            List<int> requestItems = new List<int>();
            length = rdr.ReadInt32();
            for (int i = 0; i < length; i++)
                requestItems.Add(rdr.ReadInt32());
            length = rdr.ReadInt32();
            List<ItemData> requestDatas = new List<ItemData>();
            for (int i = 0; i < length; i++)
                requestDatas.Add(ItemData.CreateData(rdr.ReadUTF()));
            this.IncludedSlots = slots.ToArray();
            this.RequestItems = requestItems.ToArray();
            this.RequestDatas = requestDatas.ToArray();
        }

        protected override void Write(NWriter wtr)
        {
        }
    }
}