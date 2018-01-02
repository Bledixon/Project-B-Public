using System;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;
using db;

namespace wServer.realm.commands
{
    internal class MarketCommand : Command
    {
        public MarketCommand() : base("market") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            return true;
        }
    }

    internal class MscaleCommand : Command
    {
        public MscaleCommand() : base("mscale") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            return true;
        }
    }

    internal class FindCommand : Command
    {
        public FindCommand() : base("find") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            foreach (Client x in player.Manager.Clients.Values)
            {
                if (x.Account.Name == args && x != null)
                    if (player.IsServerHighStaff())
                    {
                        player.SendInfo("Found player!");
                        player.SendInfo("World: " + x.Player.Owner.Name);
                        player.SendInfo("Level: " + x.Player.Level);
                        player.SendInfo("Fame: " + x.Player.Fame);
                        player.SendInfo("Gold: " + x.Player.Credits);
                        player.SendInfo("AccountID: " + x.Player.AccountId);
                        return true;
                    }
                    else
                    {
                        player.SendInfo("Found player!");
                        player.SendInfo("World: " + x.Player.Owner.Name);
                        player.SendInfo("Level: " + x.Player.Level);
                        return true;
                    }
            }
            player.SendInfo("Player not online!");
            return false;
        }
    }


    internal class SetCommand : Command
    {
        public SetCommand() : base("set") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            player.SendError("This command is currently disabled.");
            return true;
       /*     bool success = false;

            for (int i = 0; i < player.Inventory.Length; i++))
            {
                switch (args.ToLower())
                    {
                        case "priest":
                            player.Inventory[4] = player.Manager.GameData.Items[0xa86]; // Wand of Shadow
                            player.Inventory[5] = player.Manager.GameData.Items[0xa33]; // Tome of Renewing
                            player.Inventory[6] = player.Manager.GameData.Items[0xa95]; // Moon
                            player.Inventory[7] = player.Manager.GameData.Items[0xac5]; // Para HP
                            player.UpdateCount++;
                            success = true;
                            break;
                        case "wizard":
                            player.Inventory[4] = player.Manager.GameData.Items[0xaa1]; // Dia
                            player.Inventory[5] = player.Manager.GameData.Items[0xad6]; // Dsphere
                            player.Inventory[6] = player.Manager.GameData.Items[0xa95]; // Moon
                            player.Inventory[7] = player.Manager.GameData.Items[0xac5]; // Para HP
                            player.UpdateCount++;
                            success = true;
                            break;
                        default:
                            player.SendHelp("Usage: /set <class name>");
                            break;
                    }
                if (success)
                {
                    player.SaveToCharacter();
                    player.SendInfo("Successully given set!");
                    return true;
                }
                return false;
            }
            return false; */
        }
    }

    internal class LockCommand : Command
    {
        public LockCommand() : base("lock") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (args.Length != 1)
            {
                player.SendHelp("Usage: /lock <playername>");
                return false;
            }
            if (string.Equals(player.Name.ToLower(), args.ToLower()))
            {
                player.SendInfo("You are trying to lock yourself...Dumass.");
                return false;
            }
            foreach (Client i in player.Manager.Clients.Values.Where(_ => _.Account.Name.EqualsIgnoreCase(args)))
            {
                foreach (int x in player.Locked)
                {
                    using (var db = new Database(Program.Settings.GetValue("conn")))
                    {
                        if (!x.Equals(i.Account.AccountId))
                        {
                            db.AddLock(player.AccountId, i.Account.AccountId);
                            player.Locked.Add(i.Account.AccountId);
                            player.UpdateCount++;
                            return true;
                        }
                        db.RemoveLock(player.AccountId, i.Account.AccountId);
                        player.Locked.Remove(i.Account.AccountId);
                        player.UpdateCount++;
                        db.Dispose();
                        return true;
                    }
                }
            }
            player.SendError($"Player {args} could not be found");
            return false;
        }
    }

    internal class TutorialCommand : Command
    {
        public TutorialCommand() : base("tutorial") { }

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
                    GameId = World.TUT_ID,
                    Name = "Tutorial",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class PlayersCommand : Command
    {
        public PlayersCommand() : base("players") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            int a = 0;
            foreach (Client i in player.Manager.Clients.Values)
                a++;
            player.SendInfo("Total Players Online: " + a);
            return true;
        }
    }

    internal class GOnlineCommand : Command
    {
        public GOnlineCommand() : base("gmates") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            foreach (Client i in player.Manager.Clients.Values)
                if (i.Player.Guild == player.Guild && player.Guild != null)
                {
                    player.SendInfo(i.Player.Name);
                    return true;
                }
            player.SendError("You don't have a Guild!");
            return false;
        }
    }

    internal class NexusCommand : Command
    {
        public NexusCommand() : base("nexus") { }

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
                    GameId = World.NEXUS_ID,
                    Name = "Nexus",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class VaultCommand : Command
    {
    public VaultCommand() : base("vault") { }

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
                   GameId = World.VAULT_ID,
                   Name = "Vault",
                   Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class XpworldCommand : Command
    {
        public XpworldCommand() : base("xpgift") { }

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
                    GameId = World.XP_GIFT,
                    Name = "Fame Whoreing",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class UpdatesCommand : Command
    {
        public UpdatesCommand() : base("updates") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            player.Client.SendPacket(new TextBoxPacket
            {
                Title = "Newest Updates",
                Message =
                "Added /elderarena, added White Fountains to Nexus, Most Elder Event Arena issues have been resolved, Removed Guild Chronical from Nexus",
                Button1 = "Exit",
                Type = "Exit"
            });
            return true;
        }
    }

    /* internal class GhallCommand : Command
     {
     public GhallCommand() : base("ghall") { }

         protected override bool Process(Player player, RealmTime time, string args)
         {
             player.Client.Reconnect(new ReconnectPacket
             {
                 Host = "",
                 Port = 2050,
                 GameId = World.GUILD_ID,
                 Name = "Guild Hall",
                 Key = Empty<byte>.Array,
             });
             return true;
         }
     } */

    internal class ShopCommand : Command
    {
    public ShopCommand() : base("shop") { }

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
                    GameId = World.MARKET_ID,
                    Name = "Market",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class GShopCommand : Command
    {
        public GShopCommand() : base("goldshop") { }

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
                    GameId = World.GMARKET_ID,
                    Name = "Gold Market",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class ClothMarketCommand : Command
    {
        public ClothMarketCommand() : base("clothmarket") { }

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
                    GameId = World.CMARKET_ID,
                    Name = "Cloth Market",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class EventArenaCommand : Command
    {
     public EventArenaCommand() : base("earena") { }

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
                    GameId = World.EARENA_ID,
                    Name = "Event Arena",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class ArenaCommand : Command
    {
        public ArenaCommand() : base("arena") { }

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
                    GameId = World.ARENA_ID,
                    Name = "Arena",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    }

    internal class RealmCommand : Command
    {
        public RealmCommand() : base("realm") { }

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
                    GameId = World.RAND_REALM,
                    Name = "Elder Realm",
                    Key = Empty<byte>.Array,
                });
            }));
            return true;
        }
    } 

    internal class TradeCommand : Command
    {
        public TradeCommand() : base("trade") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (args.Length == 0)
            {
                player.SendHelp("Usage: /trade <username>");
                return true;
            }

            Player plr = player.Manager.FindPlayer(args);
            if (plr != null && plr.Owner == player.Owner)
            {
                player.RequestTrade(time, new RequestTradePacket() { Name = plr.Name });
                return true;
            }
            return false;
        }
    }

    internal class WhoCommand : Command
    {
        public WhoCommand() : base("who") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            var sb = new StringBuilder("Players online: ");

            var visiblePlayers = new List<string>();
            var vanishedPlayers = new List<string>();


            Player[] copy = player.Owner.Players.Values.ToArray();
            if (copy.Length == 0)
                player.SendInfo("Nobody else is online");
            else
            {
                for (int v = 0; v < copy.Length; v++)
                    if (!copy[v].isNotVisible)
                        visiblePlayers.Add(copy[v].Name);
                    else
                        vanishedPlayers.Add(copy[v].Name);
                if (visiblePlayers.Count > 0)
                    player.SendInfo("Players online: " + string.Join(", ", visiblePlayers.ToArray()));
                else
                    player.SendInfo("Nobody else is online");
            }
            return true;
        }
    }

    internal class ServerCommand : Command
    {
        public ServerCommand() : base("server") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            player.SendInfo(player.Owner.Name); 
            return true;
        }
    }
    
    internal class CFameCommand : Command
    {
        public CFameCommand() : base("myfame") { }
        

        protected override bool Process(Player player, RealmTime time, string args)
        {
        	int Fame = player.Client.Character.CurrentFame;
            player.SendInfo("You currently have " + Fame + " Fame.");
            return true;
        }
    }
    
    internal class CHelpCommand : Command
    {
        public CHelpCommand() : base("chelp") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            player.SendInfo("-------- items --------");
            player.SendInfo("Ancient Seal = Bes's/Nut's/Geb's Ancient Seal");
            player.SendInfo("Ancient Shield = Shield Part 1/2/3");
            player.SendInfo("Oryx's Helm = Oryx's Horns/Left Face/Right Face");
            player.SendInfo("Pet Ruin + Pet Ruin = Next tier Pet Ruin");
            player.SendInfo("-------- pets --------");
            player.SendInfo("Goblin Mage Pet = Pet Rock + Uncommon Pet Ruin");
            player.SendInfo("Lil Sumo Pet = Pet Rock + Rare Pet Ruin");
            player.SendInfo("Giant Crab Pet = Pet Rock + Legendary Pet Ruin");
            return true;
        }
    }

    internal class ServerChatCommand : Command
    {
        public ServerChatCommand() : base("sc") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            int x = 0;
            Regex rgx = new Regex("[^a-zA-Z0-9 -,.]");
            args = rgx.Replace(args, "");

            if (player.Client.Account.Muted)
                return false;

            if (args == string.Empty)
            {
                player.SendInfo("Usage: /sc <Your text>");
                return false;
            }

            foreach (var i in player.Manager.Clients.Values)
            {
                if (i.Player != null && i != null && i.Player.Owner != null && args != "" && !i.Player.Ignored.Contains(player.Client.Account.AccountId))
                  if (x < 4)
                    i.Player.SendHelp("[Server Chat] " + player.Name + ": " + args);
            }
            x++;
            player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) => x--));
            return true;
        }
    }

    internal class glandCommand : Command
    {
        public glandCommand() : base("gland") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            string[] coordinates = args.Split(' ');

            player.Move(1000 + 0.5f, 850 + 0.5f);
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
            if (player.Pet != null)
            {
                player.Pet.Move(player.X, player.Y);
                player.Pet.UpdateCount++;
                player.Pet.Owner.BroadcastPacket(new GotoPacket
                {
                    ObjectId = player.Pet.Id,
                    Position = new Position
                    {
                        X = player.Pet.X,
                        Y = player.Pet.Y
                    }
                }, null);
            }
            return true;
        }
    }

    internal class PettpCommand : Command
    {
        public PettpCommand() : base("pet") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            string[] coordinates = args.Split(' ');

            player.Pet.Move(player.X, player.Y);
            player.Pet.UpdateCount++;
            player.Pet.Owner.BroadcastPacket(new GotoPacket
            {
                ObjectId = player.Pet.Id,
                Position = new Position
                {
                    X = player.Pet.X,
                    Y = player.Pet.Y
                }
            }, null);
            player.SendInfo("Pet has been teleported to you!");
            return true;
        }
    }

    internal class PauseCommand : Command
    {
        public PauseCommand() : base("pause") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (player.connecting_Paused == 1)
                return false;

            if (player.HasConditionEffect(ConditionEffects.Paused))
            {
                player.ApplyConditionEffect(new ConditionEffect
                {
                    Effect = ConditionEffectIndex.Paused,
                    DurationMS = 0
                });
                player.SendInfo("Game resumed.");
                return true;
            }
            if (player.Owner.EnemiesCollision.HitTest(player.X, player.Y, 8).OfType<Enemy>().Any())
            {
                player.SendError("Not safe to pause.");
                return false;
            }
            player.ApplyConditionEffect(new ConditionEffect
            {
                Effect = ConditionEffectIndex.Paused,
                DurationMS = -1
            });
            player.SendInfo("Game paused.");
            return true;
        }
    }

    internal class TeleportCommand : Command
    {
        public TeleportCommand() : base("teleport") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (player.Name.EqualsIgnoreCase(args))
            {
                player.SendInfo("You are already at yourself, and always will be!");
                return false;
            }
            if (player.Owner.AllowTeleport == false)
            {
                player.SendError("You are not allowed to teleport in this area!");
                return false;
            }

            foreach (var i in player.Owner.Players)
            {
                if (i.Value.Name.EqualsIgnoreCase(args))
                {
                    if (i.Value.isNotVisible)
                    {
                        player.SendInfo(string.Format("Unable to find player: {0}", args));
                        return false;
                    }
                    if (i.Value.HasConditionEffect(ConditionEffects.Invisible))
                    {
                        player.SendError("You can't teleport to invisible players");
                        return false;
                    }
                    player.Teleport(time, i.Value.Id);
                    return true;
                }
            }
            player.SendInfo(string.Format("Unable to find player: {0}", args));
            return false;
        }
    }

    internal class TellCommand : Command
    {
        public TellCommand() : base("tell") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            string saytext = string.Join(" ", args);
            int index = args.IndexOf(' ');
            string playername = args.Substring(0, index);
            string msg = args.Substring(index + 1);

            if (player.Client.Account.Muted) return false;

            if (!player.NameChosen)
            {
                player.SendError("Choose a name!");
                return false;
            }
            if (saytext.Equals("") || saytext == null || msg.Equals("") || msg == null || msg.Length < 0 || playername.Length < 0)
            {
                player.SendError("Usage: /tell <player name> <text>");
                return false;
            }
            
            if (msg.Trim() == string.Empty)
                return false;

            if (String.Equals(player.Name.ToLower(), playername.ToLower()))
            {
                player.SendInfo("Quit telling yourself!");
                return false;
            }

            foreach (var i in player.Manager.Clients.Values)
            {
                if (i.Account.NameChosen && i.Account.Name.EqualsIgnoreCase(playername))
                {
                    if (i.Account.Ignored.Contains(player.Client.Account.AccountId)) return false;
                    if (i.Player == null || i.Player.Owner == null)
                        continue;

                    player.Client.SendPacket(new TextPacket() //echo to self
                    {
                        ObjectId = player.Id,
                        BubbleTime = 10,
                        Stars = player.Stars,
                        Name = player.Name,
                        Recipient = i.Account.Name,
                        Text = msg.ToSafeText(),
                        CleanText = ""
                    });

                    i.SendPacket(new TextPacket() //echo to /tell player
                    {
                        ObjectId = player.Owner.Id == i.Player.Owner.Id ? player.Id : 0,
                        BubbleTime = (byte)(player.Owner.Id == i.Player.Owner.Id ? 10 : 0),
                        Stars = player.Stars,
                        Name = player.Name,
                        Recipient = i.Account.Name,
                        Text = msg.ToSafeText(),
                        CleanText = ""
                    });
                    return true;
                }
            }
            player.SendError(string.Format("{0} not found.", playername));
            return false;
        }
    }

    internal class HelpCommand : Command
    {
        public HelpCommand() : base("help") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            StringBuilder sb = new StringBuilder("Available commands: ");
            var cmds = player.Manager.Commands.Commands.Values
                .Where(x => x.HasPermission(player))
                .ToArray();
            for (int i = 0; i < cmds.Length; i++)
            {
                if (i != 0) sb.Append(", ");
                sb.Append(cmds[i].CommandName);
            }

            player.SendInfo(sb.ToString());
            return true;
        }
    }

    internal class PartyCommand : Command
    {
        public PartyCommand() : base("party") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (args.Trim() != "")
            {
                string cmd = args.Split(' ')[0];
                string left = args.Split(' ').Length > 1 ? string.Join(" ", args.Split(' ').Skip(1)) : "";
                bool inParty = player.Party != null;
                bool leader = inParty && player.Party.Leader == player;
                switch (cmd)
                {
                    case "join":
                        if (left == string.Empty)
                        {
                            player.SendInfo("Usage: /party join <username>");
                            return false;
                        }
                        Player target = player.Owner.GetUniqueNamedPlayer(left);
                        if(target == null)
                        {
                            player.SendInfo("Player not found.");
                            return false;
                        }
                        if(target.Party == null)
                        {
                            player.SendInfo("Player is not in a party.");
                            return false;
                        }
                        if(target.Party.Leader != target)
                        {
                            player.SendInfo("You can only join the leader of the party.");
                            return false;
                        }
                        if(!target.Party.Invitations.Contains(player.AccountId))
                        {
                            player.SendInfo("You must be invited to join a party.");
                            return false;
                        }
                        if (player.Party != null)
                            if (player.Party.Leader == player)
                                player.Party.Disband();
                            else
                                player.Party.RemoveMember(player);
                        target.Party.AddMember(player);
                        break;
                    case "invite":
                        if (left == string.Empty)
                        {
                            player.SendInfo("Usage: /party invite <username>");
                            return false;
                        }
                        if(inParty && !leader)
                        {
                            player.SendInfo("You must be the leader of a party to invite others.");
                            return false;
                        }
                        if(!inParty)
                        {
                            player.Party = new Party(player);
                            player.UpdateCount++;
                            inParty = true;
                        }
                        Player target2 = player.Owner.GetUniqueNamedPlayer(left);
                        if (target2 == null)
                        {
                            player.SendInfo("Player not found.");
                            return false;
                        }
                        if (player.Owner.Id == World.VIPLOUNGE || target2.Owner.Id == World.VIPLOUNGE)
                            return false;
                        if (target2.Client == null)
                        {
                            player.SendError("Player no longer exists!");
                            return false;
                        }
                        if(target2.Party == player.Party)
                        {
                            player.SendInfo("Player is already in your party.");
                            return false;
                        }
                        if (!player.Party.Invitations.Contains(target2.AccountId))
                            player.Party.Invitations.Add(target2.AccountId);
                        player.Party.SendPacket(new TextPacket
                        {
                            BubbleTime = 0,
                            Stars = -1,
                            Name = "",
                            Recipient = "*Party*",
                            Text = target2.Name + " was invited to the party"
                        }, null);
                        target2.Client.SendPacket(new InvitedToPartyPacket
                        {
                            Name = player.Name,
                            PartyID = player.Party.ID
                        });
                        break;
                    case "kick":
                        if(left == string.Empty)
                        {
                            player.SendInfo("Usage: /party kick <username>");
                            return false;
                        }
                        if(!inParty || !leader)
                        {
                            player.SendInfo("You must be the leader of a party to kick others.");
                            return false;
                        }
                        Player target3 = player.Owner.GetUniqueNamedPlayer(left);
                        if (target3 == null)
                        {
                            player.SendInfo("Player not found.");
                            return false;
                        }
                        if (target3.Party != player.Party)
                        {
                            player.SendInfo("Player must be in your party.");
                            return false;
                        }
                        player.Party.SendPacket(new TextPacket
                        {
                            BubbleTime = 0,
                            Stars = -1,
                            Name = "",
                            Recipient = "*Party*",
                            Text = target3.Name + " was kicked from the party"
                        }, null);
                        player.Party.RemoveMember(target3);
                        break;
                    case "disband":
                    case "leave":
                        if(!inParty)
                        {
                            player.SendInfo("You are not in a party.");
                            return false;
                        }
                        if (player.Party.Leader == player)
                            player.Party.Disband();
                        else
                            player.Party.RemoveMember(player);
                        break;
                    case "chat":
                        if(left.Trim() == string.Empty)
                        {
                            player.SendInfo("Usage: /party chat <message> or /p <message>");
                            return false;
                        }
                        if(!inParty)
                        {
                            player.SendInfo("You are not in a party.");
                            return false;
                        }
                        player.Manager.Chat.SayParty(player, left.ToSafeText());
                        break;
                    case "help":
                        player.SendHelp("Party commands:\n[/party join <username>]: accept a party invite\n[/party invite <username>]: invite a player to your party (leader only)\n[/party kick <username>]: kick a user from your party (leader only)\n[/party leave]: leave your current party\n[/party chat <message>]: send a message to your party");
                        break;
                    default:
                        player.SendInfo("Invalid command!");
                        player.SendInfo("Type \"/party help\" for commands.");
                        break;
                }
            }
            else
            {
                if(player.Party == null)
                {
                    player.SendInfo("You are not in a party!");
                    player.SendInfo("Type \"/party help\" for commands.");
                    return false;
                }
                player.SendInfo("Party Leader:\n " + player.Party.Leader.Name);
                List<string> members = new List<string>();;
                foreach(var i in player.Party.Members)
                    members.Add(i.Name);
                player.SendInfo("Party Members:\n " + (members.Count > 0 ? string.Join(", ", members.ToArray()) : "None"));
                player.SendInfo("Type \"/party help\" for commands.");
            }
            return true;
        }
    }

    internal class PartyChatCommand : Command
    {
        public PartyChatCommand() : base("p") { }

        protected override bool Process(Player player, RealmTime time, string args)
        {
            if (args.Trim() == string.Empty)
            {
                player.SendInfo("Usage: /party chat <message> or /p <message>");
                return false;
            }
            if (player.Party == null)
            {
                player.SendInfo("You are not in a party.");
                return false;
            }
            player.Manager.Chat.SayParty(player, args.ToSafeText());
            return true;
        }
    }
}