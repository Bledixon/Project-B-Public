#region
using System;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;


#endregion

namespace wServer.networking.handlers
{
    internal class PlayerShootPacketHandler : PacketHandlerBase<PlayerShootPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.PlayerShoot; }
        }

        protected override void HandlePacket(Client client, PlayerShootPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t =>
            {
                StatsManager statsMgr = new StatsManager(client.Player, 0);
                if (client.Player.Owner == null) return;
                client.Player.UpdateCount++;
                Random rnd = new Random();
                Item item = client.Player.Manager.GameData.Items[(ushort)packet.ContainerType];
                Player playeEr = client.Player;
                int stype = 0;
                for (int i = 0; i < 4; i++)
                {
                    if (client.Player.Inventory[i]?.ObjectType == packet.ContainerType)
                    {
                        stype = i;
                        client.Player.UpdateCount++;
                        break;
                    }
                }

                if (client.Player.SlotTypes[stype] != item.SlotType)
                {
                    client.Player.SendError("This cheating attempt has beed logged and a message was sent to all online admins.");
                    client.Disconnect();
                    foreach (Player x in client.Player.Owner.Players.Values)
                        if (x.Client.Account.Rank > 5)
                            x.SendInfo(String.Format("Player {0} is shooting with a weapon that doesnt match the class slot type.", client.Player.Name));
                    return;
                }
                ProjectileDesc prjDesc = item.Projectiles[0]; //Assume only one
                var dmg = (int)client.Player.statsMgr.GetAttackDamage(prjDesc.MinDamage, prjDesc.MaxDamage, (client.Player.Inventory.Data[0] != null ? client.Player.Inventory.Data[0].DmgPercentage : 0));
                var data = client.Player.Inventory.Data[0];

                Projectile prj = client.Player.PlayerShootProjectile(packet.BulletId, prjDesc, item.ObjectType, packet.Time, packet.Position, packet.Angle, dmg, data, 0);
                client.Player.Owner.EnterWorld(prj);
                CheckShootSpeed(playeEr, item);

                client.Player.BroadcastSync(new AllyShootPacket
                {
                    OwnerId = client.Player.Id,
                    Angle = packet.Angle,
                    ContainerType = packet.ContainerType,
                    BulletId = packet.BulletId,
                }, p => p != client.Player && client.Player.Dist(p) < 25);
                client.Player.FameCounter.Shoot(prj);
            }, PendingPriority.Networking);

            if (client.Player.statsMgr.success > 0)
                foreach (Client i in client.Player.Manager.Clients.Values)
                    i.SendPacket(new NotificationPacket
                    {
                        Color = new ARGB(0xffb20000),
                        ObjectId = client.Player.Id,
                        Text = "Critical!"
                    });
        }

        public void CheckShootSpeed(Player player, Item item)
        {
            StatsManager statsMgr = new StatsManager(player, 0);
            player.shootCounter++;
            
            if (player.lastShootTime == -1)
                player.lastShootTime = Environment.TickCount;

            int tolerance = 60;
            float diff = (Environment.TickCount - player.lastShootTime) + tolerance;

            float APS = statsMgr.GetDex();

            if (diff < 670f / APS)
            {
                if (player.shootCounter > (item.NumProjectiles * item.RateOfFire))
                {
                    player.shootCounter = 0;
                    player.checkForDex++;
                    player.Owner.Timers.Add(new WorldTimer(1000, (world, t) =>
                    {
                        player.checkForDex--;
                        return;

                    }));

                }
                if (player.checkForDex >= 60)
                {
                    player.SendError("Error Code 3044! Please contact a staff member!");
                    player.Client.Save();
                    player.Owner.Timers.Add(new WorldTimer(1500, (world, RealmTime) =>
                    {
                        player.Client.Disconnect();
                    }));
                }

                if (player.checkForDex < 0)
                    player.checkForDex = 0;
            }
            else
            {
                player.shootCounter = 0;
                player.lastShootTime = Environment.TickCount;
            }

        }
    }
}