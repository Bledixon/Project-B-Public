namespace wServer.networking.svrPackets
{
    public class CreateGuildResultPacket : ServerPacket
    {
        public string ResultMessage { get; set; }
        public bool Success { get; set; }

        public override PacketID ID
        {
            get { return PacketID.CreateGuildResult; }
        }

        public override Packet CreateInstance()
        {
            return new CreateGuildResultPacket();
        }

        protected override void Read(NReader rdr)
        {
            ResultMessage = rdr.ReadUTF();
            Success = rdr.ReadBoolean();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Success);
            wtr.WriteUTF(ResultMessage);
        }
    }
}