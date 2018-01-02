namespace wServer.networking.cliPackets
{
    public class GroundDamagePacket : ClientPacket
    {
        public int Time { get; set; }
        public Position Position { get; set; }

        public override PacketID ID
        {
            get { return PacketID.GroundDamage; }
        }

        public override Packet CreateInstance()
        {
            return new GroundDamagePacket();
        }

        protected override void Read(NReader rdr)
        {
            Time = rdr.ReadInt32();
            Position = Position.Read(rdr);
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Time);
            Position.Write(wtr);
        }
    }
}