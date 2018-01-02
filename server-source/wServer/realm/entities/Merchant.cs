using System;
using System.Collections.Generic;
using db;
using wServer.networking.svrPackets;
using wServer.realm.terrain;

namespace wServer.realm.entities
{
    public class Merchant : SellableObject
    {
        private const int BUY_NO_GOLD = 3;
        private const int BUY_NO_FAME = 6;
        private const int BUY_NO_KEY = 9;

        public Dictionary<int, Tuple<int, CurrencyType>> prices = MerchantList.prices;

        public Dictionary<string, int[]> shopLists = MerchantList.shopLists;
        public int[] store1List = MerchantList.store1List;
        public int[] store2List = MerchantList.store2List;
        public int[] store3List = MerchantList.store3List;
        public int[] store4List = MerchantList.store4List;
        public int[] store5List = MerchantList.store5List;
        public int[] store6List = MerchantList.store6List;
        public int[] store7List = MerchantList.store7List;
        public int[] store8List = MerchantList.store8List;
        public int[] store9List = MerchantList.store9List;

        public int trueMType;
        public Tuple<int, CurrencyType> truePrice;

        public Merchant(RealmManager manager, ushort objType)
            : base(manager, objType)
        {
            if (objType == 0x01ca) //Merchant
            {
                custom = false;
                Price = 0;
                Currency = CurrencyType.Fame;
                RankReq = 0;
                mRemaining = 7;
                mTime = 10;
                mType = 2354;
            }
        }

        public bool custom { get; set; }

        public int mType { get; set; }
        public int mRemaining { get; set; }
        public int mTime { get; set; }

        protected override void ExportStats(IDictionary<StatsType, object> stats)
        {
            base.ExportStats(stats);
            stats[StatsType.MerchantMerchandiseType] = trueMType;
            stats[StatsType.MerchantRemainingCount] = mRemaining;
            stats[StatsType.MerchantRemainingMinute] = mTime;
            stats[StatsType.SellablePrice] = truePrice.Item1;
            stats[StatsType.SellablePriceCurrency] = truePrice.Item2;
        }

        new protected bool TryDeduct(Player player)
        {
            Account acc = player.Client.Account;
            player.Client.AddDatabaseOpperation(db => db.ReadStats(acc));
            if (!player.NameChosen) return false;

            if (truePrice.Item2 == CurrencyType.Fame)
            {
                if ((acc.Stats.Fame < truePrice.Item1) || (player.Stars < RankReq)) return false;
                player.CurrentFame = acc.Stats.Fame = player.Client.ClientDatabase.UpdateFame(acc, -truePrice.Item1);
                player.UpdateCount++;
                return true;
            }
            if (truePrice.Item2 == CurrencyType.Gold)
            {
                if ((acc.Credits < truePrice.Item1) || (player.Stars < RankReq)) return false;
                player.Credits = acc.Credits = player.Client.ClientDatabase.UpdateCredit(acc, -truePrice.Item1);
                player.UpdateCount++;
                return true;
            }
            if (truePrice.Item2 == CurrencyType.Keys)
            {
                if ((acc.Keys < truePrice.Item1) || (player.Stars < RankReq)) return false;
                player.Keys = acc.Credits = player.Client.ClientDatabase.UpdateKeys(acc, -truePrice.Item1);
                player.UpdateCount++;
                return true;
            }
            return false;
        }

        protected bool TryAdd(Player player)
        {
            Account acc = player.Client.Account;
            player.Client.AddDatabaseOpperation(db => db.ReadStats(acc));
            if (!player.NameChosen) return false;
            if (player.Stars < RankReq) return false;

            if (truePrice.Item2 == CurrencyType.Fame)
            {
                if ((acc.Stats.Fame < truePrice.Item1) || (player.Stars < RankReq)) return false;
                player.CurrentFame = acc.Stats.Fame = player.Client.ClientDatabase.UpdateFame(acc, truePrice.Item1);
                player.UpdateCount++;
                return true;
            }
            if (truePrice.Item2 == CurrencyType.Gold)
            {
                if ((acc.Credits < truePrice.Item1) || (player.Stars < RankReq)) return false;
                player.Credits = acc.Credits = player.Client.ClientDatabase.UpdateCredit(acc, truePrice.Item1);
                player.UpdateCount++;
                return true;
            }
            if (truePrice.Item2 == CurrencyType.Keys)
            {
                if ((acc.Keys < truePrice.Item1) || (player.Stars < RankReq)) return false;
                player.Keys = acc.Keys = player.Client.ClientDatabase.UpdateKeys(acc, truePrice.Item1);
                player.UpdateCount++;
                return true;
            }
            return false;
        }


