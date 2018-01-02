namespace wServer.networking.cliPackets
{
    internal class TextBoxButtonPacket : ClientPacket
    {
        public int Button { get; set; }
        public string Type { get; set; }

        public override PacketID ID
        {
            get { return PacketID.TextBoxButton; }
        }

        public override Packet CreateInstance()
        {
            return new TextBoxButtonPacket();
        }

        protected override void Read(NReader rdr)
        {
            Button = rdr.ReadInt32();
            Type = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Button);
            wtr.WriteUTF(Type);
        }
    }
}