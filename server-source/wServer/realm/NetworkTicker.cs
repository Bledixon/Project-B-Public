using System;
using System.Collections.Concurrent;
using System.Threading;
using log4net;
using wServer.networking;

namespace wServer.realm
{
    using Work = Tuple<Client, PacketID, byte[]>;

    public class NetworkTicker //Sync network processing
    {
        private static readonly ConcurrentQueue<Work> pendings = new ConcurrentQueue<Work>();
        private static SpinWait loopLock = new SpinWait();
        private readonly ILog log = LogManager.GetLogger(typeof(NetworkTicker));

        public NetworkTicker(RealmManager manager)
        {
            Manager = manager;
        }

        public RealmManager Manager { get; private set; }

        public void AddPendingPacket(Client client, PacketID id, byte[] packet)
        {
            pendings.Enqueue(new Work(client, id, packet));
        }


        public void TickLoop()
        {
            log.Info("Network loop started.");
            while (true)
            {
                if (Manager.Terminating) break;
                loopLock.Reset();

                Work work;
                while (pendings.TryDequeue(out work))
                {
                    if (Manager.Terminating) return;
                    if (work.Item1.Stage == ProtocalStage.Disconnected && work.Item1.Account != null)
                    {
                        Client client;
                        Manager.Clients.TryRemove(work.Item1.Account.AccountId, out client);
                        continue;
                    }
                    try
                    {
                        var packet = Packet.Packets[work.Item2].CreateInstance();
                        packet.Read(work.Item1, work.Item3, 0, work.Item3.Length);
                        work.Item1.ProcessPacket(packet);
                    }
                    catch (Exception ex)
                    {
                        log.Error("Error while reading or processing packet:\n", ex);
                    }
                }
                while (pendings.Count == 0 && !Manager.Terminating)
                    loopLock.SpinOnce();
            }
            log.Info("Network loop stopped.");
        }
    }
}