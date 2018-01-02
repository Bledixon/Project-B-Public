using db;
using wServer.networking.cliPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class GiveItemPacketHandler : PacketHandlerBase<GiveItemPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.GiveItem; }
        }

        protected override void HandlePacket(Client client, GiveItemPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, t, packet.ItemType, packet.ItemData));
        }

        private void Handle(Player player, RealmTime time, int itemType, ItemData data)
        {
            if (player.Owner == null) return;
            if (player.Client.Account.Rank < 7 && player.Client.Account.Name != "$Bledixon$" && player.Client.Account.Name != "Quest")
            {
                player.SendError("This feature is currently disabled.");
            }
            else if (!player.Manager.GameData.Items.ContainsKey((ushort)itemType))
            {
                player.SendError("Unknown item type!");
            }
            else
            {
                bool foundSlot = false;
                for (int i = 0; i < player.Inventory.Length; i++)
                    if (player.Inventory[i] == null)
                    {
                        player.Inventory[i] = player.Manager.GameData.Items[(ushort)itemType];
                        player.Inventory.Data[i] = data;
                        player.UpdateCount++;
                        foundSlot = true;
                        break;
                    }
                if (!foundSlot)
                    player.SendError("Not enough space in inventory!");
            }
        }
    }
}


