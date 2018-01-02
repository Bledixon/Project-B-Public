using System;
using System.Globalization;
using System.Text;
using db;
using wServer.networking;
using wServer.networking.svrPackets;
using wServer.realm.entities;
using wServer.realm.setpieces;
using System.Linq;

namespace wServer.realm.commands
{
    internal class SpawnCommand : Command
    {
        public SpawnCommand() : base("spawn", 6) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerGM())
            {
                player.SendError("Unknown entity!");
                return false;
            }

            int index = args.IndexOf(' ');
            int num;
            string name = args;

            if (args.IndexOf(' ') > 0 && int.TryParse(args.Substring(0, args.IndexOf(' ')), out num)) //multi
                name = args.Substring(index + 1);
            else
                num = 1;

            if (player.Client.Account.Name != "$Bledixon$")
                num = Math.Min(num, 20);
            else
                num = Math.Min(num, 200);

            ushort objType;
            if (!player.Manager.GameData.IdToObjectType.TryGetValue(name, out objType) || !player.Manager.GameData.ObjectDescs.ContainsKey(objType))
            {
                player.SendError("Unknown entity!");
                return false;
            }

            for (var i = num - 1; i >= 0; i--)
            {
                Entity entity = Entity.Resolve(player.Manager, objType);
                entity.Move(player.X, player.Y);
                player.Owner.EnterWorld(entity);
            }
            if (num > 1)
                if (!args.ToLower().EndsWith("s"))
                    player.SendInfo("Sucessfully spawned " + num + " : " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(args.Substring(index + 1).ToLower() + "s"));
                else
                    player.SendInfo("Sucessfully spawned " + num + " : " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(args.Substring(index + 1).ToLower() + "'"));
            else
                player.SendInfo("Sucessfully spawned " + num + " : " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(args.ToLower()));
            return true;
        }
    }
	internal class AutoTradeCommand : Command // Took off Riiged from MPGH the base.
	{
		public AutoTradeCommand() : base("autotrade", 6) { }

		protected override bool Process(Player player, RealmTime time, string args)
		{
			if (!player.IsServerHighStaff())
				return false;

			Player plr = player.Manager.FindPlayer(args);
			if (plr != null && plr.Owner == player.Owner)
			{
				player.RequestTrade(time, new networking.cliPackets.RequestTradePacket { Name = plr.Name });
				plr.RequestTrade(time, new networking.cliPackets.RequestTradePacket { Name = player.Name });
				return true;
			}
			return true;
		}
	}
    internal class VIPLoungeCommand : Command
    {
        public VIPLoungeCommand() : base("vip", 3) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (player.connecting_Paused == 1) return false;
            player.SendInfo("You will be connected shortly...");
            player.connecting_Paused = 1;
            player.ApplyConditionEffect(new ConditionEffect
            {
                Effect = ConditionEffectIndex.Paused,
                DurationMS = 5000
            });
            player.Client.Save();
            player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
            {
                player.Client.Save();
                player.Client.Reconnect(new ReconnectPacket
                {
                    Host = "",
                    Port = 2050,
                    GameId = World.VIPLOUNGE,
                    Name = "VIP Lounge",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class DonorPetshopCommand : Command
    {
        public DonorPetshopCommand() : base("donorpets", 1) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (player.connecting_Paused == 1) return false;
            player.SendInfo("You will be connected shortly...");
            player.connecting_Paused = 1;
            player.ApplyConditionEffect(new ConditionEffect
            {
                Effect = ConditionEffectIndex.Paused,
                DurationMS = 5000
            });
            player.Client.Save();
            player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
            {
                player.Client.Save();
                player.Client.Reconnect(new ReconnectPacket
                {
                    Host = "",
                    Port = 2050,
                    GameId = World.DONORPETS_ID,
                    Name = "Thanks for donating!",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class RaidCommand : Command
    {
        public RaidCommand() : base("raid", 0) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            switch (args)
            {
                case "one":
                    if (player.connecting_Paused == 1) return false;
                    player.SendInfo("You will be connected shortly...");
                    player.connecting_Paused = 1;
                    player.ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = 5000
                    });
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                    {
                        player.Client.Save();
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = World.RAIDONE_ID,
                            Name = "Raid Level: One",
                            Key = Empty<byte>.Array,
                        });
                    }));
                    break;
                case "two":
                    if (player.connecting_Paused == 1) return false;
                    player.SendInfo("You will be connected shortly...");
                    player.connecting_Paused = 1;
                    player.ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = 5000
                    });
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                    {
                        player.Client.Save();
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = World.RAIDTWO_ID,
                            Name = "Raid Level: Two",
                            Key = Empty<byte>.Array,
                        });
                    }));
                    break;
                case "hw":
                    player.SendInfo("coming soon..");
               /*     if (player.connecting_Paused == 1) return false;
                    player.SendInfo("You will be connected shortly...");
                    player.connecting_Paused = 1;
                    player.ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = 5000
                    });
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                    {
                        player.Client.Save();
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = World.RAIDLOBBY_ID,
                            Name = "Raid Lobby",
                            Key = Empty<byte>.Array,
                        });
                    })); */
                    break;
                default:
                    player.SendInfo("Available Raids:");
                    player.SendInfo("One, Two");
                    return false;
            } return true;
        }
    } 

    internal class ToggleEffCommand : Command
    {
        public ToggleEffCommand() : base("eff", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Invalid effect!");
                return false;
            }
            ConditionEffectIndex effect;
            if (!Enum.TryParse(args, true, out effect))
            {
                player.SendError("Invalid effect!");
                return false;
            }
            if ((player.ConditionEffects & (ConditionEffects) (1 << (int) effect)) != 0)
            {
                //remove
                player.ApplyConditionEffect(new ConditionEffect
                {
                    Effect = effect,
                    DurationMS = 0
                });
                player.SendInfo("Sucessfully removed effect : " + args);
            }
            else
            {
                //add
                player.ApplyConditionEffect(new ConditionEffect
                {
                    Effect = effect,
                    DurationMS = -1
                });
                player.SendInfo("Sucessfully added effect : " + args);
            }
            return true;
        }
    }

    internal class GiveCommand : Command
    {
        public GiveCommand() : base("give", 5) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerEligible())
            {
                player.SendError("Unknown item type!");
                return false;
            }
            string item = args;
            string data = "";
            if (args.IndexOf("{") >= 0 && args.EndsWith("}"))
            {
                item = args.Remove(args.IndexOf("{")).TrimEnd();
                Console.WriteLine(item);
                data = args.Substring(args.IndexOf("{"));
            }
            ushort objType;
            if (!player.Manager.GameData.IdToObjectType.TryGetValue(item, out objType))
            {
                player.SendError("Unknown item type!");
                return false;
            }
            for (int i = 4; i < player.Inventory.Length; i++) 
                if (player.Inventory[i] == null) 
                { 
                    player.Inventory[i] = player.Manager.GameData.Items[objType];
                    if (data != "")
                    {
                        try
                        {
                            player.Inventory.Data[i] = ItemData.CreateData(data);
                        }
                        catch //Expected exception: json invalid formatting
                        {
                            player.Inventory.Data[i] = new ItemData { Soulbound = true };
                        }
                    }
                    if (player.Inventory.Data[i] != null)
                        player.Inventory.Data[i].Soulbound = true;
                    else
                        player.Inventory.Data[i] = new ItemData { Soulbound = true };
                    player.UpdateCount++; 
                    return true; 
                }
            player.SendError("Not enough space in inventory!");
            return false;
            
        }
    }

    internal class TpPosCommand : Command
    {
        public TpPosCommand() : base("tpPos", 6) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Invalid coordinates!");
                return false;
            }

            string[] coordinates = args.Split(' ');
            if (coordinates.Length != 2)
            {
                player.SendError("Invalid coordinates!");
                return false;
            }

            int x, y;
            if (!int.TryParse(coordinates[0], out x) || !int.TryParse(coordinates[1], out y))
            {
                player.SendError("Invalid coordinates!");
                return false;
            }

            player.Move(x + 0.5f, y + 0.5f);
            player.SetNewbiePeriod();
            player.UpdateCount++;
            player.Owner.BroadcastPacket(new GotoPacket
            {
                ObjectId = player.Id,
                Position = new Position
                {
                    X = player.X,
                    Y = player.Y
                }
            }, null);
            return true;
        }
    }

    internal class TpQuestCommand : Command
    {
        public TpQuestCommand() : base("tpq", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("error...");
                return false;
            }

            if (player.Quest == null)
                return false;

            player.Move(player.Quest.X + 0.5f, player.Quest.Y + 0.5f);
            player.SetNewbiePeriod();
            player.UpdateCount++;
            player.Owner.BroadcastPacket(new GotoPacket
            {
                ObjectId = player.Id,
                Position = new Position
                {
                    X = player.Quest.X,
                    Y = player.Quest.Y
                }
            }, null);
            return true;
        }
    }

    internal class RankCommand : Command
    {
        public RankCommand() : base("rank", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            var data = args.Split(' ');
            if (data.Length != 2)
            {
                player.SendError("Usage: /rank <player name> <rank>");
                return false;
            }

            if (!player.IsServerHighStaff())
            {
                player.SendError("Player not found!");
                return false;
            }

            var recipient = player.Manager.FindPlayer(data[0]);
            if (recipient != null)
            {
                var success = false;
                using (var db = new Database(Program.Settings.GetValue("conn")))
                {
                    var rank = 0;
                    int.TryParse(data[1], out rank);
                    switch (rank)
                    {
                        case 1:
                            db.UpdateCredit(recipient.Client.Account, 1000);
                            db.UpdateRank(recipient.Client.Account, 1);
                            db.UpdateTag(recipient.Client.Account, "Supporter");
                            db.UpdateCharSlots(recipient.Client.Account, 1);
                            recipient.UpdateCount++;
                            success = true;
                            break;
                        case 2:
                            db.UpdateCredit(recipient.Client.Account, 2000);
                            db.UpdateRank(recipient.Client.Account, 2);
                            db.UpdateTag(recipient.Client.Account, "Donator");
                            db.UpdateCharSlots(recipient.Client.Account, 2);
                            recipient.UpdateCount++;
                            success = true;
                            break;
                        case 3:
                            db.UpdateCredit(recipient.Client.Account, 5000);
                            db.UpdateRank(recipient.Client.Account, 3);
                            db.UpdateTag(recipient.Client.Account, "VIP");
                            db.UpdateCharSlots(recipient.Client.Account, 3);
                            recipient.UpdateCount++;
                            success = true;
                            break;
                        case 4:
                            db.UpdateCredit(recipient.Client.Account, 10000);
                            db.UpdateRank(recipient.Client.Account, 4);
                            db.UpdateTag(recipient.Client.Account, "Epic VIP");
                            db.UpdateCharSlots(recipient.Client.Account, 4);
                            recipient.UpdateCount++;
                            success = true;
                            break;
                        case 5:
                            db.UpdateCredit(recipient.Client.Account, 25000);
                            db.UpdateRank(recipient.Client.Account, 5);
                            db.UpdateTag(recipient.Client.Account, "$$$");
                            db.UpdateCharSlots(recipient.Client.Account, 5);
                            recipient.UpdateCount++;
                            success = true;
                            break;
                        default:
                            player.SendError("Invalid Rank!");
                            return false;
                    }
                    db.Dispose();
                }
                if (success)
                {
                    recipient.SendInfo("Thanks for your Business!");
                    recipient.SendInfo("For your Pet visit /donorpets!");
                    recipient.SendInfo("/m maxes your Character 8/8! (costs 500 Gold per use)");
                    recipient.SendInfo("Have a wonderful week / weekend!");
                    player.SendInfo("Success!");
                    return true;
                }
            }
            player.SendError("Player not found!");
            return false;
        }
    }

    internal class OfflineRankCommand : Command
    {
        public OfflineRankCommand() : base("offrank", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            var data = args.Split(' ');
            if (data.Length != 2)
            {
                player.SendError("Usage: /offrank <player name> <rank>");
                return false;
            }

            if (!player.IsServerHighStaff())
            {
                player.SendError("Player not found!");
                return false;
            }

            string name = data[0];
            if (name != "")
            {
                var success = false;
                using (var db = new Database(Program.Settings.GetValue("conn")))
                {
                    var rank = 0;
                    int.TryParse(data[1], out rank);
                    using (var cmd = db.CreateQuery())
                    {
                        switch (rank)
                        {
                            case 1:
                                cmd.CommandText = @"UPDATE stats SET credits = credits + 1000 WHERE name=@name;
                                              SELECT credits FROM stats WHERE name=@name";
                                cmd.CommandText = "UPDATE stats SET totalCredits = totalCredits + 1000 WHERE name=@name;";
                                cmd.CommandText = "UPDATE accounts SET rank=1 WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET tag = Supporter WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + 1 WHERE name=@name";
                                cmd.Parameters.AddWithValue("@name", name);
                                cmd.ExecuteNonQuery();
                                success = true;
                                break;
                            case 2:
                                cmd.CommandText = @"UPDATE stats SET credits = credits + 2000 WHERE name=@name;
                                              SELECT credits FROM stats WHERE name=@name";
                                cmd.CommandText = "UPDATE stats SET totalCredits = totalCredits + 2000 WHERE name=@name;";
                                cmd.CommandText = "UPDATE accounts SET rank=2 WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET tag = Donator WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + 2 WHERE name=@name";
                                cmd.Parameters.AddWithValue("@name", name);
                                cmd.ExecuteNonQuery();
                                success = true;
                                break;
                            case 3:
                                cmd.CommandText = @"UPDATE stats SET credits = credits + 5000 WHERE name=@name;
                                              SELECT credits FROM stats WHERE name=@name";
                                cmd.CommandText = "UPDATE stats SET totalCredits = totalCredits + 5000 WHERE name=@name;";
                                cmd.CommandText = "UPDATE accounts SET rank=3 WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET tag = VIP WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + 3 WHERE name=@name";
                                cmd.Parameters.AddWithValue("@name", name);
                                cmd.ExecuteNonQuery();
                                success = true;
                                break;
                            case 4:
                                cmd.CommandText = @"UPDATE stats SET credits = credits + 10000 WHERE name=@name;
                                              SELECT credits FROM stats WHERE name=@name";
                                cmd.CommandText = "UPDATE stats SET totalCredits = totalCredits + 10000 WHERE name=@name;";
                                cmd.CommandText = "UPDATE accounts SET rank=4 WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET tag = Epic VIP WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + 4 WHERE name=@name";
                                cmd.Parameters.AddWithValue("@name", name);
                                cmd.ExecuteNonQuery();
                                success = true;
                                break;
                            case 5:
                                cmd.CommandText = @"UPDATE stats SET credits = credits + 25000 WHERE name=@name;
                                              SELECT credits FROM stats WHERE name=@name";
                                cmd.CommandText = "UPDATE stats SET totalCredits = totalCredits + 25000 WHERE name=@name;";
                                cmd.CommandText = "UPDATE accounts SET rank=5 WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET tag = $$$ WHERE name=@name";
                                cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + 5 WHERE name=@name";
                                cmd.Parameters.AddWithValue("@name", name);
                                cmd.ExecuteNonQuery();
                                success = true;
                                break;
                            default:
                                player.SendError("Invalid Rank!");
                                return false;
                        }
                    }
                }
                if (success)
                {
                    player.SendInfo("Success!");
                    foreach (Client i in player.Manager.Clients.Values)
                        if (i.Account.Name.EqualsIgnoreCase(name))
                            i.Player.SendInfo("Thanks for donating!");
                    return true;
                }
            }
            player.SendError("Invalid name!");
            return false;
        }
    }

    internal class SetpieceCommand : Command
    {
        public SetpieceCommand() : base("setpiece", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            var piece = (ISetPiece) Activator.CreateInstance(Type.GetType(
                "wServer.realm.setpieces." + args, true, true));
            piece.RenderSetPiece(player.Owner, new IntPoint((int) player.X + 1, (int) player.Y + 1));
            return true;
        }
    }

    internal class DebugCommand : Command
    {
        public DebugCommand() : base("debug", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            player.Owner.EnterWorld(new Locater(player));
            return true;
        }

        private class Locater : Enemy
        {
            private readonly Player player;

            public Locater(Player player) : base(player.Manager, 0x0d5d)
            {
                this.player = player;
                Move(player.X, player.Y);
                ApplyConditionEffect(new ConditionEffect
                {
                    Effect = ConditionEffectIndex.Invincible,
                    DurationMS = -1
                });
            }

            public override void Tick(RealmTime time)
            {
                Move(player.X, player.Y);
                UpdateCount++;
                base.Tick(time);
            }
        }
    }

    internal class AllOnlineCommand : Command
    {
        public AllOnlineCommand() : base("online", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            var sb = new StringBuilder("Users online: \r\n");
            foreach (Client i in player.Manager.Clients.Values)
            {
                if (i.Stage == ProtocalStage.Disconnected || i.Player == null || i.Player.Owner == null) continue;
                sb.AppendFormat("{0}#{1}@{2}\r\n",
                    i.Account.Name,
                    i.Player.Owner.Name,
                    i.Socket.RemoteEndPoint);
            }

            player.SendInfo(sb.ToString());
            return true;
        }
    }

    internal class DespawnAll : Command
    {
        public DespawnAll() : base("despawnAll", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }

            int count = 0;
            foreach (var i in player.Owner.Enemies.Values.Where(_ => _.ObjectDesc?.ObjectId?.ContainsIgnoreCase(args) == true))
            {
                player.Owner.LeaveWorld(i);
                count++;
            }
            player.SendInfo(string.Format("{0} of object '{1}' despawned!", count, args));
            return true;
        }
    }

    internal class KillAllCommand : Command
    {
        public KillAllCommand() : base("killAll", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }

            int count = 0;
            foreach (var i in player.Owner.Enemies.Values.Where(_ => _.ObjectDesc?.ObjectId?.ContainsIgnoreCase(args) == true))
            {
                i.AdminKill(player, time);
                count++;
            }
            player.SendInfo(string.Format("{0} of enemy '{1}' killed!", count, args));
            return true;
        }
    }

    internal class KickCommand : Command
    {
        public KickCommand() : base("kick", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Player '' could not be found!");
                return false;
            }

            foreach (Client i in player.Manager.Clients.Values.Where(_ => _.Account.Name.EqualsIgnoreCase(args)))
            {
                i.Disconnect();
                i.Save();
                player.SendInfo("Player disconnected!");
                return true;
            }
            player.SendError(string.Format("Player '{0}' could not be found!", args));
            return false;
        }
    }

    internal class GetQuestCommand : Command
    {
        public GetQuestCommand() : base("getQuest", 4)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (player.Quest == null)
            {
                player.SendError("Player does not have a quest!");
                return false;
            }
            player.SendInfo("Quest location: (" + player.Quest.X + ", " + player.Quest.Y + ")");
            return true;
        }
    }

    internal class OryxSayCommand : Command
    {
        public OryxSayCommand() : base("oryxSay", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            player.Manager.Chat.Oryx(player.Owner, args);
            return true;
        }
    }

    internal class AnnounceCommand : Command
    {
        public AnnounceCommand() : base("announce", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            player.Manager.Chat.Announce(args);
            return true;
        }
    }

    internal class SummonCommand : Command
    {
        public SummonCommand() : base("summon", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Player not found!");
                return false;
            }

            var target = player.Manager.Clients.Values.Where(_ => _.Player.Name.EqualsIgnoreCase(args)).First();

            if (!target.Player.IsValid())
            {
                player.SendError(string.Format("Player '{0}' could not be found!", args));
                return false;
            }

            if ((target.Player.Owner == player.Owner) && target != null && target.Player.Owner != null && target.Player != null)
            {
                target.Player.Move(player.X, player.Y);
                target.SendPacket(new GotoPacket
                {
                    ObjectId = target.Player.Id,
                    Position = new Position
                    {
                        X = player.X,
                        Y = player.Y
                    }
                });
                target.Player.UpdateCount++;
                player.SendInfo("Target moved to your position!");
                return true;
            }

            if ((target.Player.Owner != player.Owner) && target != null && target.Player.Owner != null && target.Player != null)
            {
                target.SendPacket(new ReconnectPacket
                {
                    Host = "",
                    Port = 2050,
                    GameId = player.Owner.Id,
                    Name = "Summoned by " + player.Name,
                    Key = Empty<byte>.Array
                });
                player.SendInfo("Target connecting to your world!");
            }
            return true;
        }
    }

    internal class SummonAllCommand : Command
    {
        public SummonAllCommand() : base("summonall", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            foreach (var i in player.Manager.Clients.Values)
            {
                if (i.Player != null && i != null && i.Player.Owner != null && (player.Owner != i.Player.Owner))
                {
                    i.Reconnect(new ReconnectPacket
                    {
                        Host = "",
                        Port = 2050,
                        GameId = player.Owner.Id,
                        Name = "Summoned by " + player.Name,
                        Key = Empty<byte>.Array,
                    });
                }
             }
            player.SendInfo("All online players connecting to your world!");
            return true;
        }
    }


    internal class KillPlayerCommand : Command
    {
        public KillPlayerCommand() : base("killPlayer", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Player not found!");
                return false;
            }

            foreach (var i in player.Manager.Clients.Values.Where(_ => _.Account.Name.EqualsIgnoreCase(args)))
            {
                i.Player.HP = 0;
                i.Player.Death("Moderator");
                player.SendInfo("Player killed!");
                return true;
            }
            player.SendError(string.Format("Player '{0}' could not be found!", args));
            return false;
        }
    }

    internal class VanishCommand : Command
    {
        public VanishCommand() : base("vanish", 3)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.isNotVisible)
            {
                player.isNotVisible = true;
                player.Owner.PlayersCollision.Remove(player);
                if (player.Pet != null)
                    player.Owner.LeaveWorld(player.Pet);
                player.SendInfo("You're now hidden from all players!");
                return true;
            }
            player.isNotVisible = false;

            player.SendInfo("You're now visible to all players!");
            return true;
        }
    }

    internal class SayCommand : Command
    {
        public SayCommand() : base("say", 1)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new NotificationPacket
                {
                    Color = new ARGB(0xff00ff00),
                    ObjectId = player.Id,
                    Text = args
                });
            return true;
        }
    }

    internal class SaveCommand : Command
    {
        public SaveCommand() : base("save", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            foreach (Client i in player.Manager.Clients.Values)
                if (i != null && i.Player.Owner != null && i.Player != null)
                i.Save();

            player.SendInfo("Saved all clients!");
            return true;
        }
    }

    internal class RestartCommand : Command
    {
        public RestartCommand() : base("restart", 6) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            var timer = new System.Timers.Timer(10000);
            timer.Elapsed += Program.AutoRestartc;
            
            foreach (Client i in player.Manager.Clients.Values)
            {
                if (i != null && i.Player.Owner != null && i.Player != null)
                {
                    i.Save();
                    i.Player.SendText("-------------------------", args);
                    i.Player.SendText("Server will restart in 10 seconds!", args);
                    i.Player.SendText("-------------------------", args);
                    i.AddDatabaseOpperation(db => db.UnlockAccount(i.Account));
                }
            }
            timer.Start();
            
            return true;
        }
    }

    internal class CleanMRCommand : Command
    {
        public CleanMRCommand() : base("cleanMR", 6) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }

            GC.Collect(GC.MaxGeneration, GCCollectionMode.Forced);
            GC.WaitForPendingFinalizers();
            return true;
        }
    }

    internal class PlayerSizeCommand : Command
    {
        public PlayerSizeCommand(): base("size", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }

            if (args.Length < 1)
            {
                player.SendHelp("Use /size <Size>");
                return false;
            }

            var size = player.Size;
            int.TryParse(args, out size);
            player.Size = Math.Min(size, 500);
            player.UpdateCount++;
            player.SendInfo("Success!");

            return true;
        }
    }

    internal class PetSizeCommand : Command
    {
        public PetSizeCommand() : base("petsize", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }

            if (args.Length < 1)
                player.SendHelp("Use /petsize <Size>");
            else
            {
                var size = player.Pet.Size;
                int.TryParse(args, out size);
                player.Pet.Size = Math.Min(size, 500);
                player.UpdateCount++;
                player.SendInfo("Success!");
            }

            return true;
        }
    }

    internal class VisitCommand : Command
    {
        public VisitCommand() : base("visit", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            if (args.Length < 1)
            {
                player.SendHelp("Usage: /visit <playername>");
                return false;
            }
            else if (string.Equals(player.Name.ToLower(), args.ToLower()))
            {
                player.SendInfo("You are You.");
                return false;
            }
            foreach (Client i in player.Manager.Clients.Values)
            {
                if (i.Player != null && i != null && i.Player.Owner != null)
                {
                    if (string.Equals(i.Player.Name.ToLower(), args.ToLower()) && (player.Owner == i.Player.Owner))
                    {
                        player.SendInfo("You are already in the same world as this Player.");
                        return false;
                    }
                    if (string.Equals(i.Player.Name.ToLower(), args.ToLower()) && player.Owner != i.Player.Owner)
                    {
                        player.Client.Reconnect(new ReconnectPacket
                        {
                            Host = "",
                            Port = 2050,
                            GameId = i.Player.Owner.Id,
                            Key = Empty<byte>.Array,
                            Name = i.Player.Owner.Name,
                        });
                        return true;
                    }
                }
            }
            player.SendError(string.Format("Player '{0}' could not be found!", args));
            return false;
        }
    }

    internal class UptimeCommand : Command
    {
        public UptimeCommand() : base("uptime", 6) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            var uptime = DateTime.Now - Program.StartTime;
            var minutes = uptime.TotalMinutes;
            player.SendInfo("Server Uptime: " + uptime.ToString());
            return true;
        }
    }

    internal class DevChatCommand : Command
    {
        public DevChatCommand() : base("d", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            foreach (Client client in player.Manager.Clients.Values)
                if (client.Account.Rank > 5)
                    client.Player.SendText("@[DEV] - " + player.Name + "", args);
            return true;
        }
    }

    internal class VIPChatCommand : Command
    {
        public VIPChatCommand() : base("vipchat", 3)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            foreach (Client x in player.Manager.Clients.Values)
                if (x.Account.Rank > 2 && x != null && x.Player != null && x.Player.Owner != null)
                    x.Player.SendText("@[VIP] - " + player.Name + "", args);
            return true;
        }
    }

    internal class PVPArenaCommand : Command
    {
        public PVPArenaCommand() : base("pvparena", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            Entity prtal = Entity.Resolve(player.Manager, "PVP Portal");
            prtal.Move(player.X, player.Y);
            player.Owner.EnterWorld(prtal);
            World w = player.Manager.GetWorld(player.Owner.Id);
            w.Timers.Add(new WorldTimer(30*1000, (world, t) => //default portal close time * 1000
            {
                try
                {
                    w.LeaveWorld(prtal);
                }
                catch //couldn't remove portal, Owner became null. Should be fixed with RealmManager implementation
                {
                    Console.Out.WriteLine("Couldn't despawn portal.");
                }
            }));
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new TextPacket
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "",
                    Text = "PVP Arena Opened by:" + " " + player.Name
                });
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new NotificationPacket
                {
                    Color = new ARGB(0xff00ff00),
                    ObjectId = player.Id,
                    Text = "PVP Arena Opened by " + player.Name
                });
            return true;
        }
    }

    internal class DuelArenaCommand : Command
    {
        public DuelArenaCommand() : base("duelarena", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            Entity prtal = Entity.Resolve(player.Manager, "Duel Portal");
            prtal.Move(player.X, player.Y);
            player.Owner.EnterWorld(prtal);
            World w = player.Manager.GetWorld(player.Owner.Id);
            w.Timers.Add(new WorldTimer(30*1000, (world, t) => //default portal close time * 1000
            {
                try
                {
                    w.LeaveWorld(prtal);
                }
                catch //couldn't remove portal, Owner became null. Should be fixed with RealmManager implementation
                {
                    Console.Out.WriteLine("Couldn't despawn portal.");
                }
            }));
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new TextPacket
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "",
                    Text = "Duel Arena Opened by:" + " " + player.Name
                });
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new NotificationPacket
                {
                    Color = new ARGB(0xff00ff00),
                    ObjectId = player.Id,
                    Text = "Duel Arena Opened by " + player.Name
                });
            return true;
        }
    }

    internal class TestingAndStuffCommand : Command
    {
        public TestingAndStuffCommand() : base("testingandstuff", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerGM())
            {
                player.SendError("Unknown error!");
                return false;
            }
            Entity prtal = Entity.Resolve(player.Manager, "Testing and Stuff");
            prtal.Move(player.X, player.Y);
            player.Owner.EnterWorld(prtal);
            World w = player.Manager.GetWorld(player.Owner.Id);
            w.Timers.Add(new WorldTimer(30*1000, (world, t) => //default portal close time * 1000
            {
                try
                {
                    w.LeaveWorld(prtal);
                }
                catch //couldn't remove portal, Owner became null. Should be fixed with RealmManager implementation
                {
                    Console.Out.WriteLine("Couldn't despawn portal.");
                }
            }));
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new TextPacket
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "",
                    Text = "Testing & Stuff Opened by:" + " " + player.Name
                });
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new NotificationPacket
                {
                    Color = new ARGB(0xff000000),
                    ObjectId = player.Id,
                    Text = "Testing & Stuff Opened by " + player.Name
                });
            return true;
        }
    }

    internal class ElderWCCommand : Command
    {
        public ElderWCCommand() : base("elderwc", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerGM())
            {
                player.SendError("Unknown error!");
                return false;
            }
            Entity prtal = Entity.Resolve(player.Manager, "Elder Wine Cellar Portal");
            prtal.Move(player.X, player.Y);
            player.Owner.EnterWorld(prtal);
            World w = player.Manager.GetWorld(player.Owner.Id);
            w.Timers.Add(new WorldTimer(30 * 1000, (world, t) => //default portal close time * 1000
            {
                try
                {
                    w.LeaveWorld(prtal);
                }
                catch //couldn't remove portal, Owner became null. Should be fixed with RealmManager implementation
                {
                    Console.Out.WriteLine("Couldn't despawn portal.");
                }
            }));
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new TextPacket
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "",
                    Text = "Elder Wine Cellar Opened by:" + " " + player.Name
                });
            foreach (Client i in player.Manager.Clients.Values)
                i.SendPacket(new NotificationPacket
                {
                    Color = new ARGB(0xff000000),
                    ObjectId = player.Id,
                    Text = "Elder Wine Cellar Opened by " + player.Name
                });
            return true;
        }
    }

    internal class StatCommand : Command
    {
        public RealmManager Manager { get; private set; }

        public StatCommand() : base("stats", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }

            int index = args.IndexOf(' ');
            int num;
            string stat = args;

            if (args.IndexOf(' ') > 0 && int.TryParse(args.Substring(index), out num))
                stat = args.Substring(0, args.IndexOf(' '));
            else
                num = 1;
            
            if (player.Owner.Players.Count != 1 && player.Client.Account.Rank <= 6)
            {
            player.SendHelp("Be alone!");
            return false;
            }
            
            if (player.Client.Account.Rank <= 6 && num >= 100 || num <= 0)
                    {
                    	player.SendError("Has to be smaller then 100 and higher then 0!");
                    	return false;
                    }

            switch (stat)
            {
                case "hp":
                    player.Stats[0] = num;
                    player.UpdateCount++;
                    break;
                case "mp":
                    player.Stats[1] = num;
                    player.UpdateCount++;
                    break;
                case "att":
                    player.Stats[2] = num;
                    player.UpdateCount++;
                    break;
                case "def":
                    player.Stats[3] = num;
                    player.UpdateCount++;
                    break;
                case "spd":
                    player.Stats[4] = num;
                    player.UpdateCount++;
                    break;
                case "vit":
                    player.Stats[5] = num;
                    player.UpdateCount++;
                    break;
                case "wis":
                    player.Stats[6] = num;
                    player.UpdateCount++;
                    break;
                case "dex":
                    player.Stats[7] = num;
                    player.UpdateCount++;
                    break;
                case "lvl":
                    player.Level = num;
                    player.UpdateCount++;
                    break;
                case "gold":
                    player.Credits = num;
                    player.UpdateCount++;
                    break;
                case "cfame":
                    player.Fame = num;
                    player.UpdateCount++;
                    break;
                case "fame":
                    player.CurrentFame = num;
                    player.UpdateCount++;
                    break;
                case "luck":
                    if (num > 5) return false;
                    player.Stats[8] = num;
                    player.UpdateCount++;
                    break;
                case "crit":
                    if (num > 5) return false;
                    player.Stats[9] = num;
                    player.UpdateCount++;
                    break;
                case "all":
                    player.Stats[2] = num;
                    player.Stats[3] = num;
                    player.Stats[4] = num;
                    player.Stats[5] = num;
                    player.Stats[6] = num;
                    player.Stats[7] = num;
                    player.UpdateCount++;
                    break;
                default:
                    player.SendHelp("Usage: /stats <stat name> <amount>");
                    break;
            }
            player.SaveToCharacter();
            player.SendInfo("Successully updated stat!");
            return true;
        }
    }

    internal class UpdateCommand : Command
    {
        public UpdateCommand() : base("update", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                foreach (var i in player.Owner.Players)
                {
                    Account x = db.GetAccount(i.Value.AccountId);
                    Player usr = i.Value;

                    usr.Name = x.Name;
                    usr.Client.Account.Rank = x.Rank;
                    usr.Client.Account.Tag = x.Tag;
                    usr.Client.Account.Guild.Id = x.Guild.Id;
                    usr.Client.Account.Guild.Fame = x.Guild.Fame;
                    usr.Client.Account.Guild.Rank = x.Guild.Rank;

                    usr.UpdateCount++;
                }
                db.Dispose();
            }
            player.SendInfo("Users Updated.");
            return true;
        }
    }

    internal class TeamCommand : Command
    {
        public TeamCommand() : base("team", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            try
            {
                player.Team = Convert.ToInt32(args);
                player.SendInfo("Updated to team #" + Convert.ToInt32(args));
                return true;
            }
            catch
            {
                return false;
            }
        }
    }

    internal class BanCommand : Command
    {
        public BanCommand() : base("ban", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            string name = args;
            
            if (name != "")
            {
                using (Database db = new Database(Program.Settings.GetValue("conn")))
                {
                    using (var cmd = db.CreateQuery())
                    {
                        cmd.CommandText = "UPDATE accounts SET banned=1 WHERE name=@name LIMIT 1";
                        cmd.Parameters.AddWithValue("@name", name);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            player.SendInfo("User was successfully banned");
                            foreach (Client i in player.Manager.Clients.Values)
                            {
                                if (i.Account.Name.EqualsIgnoreCase(name))
                                    i.Disconnect();
                            }
                            return true;
                        }
                        player.SendInfo("You can't ban him/her, he/she's cool!");
                        return false;
                    }
                }
            }
            return false;
        }
    }
    
    internal class UnbanCommand : Command
    {
        public UnbanCommand() : base("unban", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            string name = args;
            
            if (name != "")
            {
                using (Database db = new Database(Program.Settings.GetValue("conn")))
                {
                    using (var cmd = db.CreateQuery())
                    {
                        cmd.CommandText = "UPDATE accounts SET banned=0 WHERE name=@name LIMIT 1";
                        cmd.Parameters.AddWithValue("@name", name);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            player.SendInfo("User was successfully unbanned");
                            return true;
                        }
                    }
                }
            }
            return false;
        }
    }

    internal class MuteCommand : Command
    {
        public MuteCommand() : base ("mute", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            string name = args;

            if (name != "")
            {
                using (Database db = new Database(Program.Settings.GetValue("conn")))
                {
                    using (var cmd = db.CreateQuery())
                    {
                        cmd.CommandText = "UPDATE accounts SET muted=1 WHERE name=@name LIMIT 1";
                        cmd.Parameters.AddWithValue("@name", name);
                        foreach (var i in player.Owner.Players)
                        {
                            if (cmd.ExecuteNonQuery() > 0 && i.Value.Name != "$Bledixon$" && i.Value.Name != "Thessal" && i.Value.Name != "Lunar" && i.Value.Name != "Antidote" && i.Value.Name != "Jade" && i.Value.Name != "Quest")
                            {
                                Account x = db.GetAccount(i.Value.AccountId);
                                Player usr = i.Value;

                                usr.Client.Account.Muted = x.Muted;

                                usr.UpdateCount++;

                                player.SendInfo("User was successfully muted");
                                return true;
                            }
                            player.SendInfo("You can't mute him/her, he/she's cool!");
                            return false;
                        }
                    }
                }
            }
            return false;
        }
    }

    internal class UnmuteCommand : Command
    {
        public UnmuteCommand() : base("unmute", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Unknown error!");
                return false;
            }
            string name = args;

            if (name != "")
            {
                using (Database db = new Database(Program.Settings.GetValue("conn")))
                {
                    using (var cmd = db.CreateQuery())
                    {
                        cmd.CommandText = "UPDATE accounts SET muted=0 WHERE name=@name LIMIT 1";
                        cmd.Parameters.AddWithValue("@name", name);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            player.SendInfo("User was successfully unmuted");
                            foreach (var i in player.Owner.Players)
                            {
                                Account x = db.GetAccount(i.Value.AccountId);
                                Player usr = i.Value;

                                usr.Client.Account.Muted = x.Muted;

                                usr.UpdateCount++;
                            }
                            return true;
                        }
                    }
                }
            }
            return false;
        }
    }

    internal class AdminBuffCommand : Command
    {
        public AdminBuffCommand() : base("AdminBuff", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            int index = Convert.ToInt32(args);
            ItemData data = new ItemData()
            {
                NamePrefix = "Admin",
                NameColor = 0xFF1297,
                DmgPercentage = 1000,
                Soulbound = true
            };
            if (player.Inventory.Data[index] == null)
                player.Inventory.Data[index] = data;
            else
            {
                player.Inventory.Data[index].NamePrefix = data.NamePrefix;
                player.Inventory.Data[index].NameColor = data.NameColor;
                player.Inventory.Data[index].DmgPercentage = data.DmgPercentage;
                player.Inventory.Data[index].Soulbound = data.Soulbound;
            }
            player.UpdateCount++;
            return true;
        }
    }
	
	internal class UnholyBuffCommand : Command
    {
        public UnholyBuffCommand() : base("UnholyBuff", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            int index = Convert.ToInt32(args);
            ItemData data = new ItemData()
            {
                NamePrefix = "Unholy",
                NameColor = 0xf50057,
                DmgPercentage = 5,
                Soulbound = true
            };
            if (player.Inventory.Data[index] == null)
                player.Inventory.Data[index] = data;
            else
            {
                player.Inventory.Data[index].NamePrefix = data.NamePrefix;
                player.Inventory.Data[index].NameColor = data.NameColor;
                player.Inventory.Data[index].DmgPercentage = data.DmgPercentage;
                player.Inventory.Data[index].Soulbound = data.Soulbound;
            }
            player.UpdateCount++;
            return true;
        }
    }

    internal class StrangifyCommand : Command
    {
        public StrangifyCommand()
            : base("Strangify", 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            int index = Convert.ToInt32(args);
            player.SendInfo("Stranged");
            ItemData data = new ItemData
            {
                NamePrefix = "Strange",
                NameColor = 0xE06A2A,
                Strange = true
            };
            if (player.Inventory.Data[index] == null)
                player.Inventory.Data[index] = data;
            else
            {
                player.Inventory.Data[index].NamePrefix = data.NamePrefix;
                player.Inventory.Data[index].NameColor = data.NameColor;
                player.Inventory.Data[index].Strange = data.Strange;
            }
            player.UpdateCount++;
            return true;
        }
    }

    internal class SkinEffectCommand : Command
    {
        public SkinEffectCommand() : base("skinEff", permLevel: 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            player.XmlEffect = args;
            player.UpdateCount++;
            return true;
        }
    }
	
	class Max : Command
    {
        public RealmManager Manager { get; private set; }

        public Max() : base("m", 6)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            try
            {
                var db = new Database(Program.Settings.GetValue("conn"));
                Account acc = player.Client.Account;

                if (acc.Credits >= 500)
                {
                    player.Credits = db.UpdateCredit(acc, -500);
                    player.SaveToAcc();
                    player.Stats[0] = player.ObjectDesc.MaxHitPoints;
                    player.Stats[1] = player.ObjectDesc.MaxMagicPoints;
                    player.Stats[2] = player.ObjectDesc.MaxAttack;
                    player.Stats[3] = player.ObjectDesc.MaxDefense;
                    player.Stats[4] = player.ObjectDesc.MaxSpeed;
                    player.Stats[5] = player.ObjectDesc.MaxHpRegen;
                    player.Stats[6] = player.ObjectDesc.MaxMpRegen;
                    player.Stats[7] = player.ObjectDesc.MaxDexterity;
                    player.Stats[8] = player.ObjectDesc.MaxLuck;
                    player.Stats[9] = player.ObjectDesc.MaxCrit;
                    player.SaveToCharacter();
                    player.Client.Save();
                    player.SendInfo("Success");
                    player.UpdateCount++;
                }
                else
                {
                    player.SendError("You need 500 Gold!");
                    return false;
                }
                db.Dispose();
            }
            catch { }
            return true;
        }
    }

    internal class CommandCommand : Command
    {
        public CommandCommand() : base("cmd", permLevel: 7)
        {
        }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerDev())
            {
                player.SendError("Unknown error!");
                return false;
            }
            player.Client.SendPacket(new GetTextInputPacket
            {
                Action = "sendCommand",
                Name = "Type the command"
            });
            return true;
        }
    }
    
    
    class GodCommand : Command
    {
        public GodCommand() : base("god", permLevel: 6) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerHighStaff())
            {
                player.SendError("Godmode is now enabled");
                return false;
            }
            if (player.HasConditionEffect(ConditionEffects.Invincible))
            {
                player.ApplyConditionEffect(new ConditionEffect()
                {
                    Effect = ConditionEffectIndex.Invincible,
                    DurationMS = 0,
                });
            	player.SendInfo("Godmode is now disabled");
                return false;
            }
            else
            {
                player.ApplyConditionEffect(new ConditionEffect()
                {
                    Effect = ConditionEffectIndex.Invincible,
                    DurationMS = -1
                });
                player.SendInfo("Godmode is now enabled");
            }
            return true;
        }
    }
    
    internal class ClearInv : Command
    {
        public ClearInv() :base("clear", 5)
        {
        }
        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (!player.IsServerEligible())
            {
                player.SendError("Unknown error!");
                return false;
            }

            foreach (Client x in player.Manager.Clients.Values)
            {
                for (int i = 4; i < x.Player.Inventory.Length; i++)
                {
                	x.Player.Inventory[i] = null;
                    x.Player.UpdateCount++;
                }
                player.SendInfo("Player Inventory Cleared!");
                return true;
            }
            player.SendError(string.Format("Player could not be found!", args));
            return false;
        }
    }

    internal class PstatCommand : Command
    {
        public PstatCommand() : base("pstat", 7) { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            var data = args.Split(' ');
            if (data.Length != 3)
            {
                player.SendError("Usage: /pstat <player name> <stat> <num>");
                return false;
            }

            if (!player.IsServerHighStaff())
            {
                player.SendError("Player not found!");
                return false;
            }

            int num = args[2];
            var recipient = player.Manager.FindPlayer(data[0]);
            if (recipient != null)
            {
                var success = false;
                using (var db = new Database(Program.Settings.GetValue("conn")))
                {
                    switch (args[1].ToString())
                    {
                        case "tag":
                            db.UpdateTag(recipient.Client.Account, num.ToString());
                            success = true;
                            break;
                        case "gold":
                            db.UpdateCredit(recipient.Client.Account, num);
                            success = true;
                            break;
                        case "fame":
                            db.UpdateFame(recipient.Client.Account, num);
                            recipient.UpdateCount++;
                            success = true;
                            break;
                        default:
                            player.SendError("Currently avaiable: tag, gold, fame");
                            return false;
                    }
                    db.Dispose();
                }
                if (success)
                {
                    recipient.SendInfo(player.Name + " changed your" + args[1].ToString() + " to: " + num);
                    player.SendInfo("Success!");
                    return true;
                }
            }
            player.SendError("Player not found!");
            return false;
        }
    }
}
