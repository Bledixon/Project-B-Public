namespace wServer.networking.svrPackets
{
    public class NotificationPacket : ServerPacket
    {
        public int ObjectId { get; set; }
        public string Text { get; set; }
        public ARGB Color { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Notification; }
        }

        public override Packet CreateInstance()
        {
            return new NotificationPacket();
        }

        protected override void Read(NReader rdr)
        {
            ObjectId = rdr.ReadInt32();
            Text = rdr.ReadUTF();
            Color = ARGB.Read(rdr);
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(ObjectId);
            wtr.WriteUTF(Text);
            Color.Write(wtr);
        }
    }
}