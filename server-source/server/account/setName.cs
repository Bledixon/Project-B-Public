using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.account
{
    [HttpUrlRequest("/account/setName")]
    internal class setName : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes("<Error>Internal error</Error>");

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc = db.Verify(GUID, PASS);
                if (acc == null)
                {
                    status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
                }
                else
                {

                    MySqlCommand cmd = db.CreateQuery();
                    cmd.CommandText = "SELECT COUNT(name) FROM accounts WHERE name=@name;";
                    cmd.Parameters.AddWithValue("@name", NameValueCollection["name"]);
                    if ((int)(long)cmd.ExecuteScalar() > 0)
                        status = Encoding.UTF8.GetBytes("<Error>Duplicate username</Error>");
                    else if (NameValueCollection["name"].Length < 3)
                    {
                        status = Encoding.UTF8.GetBytes("<Error>Name too short, minimum 3 letters</Error>");
                    }
                    else
                    {
                        cmd = db.CreateQuery();
                        cmd.CommandText = "UPDATE accounts SET name=@name, namechosen=TRUE WHERE id=@accId;";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        cmd.Parameters.AddWithValue("@name", NameValueCollection["name"]);
                        if (cmd.ExecuteNonQuery() > 0)
                            status = Encoding.UTF8.GetBytes("<Success />");
                    }
                    
                }
            }
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}