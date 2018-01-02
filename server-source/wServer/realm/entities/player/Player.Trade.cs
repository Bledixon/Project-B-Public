#region

using db;
using System;
using System.Collections.Generic;
using System.Linq;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;

#endregion

namespace wServer.realm.entities
{
    partial class Player
    {
        private readonly bool[] inUse = new bool[12];
        private readonly List<string> itemsNeeded = new List<string>();
        private readonly Dictionary<Player, int> potentialTrader = new Dictionary<Player, int>();
        public int itemnumber1;
        public int itemnumber2;
        public bool taking;
        public bool[] trade;
        public bool tradeAccepted;
        public Player tradeTarget;

        public static string items1 { get; set; }

        public static string items2 { get; set; }

        public void RequestTrade(RealmTime time, RequestTradePacket pkt)
        {
            if (!NameChosen)
            {
                SendInfo("Unique name is required to trade with others!");
                return;
            }
            Player target = Owner.GetUniqueNamedPlayer(pkt.Name);
            if (tradeTarget != null)
            {
                SendError("You're already trading!");
                tradeTarget = null;
                return;
            }

            if (target.Ignored.Contains(client.Account.AccountId))
            {
                SendError("This person has ignored you!");
                tradeTarget = null;
                return;
            }

            if (client.Player == target)
            {
                SendError("Trading with yourself would be pointless.");
                tradeTarget = null;
                return;
            }
            if (!target.IsValid())
            {
                SendError("Player not found!");
                return;
            }
            if (target.tradeTarget != null && target.tradeTarget != this)
            {
                SendError(target.Name + " is already trading!");
                return;
            }

            if (potentialTrader.ContainsKey(target))
            {
                tradeTarget = target;
                trade = new bool[12];
                tradeAccepted = false;
                target.tradeTarget = this;
                target.trade = new bool[12];
                target.tradeAccepted = false;
                potentialTrader.Clear();
                target.potentialTrader.Clear();
                taking = false;

                TradeItem[] my = new TradeItem[Inventory.Length];
                for (int i = 0; i < Inventory.Length; i++)
                    my[i] = new TradeItem
                    {
                        Item = Inventory[i] == null ? -1 : Inventory[i].ObjectType,
                        Data = Inventory.Data[i] ?? new ItemData(),
                        SlotType = SlotTypes[i],
                        Included = false,
                        Tradeable = (Inventory[i] != null && i >= 4) && (!Inventory[i].Soulbound) && (!Inventory[i].AdminOnly) && (Inventory.Data[i] == null || !Inventory.Data[i].Soulbound)
                    };
                TradeItem[] your = new TradeItem[target.Inventory.Length];
                for (int i = 0; i < target.Inventory.Length; i++)
                    your[i] = new TradeItem
                    {
                        Item = target.Inventory[i] == null ? -1 : target.Inventory[i].ObjectType,
                        Data = target.Inventory.Data[i] ?? new ItemData(),
                        SlotType = target.SlotTypes[i],
                        Included = false,
                        Tradeable = (target.Inventory[i] != null && i >= 4) && (!target.Inventory[i].Soulbound) && (!target.Inventory[i].AdminOnly) && (target.Inventory.Data[i] == null || !target.Inventory.Data[i].Soulbound)
                    };

                client.SendPacket(new TradeStartPacket
                {
                    MyItems = my,
                    YourName = target.Name,
                    YourItems = your
                });
                target.client.SendPacket(new TradeStartPacket
                {
                    MyItems = your,
                    YourName = Name,
                    YourItems = my
                });
            }
            else
            {
                target.potentialTrader[this] = 1000 * 20;
                target.client.SendPacket(new TradeRequestedPacket
                {
                    Name = Name
                });
                SendInfo("Sent trade request to " + target.Name);
            }
        }

