namespace wServer.networking.svrPackets
{
    public class TradeAcceptedPacket : ServerPacket
    {
        public bool[] MyOffers { get; set; }
        public bool[] YourOffers { get; set; }

        public override PacketID ID
        {
            get { return PacketID.TradeAccepted; }
        }

        public override Packet CreateInstance()
        {
            return new TradeAcceptedPacket();
        }

        protected override void Read(NReader rdr)
        {
            MyOffers = new bool[rdr.ReadInt16()];
            for (int i = 0; i < MyOffers.Length; i++)
                MyOffers[i] = rdr.ReadBoolean();

            YourOffers = new bool[rdr.ReadInt16()];
            for (int i = 0; i < YourOffers.Length; i++)
                YourOffers[i] = rdr.ReadBoolean();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((short) MyOffers.Length);
            foreach (bool i in MyOffers)
                wtr.Write(i);
            wtr.Write((short) YourOffers.Length);
            foreach (bool i in YourOffers)
                wtr.Write(i);
        }
    }
}