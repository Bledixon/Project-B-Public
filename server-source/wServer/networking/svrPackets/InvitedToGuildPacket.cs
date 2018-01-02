namespace wServer.networking.svrPackets
{
    public class InvitedToGuildPacket : ServerPacket
    {
        public string GuildName;
        public string Name;

        public override PacketID ID
        {
            get { return PacketID.InvitedToGuild; }
        }

        public override Packet CreateInstance()
        {
            return new InvitedToGuildPacket();
        }

        protected override void Read(NReader rdr)
        {
            Name = rdr.ReadUTF();
            GuildName = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
            wtr.WriteUTF(GuildName);
        }
    }
}