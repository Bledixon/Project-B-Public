namespace wServer.networking.cliPackets
{
    public class CreateGuildPacket : ClientPacket
    {
        public string Name;
        public bool Success;

        public override PacketID ID
        {
            get { return PacketID.CreateGuild; }
        }

        public override Packet CreateInstance()
        {
            return new CreateGuildPacket();
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