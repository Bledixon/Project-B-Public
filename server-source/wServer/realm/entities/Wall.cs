﻿using System.Xml.Linq;
using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    public class Wall : StaticObject
    {
        public Wall(RealmManager manager, ushort objType, XElement node)
            : base(manager, objType, GetHP(node), true, false, true)
        {
        }


        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            if (Vulnerable && projectile.ProjectileOwner is Player)
            {
                var dmg = (int) StatsManager.GetEnemyDamage(this, projectile.Damage, ObjectDesc.Defense);
                HP -= dmg;
                Owner.BroadcastPacket(new DamagePacket
                {
                    TargetId = Id,
                    Effects = 0,
                    Damage = (ushort) dmg,
                    Killed = !CheckHP(),
                    BulletId = projectile.ProjectileId,
                    ObjectId = projectile.ProjectileOwner.Self.Id
                }, null);
            }
            return true;
        }
    }
}