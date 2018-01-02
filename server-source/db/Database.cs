using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using log4net;
using MySql.Data.MySqlClient;
using Ionic.Zlib;
using System.Data;
using System.Threading.Tasks;

namespace db
{
    public partial class Database : IDisposable
    {
        private static ILog log = LogManager.GetLogger(typeof(Database));
        public bool disposed = false;

        private static readonly string[] names =
        {
            "Darq", "Deyst", "Drac", "Drol",
            "Eango", "Eashy", "Eati", "Eendi", "Ehoni",
            "Gharr", "Iatho", "Iawa", "Idrae", "Iri", "Issz", "Itani",
            "Laen", "Lauk", "Lorz",
            "Oalei", "Odaru", "Oeti", "Orothi", "Oshyu",
            "Queq", "Radph", "Rayr", "Ril", "Rilr", "Risrr",
            "Saylt", "Scheev", "Sek", "Serl", "Seus",
            "Tal", "Tiar", "Uoro", "Urake", "Utanu",
            "Vorck", "Vorv", "Yangu", "Yimi", "Zhiar"
        };

        public readonly MySqlConnection con;

        public Database(string connStr)
        {
            con = new MySqlConnection(connStr);
            con.Open();
            CheckConnection(); // would this be a good idea?
            con.StateChange += Con_StateChange;
        }

        public void CheckConnection()
        {
            if (!con.Ping())
                con.Open();
        }

        private void Con_StateChange(object sender, StateChangeEventArgs e)
        {
            if (e.CurrentState == ConnectionState.Closed || e.CurrentState == ConnectionState.Broken)
                con.Open();
        }

        public void Dispose()
        {
            con.StateChange -= Con_StateChange;
            CheckConnection();
            con.Close();
            con.Dispose();
            disposed = true;
        }

        public string UppercaseFirst(string s)
        {
            if (string.IsNullOrEmpty(s))
            {
                return string.Empty;
            }
            return char.ToUpper(s[0]) + s.Substring(1);
        }

        public MySqlCommand CreateQuery()
        {
            return con.CreateCommand();
        }

        public static int DateTimeToUnixTimestamp(DateTime dateTime)
        {
            return (int)(dateTime - new DateTime(1970, 1, 1).ToLocalTime()).TotalSeconds;
        }