        public bool usable(int slot, string[] needed)
        {
            if (inUse[slot])
                return false;
            if (Inventory[slot] == null)
                return false;

            for (int i = 0; i < needed.Length; i++)
            {
                if (Inventory[slot].ObjectId != needed[i])
                {
                    if (i == needed.Length)
                        return false;
                }
                else
                {
                    inUse[slot] = true;
                    itemsNeeded.RemoveAt(i);
                    return true;
                }
            }
            return false;
        }

        public void ChangeTrade(RealmTime time, ChangeTradePacket pkt)
        {
            if (trade != pkt.Offers)
            {
                tradeAccepted = false;
                tradeTarget.tradeAccepted = false;
                trade = pkt.Offers;

                for (int i = 0; i < pkt.Offers.Length; i++)
                {
                    if (pkt.Offers[i])
                        if (Inventory[i].Soulbound || Inventory[i].AdminOnly)
                            trade[i] = false;
                        else
                            trade[i] = true;
                }

                tradeTarget.client.SendPacket(new TradeChangedPacket
                {
                    Offers = trade
                });
            }
        }

        public void AcceptTrade(RealmTime time, AcceptTradePacket pkt)
        {
            trade = pkt.MyOffers;
            if (tradeTarget.trade.SequenceEqual(pkt.YourOffers))
            {
                tradeTarget.trade = pkt.YourOffers;
                tradeAccepted = true;
                tradeTarget.client.SendPacket(new TradeAcceptedPacket
                {
                    MyOffers = tradeTarget.trade,
                    YourOffers = trade
                });
                log.InfoFormat("Player {0} accepted trade with {1}", Name, tradeTarget.Name);
            }
        }

        public void CancelTrade()
        {
            {
                client.SendPacket(new TradeDonePacket
                {
                    Result = 1,
                    Message = "Trade cancelled."
                });
                tradeTarget.client.SendPacket(new TradeDonePacket
                {
                    Result = 1,
                    Message = "Trade cancelled."
                });
                tradeTarget.tradeTarget = null;
                tradeTarget.trade = null;
                tradeTarget.tradeAccepted = false;
                tradeTarget.UpdateCount++;
                tradeTarget = null;
                trade = null;
                tradeAccepted = false;
                UpdateCount++;
            }
        }

        private void TradeTick(RealmTime time)
        {
            if (trade != null)
                if (taking == false)
                    if (tradeTarget != null)
                        if (tradeAccepted && tradeTarget.tradeAccepted)
                            if (tradeTarget != null && Owner != null && tradeTarget.Owner != null && Owner == tradeTarget.Owner)
                                DoTrade();
                            else
                            {
                                tradeTarget.tradeTarget = null;
                                tradeTarget.trade = null;
                                tradeTarget.tradeAccepted = false;
                                tradeTarget = null;
                                trade = null;
                                tradeAccepted = false;
                                return;
                            }
            CheckTradeTimeout(time);
        }

        private void CheckTradeTimeout(RealmTime time)
        {
            List<Tuple<Player, int>> newState =
                potentialTrader.Select(i => new Tuple<Player, int>(i.Key, i.Value - time.thisTickTimes)).ToList();

            foreach (Tuple<Player, int> i in newState)
            {
                if (i.Item2 < 0)
                {
                    {
                        i.Item1.SendError("Trade to " + Name + " has timed out!");
                    }
                    potentialTrader.Remove(i.Item1);
                }
                else potentialTrader[i.Item1] = i.Item2;
            }
        }

