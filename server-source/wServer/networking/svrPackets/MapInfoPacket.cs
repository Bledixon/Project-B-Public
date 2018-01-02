namespace wServer.networking.svrPackets
{
    public class MapInfoPacket : ServerPacket
    {
        public int Width { get; set; }
        public int Height { get; set; }
        public string Name { get; set; }
        public string ConMessage { get; set; }
        public uint Seed { get; set; }
        public int Background { get; set; }
        public int Difficulty { get; set; }
        public bool AllowTeleport { get; set; }
        public bool ShowDisplays { get; set; }
        public Weather Weatherx { get; set; }
        public string Music { get; set; }
        public string[] ClientXML { get; set; }
        public string[] ExtraXML { get; set; }

        public override PacketID ID
        {
            get { return PacketID.MapInfo; }
        }

        public override Packet CreateInstance()
        {
            return new MapInfoPacket();
        }

        protected override void Read(NReader rdr)
        {
            Width = rdr.ReadInt32();
            Height = rdr.ReadInt32();
            Name = rdr.ReadUTF();
            ConMessage = rdr.ReadUTF();
            Seed = rdr.ReadUInt32();
            Background = rdr.ReadInt32();
            Difficulty = rdr.ReadInt32();
            AllowTeleport = rdr.ReadBoolean();
            ShowDisplays = rdr.ReadBoolean();
            Weatherx = (Weather)rdr.ReadByte();
            Music = rdr.ReadUTF();

            ClientXML = new string[rdr.ReadInt16()];
            for (int i = 0; i < ClientXML.Length; i++)
                ClientXML[i] = rdr.Read32UTF();

            ExtraXML = new string[rdr.ReadInt16()];
            for (int i = 0; i < ExtraXML.Length; i++)
                ExtraXML[i] = rdr.Read32UTF();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Width);
            wtr.Write(Height);
            wtr.WriteUTF(Name);
            wtr.WriteUTF(ConMessage);
            wtr.Write(Seed);
            wtr.Write(Background);
            wtr.Write(Difficulty);
            wtr.Write(AllowTeleport);
            wtr.Write(ShowDisplays);
            wtr.Write((byte)Weatherx);
            wtr.WriteUTF(Music);

            wtr.Write((short) ClientXML.Length);
            foreach (string i in ClientXML)
                wtr.Write32UTF(i);

            wtr.Write((short) ExtraXML.Length);
            foreach (string i in ExtraXML)
                wtr.Write32UTF(i);
        }
        public enum Weather : byte
        {
            Sunny = 0,
            Rainy = 1,
            Snowy = 2,
            ThunderStorm = 3,
            AshStorm = 4,
            Ghost = 5
        }
    }
}