        public string GetAcc(string uuid, string password)
        {
            string ret;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT email WHERE uuid=@uuid AND password=@pass LIMIT 1";
                cmd.Parameters.AddWithValue("@uuid", uuid);
                cmd.Parameters.AddWithValue("@pass", password);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        ret = "";
                    else
                    {
                        rdr.Read();
                        ret = rdr.GetString("email");
                    }
                }
            }
            return ret;
        }

        public void InsertEmail(string uuid, string password, string hash)
        {
            if (string.IsNullOrEmpty(uuid) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(hash)) return;

            using (var cmd = CreateQuery())
            {
                cmd.CommandText = @"INSERT INTO emails(accId, name, email, accessKey)
VALUES(@accId, @name, @email, @accessKey) 
ON DUPLICATE KEY UPDATE 
accessKey = @accessKey;";
                cmd.Parameters.AddWithValue("@accId", GetAccInfo(uuid, 1));
                cmd.Parameters.AddWithValue("@name", uuid);
                cmd.Parameters.AddWithValue("@email", GetAccInfo(uuid, 3));
                cmd.Parameters.AddWithValue("@accessKey", hash);

                cmd.ExecuteNonQuery();
            }
            return;
        }

        public string GetAccInfo(string guid, int type)
        {
            string info = "";
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT id, name, email FROM accounts WHERE uuid=@uuid LIMIT 1";
                cmd.Parameters.AddWithValue("@uuid", guid);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        info = "";
                    else
                    {
                        rdr.Read();
                        if (type == 1)
                            info = rdr.GetInt32("id").ToString();
                        if (type == 2)
                            info = rdr.GetString("name");
                        if (type == 3)
                            info = rdr.GetString("email");
                    }
                }
            }
            return info;
        }

        public bool IsUserInLegends(int AccountId) //jade: this query drains a mega ton of power as the deaths table fills up, so i'll rework it later
        {
            bool ret = false;
            using (var cmd = CreateQuery()) //WEEK
            {
                cmd.CommandText = "SELECT * FROM death WHERE (time >= DATE_SUB(NOW(), INTERVAL 1 WEEK)) ORDER BY totalFame DESC LIMIT 10;";
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                    while (rdr.Read())
                        if (rdr.GetInt32("accId") == AccountId) ret = true;
            }
            
            if (!ret) //MONTH
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "SELECT * FROM death WHERE (time >= DATE_SUB(NOW(), INTERVAL 1 MONTH)) ORDER BY totalFame DESC LIMIT 10;";
                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                        while (rdr.Read())
                            if (rdr.GetInt32("accId") == AccountId) ret = true;
                }
            
            if (!ret) //ALLTIME
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "SELECT * FROM death WHERE TRUE ORDER BY totalFame DESC LIMIT 10;";
                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                        while (rdr.Read())
                            if (rdr.GetInt32("accId") == AccountId) ret = true;
                }
            return ret;
        }

        public string GetUserEmail(string name)
        {
            string info = "";
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT email FROM accounts WHERE name=@name LIMIT 1";
                cmd.Parameters.AddWithValue("@name", name);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        info = "";
                    else
                    {
                        rdr.Read();
                        info = rdr.GetString("email");
                    }
                }
            }
            return info;
        }

        public List<NewsItem> GetNews(XmlData dat, Account acc)
        {
            List<NewsItem> ret = new List<NewsItem>();
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT icon, title, text, link, date FROM news ORDER BY date LIMIT 7;";
            using (MySqlDataReader rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                    ret.Add(new NewsItem
                    {
                        Icon = rdr.GetString("icon"),
                        Title = rdr.GetString("title"),
                        TagLine = rdr.GetString("text"),
                        Link = rdr.GetString("link"),
                        Date = DateTimeToUnixTimestamp(rdr.GetDateTime("date")),
                    });
            }
            if (acc != null)
            {
                cmd = CreateQuery();
                cmd.CommandText = @"SELECT charId, characters.charType, level, death.totalFame, time
FROM characters, death
WHERE dead = TRUE AND
characters.accId=@accId AND death.accId=@accId
AND characters.charId=death.chrId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                        ret.Add(new NewsItem
                        {
                            Icon = "fame",
                            Title = string.Format("Your {0} died at level {1}",
                                dat.ObjectTypeToId[(ushort)rdr.GetInt32("charType")],
                                rdr.GetInt32("level")),
                            TagLine = string.Format("You earned {0} glorious Fame",
                                rdr.GetInt32("totalFame")),
                            Link = "fame:" + rdr.GetInt32("charId"),
                            Date = DateTimeToUnixTimestamp(rdr.GetDateTime("time")),
                        });
                }
            }
            ret.Sort((a, b) => -Comparer<int>.Default.Compare(a.Date, b.Date));
            return ret.Take(20).ToList();
        }

        public static Account CreateGuestAccount(string uuid)
        {
            return new Account
            {
                Name = names[(uint)uuid.GetHashCode() % names.Length],
                AccountId = 0,
                Admin = false,
                BeginnerPackageTimeLeft = 604800,
                Converted = false,
                Credits = 0,
                Keys = 0,
                Guild = new Guild
                {
                    Name = "",
                    Id = 0,
                    Rank = 0
                },
                NameChosen = false,
                NextCharSlotPrice = 100,
                VerifiedEmail = false,
                Stats = new Stats
                {
                    BestCharFame = 0,
                    ClassStates = new List<ClassStats>(),
                    Fame = 0,
                    TotalFame = 0
                },
                Vault = new VaultData
                {
                    Chests = new List<VaultChest>()
                }
            };
        }

        public Account Verify(string uuid, string password)
        {
            if (password == null || password == string.Empty || uuid == null || uuid == string.Empty || uuid.Length > 15) return null;

            Account ret = null;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText =
                    "SELECT id, name, rank, tag, namechosen, verified, guild, guildRank, guildFame, maxCharSlot, locked, ignored, guest, banned, muted, beginnerPackageTimeLeft FROM accounts WHERE uuid=@uuid AND password=SHA1(@password);";
                cmd.Parameters.AddWithValue("@uuid", uuid);
                cmd.Parameters.AddWithValue("@password", password);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        ret = null;
                    else
                    {
                        rdr.Read();
                        ret = new Account
                        {
                            Name = rdr.GetString("name"),
                            AccountId = rdr.GetInt32("id"),
                            Admin = rdr.GetInt32("rank") >= 6,
                            Rank = rdr.GetInt32("rank"),
                            Tag = rdr.GetString("tag"),
                            Muted = rdr.GetBoolean("muted"),
                            BeginnerPackageTimeLeft = rdr.GetInt32("beginnerPackageTimeLeft"),
                            Converted = false,
                            Guild = new Guild
                            {
                                Id = rdr.GetInt32("guild"),
                                Rank = rdr.GetInt32("guildRank")
                            },
                            NameChosen = rdr.GetBoolean("namechosen"),
                            NextCharSlotPrice = (rdr.GetInt32("maxCharSlot") < 10) ? rdr.GetInt32("maxCharSlot") * 100 : 1000,
                            VerifiedEmail = rdr.GetBoolean("verified"),
                            _StarredAccounts = rdr.GetString("locked"),
                            _IgnoredAccounts = rdr.GetString("ignored"),
                            isGuest = rdr.GetBoolean("guest"),
                            isBanned = rdr.GetBoolean("banned")
                        };
                    }
                }
                if (ret != null)
                {
                    ReadStats(ret);
                    ret.Guild.Name = GetGuildName(ret.Guild.Id);
                }
                else log.InfoFormat("Client tried to log in as \"{0}\", but had invalid credentials or the account does not exist.", uuid);
            }
            return ret;
        }

        public Account Register(string uuid, string password, string email, bool isGuest)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT COUNT(id) FROM accounts WHERE uuid=@uuid;";
            cmd.Parameters.AddWithValue("@uuid", uuid);
            if ((int)(long)cmd.ExecuteScalar() > 0)
            {
                cmd.Dispose();
                return null;
            }

            cmd = CreateQuery();
            cmd.CommandText =
            "INSERT INTO accounts(uuid, password, name, email, guest, maxCharSlot, regTime) VALUES(@uuid, SHA1(@password), @name, @email, @guest, 1, now());";
            cmd.Parameters.AddWithValue("@uuid", uuid);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@name", names[(uint)uuid.GetHashCode() % names.Length]);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@guest", isGuest);
            int v = cmd.ExecuteNonQuery();
            bool ret = v > 0;

            if (ret)
            {
                cmd = CreateQuery();
                cmd.CommandText = "SELECT last_insert_id();";
                int accId = Convert.ToInt32(cmd.ExecuteScalar());

                cmd = CreateQuery();
                cmd.CommandText =
                    "INSERT INTO stats(accId, fame, totalFame, credits, totalCredits, souls, totalSouls) VALUES(@accId, 0, 0, 49, 49, 0, 0);";
                cmd.Parameters.AddWithValue("@accId", accId);
                cmd.ExecuteNonQuery();

                cmd = CreateQuery();
                cmd.CommandText =
                    "INSERT INTO vaults(accId, items, itemDatas) VALUES(@accId, '65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535', @datas);";
                cmd.Parameters.AddWithValue("@datas", ItemDataList.GetJson(new ItemData[8]));
                cmd.ExecuteNonQuery();
            }
            cmd.Dispose();
            
            return Verify(uuid, password);
        }

        public bool HasUuid(string uuid)
        {
            bool ret = false;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT COUNT(id) FROM accounts WHERE uuid=@uuid;";
                cmd.Parameters.AddWithValue("@uuid", uuid);
                ret = (int)(long)cmd.ExecuteScalar() > 0;
            }
            return ret;
        }

        public Account GetAccountByName(string name, XmlData data)
        {
            MySqlCommand cmd = CreateQuery();
            cmd.CommandText =
                "SELECT * FROM accounts WHERE name=@name;";
            cmd.Parameters.AddWithValue("@name", name);
            string accId = String.Empty;
            using (MySqlDataReader rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) return null;
                rdr.Read();
                accId = rdr.GetString("id");
            }
            return GetAccount(accId);
        }

        public bool HasEmail(string email)
        {
            bool ret = false;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT COUNT(id) FROM accounts WHERE email=@email;";
                cmd.Parameters.AddWithValue("@email", email);
                ret = (int)(long)cmd.ExecuteScalar() > 0;
            }
            return ret;
        }

        public Account GetAccount(int id)
        {
            Account ret = null;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText =
                    "SELECT id, name, rank, tag, namechosen, verified, guild, guildRank, maxCharSlot, guest, banned, locked, ignored, muted, beginnerPackageTimeLeft FROM accounts WHERE id=@id;";
                cmd.Parameters.AddWithValue("@id", id);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        ret = null;
                    else
                    {
                        rdr.Read();
                        ret = new Account
                        {
                            Name = rdr.GetString(UppercaseFirst("name")),
                            AccountId = rdr.GetInt32("id"),
                            Admin = rdr.GetInt32("rank") >= 2,
                            Rank = rdr.GetInt32("rank"),
                            Tag = rdr.GetString("tag"),
                            Muted = rdr.GetBoolean("muted"),
                            BeginnerPackageTimeLeft = rdr.GetInt32("beginnerPackageTimeLeft"),
                            Converted = false,
                            Guild = new Guild
                            {
                                Id = rdr.GetInt32("guild"),
                                Rank = rdr.GetInt32("guildRank")
                            },
                            NameChosen = rdr.GetBoolean("namechosen"),
                            NextCharSlotPrice = (rdr.GetInt32("maxCharSlot") < 10) ? rdr.GetInt32("maxCharSlot") * 100 : 1000,
                            VerifiedEmail = rdr.GetBoolean("verified"),
                            _StarredAccounts = rdr.GetString("locked"),
                            _IgnoredAccounts = rdr.GetString("ignored"),
                            isGuest = rdr.GetBoolean("guest"),
                            isBanned = rdr.GetBoolean("banned")
                        };
                    }
                }
                ReadStats(ret);
                ret.Guild.Name = GetGuildName(ret.Guild.Id);
            }
            return ret;
        }

        public Account GetAccount(string name)
        {
            Account ret = null;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText =
                    "SELECT id, name, rank, tag, namechosen, verified, guild, guildRank, maxCharSlot, guest, banned, locked, ignored, muted, beginnerPackageTimeLeft FROM accounts WHERE name=@name;";
                cmd.Parameters.AddWithValue("@name", name);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        ret = null;
                    else
                    {
                        rdr.Read();
                        ret = new Account
                        {
                            Name = rdr.GetString(UppercaseFirst("name")),
                            AccountId = rdr.GetInt32("id"),
                            Admin = rdr.GetInt32("rank") >= 2,
                            Rank = rdr.GetInt32("rank"),
                            Tag = rdr.GetString("tag"),
                            Muted = rdr.GetBoolean("muted"),
                            BeginnerPackageTimeLeft = rdr.GetInt32("beginnerPackageTimeLeft"),
                            Converted = false,
                            Guild = new Guild
                            {
                                Id = rdr.GetInt32("guild"),
                                Rank = rdr.GetInt32("guildRank")
                            },
                            NameChosen = rdr.GetBoolean("namechosen"),
                            NextCharSlotPrice = (rdr.GetInt32("maxCharSlot") < 10) ? rdr.GetInt32("maxCharSlot") * 100 : 1000,
                            VerifiedEmail = rdr.GetBoolean("verified"),
                            _StarredAccounts = rdr.GetString("locked"),
                            _IgnoredAccounts = rdr.GetString("ignored"),
                            isGuest = rdr.GetBoolean("guest"),
                            isBanned = rdr.GetBoolean("banned")
                        };
                    }
                }
                ReadStats(ret);
                ret.Guild.Name = GetGuildName(ret.Guild.Id);
            }
            return ret;
        }

        public int MaxCharSlotPrice(string uuid)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT maxCharSlot FROM accounts WHERE uuid=@uuid";
                cmd.Parameters.AddWithValue("@uuid", uuid);
                var result = (int)cmd.ExecuteScalar();
                if (result < 10)
                    return result * 100;
                return 1000;
            }
        }

        public int UpdateCredit(Account acc, int amount)
        {
            int ret = 0;
            if (amount > 0)
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "UPDATE stats SET totalCredits = totalCredits + @amount WHERE accId=@accId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.ExecuteNonQuery();
                }
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = @"UPDATE stats SET credits = credits + (@amount) WHERE accId=@accId;
SELECT credits FROM stats WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@amount", amount);
                ret = (int)cmd.ExecuteScalar();
            }
            return ret;
        }

        public int UpdateFame(Account acc, int amount)
        {
            int ret = 0;
            if (amount > 0)
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "UPDATE stats SET totalFame = totalFame + @amount WHERE accId=@accId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.ExecuteNonQuery();
                }
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = @"UPDATE stats SET fame = fame + (@amount) WHERE accId=@accId;
SELECT fame FROM stats WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@amount", amount);
                ret = (int)cmd.ExecuteScalar();
            }
            return ret;
        }

        public int UpdateKeys(Account acc, int amount)
        {
            int ret = 0;
            if (amount > 0)
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "UPDATE stats SET totalSouls = totalSouls + @amount WHERE accId=@accId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.ExecuteNonQuery();
                }
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = @"UPDATE stats SET souls = souls + (@amount) WHERE accId=@accId;
SELECT souls FROM stats WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@amount", amount);
                ret = (int)cmd.ExecuteScalar();
            }
            return ret;
        }

        public int UpdateRank(Account acc, int amount)
        {
            int ret = 0;
            if (amount > 0)
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "UPDATE accounts SET rank = @amount WHERE name=@name;";
                    cmd.Parameters.AddWithValue("@name", acc.Name);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.ExecuteNonQuery();
                }
            return ret;
        }

        public int UpdateTag(Account acc, string tag)
        {
            int ret = 0;
            if (tag != "")
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "UPDATE accounts SET tag = @tag WHERE name=@name;";
                    cmd.Parameters.AddWithValue("@name", acc.Name);
                    cmd.Parameters.AddWithValue("@tag", tag);
                    cmd.ExecuteNonQuery();
                }
            return ret;
        }

        public int UpdateCharSlots(Account acc, int amount)
        {
            int ret = 0;
            if (amount > 0)
                using (var cmd = CreateQuery())
                {
                    cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + @amount WHERE name=@name;";
                    cmd.Parameters.AddWithValue("@name", acc.Name);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.ExecuteNonQuery();
                }
            return ret;
        }

        public void ReadStats(Account acc)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT fame, totalFame, credits, souls FROM stats WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        rdr.Read();
                        acc.Credits = rdr.GetInt32("credits");
                        acc.Stats = new Stats
                        {
                            Fame = rdr.GetInt32("fame"),
                            TotalFame = rdr.GetInt32("totalFame")
                        };
                        acc.Keys = rdr.GetInt32("souls");
                    }
                    else
                    {
                        acc.Credits = 0;
                        acc.Stats = new Stats
                        {
                            Fame = 0,
                            TotalFame = 0,
                            BestCharFame = 0,
                            ClassStates = new List<ClassStats>()
                        };
                        acc.Keys = 0;
                    }
                }
                acc.Stats.ClassStates = ReadClassStates(acc);
                if (acc.Stats.ClassStates.Count > 0)
                    acc.Stats.BestCharFame = acc.Stats.ClassStates.Max(_ => _.BestFame);
                acc.Vault = ReadVault(acc);
            }
            return;
        }

        public List<ClassStats> ReadClassStates(Account acc)
        {
            var ret = new List<ClassStats>();
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT objType, bestLv, bestFame FROM classstats WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                        ret.Add(new ClassStats
                        {
                            ObjectType = rdr.GetInt32("objType"),
                            BestFame = rdr.GetInt32("bestFame"),
                            BestLevel = rdr.GetInt32("bestLv")
                        });
                }
            }
            return ret;
        }

        public VaultData ReadVault(Account acc)
        {
            var ret = new VaultData { Chests = new List<VaultChest>() };
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT chestId, items, itemDatas FROM vaults WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.HasRows)
                        while (rdr.Read())
                            ret.Chests.Add(new VaultChest
                            {
                                ChestId = rdr.GetInt32("chestId"),
                                _Items = rdr.GetString("items"),
                                _Datas = rdr.GetString("itemDatas")
                            });
                }
            }
            return ret;
        }

        public void SaveChest(Account acc, VaultChest chest)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "UPDATE vaults SET items=@items, itemDatas=@itemDatas WHERE accId=@accId AND chestId=@chestId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@chestId", chest.ChestId);
                cmd.Parameters.AddWithValue("@items", chest._Items);
                cmd.Parameters.AddWithValue("@itemDatas", chest._Datas);
                cmd.ExecuteNonQuery();
            }
            return;
        }

        public VaultChest CreateChest(Account acc)
        {
            var id = 0;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText =
                       @"INSERT INTO vaults(accId, items, itemDatas) VALUES(@accId, '65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535', @itemDatas);
SELECT MAX(chestId) FROM vaults WHERE accId = @accId;UPDATE accounts SET vaultCount=vaultCount+1 WHERE id=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@itemDatas", ItemDataList.GetJson(new ItemData[12]));
                id = (int)cmd.ExecuteScalar();
            }
            return new VaultChest
            {
                ChestId = id,
                _Items = "65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535",
                _Datas = ItemDataList.GetJson(new ItemData[8])
            };
        }

        public void GetCharData(Account acc, Chars chrs)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT IFNULL(MAX(id), 0) + 1 FROM characters WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                chrs.NextCharId = (int)(long)cmd.ExecuteScalar();
            }

            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT maxCharSlot FROM accounts WHERE id=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                chrs.MaxNumChars = (int)cmd.ExecuteScalar();
                cmd.Dispose();
                return;
            }
        }

        public int GetNextCharID(Account acc)
        {
            var ret = 0;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT IFNULL(MAX(id), 0) + 1 FROM characters WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                ret = (int)(long)cmd.ExecuteScalar();
            }
            return ret;
        }

        public bool AddLock(int accId, int lockId)
        {
            var ret = false;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "UPDATE accounts SET locked=@newlocked WHERE id=@accId";
                var x = GetLockeds(accId);
                x.Add(lockId);
                cmd.Parameters.AddWithValue("@newlocked", Utils.GetCommaSepString(x.ToArray()));
                cmd.Parameters.AddWithValue("@accId", accId);
                if (cmd.ExecuteNonQuery() != 0)
                    ret = true;
            }
            return ret;
        }

        public bool RemoveLock(int accId, int lockId)
        {
            var ret = false;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "UPDATE accounts SET locked=@newlocked WHERE id=@accId";
                var x = GetLockeds(accId);
                x.Remove(lockId);
                cmd.Parameters.AddWithValue("@newlocked", Utils.GetCommaSepString(x.ToArray()));
                cmd.Parameters.AddWithValue("@accId", accId);
                if (cmd.ExecuteNonQuery() != 0)
                    ret = true;
            }
            return ret;
        }

        public bool AddIgnore(int accId, int ignoreId)
        {
            var ret = false;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "UPDATE accounts SET ignored=@newignored WHERE id=@accId";
                var x = GetIgnoreds(accId);
                x.Add(ignoreId);
                cmd.Parameters.AddWithValue("@newignored", Utils.GetCommaSepString(x.ToArray()));
                cmd.Parameters.AddWithValue("@accId", accId);
                if (cmd.ExecuteNonQuery() != 0)
                    ret = true;
            }
            return ret;
        }

        public bool RemoveIgnore(int accId, int ignoreId)
        {
            var ret = false;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "UPDATE accounts SET ignored=@newignored WHERE id=@accId";
                var x = GetIgnoreds(accId);
                x.Remove(ignoreId);
                cmd.Parameters.AddWithValue("@newignored", Utils.GetCommaSepString(x.ToArray()));
                cmd.Parameters.AddWithValue("@accId", accId);
                if (cmd.ExecuteNonQuery() != 0)
                    ret = true;
            }
            return ret;
        }

        public List<int> GetLockeds(int accId)
        {
            var ret = new List<int>();
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT locked FROM accounts WHERE id=@accId";
                cmd.Parameters.AddWithValue("@accid", accId);
                var result = cmd.ExecuteScalar().ToString();
                if (result != null && result != "") ret = result.Split(',').Select(int.Parse).ToList();
            }
            return ret;
        }

        public List<int> GetIgnoreds(int accId)
        {
            var ret = new List<int>();
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT ignored FROM accounts WHERE id=@accId";
                cmd.Parameters.AddWithValue("@accid", accId);
                var result = cmd.ExecuteScalar().ToString();
                if (result != null && result != "") ret = result.Split(',').Select(int.Parse).ToList();
            }
            return ret;
        }

        public void LoadCharacters(Account acc, Chars chrs)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT * FROM characters WHERE accId=@accId AND dead = FALSE;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        int[] stats = Utils.FromCommaSepString32(rdr.GetString("stats"));
                        chrs.Characters.Add(new Char
                        {
                            ObjectType = (short)rdr.GetInt32("charType"),
                            CharacterId = rdr.GetInt32("charId"),
                            Level = rdr.GetInt32("level"),
                            Exp = rdr.GetInt32("exp"),
                            CurrentFame = rdr.GetInt32("fame"),
                            _Equipment = rdr.GetString("items"),
                            _EquipData = rdr.GetString("itemDatas"),
                            MaxHitPoints = stats[0],
                            HitPoints = rdr.GetInt32("hp"),
                            MaxMagicPoints = stats[1],
                            MagicPoints = rdr.GetInt32("mp"),
                            Attack = stats[2],
                            Defense = stats[3],
                            Speed = stats[4],
                            HpRegen = stats[5],
                            MpRegen = stats[6],
                            Dexterity = stats[7],
                            Luck = stats[7],
                            Crit = stats[7],
                            Tex1 = rdr.GetInt32("tex1"),
                            Tex2 = rdr.GetInt32("tex2"),
                            Effect = rdr.GetString("effect"),
                            Skin = rdr.GetInt32("skin"),
                            PermaSkin = rdr.GetInt32("permaSkin"),
                            XpBoost = rdr.GetInt32("xpboost"),
                            Dead = false,
                            PCStats = rdr.GetString("fameStats"),
                            Pet = rdr.GetInt32("pet"),
                            Floors = rdr.GetInt32("floors")
                        });
                    }
                }
            }
            return;
        }

        public static Char CreateCharacter(XmlData dat, ushort type, int chrId)
        {
            XElement cls = dat.ObjectTypeToElement[type];
            if (cls == null) return null;
            return new Char
            {
                ObjectType = type,
                CharacterId = chrId,
                Level = 1,
                Exp = 0,
                CurrentFame = 0,
                _Equipment = cls.Element("Equipment").Value,
                EquipData = new ItemData[12],
                MaxHitPoints = int.Parse(cls.Element("MaxHitPoints").Value),
                HitPoints = int.Parse(cls.Element("MaxHitPoints").Value),
                MaxMagicPoints = int.Parse(cls.Element("MaxMagicPoints").Value),
                MagicPoints = int.Parse(cls.Element("MaxMagicPoints").Value),
                Attack = int.Parse(cls.Element("Attack").Value),
                Defense = int.Parse(cls.Element("Defense").Value),
                Speed = int.Parse(cls.Element("Speed").Value),
                Dexterity = int.Parse(cls.Element("Dexterity").Value),
                HpRegen = int.Parse(cls.Element("HpRegen").Value),
                MpRegen = int.Parse(cls.Element("MpRegen").Value),
                Luck = int.Parse(cls.Element("Luck").Value),
                Crit = int.Parse(cls.Element("Crit").Value),
                Tex1 = 0,
                Tex2 = 0,
                Effect = "",
                Skin = -1,
                PermaSkin = 0,
                XpBoost = 0,
                Dead = false,
                PCStats = "",
                FameStats = new FameStats(),
                Pet = -1,
                Floors = 0
            };
        }

        public Char LoadCharacter(Account acc, int charId)
        {
            Char ret;
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT * FROM characters WHERE accId=@accId AND charId=@charId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@charId", charId);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        ret = null;
                    else
                    {
                        rdr.Read();
                        int[] stats = Utils.FromCommaSepString32(rdr.GetString("stats"));
                        ret = new Char
                        {
                            ObjectType = (short)rdr.GetInt32("charType"),
                            CharacterId = rdr.GetInt32("charId"),
                            Level = rdr.GetInt32("level"),
                            Exp = rdr.GetInt32("exp"),
                            CurrentFame = rdr.GetInt32("fame"),
                            _Equipment = rdr.GetString("items"),
                           /* _Backpack1 = rdr.GetString("backpack1"),
                            _Backpack2 = rdr.GetString("backpack2"),
                            Backpacks = rdr.GetInt32("backpacks"), */
                            _EquipData = rdr.GetString("itemDatas"),
                            MaxHitPoints = stats[0],
                            HitPoints = rdr.GetInt32("hp"),
                            MaxMagicPoints = stats[1],
                            MagicPoints = rdr.GetInt32("mp"),
                            Attack = stats[2],
                            Defense = stats[3],
                            Speed = stats[4],
                            HpRegen = stats[5],
                            MpRegen = stats[6],
                            Dexterity = stats[7],
                            Luck = stats[8],
                            Crit = stats[9],
                            Tex1 = rdr.GetInt32("tex1"),
                            Tex2 = rdr.GetInt32("tex2"),
                            Effect = rdr.GetString("effect"),
                            Skin = rdr.GetInt32("skin"),
                            PermaSkin = rdr.GetInt32("permaSkin"),
                            XpBoost = rdr.GetInt32("xpboost"),
                            Dead = rdr.GetBoolean("dead"),
                            Pet = rdr.GetInt32("pet"),
                            PCStats = rdr.GetString("fameStats"),
                        };
                        ret.FameStats = new FameStats();
                        if (!string.IsNullOrEmpty(ret.PCStats))
                            ret.FameStats.Read(
                                ZlibStream.UncompressBuffer(
                                    Convert.FromBase64String(ret.PCStats.Replace('-', '+').Replace('_', '/'))));
                    }
                }
            }
            return ret;
        }

        public void SaveCharacter(Account acc, Char chr)
        {
            MySqlCommand cmd = CreateQuery(); 
            cmd.CommandText = @"UPDATE characters SET 
level=@level, 
exp=@exp, 
fame=@fame, 
items=@items, 
itemDatas=@itemDatas,
stats=@stats, 
hp=@hp, 
mp=@mp, 
tex1=@tex1, 
tex2=@tex2, 
effect=@effect,
skin=@skin,
permaSkin=@pskin,
pet=@pet, 
xpboost=@xpboost,
fameStats=@fameStats 
WHERE accId=@accId AND charId=@charId;"; // backpack1=@backpack1, backpack2 = @backpack2, backpacks = @backpacks
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@charId", chr.CharacterId);

            cmd.Parameters.AddWithValue("@level", chr.Level);
            cmd.Parameters.AddWithValue("@exp", chr.Exp);
            cmd.Parameters.AddWithValue("@fame", chr.CurrentFame);
            cmd.Parameters.AddWithValue("@items", chr._Equipment);
           /* cmd.Parameters.AddWithValue("@backpack1", chr._Backpack1);
            cmd.Parameters.AddWithValue("@backpack2", chr._Backpack2);
            cmd.Parameters.AddWithValue("@backpacks", chr.Backpacks); */
            cmd.Parameters.AddWithValue("@itemDatas", chr._EquipData);
            cmd.Parameters.AddWithValue("@stats", Utils.GetCommaSepString(new[]
            {
                chr.MaxHitPoints,
                chr.MaxMagicPoints,
                chr.Attack,
                chr.Defense,
                chr.Speed,
                chr.HpRegen,
                chr.MpRegen,
                chr.Dexterity,
                chr.Luck,
                chr.Crit
            }));
            cmd.Parameters.AddWithValue("@hp", chr.HitPoints);
            cmd.Parameters.AddWithValue("@mp", chr.MagicPoints);
            cmd.Parameters.AddWithValue("@tex1", chr.Tex1);
            cmd.Parameters.AddWithValue("@tex2", chr.Tex2);
            cmd.Parameters.AddWithValue("@effect", chr.Effect);
            cmd.Parameters.AddWithValue("@skin", chr.Skin);
            cmd.Parameters.AddWithValue("@pskin", chr.PermaSkin);
            cmd.Parameters.AddWithValue("@pet", chr.Pet);
            cmd.Parameters.AddWithValue("@xpboost", chr.XpBoost);
            chr.PCStats =
                Convert.ToBase64String(ZlibStream.CompressBuffer(chr.FameStats.Write()))
                    .Replace('+', '-')
                    .Replace('/', '_');
            cmd.Parameters.AddWithValue("@fameStats", chr.PCStats);
            cmd.ExecuteNonQuery();

            cmd = CreateQuery();
            cmd.CommandText = @"INSERT INTO classstats(accId, objType, bestLv, bestFame) 
VALUES(@accId, @objType, @bestLv, @bestFame) 
ON DUPLICATE KEY UPDATE 
bestLv = GREATEST(bestLv, @bestLv), 
bestFame = GREATEST(bestFame, @bestFame);";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@objType", chr.ObjectType);
            cmd.Parameters.AddWithValue("@bestLv", chr.Level);
            cmd.Parameters.AddWithValue("@bestFame", chr.CurrentFame);
            cmd.ExecuteNonQuery();
        }

        public void Death(XmlData dat, Account acc, Char chr, string killer) //Save first
        {
            bool firstBorn;
            int finalFame = chr.FameStats.CalculateTotal(dat, acc, chr, chr.CurrentFame, out firstBorn);
            var cmd = CreateQuery();
            cmd.CommandText = @"UPDATE characters SET 
dead=TRUE, 
deathTime=NOW() 
WHERE accId=@accId AND charId=@charId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@charId", chr.CharacterId);
            cmd.ExecuteNonQuery();

            cmd = CreateQuery();
            cmd.CommandText = @"UPDATE stats SET 
fame=fame+@amount, 
totalFame=totalFame+@amount 
WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@amount", finalFame);
            cmd.ExecuteNonQuery();

            cmd = CreateQuery();
            cmd.CommandText =
            @"INSERT INTO death(accId, chrId, name, charType, tex1, tex2, skin, items, fame, fameStats, totalFame, firstBorn, killer) 
VALUES(@accId, @chrId, @name, @objType, @tex1, @tex2, @skin, @items, @fame, @fameStats, @totalFame, @firstBorn, @killer);";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@chrId", chr.CharacterId);
            cmd.Parameters.AddWithValue("@name", acc.Name);
            cmd.Parameters.AddWithValue("@objType", chr.ObjectType);
            cmd.Parameters.AddWithValue("@tex1", chr.Tex1);
            cmd.Parameters.AddWithValue("@tex2", chr.Tex2);
            cmd.Parameters.AddWithValue("@skin", chr.Skin);
            cmd.Parameters.AddWithValue("@items", chr._Equipment);
            cmd.Parameters.AddWithValue("@fame", chr.CurrentFame);
            cmd.Parameters.AddWithValue("@fameStats", chr.PCStats);
            cmd.Parameters.AddWithValue("@totalFame", finalFame);
            cmd.Parameters.AddWithValue("@firstBorn", firstBorn);
            cmd.Parameters.AddWithValue("@killer", killer);
            cmd.ExecuteNonQuery();
            return;
        }

        public void AddOffer(int accId, Offer offer)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText =
                @"INSERT INTO market(accId, status, offerItems, offerData, requestItems, requestData) 
