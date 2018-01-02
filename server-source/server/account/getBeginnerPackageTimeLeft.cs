using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.account
{
    [HttpUrlRequest("/account/getBeginnerPackageTimeLeft")]
    internal class getBeginnerPackageTimeLeft : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc = db.Verify(GUID, PASS);
                byte[] status;
                if (acc == null)
                {
                    status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
                }
                else
                {
                    using (var cmd = db.CreateQuery())
                    {
                        cmd.CommandText = "SELECT beginnerPackageTimeLeft FROM accounts WHERE uuid=@uuid";
                        cmd.Parameters.AddWithValue("@uuid", GUID);
                        object result = cmd.ExecuteScalar();
                        status = Encoding.UTF8.GetBytes("<BeginnerPackageTimeLeft>" + result + "</BeginnerPackageTimeLeft>");
                    }
                }
                ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
            }
        }
    }
}