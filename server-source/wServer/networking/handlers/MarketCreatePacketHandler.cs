using db;
using System.Collections.Generic;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class MarketCreatePacketHandler : PacketHandlerBase<MarketCreatePacket>
    {
        public override PacketID ID
        {
            get { return PacketID.MarketCreate; }
        }

        protected override void HandlePacket(Client client, MarketCreatePacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, t, packet.IncludedSlots, packet.RequestItems, packet.RequestDatas));
        }

        private void Handle(Player player, RealmTime time, int[] slots, int[] items, ItemData[] datas)
        {
            if (player.Owner == null || player.trade != null) return;
            
            if (slots.Length == 0 || items.Length == 0)
            {
                player.Client.SendPacket(new MarketTradeResultPacket
                {
                    Success = false,
                    ResultMessage = "No items were put up for trade"
                });
                return;
            }

            if (slots.Length > 8 || items.Length > 8)
            {
                player.Client.SendPacket(new MarketTradeResultPacket
                {
                    Success = false,
                    ResultMessage = "Please only use 8 or less items!"
                });
                return;
            }

            foreach (var i in items)
                foreach (var x in slots)
                    if (i == 0xa22 || i == 0xa23 || x == 0xa22 || x == 0xa23)
                    {
                        player.Client.SendPacket(new MarketTradeResultPacket
                        {
                            Success = false,
                            ResultMessage = "Please don't use Health or Magic Pots!"
                        });
                        return;
                    }

            List<int> slotList = new List<int>(slots);
            List<ushort> requestItemList = new List<ushort>();
            foreach (var i in items)
                requestItemList.Add((ushort)i);

            List<ushort> offerItems = new List<ushort>();
            List<ItemData> offerDatas = new List<ItemData>();
            foreach (var i in slotList)
            {
                    offerItems.Add(player.Inventory[i].ObjectType);
                    offerDatas.Add(player.Inventory.Data[i]);
                    player.Inventory[i] = null;
                    player.Inventory.Data[i] = null;
                    player.Client.Save();
            }

            player.Client.Save();
            player.SaveToAcc();
            player.SaveToCharacter();
            player.UpdateCount++;

            Offer offer = new Offer();
            offer.Status = 0;
            offer.OfferItems = offerItems.ToArray();
            offer.OfferData = offerDatas.ToArray();
            offer.RequestItems = requestItemList.ToArray();
            offer.RequestData = datas;

            player.Client.AddDatabaseOpperation(db => db.AddOffer(player.AccountId, offer));

            player.Client.Save();

            player.Client.SendPacket(new MarketTradeResultPacket
            {
                Success = true,
                ResultMessage = "Successfully added trade"
            });
        }
    }
}