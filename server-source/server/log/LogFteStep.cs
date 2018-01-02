using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace server.log
{
    [HttpUrlRequest("/log/logFteStep")]
    public class LogFteStep : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes("<Success/>"); //this just popped up while reconnecting so i'm debugging this.
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}
