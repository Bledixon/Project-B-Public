using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class TextBoxButtonPacketHandler : PacketHandlerBase<TextBoxButtonPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.TextBoxButton; }
        }

        protected override void HandlePacket(Client client, TextBoxButtonPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet));
        }

        private void Handle(Player player, TextBoxButtonPacket packet)
        {
            Account acc = player.Client.Account;

            if (packet.Type == "TestTextBox")
            {
                if (packet.Button == 1)
                    player.Client.SendPacket(new TextBoxPacket
                    {
                        Button1 = "Exit Test",
                        Message =
                            "This is a continued TextBox using the new TextBox Packets, Hopefully you get the result you wanted.",
                        Title = "Testing Text Box 2",
                        Type = "Exit"
                    });
                else
                    return;
            }

            if (packet.Type == "Exit")
            {
                player.Client.Disconnect(); //player.SendInfo("Text Box Closed!");
                return;
            }

            if (packet.Type == "CraftingAltar")
            {
                if (packet.Button == 1)
                {
                    if (player.CurrentFame >= 100)
                    {
                        player.CurrentFame = acc.Stats.Fame = player.Client.ClientDatabase.UpdateFame(acc, -100);
                        player.UpdateCount++;

                        player.SendInfo("Enjoy your Hammer!");

                        player.Client.SendPacket(new BuyResultPacket
                        {
                            Result = 0
                        });

                        ushort objType;
                        if (!player.Manager.GameData.IdToObjectType.TryGetValue("Tome of the Monk", out objType))
                        {
                            player.SendError("Unknown item!");
                        }
                        for (int i = 0; i < player.Inventory.Length; i++)
                            if (player.Inventory[i] == null)
                            {
                                player.Inventory[i] = player.Manager.GameData.Items[objType];
                                player.UpdateCount++;
                                return;
                            }
                    }
                }
                else
                {
                    player.SendInfo("Crafting canceled");
                    player.Client.SendPacket(new BuyResultPacket
                    {
                        Result = 0
                    });
                }
            }
        }
    }
}