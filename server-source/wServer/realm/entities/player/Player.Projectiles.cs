using db;
using System;

namespace wServer.realm.entities
{
    public partial class Player
    {
        internal Projectile PlayerShootProjectile(
            byte id, ProjectileDesc desc, ushort objType,
            int time, Position position, float angle, int dmg, ItemData data, int slotId = -1)
        {
            projectileId = id;
            return CreateProjectile(desc, (ushort)objType,
                (int)statsMgr.GetAttackDamage(desc.MinDamage, desc.MaxDamage, data != null ? data.DmgPercentage : 0),
                time, position, angle, slotId);
        }

        
    }
}