using db;
using System;
using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    public partial class Player
    {
        private Tuple<Func<Item, ItemData, bool>, Action<int>> selection;

        public void ItemSelect(Func<Item,ItemData,bool> valid, Action<int> action)
        {
            TradeItem[] items = new TradeItem[Inventory.Length];
            for (int i = 0; i < Inventory.Length; i++)
            {
                items[i] = new TradeItem
                {
                    Item = Inventory[i] == null ? -1 : Inventory[i].ObjectType,
                    Data = Inventory.Data[i] ?? new ItemData(),
                    SlotType = SlotTypes[i],
                    Included = false,
                    Tradeable = Inventory[i] == null ? false : valid.Invoke(Inventory[i], Inventory.Data[i])
                };
            }

            client.SendPacket(new ItemSelectStartPacket
            {
                MyItems = items
            });

            this.selection = Tuple.Create(valid, action);
        }

        public void SelectResult(int slot)
        {
            if (selection == null)
                return;
            if (slot == -1)
            {
                client.SendPacket(new TradeDonePacket
                {
					Result = 0,
					Message = "Invalid slot selected"
                });
                selection = null;
				return;
            }
            Item item = Inventory[slot];
            ItemData data = Inventory.Data[slot];
            if (client.Player.Owner.Name != "Nexus")
            {
                client.SendPacket(new TradeDonePacket
                {
                    Result = 0,
                    Message = "Only useable in the Nexus!"
                });
                selection = null;
                return;
            }
            if (item == null)
            {
                client.SendPacket(new TradeDonePacket
                {
                    Result = 0,
                    Message = "Item no longer exists"
                });
                selection = null;
                return;
            }
            if (!selection.Item1.Invoke(item, data))
            {
                client.SendPacket(new TradeDonePacket
                {
                    Result = 0,
                    Message = "Invalid item"
                });
                selection = null;
                return;
            }
            client.SendPacket(new TradeDonePacket
            {
                Result = 1
            });
            selection.Item2.Invoke(slot);
            selection = null;
        }
    }
}
