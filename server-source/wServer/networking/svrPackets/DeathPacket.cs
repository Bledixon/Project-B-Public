﻿namespace wServer.networking.svrPackets
{
    public class DeathPacket : ServerPacket
    {
        public int AccountId { get; set; }
        public int CharId { get; set; }
        public string Killer { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Death; }
        }

        public override Packet CreateInstance()
        {
            return new DeathPacket();
        }

        protected override void Read(NReader rdr)
        {
            AccountId = rdr.ReadInt32();
            CharId = rdr.ReadInt32();
            Killer = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(AccountId);
            wtr.Write(CharId);
            wtr.WriteUTF(Killer);
        }
    }
}