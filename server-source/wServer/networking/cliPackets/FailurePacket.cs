namespace wServer.networking.cliPackets
{
    public class FailurePacket : ClientPacket
    {
        public string Message { get; set; }
        public int ErrorId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Failure; }
        }

        public override Packet CreateInstance()
        {
            return new FailurePacket();
        }

        protected override void Read(NReader rdr)
        {
            ErrorId = rdr.ReadInt32();
            Message = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(ErrorId);
            wtr.WriteUTF(Message);
        }
    }
}