        private void DoTrade()
        {
            if (this.IsValid() && tradeTarget.IsValid() && this.Owner == tradeTarget.Owner)
            {
                int thisemptyslots = 0;
                int targetemptyslots = 0;
                var thisItems = new List<Item>();
                var thisDatas = new List<ItemData>();
                for (int i = 0; i < trade.Length; i++)
                    if (trade[i])
                    {
                        thisItems.Add(Inventory[i]);
                        thisDatas.Add(Inventory.Data[i]);
                        Inventory[i] = null;
                        Inventory.Data[i] = null;
                        UpdateCount++;
                        if (itemnumber1 == 0)
                        {
                            try
                            {
                                items1 = items1 + " " + thisItems[itemnumber1].ObjectId;
                            }
                            catch (Exception e)
                            {
                                client.SendPacket(new TradeDonePacket
                                {
                                    Result = 1,
                                    Message = "Error."
                                });
                                log.Error(e);
                            }
                        }
                        else if (itemnumber1 > 0)
                        {
                            items1 = items1 + ", " + thisItems[itemnumber1].ObjectId;
                        }
                        itemnumber1++;
                    }

                var targetItems = new List<Item>();
                var targetDatas = new List<ItemData>();
                for (int i = 0; i < tradeTarget.trade.Length; i++)
                    if (tradeTarget.trade[i])
                    {
                        targetItems.Add(tradeTarget.Inventory[i]);
                        targetDatas.Add(tradeTarget.Inventory.Data[i]);
                        tradeTarget.Inventory[i] = null;
                        tradeTarget.Inventory.Data[i] = null;
                        tradeTarget.UpdateCount++;

                        if (itemnumber2 == 0)
                        {
                            try
                            {
                                items2 = items2 + " " + targetItems[itemnumber2].ObjectId;
                            }
                            catch (Exception e)
                            {
                                client.SendPacket(new TradeDonePacket
                                {
                                    Result = 1,
                                    Message = "Error."
                                });
                                log.Error(e);
                            }
                        }
                        else if (itemnumber2 > 0)
                        {
                            items2 = items2 + ", " + targetItems[itemnumber2].ObjectId;
                        }
                        itemnumber2++;
                    }

                for (int i = 0; i != Inventory.Length; i++)
                {
                    if (Inventory[i] == null)
                    {
                        if (SlotTypes[i] == 10)
                        {
                            thisemptyslots++;
                        }
                        else
                        {
                            for (int j = 0; j < targetItems.Count; j++)
                            {
                                if (targetItems[j].SlotType == SlotTypes[i])
                                {
                                    thisemptyslots++;
                                    break;
                                }
                            }
                        }
                    }
                }
                for (int i = 0; i != tradeTarget.Inventory.Length; i++)
                {
                    if (SlotTypes[i] == 10)
                    {
                        targetemptyslots++;
                    }
                    else
                    {
                        for (int j = 0; j < thisItems.Count; j++)
                        {
                            try
                            {
                                if (thisItems[j].SlotType == SlotTypes[i])
                                {
                                    targetemptyslots++;
                                    break;
                                }
                            }
                            catch (Exception e)
                            {
                                client.SendPacket(new TradeDonePacket
                                {
                                    Result = 1,
                                    Message = "Error."
                                });
                                log.Error(e);
                            }
                        }
                    }
                }
                if (targetemptyslots >= thisItems.Count && thisemptyslots >= targetItems.Count)
                {
                    if (tradeTarget.Owner.Id != Owner.Id)
                        return;

                    if (targetItems.Count == 0)
                    {
                        targetItems.Add(null);
                        targetDatas.Add(null);
                    }
                    if (thisItems.Count == 0)
                    {
                        thisItems.Add(null);
                        thisDatas.Add(null);
                    }
                    for (int i = 0; i < Inventory.Length; i++) //put items by slotType
                        if (Inventory[i] == null)
                        {
                            if (SlotTypes[i] == 10)
                            {
                                Inventory[i] = targetItems[0];
                                Inventory.Data[i] = targetDatas[0];
                                targetItems.RemoveAt(0);
                                targetDatas.RemoveAt(0);
                                client.Save();
                            }
                            else
                            {
                                int itmIdx = -1;
                                for (int j = 0; j < targetItems.Count; j++)
                                {
                                    try
                                    {
                                        if (targetItems[j].SlotType == SlotTypes[i] && targetItems[j].LevelRequirement <= Level)
                                        {
                                            itmIdx = j;
                                            break;
                                        }
                                    }
                                    catch
                                    {
                                        itmIdx = -1;
                                    }
                                }
                                if (itmIdx != -1)
                                {
                                    Inventory[i] = targetItems[itmIdx];
                                    Inventory.Data[i] = targetDatas[itmIdx];
                                    targetItems.RemoveAt(itmIdx);
                                    targetDatas.RemoveAt(itmIdx);
                                    client.Save();
                                }
                            }
                            if (targetItems.Count == 0) break;
                        }

                    for (int i = 0; i < tradeTarget.Inventory.Length; i++) //put items by slotType
                        if (tradeTarget.Inventory[i] == null)
                        {
                            if (tradeTarget.SlotTypes[i] == 10)
                            {
                                tradeTarget.Inventory[i] = thisItems[0];
                                tradeTarget.Inventory.Data[i] = thisDatas[0];
                                thisItems.RemoveAt(0);
                                thisDatas.RemoveAt(0);
                                tradeTarget.client.Save();
                            }
                            else
                            {
                                int itmIdx = -1;
                                for (int j = 0; j < thisItems.Count; j++)
                                {
                                    try
                                    {
                                        if (thisItems[j].SlotType == tradeTarget.SlotTypes[i] && thisItems[i].LevelRequirement <= tradeTarget.Level)
                                        {
                                            itmIdx = j;
                                            break;
                                        }
                                    }
                                    catch
                                    {
                                        itmIdx = -1;
                                    }
                                }
                                if (itmIdx != -1)
                                {
                                    tradeTarget.Inventory[i] = thisItems[itmIdx];
                                    tradeTarget.Inventory.Data[i] = thisDatas[itmIdx];
                                    thisItems.RemoveAt(itmIdx);
                                    thisDatas.RemoveAt(itmIdx);
                                    tradeTarget.client.Save();
                                }
                            }
                            if (thisItems.Count == 0) break;
                        }

                    client.Player.SendError("Saving Trade.. Please wait");
                    tradeTarget.client.Player.SendError("Saving Trade.. Please wait");

                    client.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = "Trade successful!"
                    });
                    client.Save();

                    tradeTarget.client.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = "Trade successful!"
                    });
                    tradeTarget.client.Save();

