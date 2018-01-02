using db;
using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace wServer.realm
{
    public class DatabaseTicker
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(DatabaseTicker));
        private readonly List<KeyValuePair<Database, bool>> m_databases;

        public DatabaseTicker(RealmManager manager)
        {
            Manager = manager;
            m_databases = new List<KeyValuePair<Database, bool>>();
        }

        public RealmManager Manager { get; }

        public Database GetDatabase()
        {
            lock (m_databases) //Thread safe
            {
                var db = m_databases.FirstOrDefault(_ => _.Value).Key;
                if (db != null)
                {
                    var index = m_databases.FindIndex(_ => _.Key == db);
                    m_databases.RemoveAt(index);
                    m_databases.Add(new KeyValuePair<Database, bool>(db, false));
                    return db;
                }
                db = new Database(Program.Settings.GetValue<string>("conn"));
                m_databases.Add(new KeyValuePair<Database, bool>(db, false));
                return db;
            }
        }

        public Task AddDatabaseOperation(Action<Database> action)
        {
            var db = GetDatabase();
            return Task.Factory.StartNew(o => action((Database)o), db)
                .ContinueWith(t => log.Error("Error in database task.", t.Exception.InnerException), TaskContinuationOptions.OnlyOnFaulted)
                .ContinueWith(task => FreeDatabase(db));
        }

        public void FreeDatabase(Database db)
        {
            lock (m_databases) //Thread safe
            {
                var index = m_databases.FindIndex(_ => _.Key == db);
                m_databases.RemoveAt(index);
                m_databases.Add(new KeyValuePair<Database, bool>(db, true));
            }
        }
    }
}