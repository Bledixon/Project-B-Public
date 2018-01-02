using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.account
{
    [HttpUrlRequest("/account/sendVerifyEmail")]
    internal class sendVerifyEmail : RequestHandler
    {
        private static string GetMd5Hash(MD5 md5Hash, string input)
        {
            // Convert the input string to a byte array and compute the hash. 
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes 
            // and create a string.
            var sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data  
            // and format each one as a hexadecimal string. 
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string. 
            return sBuilder.ToString();
        }

        protected override void HandleRequest()
        {
            MD5 md5Hash = MD5.Create();

            string url = Program.Settings.GetValue("webUrl");

            string accessKey = "name:" + GUID + "pass:" + PASS;
            string hash = GetMd5Hash(md5Hash, accessKey);

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                db.InsertEmail(GUID, PASS, hash);

                using (var cmd = db.CreateQuery())
                {
                    cmd.CommandText = "SELECT id, uuid, name, email FROM accounts WHERE uuid=@uuid";
                    cmd.Parameters.AddWithValue("@uuid", GUID);
                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (!rdr.HasRows)
                            rdr.Close();
                        rdr.Read();

                        string to = rdr.GetString("email").ToLower();
                        string from = "noreply@zerorealms.com";
                        var message = new MailMessage(from, to);
                        message.Subject = "Email Verification for : " + rdr.GetString("uuid");
                        #region emailBody
                        string htmlBody =
                            @"
<html>
<body style='font-family: 'Segoe UI','Helvetica Neue',Helvetica,Arial,sans-serif;font-size: 13px;line-height: 20px;color: #333;margin:0;padding:0;'>
    <table cellspacing='0' cellpadding='0' border='0' width='100%'>
        <tr style='background: #3f3f3f'>
            <td class='navbar navbar-inverse' align='center'>
                <table width='650px' cellspacing='0' cellpadding='3' class='container' style='width:auto;margin:0;padding:0;'>
                    <tr class='navbar navbar-inverse'>
                        <td><a style='margin:0px -3px;text-decoration:none;display: block;padding: 20px;font-size: 20px;font-weight: 200;color: rgb(241,241,241);text-shadow: 0px -1px 1px rgba(0, 0, 0, 0.55);' href='http://forum.kithio.com'>Forums</a></li></ul></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style='background: #d6d6d6;'>
            <td align='center'>
                <table width='650px' cellspacing='0' cellpadding='3' class='container' style='width:960px;margin-top:15px;'>
                    <tr>
                        <th colspan='2'><h1 style='margin: 10px 0px;font-family: inherit;font-weight: bold;line-height: 40px;font-size: 36px;color: inherit;text-rendering: optimizelegibility;margin-bottom: 35px;'>Email Verification</h1></th>
                    </tr>
                    <tr style='height:40px;'>
                        <td align='right' style='width:42%;'><p style='font-weight:600;color:#474747;'>Account Name : </p></td><td style='width:58%;'><b>" +
                            rdr.GetString("uuid") + @"</b></td>
                    </tr>
                    <tr style='height:40px;'>
                        <td align='right' style='width:42%;'><p style='font-weight:600;color:#474747;'>Character Name : </p></td><td style='width:58%;'><b>" +
                            rdr.GetString("name") + @"</b></td>
                    </tr>
                    <tr style='height:40px;'>
                        <td align='right' style='width:42%;'><p style='font-weight:600;color:#474747;'>Email Address : </p></td><td style='width:58%;'><b style='color:#0063CA;text-decoration:none;'>" +
                            rdr.GetString("email") + @"</b></td>
                    </tr>
                    <tr>
                        <td colspan='2' align='center'>
							<hr style='margin: 10px 0px;margin-top:35px;border-right: 0px none;border-left: 0px none;-moz-border-top-colors: none;-moz-border-right-colors: none;-moz-border-bottom-colors: none;-moz-border-left-colors: none;border-image: none;border-width: 1px 0px;border-style: solid none;border-color: #EEE -moz-use-text-color #FFF;'>
							<p style='line-height: 20px;color: #333;font-size: 13px;'>
								<a style='color: #0063CA;text-decoration: none;' href='http://" + url + @"/verify.php?email=" +
                            rdr.GetString("email").Replace("@", "%40") + @"&key=" + hash + @"'>
									<b><h3 style='font-size: 24px;line-height: 40px;margin-top: 30px;margin-bottom:20px;'>Click Here to Verify your Email Address</h3></b>
								</a>
							</p>
						</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style='background: #d6d6d6;'>
            <td align='center'>
                <table width='650px' cellspacing='0' cellpadding='3' class='container' style='width:960px;'>
                    <tr>
                        <td align='center' style='font-size:12pt;'>
                            <hr style='border-right: 0px none;border-left: 0px none;-moz-border-top-colors: none;-moz-border-right-colors: none;-moz-border-bottom-colors: none;-moz-border-left-colors: none;border-image: none;border-width: 1px 0px;border-style: solid none;border-color: #EEE -moz-use-text-color #FFF;'>
                            <p style='height:80px;margin-bottom:35px;'><b>Copyright &copy; 2014 | <a style='color: #0063CA;text-decoration:none;' href='http://forum.kithio.com'>Kithio</a></b></p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
";
                        #endregion emailBody
                        message.Body = htmlBody;
                        message.IsBodyHtml = true;
                        var client = new SmtpClient();
                        // Credentials are necessary if the server requires the client  
                        // to authenticate before it will send e-mail on the client's behalf.
                        client.Port = 587;
                        client.Host = "smtp.mandrillapp.com";
                        client.Credentials = new NetworkCredential("LuciTheForgotten@gmail.com", "xI7YXXrmtLC5BdwIEzsG0w");
                        rdr.Close();

                        try
                        {
                            client.Send(message);
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e);
                        }
                    }
                }
            }
        }
    }
}