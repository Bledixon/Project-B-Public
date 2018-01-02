using System.Linq;
using wServer.realm;

namespace wServer.logic.behaviors
{
    public class RemoveEntity : Behavior
    {
        private readonly float dist;
        private readonly string children;
        private readonly ushort target;

        public RemoveEntity(string target, double dist, string children)
        {
            this.target = BehaviorDb.InitGameData.IdToObjectType[target];
            this.dist = (float)dist;
            this.children = children;
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            Entity[] ens = host.GetNearestEntities(dist, target).ToArray();
            foreach (Entity e in ens)
                if (e.ObjectType == host.Manager.GameData.IdToObjectType[children])
                    host.Owner.LeaveWorld(e);
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state) { }
    }
}
