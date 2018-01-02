namespace wServer.networking.svrPackets
{
    public class GetTextInputPacket : ServerPacket
    {
        public string Name { get; set; }
        public string Action { get; set; }

        public override PacketID ID
        {
            get { return PacketID.GetTextInput; }
        }

        public override Packet CreateInstance()
        {
            return new GetTextInputPacket();
        }

        protected override void Read(NReader rdr)
        {
            Name = rdr.ReadUTF();
            Action = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
            wtr.WriteUTF(Action);
        }
    }
}