using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using log4net;
using System.Web.Http.Cors;
using db;

namespace wServer.networking
{
    [EnableCors(origins: "http://yoursite.com", headers: "*", methods: "*")]
    internal class NetworkHandler : IDisposable
    {
        public const int BUFFER_SIZE = 0x10000;
        private static readonly ILog log = LogManager.GetLogger(typeof(NetworkHandler));
        private readonly Client parent;
        private readonly ConcurrentQueue<SendToken> pendingPackets = new ConcurrentQueue<SendToken>();
        private readonly object sendLock = new object();
        private Socket skt;

        private SocketAsyncEventArgs receive;
        private byte[] receiveBuff;
        private ReceiveState receiveState = ReceiveState.Awaiting;

        private SocketAsyncEventArgs send;
        private byte[] sendBuff;
        private SendState sendState = SendState.Awaiting;
        private bool disposed;
        private bool disposeCalled;
        private int m_recvOperating;
        private int m_sendOperating;

        public NetworkHandler(Client parent, Socket skt)
        {
            this.parent = parent;
            this.skt = skt;
        }

        public void BeginHandling()
        {
            skt.NoDelay = true;
            skt.UseOnlyOverlappedIO = true;

            send = new SocketAsyncEventArgs();
            send.Completed += SendCompleted;
            send.SetBuffer(sendBuff = new byte[BUFFER_SIZE], 0, BUFFER_SIZE);

            receive = new SocketAsyncEventArgs();
            receive.Completed += ReceiveCompleted;
            receive.UserToken = new ReceiveToken();
            receive.SetBuffer(receiveBuff = new byte[BUFFER_SIZE], 0, BUFFER_SIZE);

            receiveState = ReceiveState.ReceivingHdr;
            receive.SetBuffer(0, 5);
            if (!skt.ReceiveAsync(receive))
                ReceiveCompleted(this, receive);
        }

        private void ProcessPolicyFile()
        {
            var s = new NetworkStream(skt);
            var wtr = new NWriter(s);
            wtr.WriteNullTerminatedString(customDomains.enabled ? customDomains.custom : customDomains.local);
            wtr.Write((byte)'\r');
            wtr.Write((byte)'\n');
            parent.Disconnect();
        }

        private void ReceiveCompleted(object sender, SocketAsyncEventArgs e)
        {
            m_recvOperating = 0;

            if (disposeCalled)
                Dispose();

            try
            {
                if (!skt.Connected)
                {
                    parent.Disconnect();
                    return;
                }

                if (e.SocketError != SocketError.Success)
                    throw new SocketException((int)e.SocketError);

                switch (receiveState)
                {
                    case ReceiveState.ReceivingHdr:
                        if (e.BytesTransferred < 5)
                        {
                            parent.Disconnect();
                            return;
                        }

                        if (e.Buffer[0] == 0x3c && e.Buffer[1] == 0x70 &&
                            e.Buffer[2] == 0x6f && e.Buffer[3] == 0x6c && e.Buffer[4] == 0x69)
                        {
                            ProcessPolicyFile();
                            return;
                        }

                        int len = (e.UserToken as ReceiveToken).Length =
                            IPAddress.NetworkToHostOrder(BitConverter.ToInt32(e.Buffer, 0)) - 5;
                        if (len < 0 || len > BUFFER_SIZE)
                            log.ErrorFormat("Buffer not large enough! (requested size={0})", len);
                        (e.UserToken as ReceiveToken).PacketBody = new byte[len];
                        (e.UserToken as ReceiveToken).ID = (PacketID)e.Buffer[4];

                        receiveState = ReceiveState.ReceivingBody;
                        e.SetBuffer(0, len);
                        skt.ReceiveAsync(e);

                        break;
                    case ReceiveState.ReceivingBody:
                        if (e.BytesTransferred < (e.UserToken as ReceiveToken).Length)
                        {
                            parent.Disconnect();
                            return;
                        }

                        byte[] body = (e.UserToken as ReceiveToken).PacketBody;
                        PacketID id = (e.UserToken as ReceiveToken).ID;
                        Buffer.BlockCopy(e.Buffer, 0, body, 0, body.Length);

                        receiveState = ReceiveState.Processing;
                        bool cont = OnPacketReceived(id, body);

                        if (cont && skt.Connected)
                        {
                            receiveState = ReceiveState.ReceivingHdr;
                            e.SetBuffer(0, 5);
                            skt.ReceiveAsync(e);
                        }
                        break;
                    default:
                        throw new InvalidOperationException(e.LastOperation.ToString());
                }
            }
            catch (Exception ex)
            {
                OnError(ex);
            }
        }

