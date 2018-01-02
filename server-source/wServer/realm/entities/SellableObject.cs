using System.Collections.Generic;
using wServer.networking.svrPackets;
using wServer.realm.worlds;

namespace wServer.realm.entities
{
    public class SellableObject : StaticObject
    {
        private const int BUY_NO_GOLD = 3;
        private const int BUY_NO_FAME = 6;
        private const int BUY_NO_GUILD_FAME = 9;
        //private int nextLevel = 0;

        public SellableObject(RealmManager manager, ushort objType)
            : base(manager, objType, null, true, false, false)
        {
            if (objType == 0x0505) //Vault chest
            {
                Price = 100;
                Currency = CurrencyType.Fame;
                RankReq = 0;
            }
            else if (objType == 0x0736)
            {
                Currency = CurrencyType.GuildFame;
                Price = 10000;
                RankReq = 0;
            }
        }

        public int Price { get; set; }
        public CurrencyType Currency { get; set; }
        public int RankReq { get; set; }

        protected override void ExportStats(IDictionary<StatsType, object> stats)
        {
            stats[StatsType.SellablePrice] = Price;
            stats[StatsType.SellablePriceCurrency] = (int) Currency;
            stats[StatsType.SellableRankRequirement] = RankReq;
            base.ExportStats(stats);
        }

        protected bool TryDeduct(Player player)
        {
            Account acc = player.Client.Account;
            player.Client.AddDatabaseOpperation(db => db.ReadStats(acc));
            if (!player.NameChosen) return false;

            if (Currency == CurrencyType.Fame)
            {
                if (acc.Stats.Fame < Price) return false;
                player.CurrentFame = acc.Stats.Fame = player.Client.ClientDatabase.UpdateFame(acc, -Price);
                player.UpdateCount++;
                return true;
            }
            if (acc.Credits < Price) return false;
            player.Credits = acc.Credits = player.Client.ClientDatabase.UpdateCredit(acc, -Price);
            player.UpdateCount++;
            return true;
        }

        public virtual void Buy(Player player)
        {
            if (ObjectType == 0x0505) //Vault chest
            {
                if (TryDeduct(player))
                {
                    VaultChest chest;
                    chest = player.Client.ClientDatabase.CreateChest(player.Client.Account);
                    (Owner as Vault).AddChest(chest, this);
                    player.Client.SendPacket(new NotificationPacket
                    {
                        Color = new ARGB(0xFF00FF00),
                        ObjectId = player.Id,
                        Text = "Chest Purchased"
                    });
                    player.Client.SendPacket(new BuyResultPacket
                    {
                        Result = 0,
                        Message = "Purchase Successful"
                    });
                }
                else
                    player.Client.SendPacket(new BuyResultPacket
                    {
                        Result = BUY_NO_FAME,
                        Message = "Not enough fame"
                    });
            }
            if (ObjectType == 0x0736)
            {
                player.Client.SendPacket(new BuyResultPacket
                {
                    Result = 9,
                    Message = "Not enough guild fame"
                });
            }
        }
    }
}