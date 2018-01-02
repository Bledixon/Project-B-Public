namespace wServer.networking.cliPackets
{
    public class JoinPartyPacket : ClientPacket
    {
        public int PartyID;

        public override PacketID ID
        {
            get { return PacketID.JoinParty; }
        }

        public override Packet CreateInstance()
        {
            return new JoinPartyPacket();
        }

        protected override void Read(NReader rdr)
        {
            PartyID = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(PartyID);
        }
    }
}