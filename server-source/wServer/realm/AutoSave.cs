using System;
using System.Collections.Concurrent;
using System.Diagnostics;
using log4net;

namespace wServer.realm
{
    public class AutoSave
    {
        public RealmManager Manager { get; private set; }

        public static RealmTime CurrentTime;
        private readonly ConcurrentQueue<Action<RealmTime>>[] pendings;
        private static readonly ILog log = LogManager.GetLogger(typeof(AutoSave));
        private bool Saved = true;

        public AutoSave(RealmManager manager)
        {
            Manager = manager;
            pendings = new ConcurrentQueue<Action<RealmTime>>[5];
            for (var i = 0; i < 5; i++)
                pendings[i] = new ConcurrentQueue<Action<RealmTime>>();
        }

        public void TickLoop()
        {
            log.Info("AutoSave started.");
            var watch = new Stopwatch();
            watch.Start();
            //var t = new RealmTime();
            do
            {
                if (Manager.Terminating) break;

                if (watch.ElapsedMilliseconds % 115000 == 0)
                {
                    if (Saved)
                        Saved = false;
                    else
                    {
                        foreach (var i in Manager.Clients.Values)
                        {
                            if (i.Player == null || i.Player != null && i.Player.Owner == null) return;
                            i.Save();
                        }
                        Saved = true;
                    }
                }
            } while (true);
            log.Info("AutoSave stopped.");
        }
    }
}
