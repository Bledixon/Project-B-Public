using db;
using System.Collections.Generic;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class MarketTradePacketHandler : PacketHandlerBase<MarketTradePacket>
    {
        public override PacketID ID
        {
            get { return PacketID.MarketTrade; }
        }

        protected override void HandlePacket(Client client, MarketTradePacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, t, packet.TradeId));
        }

        private void Handle(Player player, RealmTime time, int tradeId)
        {
            if (player.Owner == null) return;
            
            Offer offer = player.Client.ClientDatabase.GetOffer(tradeId, player.Client.Account);
            if (offer == null)
            {
                player.Client.SendPacket(new MarketTradeResultPacket
                {
                    Success = false,
                    ResultMessage = "Trade no longer exists"
                });
                return;
            }
            if (!offer.Mine)
            {
                if (offer.Status != 0)
                {
                    player.Client.SendPacket(new MarketTradeResultPacket
                    {
                        Success = false,
                        ResultMessage = "Must be trade owner to collect items"
                    });
                    return;
                }
                List<int> matchedSlots = new List<int>();
                for (int i = 0; i < offer.RequestItems.Length; i++)
                {
                    Item requestItem = player.Manager.GameData.Items[offer.RequestItems[i]];
                    ItemData requestData = offer.RequestData[i];
                    bool success = false;
                    for (int p = 0; p < player.Inventory.Length; p++)
                    {
                        if (matchedSlots.Contains(p) || player.Inventory[p] == null || player.Inventory[p] != requestItem)
                            continue;
                        Item myItem = player.Inventory[p];
                        ItemData myData = player.Inventory.Data[p];
                        if (myItem.Soulbound || (myData != null && myData.Soulbound))
                            continue;
                        if (requestData != null)
                        {
                            if (requestData.Strange && ((myData != null && !myData.Strange) || myData == null))
                                continue;
                            if (!requestData.Strange)
                                if ((myData != null && myData.NamePrefix != requestData.NamePrefix) || (requestData.NamePrefix != "" && myData == null))
                                    continue;
                            if ((myData != null && myData.Effect != requestData.Effect) || (requestData.Effect != "" && myData == null))
                                continue;
                        }
                        else if (myData != null)
                            if (myData.Strange || myData.NamePrefix != "" || myData.Effect != "")
                                continue;
                        success = true;
                        matchedSlots.Add(p);
                        break;
                    }
                    if (!success)
                    {
                        player.Client.SendPacket(new MarketTradeResultPacket
                        {
                            Success = false,
                            ResultMessage = "Invalid items for trade"
                        });
                        return;
                    }
                }
                int availableSlots = 0;
                for (int i = 4; i < player.Inventory.Length; i++)
                    if (player.Inventory[i] == null || matchedSlots.Contains(i))
                        availableSlots++;
                if (availableSlots < offer.OfferItems.Length)
                {
                    player.Client.SendPacket(new MarketTradeResultPacket
                    {
                        Success = false,
                        ResultMessage = "Not enough space for trade"
                    });
                    return;
                }
                else
                {
                    foreach (var i in matchedSlots)
                    {
                        player.Inventory[i] = null;
                        player.Inventory.Data[i] = null;
                        player.Client.Save();
                    }
                    Queue<ushort> retrievingItems = new Queue<ushort>(offer.OfferItems);
                    Queue<ItemData> retrievingData = new Queue<ItemData>(offer.OfferData);
                    for (int i = 4; i < player.Inventory.Length; i++)
                    {
                        if (player.Inventory[i] != null)
                            continue;
                        player.Inventory[i] = player.Manager.GameData.Items[retrievingItems.Dequeue()];
                        player.Inventory.Data[i] = retrievingData.Dequeue();
                        if (player.Inventory.Data[i] != null)
                            player.Inventory.Data[i].ResetStrange();
                        if (retrievingItems.Count == 0)
                            break;
                    }
                    player.Client.SendPacket(new MarketTradeResultPacket
                    {
                        Success = true,
                        ResultMessage = "Successfully completed trade"
                    });
                    player.Client.Save();
                    player.UpdateCount++;
                    foreach (var i in player.Client.Manager.Clients.Values)
                        if (i != null && i.Account != null && i.Player != null && i.Account.AccountId == offer.AccId)
                        {
                            i.SendPacket(new GlobalNotificationPacket
                            {
                                Text = "{\"type\": \"notif\", \"title\": \"Marketplace\", \"text\": \"A user has just purchased one of your open trades\"}"
                            });
                            i.Player.SendInfo("Marketplace: A user have just purchased one of your open trades");
                        }
                    player.Client.AddDatabaseOpperation(db => db.CloseOffer(tradeId, true));
                }
            }
            else if (offer.Status != 0)
            {
                int available = 0;
                for (int i = 4; i < player.Inventory.Length; i++)
                    if (player.Inventory[i] == null)
                        available++;
                if (available < (offer.Status == 1 ? offer.OfferItems.Length : offer.RequestItems.Length))
                    player.Client.SendPacket(new MarketTradeResultPacket
                    {
                        Success = false,
                        ResultMessage = "Not enough space to collect items"
                    });
                else
                {
                    Queue<ushort> retrievingItems = new Queue<ushort>(offer.Status == 1 ? offer.OfferItems : offer.RequestItems);
                    Queue<ItemData> retrievingData = new Queue<ItemData>(offer.Status == 1 ? offer.OfferData : offer.RequestData);
                    for (int i = 4; i < player.Inventory.Length; i++)
                    {
                        if (player.Inventory[i] != null)
                            continue;
                        player.Inventory[i] = player.Manager.GameData.Items[retrievingItems.Dequeue()];
                        player.Inventory.Data[i] = retrievingData.Dequeue();
                        if (player.Inventory.Data[i] != null)
                            player.Inventory.Data[i].ResetStrange();
                        if (retrievingItems.Count == 0)
                            break;
                    }
                    player.Client.SendPacket(new MarketTradeResultPacket
                    {
                        Success = true,
                        ResultMessage = "Successfully collected items"
                    });
                    player.UpdateCount++;
                    player.Client.AddDatabaseOpperation(db => db.DeleteOffer(tradeId));
                }
            }
            else
            {
                player.Client.SendPacket(new MarketTradeResultPacket
                {
                    Success = true,
                    ResultMessage = "Successfully closed trade"
                });
                player.Client.AddDatabaseOpperation(db => db.CloseOffer(tradeId, false));
            }
        }
    }
}