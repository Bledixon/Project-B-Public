﻿namespace wServer.networking.svrPackets
{
    public class TradeStartPacket : ServerPacket
    {
        public TradeItem[] MyItems { get; set; }
        public string YourName { get; set; }
        public TradeItem[] YourItems { get; set; }

        public override PacketID ID
        {
            get { return PacketID.TradeStart; }
        }

        public override Packet CreateInstance()
        {
            return new TradeStartPacket();
        }

        protected override void Read(NReader rdr)
        {
            MyItems = new TradeItem[rdr.ReadInt16()];
            for (int i = 0; i < MyItems.Length; i++)
                MyItems[i] = TradeItem.Read(rdr);

            YourName = rdr.ReadUTF();
            YourItems = new TradeItem[rdr.ReadInt16()];
            for (int i = 0; i < YourItems.Length; i++)
                YourItems[i] = TradeItem.Read(rdr);
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((short) MyItems.Length);
            foreach (TradeItem i in MyItems)
                i.Write(wtr);

            wtr.WriteUTF(YourName);
            wtr.Write((short) YourItems.Length);
            foreach (TradeItem i in YourItems)
                i.Write(wtr);
        }
    }
}