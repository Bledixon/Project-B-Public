using wServer.realm;
using wServer.realm.entities;
using wServer.realm.worlds.tower;

namespace wServer.logic.behaviors
{
    internal class TowerDeathPortal : Behavior
    {
        protected internal override void Resolve(State parent)
        {
            parent.Death += (sender, e) =>
            {
                TowerPortal entity = new TowerPortal(e.Host.Manager, (e.Host.Owner as Tower).Floor + 1);
                entity.Move(e.Host.X, e.Host.Y);
                e.Host.Owner.EnterWorld(entity);
            };
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
        }
    }
}