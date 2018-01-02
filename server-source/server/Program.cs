using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Net;
using System.Threading;
using db;
using log4net;
using log4net.Config;
using System.Windows.Forms;
using System.Diagnostics;

namespace server
{
    internal class Program
    {
        private static HttpListener listener;

        internal static SimpleSettings Settings;
        internal static XmlData GameData;

        private static readonly ILog log = LogManager.GetLogger("Server");

        private static void Main(string[] args)
        {
            XmlConfigurator.ConfigureAndWatch(new FileInfo("log4net.config"));

            Thread.CurrentThread.CurrentCulture = CultureInfo.InvariantCulture;
            Thread.CurrentThread.Name = "Entry";

            System.Timers.Timer timer = new System.Timers.Timer(45 * 60 * 1000);
            timer.Elapsed += AutoRestart; 

            using (Settings = new SimpleSettings("server"))
            {
                GameData = new XmlData();
                var port = Settings.GetValue<int>("port", "8080");

                RequestHandler.LoadHandlers();

                listener = new HttpListener();
                listener.Prefixes.Add("http://+:" + port + "/");
                listener.Start();
                timer.Start();

                listener.BeginGetContext(ListenerCallback, null);
                Console.CancelKeyPress += (sender, e) => e.Cancel = true;
                log.Info("Listening at port " + port + "...");

                while (Console.ReadKey(true).Key != ConsoleKey.Escape) ;

                log.Info("Terminating...");
                listener.Stop();
                GameData.Dispose();
            }
        }

        private static void ListenerCallback(IAsyncResult ar)
        {
            if (!listener.IsListening) return;
            var context = listener.EndGetContext(ar);
            listener.BeginGetContext(ListenerCallback, null);
            ProcessRequest(context);
        }

        private static void ProcessRequest(HttpListenerContext context)
        {
            if (!context.Request.Url.LocalPath.StartsWith("/clientError"))
                log.InfoFormat("Dispatching request '{0}'@{1}", context.Request.Url.LocalPath, context.Request.RemoteEndPoint);

            try
            {
                var handler = RequestHandler.GetHandler(context);
                if (handler != null)
                    handler.HandleASync();
                else
                {
                    log.ErrorFormat("Unable to dispatch request! '{0}'@{1}", context.Request.Url.LocalPath, context.Request.RemoteEndPoint);
                    context.Response.StatusCode = 400;
                    context.Response.StatusDescription = "Bad request";
                    using (var wtr = new StreamWriter(context.Response.OutputStream))
                        wtr.Write("<h1>Bad request</h1>");
                    context.Response.Close();
                }
            }
            catch (Exception ex)
            {
                using (var wtr = new StreamWriter(context.Response.OutputStream))
                    wtr.Write($"<Error>Internal Server Error</Error><FullError>{ex}</FullError>");
                log.Error("Error when dispatching request", ex);
            }
        }
        private static void AutoRestart(object source, EventArgs e)
        {
            Environment.Exit(-1);
        }
    }
}