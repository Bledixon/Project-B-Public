using db;
using System.Net;
using System.Text;

namespace server
{
    [HttpUrlRequest("/crossdomain.xml")]
    internal class crossdomain : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes((customDomains.enabled) ? @"<cross-domain-policy>
<allow-access-from domain=""*.yoursite.com""/>
</cross-domain-policy>" : @"<cross-domain-policy>
<allow-access-from domain=""*""/>
</cross-domain-policy>");
            ListenerContext.Response.ContentType = "text/*";
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}