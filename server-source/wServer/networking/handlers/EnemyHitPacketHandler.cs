using wServer.networking.cliPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class EnemyHitPacketHandler : PacketHandlerBase<EnemyHitPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.EnemyHit; }
        }

        protected override void HandlePacket(Client client, EnemyHitPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t =>
                Handle(client.Player, t, packet.TargetId, packet.BulletId, packet.Killed, packet.Damage));
        }

        private void Handle(Player player, RealmTime time, int targetId, byte bulletId, bool killed, int damage)
        {
            if (player.Owner == null) return;
            Entity entity = player.Owner.GetEntity(targetId);
            if (entity != null) //Tolerance
            {
                Projectile prj = (player as IProjectileOwner).Projectiles[bulletId];
                prj.Damage = 0;
                if (entity is Wall)
                    prj.Damage = damage;
                prj.ForceHit(entity, time);
                (entity as Enemy).Damage(player, time, damage, true, true, prj);
            }
        }
    }
}