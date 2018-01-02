using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.account
{
    [HttpUrlRequest("/account/purchaseCharSlot")]
    internal class purchaseCharSlot : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes("<Error>Internal Error</Error>");
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc = db.Verify(GUID, PASS);
                int charSlots = db.MaxCharSlotPrice(GUID);
                if (acc == null)
                {
                    status = Encoding.UTF8.GetBytes("<Error>Account credentials not valid</Error>");
                }
                else
                {
                    MySqlCommand cmd = db.CreateQuery();
                    cmd.CommandText = "SELECT fame FROM stats WHERE accId=@accId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    if ((int)cmd.ExecuteScalar() < charSlots)
                        status = Encoding.UTF8.GetBytes("<Error>Not enough fame</Error>");
                    else
                    {
                        cmd = db.CreateQuery();
                        cmd.CommandText = "UPDATE stats SET fame = fame - @price WHERE accId=@accId";
                        cmd.Parameters.AddWithValue("@price", charSlots);
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            cmd = db.CreateQuery();
                            cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + 1 WHERE id=@accId";
                            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                            if (cmd.ExecuteNonQuery() > 0)
                                status = Encoding.UTF8.GetBytes("<Success/>");
                        }
                    }
                }
            };
            ListenerContext.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}
