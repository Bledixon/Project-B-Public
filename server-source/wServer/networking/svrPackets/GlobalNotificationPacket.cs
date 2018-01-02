namespace wServer.networking.svrPackets
{
    public class GlobalNotificationPacket : ServerPacket
    {
        public int Type { get; set; }
        public string Text { get; set; }

        public override PacketID ID
        {
            get { return PacketID.GlobalNotification; }
        }

        public override Packet CreateInstance()
        {
            return new GlobalNotificationPacket();
        }

        protected override void Read(NReader rdr)
        {
            Type = rdr.ReadInt32();
            Text = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Type);
            wtr.WriteUTF(Text);
        }
    }
}