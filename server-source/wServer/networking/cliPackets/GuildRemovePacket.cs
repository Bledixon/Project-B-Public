namespace wServer.networking.cliPackets
{
    public class GuildRemovePacket : ClientPacket
    {
        public string Name;

        public override PacketID ID
        {
            get { return PacketID.GuildRemove; }
        }

        public override Packet CreateInstance()
        {
            return new GuildRemovePacket();
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