using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.realm
{
    public class TradeManager
    {
        private static ILog log = LogManager.GetLogger(typeof(TradeManager));

        public static List<KeyValuePair<Player, Player>> CurrentRequests { get { return _currentTradeRequests; } }
        [ThreadStatic]
        private static readonly List<KeyValuePair<Player, Player>> _currentTradeRequests = new List<KeyValuePair<Player, Player>>();

        public static List<Player> TradingPlayers { get { return _tradingPlayers; } }
        [ThreadStatic]
        private static readonly List<Player> _tradingPlayers = new List<Player>();

        private readonly Player player1, player2;

        private bool player1Accept;
        private bool player2Accept;
        private bool finished;

        private readonly bool[] player1Trades;
        private readonly bool[] player2Trades;

        public TradeManager(Player player1, Player player2)
        {
            this.player1Trades = new bool[12];
            this.player2Trades = new bool[12];
            this.player1 = player1;
            this.player2 = player2;
            TradingPlayers.Add(player1);
            TradingPlayers.Add(player2);
            if (CurrentRequests.Contains(new KeyValuePair<Player, Player>(player1, player2)))
                CurrentRequests.Remove(new KeyValuePair<Player, Player>(player1, player2));
            if (CurrentRequests.Contains(new KeyValuePair<Player, Player>(player2, player1)))
                CurrentRequests.Remove(new KeyValuePair<Player, Player>(player2, player1));
        }

        public void TradeChanged(Player sender, bool[] changes)
        {
            if (sender == player1)
            {
                if (changes != player1Trades)
                {
                    ResetAccept();

                    for (int i = 0; i < changes.Length; i++)
                    {
                        if (sender.Inventory[i] != null)
                        {
                            if (sender.Inventory[i].Soulbound || i < 4)
                                player1Trades[i] = false;
                            else
                                player1Trades[i] = changes[i];
                        }
                        else
                            player1Trades[i] = false;
                    }
                    player2.Client.SendPacket(new TradeChangedPacket { Offers = player1Trades });
                }
            }
            else
            {
                if (changes != player2Trades)
                {
                    ResetAccept();

                    for (int i = 0; i < changes.Length; i++)
                    {
                        if (sender.Inventory[i] != null)
                        {
                            if (sender.Inventory[i].Soulbound || i < 4)
                                player2Trades[i] = false;
                            else
                                player2Trades[i] = changes[i];
                        }
                        else
                            player2Trades[i] = false;
                    }
                    player1.Client.SendPacket(new TradeChangedPacket { Offers = player2Trades });
                }
            }
        }

        public void CancelTrade(Player sender)
        {
            if (sender == player1)
            {
                player2.Client.SendPacket(new TradeDonePacket
                {
                    Result = 1,
                    Message = sender.Name + "cancelled the trade."
                });
            }
            else
            {
                player1.Client.SendPacket(new TradeDonePacket
                {
                    Result = 1,
                    Message = sender.Name + "cancelled the trade."
                });
            }

            TradingPlayers.Remove(player1);
            TradingPlayers.Remove(player2);
        }

        public void AcceptTrade(Player sender, AcceptTradePacket pkt)
        {
            if (sender == player1)
            {
                if (pkt.MyOffers.SequenceEqual(player1Trades) && pkt.YourOffers.SequenceEqual(player2Trades))
                {
                    player2.Client.SendPacket(new TradeAcceptedPacket
                    {
                        MyOffers = player2Trades,
                        YourOffers = player1Trades
                    });
                    player1Accept = true;
                }
            }
            else
            {
                if (pkt.MyOffers.SequenceEqual(player2Trades) && pkt.YourOffers.SequenceEqual(player1Trades))
                {
                    player1.Client.SendPacket(new TradeAcceptedPacket
                    {
                        MyOffers = player1Trades,
                        YourOffers = player2Trades
                    });
                    player2Accept = true;
                }
            }

            if (player1Accept && player2Accept)
                Trade();
        }

        public void Tick(RealmTime time)
        {
            try
            {
                if (!finished)
                {
                    if (player1.Owner == null)
                    {
                        player2.Client.SendPacket(new TradeDonePacket
                        {
                            Result = 1,
                            Message = "Other player left the trade."
                        });
                        finished = true;
                        TradingPlayers.Remove(player1);
                        TradingPlayers.Remove(player2);
                    }
                    else if (player2.Owner == null)
                    {
                        player1.Client.SendPacket(new TradeDonePacket
                        {
                            Result = 1,
                            Message = "Other player left the trade."
                        });
                        finished = true;
                        TradingPlayers.Remove(player1);
                        TradingPlayers.Remove(player2);
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error(ex);
            }
        }

        private void Trade()
        {
            if (!InventoryFull())
            {
                List<Item> toTakeFromPlayer1 = new List<Item>();
                List<Item> toTakeFromPlayer2 = new List<Item>();

                for (int i = 0; i < player1Trades.Length; i++)
                {
                    if (player1Trades[i])
                    {
                        toTakeFromPlayer1.Add(player1.Inventory[i]);
                        player1.Inventory[i] = null;
                    }
                }

                for (int i = 0; i < player2Trades.Length; i++)
                {
                    if (player2Trades[i])
                    {
                        toTakeFromPlayer2.Add(player2.Inventory[i]);
                        player2.Inventory[i] = null;
                    }
                }

                for (int i = 0; i < 12; i++)
                {
                    if (player1.Inventory[i] == null)
                    {
                        foreach (var item in toTakeFromPlayer2)
                        {
                            if (player1.SlotTypes[i] != 10 && player1.SlotTypes[i] != item.SlotType) continue;
                            else
                            {
                                player1.Inventory[i] = item;
                                toTakeFromPlayer2.Remove(item);
                                break;
                            }
                        }
                    }
                }

                for (int i = 0; i < 12; i++)
                {
                    if (player2.Inventory[i] == null)
                    {
                        foreach (var item in toTakeFromPlayer1)
                        {
                            if (player2.SlotTypes[i] != 10 && player2.SlotTypes[i] != item.SlotType) continue;
                            else
                            {
                                player2.Inventory[i] = item;
                                toTakeFromPlayer1.Remove(item);
                                break;
                            }
                        }
                    }
                }

                TradeDone();
            }
            else
                TradeError();
        }

        private void TradeError()
        {
            TradeDonePacket packet = new TradeDonePacket
            {
                Result = 1,
                Message = "Trade Error"
            };

            finished = true;
            TradingPlayers.Remove(player1);
            TradingPlayers.Remove(player2);

            player1.Client.SendPacket(packet);
            player2.Client.SendPacket(packet);
        }

        private void TradeDone()
        {
            TradeDonePacket packet = new TradeDonePacket
            {
                Result = 1,
                Message = "Trade Successful"
            };

            player1.Client.SendPacket(packet);
            player2.Client.SendPacket(packet);

            player1.UpdateCount++;
            player2.UpdateCount++;

            TradingPlayers.Remove(player1);
            TradingPlayers.Remove(player2);
            finished = true;
        }

        private bool InventoryFull()
        {
            return (player1.Inventory.Count(_ => _ == null) > player2Trades.Length) && (player2.Inventory.Count(_ => _ == null) > player1Trades.Length);
        }

        private void ResetAccept()
        {
            player1Accept = false;
            player2Accept = false;
        }
    }
}