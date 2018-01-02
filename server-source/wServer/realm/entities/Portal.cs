using System.Collections.Generic;

namespace wServer.realm.entities
{
    public class Portal : StaticObject
    {
        public Portal(RealmManager manager, ushort objType, int? life)
            : base(manager, objType, life, false, true, false)
        {
            Usable = true;
            Descriptor = manager.GameData.Portals[objType];
            Name = manager.GameData.Portals[objType].DisplayId;
        }

        public PortalDesc Descriptor { get; set; }
        public bool Usable { get; set; }
        public World WorldInstance { get; set; }

        protected override void ExportStats(IDictionary<StatsType, object> stats)
        {
            stats[StatsType.PortalUsable] = Usable ? 1 : 0;
            base.ExportStats(stats);
        }

        public override void Tick(RealmTime time)
        {
            base.Tick(time);
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            return false;
        }

        public Portal Unlock(string dungeonName)
        {
            PortalDesc desc = Manager.GameData.Portals[0x0700];
            //desc.DungeonName = dungeonName;
            var portal = new Portal(Manager, desc.ObjectType, desc.TimeoutTime * 1000);
            portal.Move(X, Y);
            portal.Usable = true;
            Owner.EnterWorld(portal);
            Owner.LeaveWorld(this);
            return portal;
        }
    }
}