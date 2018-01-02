using db;
using System;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class InvDropPacketHandler : PacketHandlerBase<InvDropPacket>
    {
        private static readonly Random invRand = new Random();

        public override PacketID ID
        {
            get { return PacketID.InvDrop; }
        }

        protected override void HandlePacket(Client client, InvDropPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t =>
            {
                if (client.Player.Owner == null)
                    return;
                if (client.Player.HasConditionEffect(ConditionEffects.Paused))
                    return;

                Handle(client.Player, packet.Slot.SlotId, packet.Slot.ObjectId);
            });
        }


        private void Handle(Player player, int slot, int objId)
        {
            const ushort NORM_BAG = 0x0500;
            const ushort SOUL_BAG = 0x0503;

            const ushort LIFETIME = 1000*60;

            Entity obj = player.Owner.GetEntity(objId);
            if (obj == null)
            {
                player.Client.SendPacket(new InvResultPacket { Result = 0 });
                return;
            }

            if (obj.Name != player.Name)
                return;

            IContainer con = (obj as IContainer);
            if (con.Inventory[slot] == null)
            {
                //still count as dropped
                player.Client.SendPacket(new InvResultPacket {Result = 0});
                return;
            }

            Item item = con.Inventory[slot];
            ItemData data = con.Inventory.Data[slot];
            con.Inventory[slot] = null;
            con.Inventory.Data[slot] = null;
            player.UpdateCount++;

            Container container;
            if (item.Soulbound || (data != null && data.Soulbound))
            {
                container = new Container(player.Manager, SOUL_BAG, LIFETIME, true);
                container.BagOwners = new[] {player.AccountId};
            }
            else
                container = new Container(player.Manager, NORM_BAG, LIFETIME, true);
            container.Inventory[0] = item;
            container.Inventory.Data[0] = data;
            container.Move(player.X + (float) ((invRand.NextDouble()*2 - 1)*0.5),
                player.Y + (float) ((invRand.NextDouble()*2 - 1)*0.5));
            container.Size = 75;
            player.Owner.EnterWorld(container);
            player.Client.Save();

            player.Client.SendPacket(new InvResultPacket {Result = 0});
        }
    }
}