using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using wServer.realm;

namespace wServer
{
    internal class ClientProcessor
    {
        private static readonly XmlData dat = new XmlData();
        private readonly List<Packet> cliPkts = new List<Packet>();
        private readonly Socket skt;
        private readonly List<Packet> svrPkts = new List<Packet>();
        private Thread cliWkr;
        private TcpClient dest;
        private Thread svrWkr;

        public ClientProcessor(Socket skt)
        {
            this.skt = skt;
            ReceiveKey =
                new RC4(new byte[] {0x31, 0x1f, 0x80, 0x69, 0x14, 0x51, 0xc7, 0x1b, 0x09, 0xa1, 0x3a, 0x2a, 0x6e});
            SendKey = new RC4(new byte[] {0x72, 0xc5, 0x58, 0x3c, 0xaf, 0xb6, 0x81, 0x89, 0x95, 0xcb, 0xd7, 0x4b, 0x80});
        }

        public RC4 ReceiveKey { get; private set; }
        public RC4 SendKey { get; private set; }

        public void BeginProcess()
        {
            dest = new TcpClient();
            dest.Connect("46.137.218.95", 2050);

            cliWkr = new Thread(ProcessCli);
            cliWkr.Start();
            svrWkr = new Thread(ProcessSvr);
            svrWkr.Start();
        }

        private void ProcessCli()
        {
            try
            {
                var rdr = new NReader(new NetworkStream(skt));
                var wtr = new NWriter(dest.GetStream());
                while (true)
                {
                    int len = rdr.ReadInt32();
                    byte id = rdr.ReadByte();
                    byte[] content = rdr.ReadBytes(len - 5);

                    object state = ReceiveKey.SaveState();

                    content = ReceiveKey.Crypt(content);
                    ReceiveKey.LoadState(state);
                    //if (id == 17)
                    //{
                    //    MemoryStream ms = new MemoryStream();
                    //    using (NWriter w = new NWriter(ms))
                    //    using (NReader r = new NReader(new MemoryStream(content)))
                    //    {
                    //        w.WriteUTF(r.ReadUTF());
                    //        Console.WriteLine(r.ReadInt32()); w.Write(-3);
                    //        w.WriteUTF(r.ReadUTF());
                    //        w.WriteUTF(r.ReadUTF());
                    //        w.WriteUTF(r.ReadUTF());
                    //        w.Write(r.ReadInt32());
                    //        var c = r.ReadBytes(r.ReadInt16());
                    //        w.Write((short)c.Length);
                    //        w.Write(c);
                    //        w.Write32UTF(r.Read32UTF());
                    //        w.WriteUTF(r.ReadUTF());
                    //        w.WriteUTF(r.ReadUTF());
                    //        w.WriteUTF(r.ReadUTF());
                    //        w.WriteUTF(r.ReadUTF());
                    //    }
                    //    content = ms.ToArray();
                    //}
                    if (id == 4)
                    {
                        using (var r = new NReader(new MemoryStream(content)))
                        {
                            string Name = rdr.ReadUTF();
                            string Host = rdr.ReadUTF();
                            int Port = rdr.ReadInt32();
                            int GameId = rdr.ReadInt32();
                            int KeyTime = rdr.ReadInt32();
                            byte[] Key = rdr.ReadBytes(rdr.ReadInt16());
                        }
                    }
                    content = ReceiveKey.Crypt(content);
                    ReceiveKey.LoadState(state);


                    wtr.Write(len);
                    wtr.Write(id);
                    wtr.Write(content);

                    cliPkts.Add(new Packet {id = id, content = ReceiveKey.Crypt(content)});
                }
            }
            catch
            {
            }
            finally
            {
                skt.Close();
            }
            for (int i = 0; i < cliPkts.Count; i++)
                File.WriteAllBytes("cli_pkt/" + i + "_" + cliPkts[i].id, cliPkts[i].content);
        }

        private void ProcessSvr()
        {
            try
            {
                var rdr = new NReader(dest.GetStream());
                var wtr = new NWriter(new NetworkStream(skt));
                while (true)
                {
                    int len = rdr.ReadInt32() - 5;
                    byte id = rdr.ReadByte();
                    byte[] content = rdr.ReadBytes(len);

                    wtr.Write(len + 5);
                    wtr.Write(id);
                    wtr.Write(content);

                    svrPkts.Add(new Packet {id = id, content = SendKey.Crypt(content)});
                }
            }
            catch
            {
            }
            finally
            {
                skt.Close();
            }
            var map = new JsonMap(dat);
            for (int i = 0; i < svrPkts.Count; i++)
            {
                File.WriteAllBytes("svr_pkt/" + i + "_" + svrPkts[i].id, svrPkts[i].content);
                if (svrPkts[i].id == 37)
                {
                    map.Init(IPAddress.NetworkToHostOrder(BitConverter.ToInt32(svrPkts[i].content, 0)),
                        IPAddress.NetworkToHostOrder(BitConverter.ToInt32(svrPkts[i].content, 4)));
                    File.WriteAllBytes("mapinfo.packet", svrPkts[i].content);
                }
                if (svrPkts[i].id == 5)
                {
                    using (var rdr = new NReader(new MemoryStream(svrPkts[i].content)))
                    {
                        short count = rdr.ReadInt16();
                        for (int x = 0; x < count; x++)
                        {
                            map.Tiles[rdr.ReadInt16()][rdr.ReadInt16()] = (Tile) rdr.ReadByte();
                        }
                        count = rdr.ReadInt16();
                        for (int x = 0; x < count; x++)
                        {
                            ObjectDef def = ObjectDef.Read(rdr);
                            def.Stats.Position.X -= 0.5F;
                            def.Stats.Position.Y -= 0.5F;
                            if (def.Stats.Position.X == (int) def.Stats.Position.X &&
                                def.Stats.Position.Y == (int) def.Stats.Position.Y)
                            {
                                var _x = (int) def.Stats.Position.X;
                                var _y = (int) def.Stats.Position.Y;
                                Array.Resize(ref map.Entities[_x][_y], map.Entities[_x][_y].Length + 1);
                                ObjectDef[] arr = map.Entities[_x][_y];

                                arr[arr.Length - 1] = def;
                            }
                        }
                    }
                }
            }
            File.WriteAllText("map.jm", map.ToJson());
        }

        private struct Packet
        {
            public byte[] content;
            public byte id;
        }
    }
}