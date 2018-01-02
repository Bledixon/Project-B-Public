using db;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class InvSwapPacketHandler : PacketHandlerBase<InvSwapPacket>
    {
        private static readonly Random invRand = new Random();

        public override PacketID ID
        {
            get { return PacketID.InvSwap; }
        }

        protected override void HandlePacket(Client client, InvSwapPacket packet)
        {
            if (client.Player.Owner == null)
                return;
            if (client.Player.HasConditionEffect(ConditionEffects.Paused))
                return;

            client.Manager.Logic.AddPendingAction(t =>
            {
                Entity en1 = client.Player.Owner.GetEntity(packet.Obj1.ObjectId);
                Entity en2 = client.Player.Owner.GetEntity(packet.Obj2.ObjectId);
                var con1 = en1 as IContainer;
                var con2 = en2 as IContainer;

                Item item1 = con1.Inventory[packet.Obj1.SlotId];
                Item item2 = con2.Inventory[packet.Obj2.SlotId];

                ItemData data1 = con1.Inventory.Data[packet.Obj1.SlotId];
                ItemData data2 = con2.Inventory.Data[packet.Obj2.SlotId];

                bool Savespots = (en1.Owner.Name == "Market" || en1.Owner.Name == "Gold Market" || en1.Owner.Name == "Cloth Market"); //removed vault since it should save your inv while nexusing (duping)
                bool Savespots2 = (en2.Owner.Name == "Market" || en2.Owner.Name == "Gold Market" || en2.Owner.Name == "Cloth Market");

                if (item1 != null)
                    if (item1.AdminOnly)
                        if (!client.Account.Admin)
                            return;
                if (item2 != null)
                    if (item2.AdminOnly)
                        if (!client.Account.Admin)
                            return;

               /* int MaxStack = item2.MaxStack;
                if (item1.ObjectType == item2.ObjectType && item2.Doses < item2.MaxStack && item2.Stackable)
                {
                    data2 = new ItemData { Doses = item1.Doses + 1 };
                    if (item2.Doses > MaxStack)
                    {
                        data2 = new ItemData { Doses = MaxStack };
                        data1.Doses = (item2.Doses - MaxStack - 1);
                    }
                    else
                    {
                        item1 = null;
                        con1.Inventory.Data[packet.Obj1.SlotId] = null;
                    }
                } */

                if (en1.Dist(en2) > 1)
                {
                    if (en1 is Player)
                        (en1 as Player).Client.SendPacket(new InvResultPacket
                        {
                            Result = -1
                        });
                    else if (en2 is Player)
                        (en2 as Player).Client.SendPacket(new InvResultPacket
                        {
                            Result = -1
                        });
                    en1.UpdateCount++;
                    en2.UpdateCount++;
                    return;
                }

                if (!IsValid(item1, item2, con1, con2, packet, client))
                {
                    client.Disconnect();
                    return;
                }

                if (con2 is OneWayContainer)
                {
                    con1.Inventory[packet.Obj1.SlotId] = null;
                    con2.Inventory[packet.Obj2.SlotId] = null;
                    client.Player.DropBag(item1, true);
                    en1.UpdateCount++;
                    en2.UpdateCount++;
                    return;
                }
                if (con1 is OneWayContainer)
                {
                    if (con2.Inventory[packet.Obj2.SlotId] != null)
                    {
                        (en2 as Player)?.Client.SendPacket(new InvResultPacket { Result = -1 });
                        (con1 as OneWayContainer).UpdateCount++;
                        en2.UpdateCount++;
                        return;
                    }

                    using (Database db = new Database(Program.Settings.GetValue("conn")))
                    {
                        try
                        {
                            Account acc = db.GetAccount(client.Account.AccountId);
                            acc.Gifts.Remove(con1.Inventory[packet.Obj1.SlotId].ObjectType);

                            MySqlCommand cmd = db.CreateQuery();
                            cmd.CommandText = @"UPDATE accounts SET gifts=@gifts WHERE id=@accId;";
                            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                            cmd.Parameters.AddWithValue("@gifts", Utils.GetCommaSepString(acc.Gifts.ToArray()));
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex);
                        }
                    }
                    con1.Inventory[packet.Obj1.SlotId] = null;
                    con2.Inventory[packet.Obj2.SlotId] = item1;
                    (en2 as Player).CalculateBoost();
                    client.Player.SaveToCharacter();
                    client.Save();
                    en1.UpdateCount++;
                    en2.UpdateCount++;
                    (en2 as Player).Client.SendPacket(new InvResultPacket { Result = 0 });
                    return;
                }

                var publicbags = new List<short>
                {
                    0x0500,
                    0x0506,
                    0x0501
                };

                con1.Inventory.Data[packet.Obj1.SlotId] = data2;
                con2.Inventory.Data[packet.Obj2.SlotId] = data1;

                con1.Inventory[packet.Obj1.SlotId] = item2;
                con2.Inventory[packet.Obj2.SlotId] = item1;

                if (item2 != null)
                {
                    if (publicbags.Contains((short)en1.ObjectType) && (item2.Soulbound || (data2 != null && data2.Soulbound)))
                    {
                        con1.Inventory.Data[packet.Obj1.SlotId] = null;
                        con1.Inventory[packet.Obj1.SlotId] = null;
                    }
                }
                if (item1 != null)
                {
                    if (publicbags.Contains((short)en2.ObjectType) && (item1.Soulbound || (data1 != null && data1.Soulbound)))
                    {
                        con2.Inventory.Data[packet.Obj2.SlotId] = null;
                        con2.Inventory[packet.Obj2.SlotId] = null;
                    }
                }

                en1.UpdateCount++;
                en2.UpdateCount++;

                if (en1 is Player)
                {
                    if (Savespots)
                        (en1 as Player).Client.Save();
                    (en1 as Player).CalculateBoost();
                    (en1 as Player).Client.SendPacket(new InvResultPacket { Result = 0 });
                }
                if (en2 is Player)
                {
                    if (Savespots2)
                        (en2 as Player).Client.Save();
                    (en2 as Player).CalculateBoost();
                    (en2 as Player).Client.SendPacket(new InvResultPacket { Result = 0 });
                }

                if (!(en2 is Player))
                {
                    var con = en2 as Container;
                }
            });
            client.Save();
            client.AddDatabaseOpperation(db => db.SaveCharacter(client.Account, client.Character));
        }

        private bool IsValid(Item item1, Item item2, IContainer con1, IContainer con2, InvSwapPacket packet,
            Client client)
        {
            if (con2 is Container || con2 is OneWayContainer)
                return true;

            bool ret = false;

            if (con1 is OneWayContainer || con1 is Container)
            {
                ret = con2.AuditItem(item1, packet.Obj2.SlotId);

                if (!ret)
                {
                    if (client != null)
                        client.Disconnect();
                    foreach (Player player in client.Player.Owner.Players.Values)
                        if (player.Client.Account.Rank >= 6)
                            player.SendInfo(
                                String.Format(
                                    "Cheat engine detected for player {0},\nInvalid InvSwap. {1} instead of {2}",
                                    client.Player.Name,
                                    client.Manager.GameData.Items[(ushort)packet.Obj1.ObjectType].ObjectId,
                                    item1.ObjectId));
                }
            }
            if (con1 is Player && con2 is Player)
            {
                ret = con1.AuditItem(item1, packet.Obj2.SlotId) && con2.AuditItem(item2, packet.Obj1.SlotId);

                if (!ret)
                {
                    if (client != null)
                        client.Disconnect();
                    foreach (Player player in client.Player.Owner.Players.Values)
                        if (player.Client.Account.Rank >= 6)
                            player.SendInfo(
                                String.Format(
                                    "Cheat engine detected for player {0},\nInvalid InvSwap. {1} instead of {2}",
                                    client.Player.Name, item1.ObjectId,
                                    client.Manager.GameData.Items[(ushort)packet.Obj2.ObjectType].ObjectId));
                }
            }

            return ret;
        }
    }
}