using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;

namespace server.guild
{
    [HttpUrlRequest("/guild/getBoard")]
    internal class getBoard : RequestHandler
    {
        protected override void HandleRequest()
        {

            byte[] status = Encoding.UTF8.GetBytes("<Error>Internal Error</Error>");
            Account acc = null;
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                acc = db.Verify(GUID, PASS); 
                if (acc == null)
                    status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
                else
                    status = Encoding.UTF8.GetBytes(db.GetGuildBoard(acc));
            }
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}