        private void SendCompleted(object sender, SocketAsyncEventArgs e)
        {
            m_sendOperating = 0;

            if (disposeCalled)
                Dispose();

            try
            {
                if (!skt.Connected || disposed) return;

                int len;
                switch (sendState)
                {
                    case SendState.Ready:
                        len = (e.UserToken as SendToken).Packet.Write(parent, sendBuff, 0);

                        sendState = SendState.Sending;
                        e.SetBuffer(0, len);
                        skt.SendAsync(e);
                        break;
                    case SendState.Sending:
                        //Invoke on logic thread
                        var callback = (e.UserToken as SendToken).Callback;
                        parent.Manager.Logic.AddPendingAction(t => callback?.Invoke());

                        e.UserToken = null;
                        if (CanSendPacket(e, true))
                        {
                            len = (e.UserToken as SendToken).Packet.Write(parent, sendBuff, 0);

                            sendState = SendState.Sending;
                            e.SetBuffer(0, len);
                            skt.SendAsync(e);
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                OnError(ex);
            }
        }


        private void OnError(Exception ex)
        {
            log.Error("Socket error.", ex);
            parent.Disconnect();
        }

        private bool OnPacketReceived(PacketID id, byte[] pkt)
        {
            if (parent.IsReady())
            {
                parent.Manager.Network.AddPendingPacket(parent, id, pkt);
                return true;
            }
            return false;
        }

        private bool CanSendPacket(SocketAsyncEventArgs e, bool ignoreSending)
        {
            lock (sendLock)
            {
                if (sendState == SendState.Ready ||
                    (!ignoreSending && sendState == SendState.Sending))
                    return false;
                SendToken token;
                if (pendingPackets.TryDequeue(out token))
                {
                    e.UserToken = token;
                    sendState = SendState.Ready;
                    return true;
                }
                sendState = SendState.Awaiting;
                return false;
            }
        }

        public void SendPacket(Packet pkt, Action callback)
        {
            if (!skt.Connected) return;
            pendingPackets.Enqueue(new SendToken(pkt, callback));
            if (CanSendPacket(send, false))
            {
                int len = (send.UserToken as SendToken).Packet.Write(parent, sendBuff, 0);

                sendState = SendState.Sending;
                send.SetBuffer(sendBuff, 0, len);
                if (!skt.SendAsync(send))
                    SendCompleted(this, send);
            }
        }

        public void SendPackets(IEnumerable<Packet> pkts)
        {
            if (!skt.Connected) return;
            foreach (var pkt in pkts)
                pendingPackets.Enqueue(new SendToken(pkt, null));

            if (CanSendPacket(send, false))
            {
                int len = (send.UserToken as SendToken).Packet.Write(parent, sendBuff, 0);

                sendState = SendState.Sending;
                send.SetBuffer(sendBuff, 0, len);
                if (!skt.SendAsync(send))
                    SendCompleted(this, send);
            }
        }

        private enum ReceiveState
        {
            Awaiting,
            ReceivingHdr,
            ReceivingBody,
            Processing
        }

        private class ReceiveToken
        {
            public PacketID ID;
            public int Length;
            public byte[] PacketBody;
        }

        private enum SendState
        {
            Awaiting,
            Ready,
            Sending
        }

        private class SendToken
        {
            public Packet Packet { get; }
            public Action Callback { get; }

            public SendToken(Packet pkt, Action callback)
            {
                Packet = pkt;
                Callback = callback;
            }
        }

        public void Dispose()
        {
            disposeCalled = true;

            if (Interlocked.Exchange(ref m_sendOperating, 1) != 0 || Interlocked.Exchange(ref m_recvOperating, 1) != 0 || disposed)
                return;

            disposed = true;
            if (send != null)
            {
                send.Completed -= SendCompleted;
                send.SetBuffer(new byte[0], 0, 0);
                send.Dispose();
            }

            if (receive != null)
            {
                receive.Completed -= ReceiveCompleted;
                receive.SetBuffer(new byte[0], 0, 0);
                receive.Dispose();
            }

            sendBuff = null;
            receiveBuff = null;

            send = null;
            receive = null;
            skt?.Dispose();
            skt = null;
        }
    }
}