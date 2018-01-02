﻿namespace wServer.networking.svrPackets
{
    public class TextBoxPacket : ServerPacket
    {
        public string Title { get; set; }
        public string Message { get; set; }
        public string Button1 { get; set; }
        public string Button2 { get; set; }
        public string Type { get; set; }

        public override PacketID ID
        {
            get { return PacketID.TextBox; }
        }

        public override Packet CreateInstance()
        {
            return new TextBoxPacket();
        }

        protected override void Read(NReader rdr)
        {
            Title = rdr.ReadUTF();
            Message = rdr.ReadUTF();
            Button1 = rdr.ReadUTF();
            Button2 = rdr.ReadUTF();
            Type = rdr.ReadUTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Title);
            wtr.WriteUTF(Message);
            wtr.WriteUTF(Button1);
            wtr.WriteUTF(Button2);
            wtr.WriteUTF(Type);
        }
    }
}