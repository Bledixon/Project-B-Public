using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Xml;
using System.Xml.Serialization;
using db;
using MySql.Data.MySqlClient;

namespace server.@char
{
    [HttpUrlRequest("/char/list")]
    internal class list : RequestHandler
    {
        private Lazy<List<ServerItem>> svrList;

        public list()
        {
            svrList = new Lazy<List<ServerItem>>(GetServerList, true);
        }

        private List<ClassAvailabilityItem> GetClassAvailability(Account acc)
        {
            var classes = new string[17]
            {
                "Rogue",
                "Assassin",
                "Huntress",
                "Mystic",
                "Trickster",
                "Sorcerer",
                "Ninja",
                "_Grim Reaper",
                "King Skeleton",
                "Headless Horseman",
                "Archer",
                "Wizard",
                "Priest",
                "Necromancer",
                "Warrior",
                "Knight",
                "Paladin"
            };

            if (acc == null)
            {
                return new List<ClassAvailabilityItem>
                {
                    new ClassAvailabilityItem {Class = "Rogue", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Assassin", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Huntress", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Mystic", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Trickster", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Sorcerer", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Ninja", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "_Grim Reaper", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "King Skeleton", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Headless Horseman", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Archer", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Wizard", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Priest", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Necromancer", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Warrior", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Knight", Restricted = "unrestricted"},
                    new ClassAvailabilityItem {Class = "Paladin", Restricted = "unrestricted"},
                };
            }

            var ret = new List<ClassAvailabilityItem>();

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                MySqlCommand cmd = db.CreateQuery();
                cmd.CommandText = "SELECT class, available FROM unlockedclasses WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                    {
                        rdr.Close();
                        foreach (string s in classes)
                        {
                            using (var xcmd = db.CreateQuery())
                            {
                                xcmd.CommandText =
                                    "INSERT INTO unlockedclasses(accId, class, available) VALUES(@accId, @class, @restricted);";
                                xcmd.Parameters.AddWithValue("@accId", acc.AccountId);
                                xcmd.Parameters.AddWithValue("@class", s);
                                xcmd.Parameters.AddWithValue("@restricted", s == "Wizard" ? "unrestricted" : "restricted");
                                xcmd.ExecuteNonQuery();
                            }
                            ret.Add(new ClassAvailabilityItem
                            {
                                Class = s,
                                Restricted = s == "Wizard" ? "unrestricted" : "restricted"
                            });
                        }
                    }
                    else
                    {
                        while (rdr.Read())
                        {
                            ret.Add(new ClassAvailabilityItem
                            {
                                Class = rdr.GetString("class"),
                                Restricted = rdr.GetString("available")
                            });
                        }
                    }
                }
            }
            return ret;
        }


        public static bool Connected(string host, int port)
        {
            return true;
            /*
            if (host == "127.0.0.1") { return true; }
            return true;

            IPAddress[] IPs = Dns.GetHostAddresses(host);

            using (var tcp = new TcpClient())
            {
                tcp.NoDelay = true;

                try
                {
                    tcp.Connect(new IPEndPoint(IPs[0], port));
                }
                catch { }

                if (tcp.Connected)
                    return true;
                return false;
            }
            */
        }

        public static double CheckUsage(string host, int port)
        {
            return 0;
            /*
            if (host == "127.0.0.1") { return 0; }
            return 0;

            IPAddress[] IPs = Dns.GetHostAddresses(host);
            using (var tcp = new TcpClient())
            {
                tcp.NoDelay = true;

                try
                {
                    tcp.Connect(new IPEndPoint(IPs[0], port));
                }
                catch { }

                if (tcp.Connected)
                    return (tcp.ReceiveTimeout / 10000);
                return 1;
            }
            */
        }

        private List<ServerItem> GetServerList()
        {
            var ret = new List<ServerItem>();
            var num = Program.Settings.GetValue<int>("svrNum");
            for (int i = 0; i < num; i++)
            {
                if (Connected(Program.Settings.GetValue("svr" + i + "Adr"), 2050))
                {
                    ret.Add(new ServerItem
                    {
                        Name = Program.Settings.GetValue("svr" + i + "Name"),
                        Lat = 52.23,
                        Long = 4.55,
                        DNS = Program.Settings.GetValue("svr" + i + "Adr", "127.0.0.1"),
                        Usage = CheckUsage(Program.Settings.GetValue("svr" + i + "Adr"), 2050),
                        AdminOnly = Program.Settings.GetValue<bool>("svr" + i + "Admin", "false")
                    });
                }
            }
            return ret;
        }

        private List<ServerItem> GetServerList(bool isAdmin)
        {
            var ret = new List<ServerItem>();
            var num = Program.Settings.GetValue<int>("svrNum");
            for (int i = 0; i < num; i++)
            {
                if (Connected(Program.Settings.GetValue("svr" + i + "Adr"), 2050))
                {
                    if (isAdmin)
                    {
                        ret.Add(new ServerItem
                        {
                            Name = Program.Settings.GetValue("svr" + i + "Name"),
                            Lat = 52.23,
                            Long = 4.55,
                            DNS = Program.Settings.GetValue("svr" + i + "Adr", "127.0.0.1"),
                            Usage = CheckUsage(Program.Settings.GetValue("svr" + i + "Adr"), 2050),
                            AdminOnly = Program.Settings.GetValue<bool>("svr" + i + "Admin", "true")
                        });
                    }
                    if (!isAdmin && (Program.Settings.GetValue<bool>("svr" + i + "Admin") == false))
                    {
                        ret.Add(new ServerItem
                        {
                            Name = Program.Settings.GetValue("svr" + i + "Name"),
                            Lat = 52.23,
                            Long = 4.55,
                            DNS = Program.Settings.GetValue("svr" + i + "Adr", "127.0.0.1"),
                            Usage = CheckUsage(Program.Settings.GetValue("svr" + i + "Adr"), 2050),
                            AdminOnly = Program.Settings.GetValue<bool>("svr" + i + "Admin", "false")
                        });
                    }
                }
            }
            return ret;
        }

        private List<ServerItem> NoServerList()
        {
            return new List<ServerItem>();
        }

        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                bool isGuest = db.Verify(GUID, PASS) == null ? true : false;
                Account acc = db.Verify(GUID, PASS);

                var chrs = new Chars
                {
                    Characters = new List<Char>(),
                    NextCharId = 2,
                    MaxNumChars = 1,
                    Account = db.Verify(GUID, PASS),
                    Servers = isGuest ? NoServerList() : GetServerList(acc.Admin)
                };

                if (chrs.Account != null)
                {
                    if (!CheckAccount(acc, db)) return;
                    db.LockAccount(acc);
                    db.GetCharData(chrs.Account, chrs);
                    db.LoadCharacters(chrs.Account, chrs);
                    chrs.News = db.GetNews(Program.GameData, chrs.Account);
                    db.UnlockAccount(chrs.Account);
                }
                else
                {
                    chrs.Account = Database.CreateGuestAccount(GUID);
                    chrs.News = db.GetNews(Program.GameData, null);
                }

                chrs.ClassAvailabilityList = GetClassAvailability(chrs.Account);

                var ms = new MemoryStream();
                var serializer = new XmlSerializer(chrs.GetType(),
                    new XmlRootAttribute(chrs.GetType().Name) { Namespace = "" });

                    var xws = new XmlWriterSettings();
                    xws.OmitXmlDeclaration = true;
                    xws.Encoding = Encoding.UTF8;
                    XmlWriter xtw = XmlWriter.Create(ListenerContext.Response.OutputStream, xws);
                    serializer.Serialize(xtw, chrs, chrs.Namespaces);
            }
        }
    }
}