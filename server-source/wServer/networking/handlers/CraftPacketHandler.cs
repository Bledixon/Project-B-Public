using System;
using System.Collections.Generic;
using log4net;
using wServer.networking.cliPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class CraftPacketHandler : PacketHandlerBase<CraftPacket>
    {
        private static ILog log = LogManager.GetLogger(typeof (CraftPacketHandler));

        public override PacketID ID
        {
            get { return PacketID.Craft; }
        }

        protected override void HandlePacket(Client client, CraftPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet.ObjectId));
        }

        private void Handle(Player player, int objId)
        {
            if (player.Owner == null) return;

            var obj = player.Owner.GetEntity(objId) as Container;
            if (obj != null)
            {
                if (obj.ObjectDesc.Class == "Forge")
                {
                    var items = new List<Item>();
                    for (int i = 0; i < obj.Inventory.Length; i++)
                        if (obj.Inventory[i] != null)
                            items.Add(obj.Inventory[i]);
                    Item result;
                    if ((result = player.GetCraftResult(items)) != null)
                    {
                        Item[] itemArray = {result};
                        Array.Resize(ref itemArray, 12);
                        obj.Inventory.SetItems(itemArray);
                        player.SendInfo("Successfully crafted " + result.ObjectId + "!");
                    }
                    else
                        player.SendInfo("No crafting recipe found!\nType /chelp for recipes.");
                    obj.UpdateCount++;
                    player.UpdateCount++;
                }
                else if (obj.ObjectDesc.Class == "Reforge")
                {
                    Item item = obj.Inventory[0];
                    Item material = obj.Inventory[1];
                    if (item == null || material == null)
                    {
                        player.SendInfo("You must have an item and a material to reforge.");
                        return;
                    }
                    Item result;
                    if ((result = player.GetReforgeResult(item, material)) != null)
                    {
                        obj.Inventory[0] = obj.Inventory[1] = null;
                        obj.Inventory.Data[1] = null;
                        obj.Inventory[2] = result;
                        obj.Inventory.Data[2] = obj.Inventory.Data[0];
                        obj.Inventory.Data[0] = null;
                        player.SendInfo("Successfully forged " + result.ObjectId + "!");
                    }
                    else
                        player.SendInfo("No reforge recipe found!\nType /chelp for recipes.");
                    obj.UpdateCount++;
                    player.UpdateCount++;
                }
            }
            else
            {
                player.SendError("Object is null!");
            }
        }
    }
}