using System;
using wServer.networking.cliPackets;
using wServer.realm.entities;
using wServer.realm;

namespace wServer.networking.handlers
{
    internal class PlayerHitPacketHandler : PacketHandlerBase<PlayerHitPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.PlayerHit; }
        }

        Entity entity;

        public int LogCountHit = 0;
        protected override void HandlePacket(Client client, PlayerHitPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client, packet));
        }

        Client detect;
        private void Handle(Client client, PlayerHitPacket packet)
        {
            try
            {
                if (client.Player.Owner != null)
                {
                    Projectile proj;
                    if (!client.Player.HasConditionEffect(ConditionEffects.Invincible) || !client.Player.HasConditionEffect(ConditionEffects.Stasis) || !client.Player.HasConditionEffect(ConditionEffects.Paused)) { }

                    if (
                        client.Player.Owner.Projectiles.TryGetValue(
                            new Tuple<int, byte>(packet.ObjectId, packet.BulletId), out proj))
                    {
                        foreach (ConditionEffect effect in proj.Descriptor.Effects)
                        {
                            client.Player.ApplyConditionEffect(effect);
                        }
                        client.Player.Damage(proj.Damage, proj.ProjectileOwner.Self, proj.Descriptor.ArmorPiercing);
                    }
                    else
                    if (packet.BulletId == 0)
                    {
                        LogCountHit++;
                        client.Player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                        {
                            LogCountHit--;
                        }));
                    }
                    if (LogCountHit > 15)
                    {
                        client.Player.SendError("Error Code 1015! Please contact a staff member!");
                        client.Save();
                        client.Player.Owner.Timers.Add(new WorldTimer(1500, (world, RealmTime) =>
                        {
                            client.Disconnect();
                        }));
                        LogCountHit = 0;
                        return;
                    }

                }
            }
            catch
            {
            }
        }
    }
}