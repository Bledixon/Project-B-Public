using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;
using System.Xml.Serialization;
using db;

namespace server.account
{
    [HttpUrlRequest("/account/verify")]
    internal class verify : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc = db.Verify(GUID, PASS); 
                if (acc == null)
                {
                    byte[] status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
                    ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
                }
                else
                {
                    var serializer = new XmlSerializer(acc.GetType(),
                        new XmlRootAttribute(acc.GetType().Name) { Namespace = "" });

                    var xws = new XmlWriterSettings();
                    xws.OmitXmlDeclaration = true;
                    xws.Encoding = Encoding.UTF8;
                    XmlWriter xtw = XmlWriter.Create(ListenerContext.Response.OutputStream, xws);
                    serializer.Serialize(xtw, acc, acc.Namespaces);
                }
            }
        }
    }
}