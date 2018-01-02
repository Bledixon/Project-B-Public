﻿namespace wServer.networking.cliPackets
{
    public class ChangeTradePacket : ClientPacket
    {
        public bool[] Offers { get; set; }

        public override PacketID ID
        {
            get { return PacketID.ChangeTrade; }
        }

        public override Packet CreateInstance()
        {
            return new ChangeTradePacket();
        }

        protected override void Read(NReader rdr)
        {
            Offers = new bool[rdr.ReadInt16()];
            for (int i = 0; i < Offers.Length; i++)
                Offers[i] = rdr.ReadBoolean();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((short) Offers.Length);
            foreach (bool i in Offers)
                wtr.Write(i);
        }
    }
}