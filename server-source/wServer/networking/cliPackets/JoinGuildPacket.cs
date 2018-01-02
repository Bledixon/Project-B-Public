namespace wServer.networking.cliPackets
{
    public class JoinGuildPacket : ClientPacket
    {
        public string GuildName;

        public override PacketID ID
        {
            get { return PacketID.JoinGuild; }
        }

        public override Packet CreateInstance()
        {
            return new JoinGuildPacket();
        }

        protected override void Read(NReader rdr)
        {
            GuildName = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(GuildName);
        }
    }
}