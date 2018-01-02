using System;
using System.Net;
using System.Net.Sockets;
using log4net;
using db;

namespace wServer.networking
{
    internal class PolicyServer
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(PolicyServer));

        private readonly TcpListener listener;
        private bool started;

        public PolicyServer()
        {
            listener = new TcpListener(IPAddress.Any, 843);
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
                    wtr.WriteNullTerminatedString(customDomains.enabled ? customDomains.custom : customDomains.local);
                    wtr.Write((byte)'\r');
                    wtr.Write((byte)'\n');
                }
                cli.Close();
            }
            catch
            {
            }
        }

        public void Start()
        {
            log.Info("Starting policy server...");
            try
            {
                listener.Start();
                listener.BeginAcceptTcpClient(ServePolicyFile, listener);
                started = true;
            }
            catch
            {
                log.Warn("Could not start Socket Policy Server, is port 843 occupied?");
                started = false;
            }
        }

        public void Stop()
        {
            if (started)
            {
                log.Warn("Stopping policy server...");
                listener.Stop();
            }
        }
    }
}