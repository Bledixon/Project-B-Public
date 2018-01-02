using db;
using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;

namespace server.picture
{
    [HttpUrlRequest("/picture/delete")]
    internal class delete : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}