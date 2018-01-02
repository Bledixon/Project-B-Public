namespace wServer.networking.cliPackets
{
    public class LoadPacket : ClientPacket
    {
        public int CharacterId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Load; }
        }

        public override Packet CreateInstance()
        {
            return new LoadPacket();
        }

        protected override void Read(NReader rdr)
        {
            CharacterId = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(CharacterId);
        }
    }
}