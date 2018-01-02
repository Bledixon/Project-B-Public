namespace wServer.networking.svrPackets
{
    public class CreateSuccessPacket : ServerPacket
    {
        public int ObjectID { get; set; }
        public int CharacterID { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Create_Success; }
        }

        public override Packet CreateInstance()
        {
            return new CreateSuccessPacket();
        }

        protected override void Read(NReader rdr)
        {
            ObjectID = rdr.ReadInt32();
            CharacterID = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(ObjectID);
            wtr.Write(CharacterID);
        }
    }
}