namespace wServer.networking.svrPackets
{
    public class AllyShootPacket : ServerPacket
    {
        public byte BulletId { get; set; }
        public int OwnerId { get; set; }
        public ushort ContainerType { get; set; }
        public float Angle { get; set; }
        public int Damage { get; set; }

        public override PacketID ID
        {
            get { return PacketID.AllyShoot; }
        }

        public override Packet CreateInstance()
        {
            return new AllyShootPacket();
        }

        protected override void Read(NReader rdr)
        {
            BulletId = rdr.ReadByte();
            OwnerId = rdr.ReadInt32();
            ContainerType = rdr.ReadUInt16();
            Angle = rdr.ReadSingle();
            Damage = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(BulletId);
            wtr.Write(OwnerId);
            wtr.Write(ContainerType);
            wtr.Write(Angle);
            wtr.Write(Damage);
        }
    }
}