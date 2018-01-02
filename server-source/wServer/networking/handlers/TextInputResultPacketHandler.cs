using System;
using System.Text.RegularExpressions;
using log4net;
using wServer.networking.cliPackets;
using wServer.realm.entities;
using db;
using wServer.realm;

namespace wServer.networking.handlers
{
    internal class TextInputResultPacketHandler : PacketHandlerBase<TextInputResultPacket>
    {
        private static ILog log = LogManager.GetLogger(typeof(TextInputResultPacketHandler));

        public override PacketID ID
        {
            get { return PacketID.TextInputResult; }
        }

        protected override void HandlePacket(Client client, TextInputResultPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, t, packet.Success, packet.Action, packet.Input));
        }

        private void Handle(Player player, RealmTime time, bool success, string action, string input)
        {
            if (action.StartsWith("renameSlot"))
            {
                if (!success)
                    return;
                int slot = -1;
                try
                {
                    slot = Convert.ToInt32(action.Remove(0, 10));
                    if (slot < 0 || slot >= player.Inventory.Length)
                        throw new Exception();
                }
                catch
                {
                    player.SendError("Invalid slot");
                    return;
                }
                bool foundTag = false;
                for (int i = 0; i < player.Inventory.Length; i++)
                {
                    if (player.Inventory[i] == null) continue;

                    Item item = player.Inventory[i];
                    Regex rgx = new Regex("[^a-zA-Z0-9 -?!]");
                    input = rgx.Replace(input, "");

                    bool isNameTag = false;
                    foreach(var eff in item.ActivateEffects)
                        if (eff.Effect == ActivateEffects.RenameItem)
                        {
                            foundTag = true;
                            player.Inventory[i] = null;
                            player.Inventory.Data[i] = null;
                            isNameTag = true;
                            break;
                        }
                    if (isNameTag)
                        break;
                }
                if (foundTag)
                {
                    if (player.Inventory.Data[slot].Description == "When consumed, gives gold." || player.Inventory.Data[slot].Description == "When consumed, gives fame.") return;
                    if (player.Inventory.Data[slot] == null)
                        player.Inventory.Data[slot] = new ItemData();
                    player.Inventory.Data[slot].Name = input.Trim();
                    player.UpdateCount++;
                }
                else
                    player.SendError("No name tag exists in inventory");
                return;
            }
            else if (action == "sendCommand")
            {
                player.Manager.Commands.Execute(player, time, input);
                return;
            }
            player.SendError("Invalid action");
        }
    }
}