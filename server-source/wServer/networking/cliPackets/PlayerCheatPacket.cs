namespace wServer.networking.cliPackets
{
    public class PlayerCheatPacket : ClientPacket
    {
        public int atk_ { get; set; }
        public int def_ { get; set; }
        public int spd_ { get; set; }
        public int vit_ { get; set; }
        public int wis_ { get; set; }
        public int dex_ { get; set; }
        public int mindmg_ { get; set; }
        public int maxdmg_ { get; set; }

        public override PacketID ID
        {
            get { return PacketID.PlayerCheat; }
        }

        public override Packet CreateInstance()
        {
            return new PlayerCheatPacket();
        }

        protected override void Read(NReader rdr)
        {
            atk_ = rdr.ReadInt32();
            def_ = rdr.ReadInt32();
            spd_ = rdr.ReadInt32();
            vit_ = rdr.ReadInt32();
            wis_ = rdr.ReadInt32();
            dex_ = rdr.ReadInt32();
            mindmg_ = rdr.ReadInt32();
            maxdmg_ = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(atk_);
            wtr.Write(def_);
            wtr.Write(spd_);
            wtr.Write(vit_);
            wtr.Write(wis_);
            wtr.Write(dex_);
            wtr.Write(mindmg_);
            wtr.Write(maxdmg_);
        }
    }
}
