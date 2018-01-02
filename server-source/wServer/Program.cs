using System;
using System.Globalization;
using System.IO;
using System.Threading;
using db;
using log4net;
using log4net.Config;
using wServer.networking;
using wServer.realm;
using System.Timers;

namespace wServer
{
    internal static class Program
    {
        internal static SimpleSettings Settings;

        private static readonly ILog log = LogManager.GetLogger("Server");
        public static readonly DateTime StartTime = DateTime.Now;
        public static RealmManager manager = new RealmManager(0, 0); //Max Clients, TPS, Database.

        public static int serverTPS = 5;
        public static int serverMaxClients = 100;
        public static string serverDatabaseConnString = "Server=127.0.0.1;Database=;uid=;password=;max pool size=20000"; 
        //This is set here, just in case the client SOMEHOW manages to connect before the Settings.Value is set. Which is impossible, but it's whatever.

        private static void Main(string[] args)
        {
            XmlConfigurator.ConfigureAndWatch(new FileInfo("log4net.config"));

            System.Timers.Timer timer = new System.Timers.Timer(65 * 60 * 1000);
            timer.Elapsed += AutoRestart;

            Thread.CurrentThread.CurrentCulture = CultureInfo.InvariantCulture;
            Thread.CurrentThread.Name = "Entry";

            using (Settings = new SimpleSettings("wServer"))
            {
                serverDatabaseConnString = Settings.GetValue("conn"); //Ugh, this should do good. :]
                serverTPS = Settings.GetValue<int>("tps", "5");
                serverMaxClients = Settings.GetValue<int>("maxClient", "100");

                manager = new RealmManager(serverMaxClients, serverTPS);

                manager.Initialize();
                manager.Run();

                var server = new Server(manager, 2050);
                var policy = new PolicyServer();


                Console.CancelKeyPress += (sender, e) => e.Cancel = true;

                policy.Start();
                server.Start();
                log.Info("Server initialized.");
                timer.Start();

                while (((uint)Console.ReadKey(true).Key) != (uint)ConsoleKey.Escape)
                {

                    log.Info("Terminating...");
                    server.Stop();
                    policy.Stop();
                    manager.Stop();
                    log.Info("Server terminated.");
                }
            }
        }

        private static void AutoRestart(object source, EventArgs e)
        {
            Environment.Exit(-1);
        }

        internal static void AutoRestartc(object sender, ElapsedEventArgs e)
        {
            Environment.Exit(-1);
        }
    }
}