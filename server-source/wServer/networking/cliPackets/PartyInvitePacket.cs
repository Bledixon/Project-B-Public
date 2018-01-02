namespace wServer.networking.cliPackets
{
    public class PartyInvitePacket : ClientPacket
    {
        public string Name;

        public override PacketID ID
        {
            get { return PacketID.PartyInvite; }
        }

        public override Packet CreateInstance()
        {
            return new PartyInvitePacket();
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