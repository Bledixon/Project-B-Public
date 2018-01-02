using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.@char
{
    [HttpUrlRequest("/char/delete")]
    internal class delete : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes("<Error>Internal Error</Error>");

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc = db.Verify(GUID, PASS);
                if (acc == null)
                    status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
                else
                {
                    using (var cmd = db.CreateQuery())
                    {
                        cmd.CommandText = @"DELETE FROM characters WHERE accId = @accId AND charId = @charId;";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        cmd.Parameters.AddWithValue("@charId", NameValueCollection["charId"]);
                        if (cmd.ExecuteNonQuery() > 0)
                            status = Encoding.UTF8.GetBytes("<Success />");
                    }
                }
            }
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}