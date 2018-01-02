namespace wServer.networking.cliPackets
{
    public class VisibulletPacket : ClientPacket
    {
        public int Damage { get; set; }
        public int EnemyId { get; set; }
        public byte BulletId { get; set; }
        public bool ArmorPiercing { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Visibullet; }
        }

        public override Packet CreateInstance()
        {
            return new VisibulletPacket();
        }

        protected override void Read(NReader rdr)
        {
            Damage = rdr.ReadInt32();
            EnemyId = rdr.ReadInt32();
            BulletId = rdr.ReadByte();
            ArmorPiercing = rdr.ReadBoolean();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Damage);
            wtr.Write(EnemyId);
            wtr.Write(BulletId);
            wtr.Write(ArmorPiercing);
        }
    }
}

