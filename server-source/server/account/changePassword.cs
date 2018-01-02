using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.account
{
    [HttpUrlRequest("/account/changePassword")]
    internal class changePassword : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc = db.Verify(GUID, PASS);
                byte[] status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
                if (acc != null)
                {
                    using (var cmd = db.CreateQuery())
                    {
                        cmd.CommandText = "UPDATE accounts SET password=SHA1(@password) WHERE id=@accId;";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        cmd.Parameters.AddWithValue("@password", NameValueCollection["newPassword"]);
                        if (cmd.ExecuteNonQuery() > 0)
                            status = Encoding.UTF8.GetBytes("<Success />");
                        else
                            status = Encoding.UTF8.GetBytes("<Error>Internal error</Error>");
                    }
                }
                ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
            }
        }
    }
}