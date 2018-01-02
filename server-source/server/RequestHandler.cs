using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using log4net;
using db;

namespace server
{
    public abstract class RequestHandler
    {
        protected static readonly ILog log = LogManager.GetLogger(typeof(RequestHandler));
        
        private static readonly Dictionary<UriTemplate, Type> handlers = new Dictionary<UriTemplate, Type>();

        internal static void LoadHandlers()
        {
            var handlerTypes = from t in Assembly.GetExecutingAssembly().GetTypes()
                               where t.IsSubclassOf(typeof(RequestHandler))
                               where t.IsClass
                               select t;

            foreach (var t in handlerTypes)
            {
                var attributes = t.GetCustomAttributes(typeof(HttpUrlRequestAttribute), true);
                foreach (var attr in attributes)
                {
                    if (!(attr is HttpUrlRequestAttribute))
                    {
                        log.Warn($"Not supported handler found: {t.Name}");
                        continue;
                    }
                    handlers.Add((attr as HttpUrlRequestAttribute).Uri, t);
                    log.Info($"Handler registered: {t.Name} - URL: {(attr as HttpUrlRequestAttribute).Uri}");
                }
            }
        }

        public static Type GetHandlerType(HttpListenerRequest request)
        {
            return handlers.Where(kvp => kvp.Key.Match(new Uri(request.Url.GetLeftPart(UriPartial.Authority)), request.Url) != null).Select(kvp => kvp.Value).FirstOrDefault();
        }

        public static RequestHandler GetHandler(HttpListenerContext context)
        {
            var handlerType = handlers.Where(kvp => kvp.Key.Match(new Uri(context.Request.Url.GetLeftPart(UriPartial.Authority)), context.Request.Url) != null).Select(kvp => kvp.Value).FirstOrDefault();
            if (handlerType == null) return null;
            var handler = (RequestHandler)Activator.CreateInstance(handlerType);
            handler.Init(context);
            return handler;
        }

        protected HttpListenerContext ListenerContext { get; private set; }
        protected NameValueCollection NameValueCollection { get; private set; }

        protected string GUID => NameValueCollection["guid"];
        protected string PASS => NameValueCollection["password"];

        protected bool HasCredentials => GUID != null && PASS != null;

        public void Init(HttpListenerContext context)
        {
            if (ListenerContext != null) throw new InvalidOperationException("RequestHandler already initialized.");
            ListenerContext = context;
            if (ListenerContext.Request.HttpMethod == "POST")
            {
                using (var rdr = new StreamReader(context.Request.InputStream))
                    NameValueCollection = HttpUtility.ParseQueryString(rdr.ReadToEnd());
            }
            else
            {
                var currUrl = context.Request.RawUrl;
                var iqs = currUrl.IndexOf('?');
                if (iqs >= 0)
                {
                    NameValueCollection =
                        HttpUtility.ParseQueryString((iqs < currUrl.Length - 1)
                            ? currUrl.Substring(iqs + 1)
                            : String.Empty);
                }
            }
            if (NameValueCollection == null) NameValueCollection = new NameValueCollection();
        }

        public bool CheckAccount(Account acc, Database db, bool checkAccInUse = true)
        {
            if (acc.isBanned)
            {
                using (StreamWriter wtr = new StreamWriter(ListenerContext.Response.OutputStream))
                    wtr.WriteLine("<Error>Account under maintenance</Error>");
                ListenerContext.Response.Close();
                return false;
            }
            if (checkAccInUse)
            {
                int? timeout = 0;
                if (db.CheckAccountInUse(acc, ref timeout))
                {
                    if (timeout != null)
                        using (StreamWriter wtr = new StreamWriter(ListenerContext.Response.OutputStream))
                            wtr.WriteLine("<Error>Account in use. (" + timeout + " seconds until timeout.)</Error>");
                    else
                        using (StreamWriter wtr = new StreamWriter(ListenerContext.Response.OutputStream))
                            wtr.WriteLine("<Error>Account in use.</Error>");

                    ListenerContext.Response.Close();
                    return false;
                }
            }
            return true;
        }

        public void HandleASync()
        {
            if (ListenerContext == null) throw new InvalidOperationException("RequestHandler is not initialized.");
            Task.Factory.StartNew(HandleRequest).ContinueWith(task =>
            {
                WriteError(task.Exception?.InnerException.ToString());
            }, TaskContinuationOptions.OnlyOnFaulted).ContinueWith(task => ListenerContext.Response.Close());
        }

        protected abstract void HandleRequest();

        protected void Write(string value)
        {
            var buffer = Encoding.UTF8.GetBytes(value);
            ListenerContext.Response.OutputStream.Write(buffer, 0, buffer.Length);
        }

        protected void WriteError(string value)
        {
            var buffer = Encoding.UTF8.GetBytes($"<Error>{value}</Error>");
            ListenerContext.Response.OutputStream.Write(buffer, 0, buffer.Length);
        }
    }

    [AttributeUsage(AttributeTargets.Class, AllowMultiple = true)]
    public class HttpUrlRequestAttribute : Attribute
    {
        public UriTemplate Uri { get; }
        public bool RequiresAuth { get; }

        public HttpUrlRequestAttribute(string requestUrl, bool requiresAuth = false)
        {
            Uri = new UriTemplate(requestUrl);
            RequiresAuth = requiresAuth;
        }
    }
}