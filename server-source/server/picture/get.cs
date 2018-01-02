using db;
using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;

namespace server.picture
{
    [HttpUrlRequest("/picture/get")]
    internal class get : RequestHandler
    {
        private readonly byte[] buff = new byte[0x10000];

        protected override void HandleRequest()
        {
            //warning: maybe has hidden url injection
            string id = NameValueCollection["id"];
            string instance = NameValueCollection["instance"];

            byte[] status = Encoding.UTF8.GetBytes("<Error>Bad Request</Error>");

            if (instance != "local" || instance != "production" || instance != "testing")
                status = Encoding.UTF8.GetBytes("<Error>Invalid Instance.</Error>");
            else
            {
                foreach (char i in id)
                {
                    if (char.IsLetter(i) || i == '_' || i == '-') continue;

                    status = Encoding.UTF8.GetBytes("<Error>Invalid ID.</Error>");
                    ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
                    return;
                }
                string path = Path.GetFullPath("texture/_" + id + ".png");
                if (!File.Exists(path))
                {
                    status = Encoding.UTF8.GetBytes("<Error>Invalid ID.</Error>");
                    ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
                    return;
                }

                ListenerContext.Response.ContentType = "image/png";
                using (FileStream i = File.OpenRead(path))
                {
                    int c;
                    while ((c = i.Read(buff, 0, buff.Length)) > 0)
                        ListenerContext.Response.OutputStream.Write(buff, 0, c);
                }
            }
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}