                    items1 = "";
                    items2 = "";
                    itemnumber1 = 0;
                    itemnumber2 = 0;

                    tradeTarget.tradeTarget = null;
                    tradeTarget.trade = null;
                    tradeTarget.tradeAccepted = false;
                    tradeTarget = null;
                    trade = null;
                    tradeAccepted = false;
                }
                else
                {
                    client.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = "Exploit Halted! You have been logged."
                    });
                    tradeTarget.client.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = "Exploit Halted! You have been logged."
                    });
                    items1 = "";
                    items2 = "";
                    itemnumber1 = 0;
                    itemnumber2 = 0;
                    UpdateCount++;
                    tradeTarget.UpdateCount++;
                    tradeTarget.tradeTarget = null;
                    tradeTarget.trade = null;
                    tradeTarget.tradeAccepted = false;
                    tradeTarget = null;
                    trade = null;
                    tradeAccepted = false;
                }
            }
            else
            {
                if (this != null)
                {
                    client.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = "Exploit Halted! You have been logged."
                    });
                }
                if (tradeTarget != null)
                {
                    tradeTarget.client.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = "Exploit Halted! You have been logged."
                    });
                }
                items1 = "";
                items2 = "";
                itemnumber1 = 0;
                itemnumber2 = 0;
                UpdateCount++;
                tradeTarget.UpdateCount++;
                tradeTarget.tradeTarget = null;
                tradeTarget.trade = null;
                tradeTarget.tradeAccepted = false;
                tradeTarget = null;
                trade = null;
                tradeAccepted = false;
            }
        }
    }
}