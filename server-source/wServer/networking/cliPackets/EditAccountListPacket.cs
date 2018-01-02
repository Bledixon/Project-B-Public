﻿namespace wServer.networking.cliPackets
{
    public class EditAccountListPacket : ClientPacket
    {
        public int AccountListId { get; set; }
        public bool Add { get; set; }
        public int ObjectId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.EditAccountList; }
        }

        public override Packet CreateInstance()
        {
            return new EditAccountListPacket();
        }

        protected override void Read(NReader rdr)
        {
            AccountListId = rdr.ReadInt32();
            Add = rdr.ReadBoolean();
            ObjectId = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(AccountListId);
            wtr.Write(Add);
            wtr.Write(ObjectId);
        }
    }
}