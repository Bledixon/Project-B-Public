using System;
using System.Collections.Concurrent;
using System.Diagnostics;
using System.Linq;
using System.Threading;
using log4net;
using db;

namespace wServer.realm
{
    public class LogicTicker
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(LogicTicker));
        private readonly ConcurrentQueue<Action<RealmTime>>[] pendings;

        public int MsPT;
        public int TPS;

        public RealmTime globalTime;

        private int announceDelay;
        private int time;
        private int timex;
        private int timez;
        private int timey;
        private int timeu;

        public LogicTicker(RealmManager manager)
        {
            Manager = manager;
            pendings = new ConcurrentQueue<Action<RealmTime>>[5];
            for (int i = 0; i < 5; i++)
                pendings[i] = new ConcurrentQueue<Action<RealmTime>>();

            TPS = manager.TPS;
            MsPT = 1000 / TPS;
        }

        public RealmManager Manager { get; private set; }

        public void AddPendingAction(Action<RealmTime> callback)
        {
            AddPendingAction(callback, PendingPriority.Normal);
        }

        public void AddPendingAction(Action<RealmTime> callback, PendingPriority priority)
        {
            pendings[(int)priority].Enqueue(callback);
        }

        public void TickLoop()
        {
            log.Info("Logic loop started.");
            var watch = new Stopwatch();
            long dt = 0;
            long count = 0;

            watch.Start();
            globalTime = new RealmTime();
            do
            {
                if (Manager.Terminating) break;

                var loopStartMS = watch.ElapsedMilliseconds;

                var times = dt / MsPT;
                dt -= times * MsPT;
                times++;

                count += times;
              /*  if (times > 3)
                    log.Warn($"LAGGED!| times:{times} dt:{dt} count:{count} LSTime:{loopStartMS} CTime: {watch.ElapsedMilliseconds} tps:{count / (loopStartMS / 1000.0)}"); */

                globalTime.tickTimes = loopStartMS;
                globalTime.tickCount = count;
                globalTime.thisTickCounts = (int)times;
                globalTime.thisTickTimes = (int)(times * MsPT);

                foreach (var i in pendings)
                {
                    Action<RealmTime> callback;
                    while (i.TryDequeue(out callback))
                    {
                        try
                        {
                            callback(globalTime);
                        }
                        catch
                        {
                        }
                    }
                }

                if (customDomains.enabled)
                {
                    ResetAccountInUse();
                    multiBoxCheckFunction();
                    Announce();
                    RestartMsg();
                    SaveBeforeRestart();
                }

                TickWorlds();

                

                if ((watch.ElapsedMilliseconds - loopStartMS) < MsPT)
                    Thread.Sleep(MsPT - (int)(watch.ElapsedMilliseconds - loopStartMS));
                dt += Math.Max(0, watch.ElapsedMilliseconds - loopStartMS - MsPT);
            } while (true);
            log.Info("Logic loop stopped.");
        }

        private void TickWorlds() //Continous simulation
        {
            foreach (var i in Manager.Worlds.Where(_ => _.Key != 0))
                i.Value.Tick(globalTime);
            //if (EnableMonitor)
            //    svrMonitor.Mon.Tick(t);
        }
        private void Announce()
        {
            if (announceDelay > 0)
                announceDelay -= globalTime.thisTickTimes;
            else
            {
                announceDelay = 45000;
                var rand = new Random();
                string message = "";
                switch (rand.Next(5))
                {
                    case 0:
                        message = "Welcome to Project B!";
                        break;
                    case 1:
                        message = "This server is currently under a lot of testing, so please take any downtime, lag and bug with patience and understanding.";
                        break;
                    case 2:
                        message = "Our website: http://yoursite.com";
                        break;
                    case 3:
                        message = "For information about donating to the server, please press the crown on the donate button located upper left!";
                        break;
                    case 4:
                        message = "Newest Update: Happy Halloween!";
                        break;
                }
                foreach (var i in Manager.Worlds.Where(_ => _.Key == -2))
                {
                    foreach (var player in i.Value.Players.Values)
                    {
                        player.SendText("Server Announcements", message);
                    }
                }
            }
        }
        private void RestartMsg()
        {
            string nothing = "";

            if (time > 0)
                time -= globalTime.thisTickTimes;
            else
            {
                time = 64 * 60 * 1000;
                string message = "Server will restart in 1 minute, please be sure to log off";
                foreach (var i in Manager.Clients)
                    if (i.Value.Player != null)
                    {
                        i.Value.Player.SendText("-------------------------", nothing);
                        i.Value.Player.SendText("Server", message);
                        i.Value.Player.SendText("-------------------------", nothing);
                    }
            }
        }
        private void ResetAccountInUse()
        {
            if (timey > 0)
                timey -= globalTime.thisTickTimes;
            else
            {
                timey = 15 * 1000;
                foreach (var i in Manager.Clients)
                    i.Value.AddDatabaseOpperation(db => db.UnlockAllAccounts());
            }
        }
        private void SaveBeforeRestart()
        {
            if (timex > 0)
                timex -= globalTime.thisTickTimes;
            else
            {
                timex = (64 * 60 * 1000) + 500;
                foreach (var i in Manager.Clients)
                    if (i.Value.Player != null)
                    {
                        i.Value.Player.Client.Save();
                        i.Value.Player.Client.Disconnect();
                    }
            }
        }
        private void multiBoxCheckFunction()
        {
            if (timez > 0)
                timez -= globalTime.thisTickTimes;
            else
            {
                timez = (20 * 1000);
                foreach (var A in Manager.Clients)
                    foreach (var B in Manager.Clients)
                    {
                        try
                        {
                            if (A.Value == null || A.Value.Player == null) continue;
                            if (B.Value == null || B.Value.Player == null) continue;
                            var aIpBefore = A.Value.Socket.RemoteEndPoint.ToString().Split(':');
                            var bIpBefore = B.Value.Socket.RemoteEndPoint.ToString().Split(':');
                            var aIpAfter = aIpBefore[0];
                            var bIpAfter = bIpBefore[0];
                            if (aIpAfter == bIpAfter && A.Value.Account.AccountId != B.Value.Account.AccountId)
                            {
                                A.Value.Disconnect();
                                B.Value.Disconnect();
                                Console.WriteLine("Multibox attempt! Kicked: " + A.Value.Account.Name + " & " + B.Value.Account.Name);
                            }
                        }
                        catch (Exception ex)
                        {
                            log.Error(ex);
                        }
                    }
            }
        }
        public void ClearMemory()
        {
            if (timeu > 0)
                timeu -= globalTime.thisTickTimes;
            else
            {
                timeu = (10 * 60 * 1000);
                foreach (var i in Manager.Clients)
                    if (i.Value.Player != null)
                        i.Value.Player.SendError("Short Lag.. This is intended");

                GC.Collect(GC.MaxGeneration, GCCollectionMode.Forced);
                GC.WaitForPendingFinalizers();
            }
        }
    }
}