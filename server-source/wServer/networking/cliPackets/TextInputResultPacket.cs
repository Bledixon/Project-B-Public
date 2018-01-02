namespace wServer.networking.cliPackets
{
    public class TextInputResultPacket : ClientPacket
    {
        public bool Success { get; set; }
        public string Action { get; set; }
        public string Input { get; set; }

        public override PacketID ID
        {
            get { return PacketID.TextInputResult; }
        }

        public override Packet CreateInstance()
        {
            return new TextInputResultPacket();
        }

        protected override void Read(NReader rdr)
        {
            Success = rdr.ReadBoolean();
            Action = rdr.ReadUTF();
            Input = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Success);
            wtr.WriteUTF(Action);
            wtr.WriteUTF(Input);
        }
    }
}