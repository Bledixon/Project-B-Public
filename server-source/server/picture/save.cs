using db;
using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;

namespace server.picture
{
    [HttpUrlRequest("/picture/save")]
    internal class save : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}