VALUES(@accId, @status, @offerItems, @offerData, @requestItems, @requestData);";
                cmd.Parameters.AddWithValue("@accId", accId);
                cmd.Parameters.AddWithValue("@status", 0);
                cmd.Parameters.AddWithValue("@offerItems", offer._OfferItems);
                cmd.Parameters.AddWithValue("@offerData", offer._OfferData);
                cmd.Parameters.AddWithValue("@requestItems", offer._RequestItems);
                cmd.Parameters.AddWithValue("@requestData", offer._RequestData);
                cmd.ExecuteNonQuery();
            }
        }

        public Offer GetOffer(int tradeId, Account acc)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "SELECT * FROM market WHERE id=@id";
                cmd.Parameters.AddWithValue("@id", tradeId);

                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                        return null;
                    else
                    {
                        rdr.Read();
                    }

                    return new Offer
                    {
                        Id = rdr.GetInt32("id"),
                        AccId = rdr.GetInt32("accId"),

                        Mine = acc != null ? rdr.GetInt32("accId") == acc.AccountId : false,
                        Status = rdr.GetInt32("status"),

                        _OfferItems = rdr.GetString("offerItems"),
                        _OfferData = rdr.GetString("offerData"),

                        _RequestItems = rdr.GetString("requestItems"),
                        _RequestData = rdr.GetString("requestData")
                    };
                }
            }
        }

        public void CloseOffer(int tradeId, bool purchased)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "UPDATE market SET status=@status WHERE id=@id";
                cmd.Parameters.AddWithValue("@id", tradeId);
                cmd.Parameters.AddWithValue("@status", purchased ? 2 : 1);
                cmd.ExecuteNonQuery();
            }
        }

        public void DeleteOffer(int tradeId)
        {
            using (var cmd = CreateQuery())
            {
                cmd.CommandText = "DELETE FROM market WHERE id=@id";
                cmd.Parameters.AddWithValue("@id", tradeId);
                cmd.ExecuteNonQuery();
            }
        }

        public void UpdateLastSeen(int accId, int charId, string location)
        {
            string currentDate = DateTime.UtcNow.ToString("yyyy-MM-dd:HH-mm-ss");
            MySqlCommand cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET lastSeen=@lastSeen WHERE id=@accId;";
            cmd.Parameters.AddWithValue("@lastSeen", currentDate);
            cmd.Parameters.AddWithValue("@accId", accId);
            cmd.ExecuteScalar();

            cmd = CreateQuery();
            cmd.CommandText = "UPDATE characters SET lastSeen=@lastSeen, lastLocation=@location WHERE accId=@accId AND charId=@charId;";
            cmd.Parameters.AddWithValue("@lastSeen", currentDate);
            cmd.Parameters.AddWithValue("@location", location ?? String.Empty);
            cmd.Parameters.AddWithValue("@accId", accId);
            cmd.Parameters.AddWithValue("@charId", charId);
            cmd.ExecuteScalar();
        }

        public bool CheckAccountInUse(Account acc, ref int? timeout)
        {
            MySqlCommand cmd = CreateQuery();
            cmd.CommandText = "SELECT lastSeen, accountInUse FROM accounts WHERE id=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            using (MySqlDataReader rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    DateTime lastSeen = rdr.GetDateTime("lastSeen");
                    if (lastSeen == DateTime.MinValue)
                        return false;

                    int timeInSec = 300 - (int)(DateTime.UtcNow - lastSeen).TotalSeconds;
                    bool accInUse = rdr.GetInt32("accountInUse") == 1;
                    if (accInUse && timeInSec > 0)
                    {
                        timeout = timeInSec;
                        return true;
                    }
                }
            }
            UnlockAccount(acc);
            return false;
        }

        public void LockAccount(Account acc)
        {
            if (acc == null) return;
            MySqlCommand cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET accountInUse=1 WHERE id=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.ExecuteScalar();
        }

        public void UnlockAccount(Account acc)
        {
            if (acc == null) return;
            MySqlCommand cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET accountInUse=0 WHERE id=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.ExecuteScalar();
        }

        public void UnlockAllAccounts()
        {
            MySqlCommand cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET accountInUse=0 WHERE accountInUse=1";
            cmd.ExecuteScalar();
        }
    }
}
