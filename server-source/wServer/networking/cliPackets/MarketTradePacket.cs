namespace wServer.networking.cliPackets
{
    public class MarketTradePacket : ClientPacket
    {
        public int TradeId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.MarketTrade; }
        }

        public override Packet CreateInstance()
        {
            return new MarketTradePacket();
        }

        protected override void Read(NReader rdr)
        {
            TradeId = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(TradeId);
        }
    }
}