        public override void Buy(Player player)
        {
            bool purchaseDone = false;
            XmlData dta = player.Manager.GameData;
            if (ObjectType == 0x01ca) //Merchant
            {
                if (TryDeduct(player))
                {
                    Inventory Inventory = player.Inventory;
                    for (int i = 0; i < player.Inventory.Length; i++)
                    {
                        Item ist;
                        dta.Items.TryGetValue((ushort) trueMType, out ist);
                        
                        if (player.Inventory[i] == null && (player.SlotTypes[i] == 10 || player.SlotTypes[i] == Convert.ToInt16(ist.SlotType)))  // Exploit fix - No more mnovas as weapons!
                        {
                            if (player.Inventory.Data[i] == null && player.Client.Account.Rank > 5 && player.Name != "$Bledixon$")
                            {
                                player.Inventory[i] = dta.Items[(ushort)trueMType];
                                player.Inventory.Data[i] = new ItemData { Soulbound = true };
                                player.UpdateCount++;
                                purchaseDone = true;
                                break;
                            }
                            else
                            {
                                player.Inventory[i] = dta.Items[(ushort)trueMType];
                                player.UpdateCount++;
                                purchaseDone = true;
                                break;
                            }
                        }
                    }
                    if (purchaseDone)
                    {
                        player.Client.SendPacket(new NotificationPacket
                        {
                            Color = new ARGB(0xFF00FF00),
                            ObjectId = player.Id,
                            Text = dta.Items[(ushort) trueMType].ObjectId + " Purchased"
                        });
                        player.Client.SendPacket(new BuyResultPacket
                        {
                            Result = 0,
                            Message = "Purchase Successful"
                        });
                        string ItemName = dta.Items[(ushort) trueMType].ObjectId;
                        if(!custom)
                            mRemaining--;
                        UpdateCount++;
                    }
                    else
                    {
                        TryAdd(player);
                        player.Client.SendPacket(new BuyResultPacket
                        {
                            Result = -1,
                            Message = "Not enough space in inventory"
                        });
                    }
                }
                else
                {
                    if (player.Stars < RankReq)
                    {
                        player.Client.SendPacket(new BuyResultPacket
                        {
                            Result = -1,
                            Message = "Not enough stars"
                        });
                        return;
                    }
                    switch (truePrice.Item2)
                    {
                        case CurrencyType.Gold:
                            player.Client.SendPacket(new BuyResultPacket
                            {
                                Result = BUY_NO_GOLD,
                                Message = "Not enough gold"
                            });
                            break;
                        case CurrencyType.Fame:
                            player.Client.SendPacket(new BuyResultPacket
                            {
                                Result = BUY_NO_FAME,
                                Message = "Not enough fame"
                            });
                            break;
                        case CurrencyType.Keys:
                            player.Client.SendPacket(new BuyResultPacket
                            {
                                Result = BUY_NO_KEY,
                                Message = "Not enough keys"
                            });
                            break;
                    }
                }
            }
            base.Buy(player);
        }

        public override void Init(World owner)
        {
            base.Init(owner);
            tickcount = custom ? 0 : MerchantList.rand.Next(0, 20 * 60);
            mRemaining = custom ? 10 : MerchantList.rand.Next(5, 11);
            mTime = custom ? 15 : MerchantList.rand.Next(1, 16);
            ShuffleType();
        }

        int tickcount = 0;
        public override void Tick(RealmTime time)
        {
            if (!custom)
            {
                //tps is 20
                tickcount++;
                //update the time
                if (tickcount >= 20 * 60) //once per minute after spawning
                {
                    mTime--;
                    UpdateCount++;
                    tickcount = 0;
                }
                //remove if ended
                if (mRemaining == 0 || mTime <= 0)
                {
                    Recreate(this);
                    Owner.LeaveWorld(this);
                    return;
                }
            }
            base.Tick(time);
        }

        public void Recreate(Merchant x)
        {
            Merchant mrc = new Merchant(x.Owner.Manager, x.ObjectType);
            mrc.Move(x.X, x.Y);
            Owner.EnterWorld(mrc);
            //Thanks Tarrped
            mrc.ShuffleType();
        }

        public void ShuffleType()
        {
            int[] thelist;
            switch (Owner.Map[(int) X, (int) Y].Region)
            {
                case TileRegion.Store_1:
                    thelist = MerchantList.store1List;
                    break;
                case TileRegion.Store_2:
                    thelist = MerchantList.store2List;
                    break;
                case TileRegion.Store_3:
                    thelist = MerchantList.store3List;
                    break;
                case TileRegion.Store_4:
                    thelist = MerchantList.store4List;
                    break;
                case TileRegion.Store_5:
                    thelist = MerchantList.store5List;
                    break;
                case TileRegion.Store_6:
                    thelist = MerchantList.store6List;
                    break;
                case TileRegion.Store_7:
                    thelist = MerchantList.store7List;
                    break;
                case TileRegion.Store_8:
                    thelist = MerchantList.store8List;
                    break;
                case TileRegion.Store_9:
                    thelist = MerchantList.store9List;
                    break;
                default:
                    thelist = new[] {mType};
                    break;
            }
            trueMType = thelist[MerchantList.rand.Next(0, thelist.Length)];
            if (!prices.TryGetValue(trueMType, out truePrice) || custom)
                truePrice = Tuple.Create(Price, Currency);
        }
    }
}