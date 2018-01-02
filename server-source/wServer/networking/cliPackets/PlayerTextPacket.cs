namespace wServer.networking.cliPackets
{
    public class PlayerTextPacket : ClientPacket
    {
        public string Text { get; set; }

        public override PacketID ID
        {
            get { return PacketID.PlayerText; }
        }

        public override Packet CreateInstance()
        {
            return new PlayerTextPacket();
        }

        protected override void Read(NReader rdr)
        {
            Text = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Text);
        }
    }
}