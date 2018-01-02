﻿namespace wServer.networking.svrPackets
{
    public class BuyResultPacket : ServerPacket
    {
        public int Result { get; set; }
        public string Message { get; set; }

        public override PacketID ID
        {
            get { return PacketID.BuyResult; }
        }

        public override Packet CreateInstance()
        {
            return new BuyResultPacket();
        }

        protected override void Read(NReader rdr)
        {
            Result = rdr.ReadInt32();
            Message = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Result);
            wtr.WriteUTF(Message);
        }
    }
}