using System;
using System.Collections.Concurrent;
using log4net;
using db;

namespace wServer.networking
{
    //hackish code
    internal class DatabaseHandler : IDisposable
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(DatabaseHandler));
        private readonly Client parent;
        private readonly ConcurrentQueue<Action<Database>> pendingData = new ConcurrentQueue<Action<Database>>();
        private bool disposed = false;
        private bool disposeCalled = false;
        private Database db;

        public DatabaseHandler(Client parent)
        {
            this.parent = parent;
        }

        public void AddData(Action<Database> data)
        {
            pendingData.Enqueue(data);
        }

        public void HandleData()
        {
            lock (pendingData)
            {
                Action<Database> request;
                pendingData.TryDequeue(out request);
                db = new Database(Program.Settings.GetValue<string>("conn"));
                using (db) { request(db); }
                db.Dispose();
            }
        }

        public void Dispose()
        {
            disposeCalled = true;
            db.Dispose();
            db = null;
            disposed = true;
        }
    }
}