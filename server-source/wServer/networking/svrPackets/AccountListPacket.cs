namespace wServer.networking.svrPackets
{
    public class AccountListPacket : ServerPacket
    {
        public int AccountListId { get; set; }
        public int[] AccountIds { get; set; }

        public override PacketID ID
        {
            get { return PacketID.AccountList; }
        }

        public override Packet CreateInstance()
        {
            return new AccountListPacket();
        }

        protected override void Read(NReader rdr)
        {
            AccountListId = rdr.ReadInt32();
            AccountIds = new int[rdr.ReadInt16()];
            for (var i = 0; i < AccountIds.Length; i++)
                AccountIds[i] = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(AccountListId);
            wtr.Write((short)AccountIds.Length);
            foreach (var i in AccountIds)
                wtr.Write(i);
        }
    }
}