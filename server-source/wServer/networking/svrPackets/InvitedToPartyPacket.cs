namespace wServer.networking.svrPackets
{
    public class InvitedToPartyPacket : ServerPacket
    {
        public int PartyID;
        public string Name;

        public override PacketID ID
        {
            get { return PacketID.InvitedToParty; }
        }

        public override Packet CreateInstance()
        {
            return new InvitedToPartyPacket();
        }

        protected override void Read(NReader rdr)
        {
            Name = rdr.ReadUTF();
            PartyID = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
            wtr.Write(PartyID);
        }
    }
}