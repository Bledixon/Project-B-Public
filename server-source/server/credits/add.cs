using System.Collections.Specialized;
using System.Net;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.credits
{
    [HttpUrlRequest("/credits/add")]
    internal class add : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] res = Encoding.UTF8.GetBytes(
                @"<html>
    <head>
        <title>Ya...</title>
    </head>
    <body style='background: #333333'>
        <h1 style='color: #EEEEEE; text-align: center'>
            " + "Feature has been disabled" + @"
        </h1>
    </body>
</html>");
            ListenerContext.Response.OutputStream.Write(res, 0, res.Length);
        }
    }
}