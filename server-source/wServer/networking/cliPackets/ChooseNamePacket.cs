namespace wServer.networking.cliPackets
{
    public class ChooseNamePacket : ClientPacket
    {
        public string Name { get; set; }

        public override PacketID ID
        {
            get { return PacketID.ChooseName; }
        }

        public override Packet CreateInstance()
        {
            return new ChooseNamePacket();
        }

        protected override void Read(NReader rdr)
        {
            Name = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
        }
    }
}