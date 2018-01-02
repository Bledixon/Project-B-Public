#region

using System.Collections.Generic;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;

#endregion

namespace wServer.realm.entities
{
    public partial class Player
    {
        long lastPong = -1;
        int? lastTime = null;
        long tickMapping = 0;
        Queue<long> ts = new Queue<long>();

        bool sentPing = false;
        bool KeepAlive(RealmTime time)
        {
            if (lastPong == -1) lastPong = time.tickTimes - 1500;
            if (time.tickTimes - lastPong > 1500 && !sentPing)
            {
                sentPing = true;
                ts.Enqueue(time.tickTimes);
                client.SendPacket(new PingPacket());
            }
            else if (time.tickTimes - lastPong > 17500)
            {
                SendError("Lost connection to server.");
                client.Disconnect();
                return false;
            }
            return true;
        }
        internal void Pong(int time, PongPacket pkt)
        {
            if (lastTime != null && (time - lastTime.Value > 17500 || time - lastTime.Value < 0))
            {
                SendError("Lost connection to server.");
                client.Disconnect();
            }
            else
                lastTime = time;
            tickMapping = ts.Dequeue() - time;
            lastPong = time + tickMapping;
            sentPing = false;
        }

        /*private const int PING_PERIOD = 1000;
        private const int DC_THRESOLD = 600000;

        private int updateLastSeen;

        public WorldTimer PongDCTimer { get; private set; }

        private bool KeepAlive(RealmTime time)
        {
            return true;
        }

        internal void Pong(int time, PongPacket pkt)
        {
            updateLastSeen++;

            if (updateLastSeen == 60)
            {
                if (Owner.Timers.Contains(PongDCTimer))
                    Owner.Timers.Remove(PongDCTimer);

                Owner.Timers.Add(PongDCTimer = new WorldTimer(DC_THRESOLD, (w, t) =>
                {
                    SendError("Lost connection to server.");
                    Client.Disconnect();
                }));
            }
        }*/
    }
}