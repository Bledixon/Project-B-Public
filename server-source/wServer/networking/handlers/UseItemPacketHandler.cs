using wServer.networking.cliPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class UseItemPacketHandler : PacketHandlerBase<UseItemPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.UseItem; }
        }

        protected override void HandlePacket(Client client, UseItemPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, t, packet));
        }

        private void Handle(Player player, RealmTime time, UseItemPacket packet)
        {
            if (player.Owner == null) return;

            /*   player.Client.Manager.Logic.AddPendingAction(t =>
               {
                   var container = player.Owner.GetEntity(packet.Slot.ObjectId) as IContainer;
                   if (container == null)
                       return;
                   Item item = container.Inventory[packet.Slot.SlotId];

                   if (item != null)
                       if (item.Consumable)
                           if (container is OneWayContainer)
                           {
                               using (Database db = new Database(Program.Settings.GetValue("conn")))
                               {
                                   Account acc = db.GetAccount(player.Client.Account.AccountId);
                                   acc.Gifts.Remove(packet.Slot.ObjectType);

                                   MySqlCommand cmd = db.CreateQuery();
                                   cmd.CommandText = @"UPDATE accounts SET gifts=@gifts WHERE id=@accId;";
                                   cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                                   cmd.Parameters.AddWithValue("@gifts", Utils.GetCommaSepString(acc.Gifts.ToArray()));
                                   cmd.ExecuteNonQuery();
                               }
                           }
                   ((Entity)container).UpdateCount++; */
            player.UseItem(time, packet.Slot.ObjectId, packet.Slot.SlotId, packet.Position);
            //   });
        }
    }
}