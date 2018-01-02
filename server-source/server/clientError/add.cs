using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;

namespace server.clientError
{
    [HttpUrlRequest("/clientError/add")]
    internal class add : RequestHandler
    {
        protected override void HandleRequest()
        {
            string username = NameValueCollection["guid"];
            string error = NameValueCollection["text"];

            string errors = @"errors";
            if (!Directory.Exists(errors))
            {
                Directory.CreateDirectory(errors);
            }
            using (var writer = new StreamWriter(errors + @"\clientError", true))
            {
                writer.WriteLine(username + " Sent Error : \n\r" + error);
            }

            byte[] status = Encoding.UTF8.GetBytes("<Success/>");
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}