using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Threading;

namespace wServer
{
    internal class Program
    {
        private static Socket svrSkt;
        public static List<ClientProcessor> processors = new List<ClientProcessor>();

        private static void Main(string[] args)
        {
            svrSkt = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            svrSkt.Bind(new IPEndPoint(IPAddress.Any, 2050));
            svrSkt.Listen(0xff);
            svrSkt.BeginAccept(Listen, null);
            Console.CancelKeyPress += (sender, e) =>
            {
                Console.WriteLine("Terminating...");
                svrSkt.Close();
                Environment.Exit(0);
            };
            Console.WriteLine("Listening at port 2050...");

            Thread.CurrentThread.Join();
        }

        private static void ServePolicyFile(IAsyncResult ar)
        {
            TcpClient cli = (ar.AsyncState as TcpListener).EndAcceptTcpClient(ar);
            (ar.AsyncState as TcpListener).BeginAcceptTcpClient(ServePolicyFile, ar.AsyncState);
            try
            {
                NetworkStream s = cli.GetStream();
                var rdr = new NReader(s);
                var wtr = new NWriter(s);
                if (rdr.ReadNullTerminatedString() == "<policy-file-request/>")
                {
                    wtr.WriteNullTerminatedString(@"<cross-domain-policy>
     <allow-access-from domain=""*"" to-ports=""*"" />
</cross-domain-policy>");
                    wtr.Write((byte) '\r');
                    wtr.Write((byte) '\n');
                }
                cli.Close();
            }
            catch
            {
            }
        }

        private static void Listen(IAsyncResult ar)
        {
            try
            {
                Socket skt = svrSkt.EndAccept(ar);
                svrSkt.BeginAccept(Listen, null);

                var psr = new ClientProcessor(skt);
                processors.Add(psr);
                psr.BeginProcess();
            }
            catch (ObjectDisposedException)
            {
            }
        }
    }
}