namespace wServer.networking.svrPackets
{
    public class SwitchMusicPacket : ServerPacket
    {
        public string Music { get; set; }

        public override PacketID ID
        {
            get { return PacketID.SwitchMusic; }
        }

        public override Packet CreateInstance()
        {
            return new SwitchMusicPacket();
        }

        protected override void Read(NReader rdr)
        {
            Music = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Music);
        }
    }
}