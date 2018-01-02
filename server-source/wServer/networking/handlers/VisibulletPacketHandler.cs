using wServer.networking.cliPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    class VisibulletPacketHandler : PacketHandlerBase<VisibulletPacket>
    {
        public override PacketID ID { get { return PacketID.Visibullet; } }

        protected override void HandlePacket(Client client, VisibulletPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet));
        }

        void Handle(Player player, VisibulletPacket packet)
        {
            /*if (packet.EnemyId == -2)
            {
                player.HP = 0;
                player.UpdateCount++;
                player.Death("Unknown");
                return;
            }
            var enemy = player.Owner.GetEntity(packet.EnemyId);
            var killer = "Unknown";
            if (!player.HasConditionEffect(ConditionEffects.Invulnerable))
                player.HP -= packet.Damage;
            ConditionEffects? ceffects = null;
            if (enemy != null)
            {
                killer = enemy is Player ? enemy.Name :
                    (enemy.ObjectDesc.DisplayId ?? enemy.ObjectDesc.ObjectId);
                var proj = (enemy as IProjectileOwner).Projectiles[packet.BulletId];
                if (proj != null)
                {
                    if (!player.HasConditionEffect(ConditionEffects.Invincible))
                    {
                        ceffects = proj.ConditionEffects;
                        player.ApplyConditionEffect(proj.Descriptor.Effects);
                    }
                }
            }
            player.UpdateCount++;

            player.Owner.BroadcastPacket(new DamagePacket
            {
                TargetId = player.Id,
                Effects = (!ceffects.HasValue) ? 0 : (ConditionEffects)ceffects,
                Damage = (ushort)packet.Damage,
                Killed = player.HP <= 0,
                BulletId = packet.BulletId,
                ObjectId = packet.EnemyId
            }, player);

            if (player.HP <= 0) player.Death(killer);*/
            var enemy = player.Owner.GetEntity(packet.EnemyId);
            if (enemy != null)
            {
                ConditionEffects? ceffects = null;
                var proj = (enemy as IProjectileOwner).Projectiles[packet.BulletId];
                if (proj != null)
                {
                    if (!player.HasConditionEffect(ConditionEffects.Invincible))
                    {
                        ceffects = proj.ConditionEffects;
                        player.ApplyConditionEffect(proj.Descriptor.Effects);
                    }
                }
            }
            player.Damage(packet.Damage, enemy, packet.ArmorPiercing);
        }
    }
}

