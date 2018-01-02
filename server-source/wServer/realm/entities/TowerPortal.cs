using wServer.realm.worlds.tower;

namespace wServer.realm.entities
{
    public class TowerPortal : Portal
    {
        public TowerPortal(RealmManager manager, int floor)
            : base(manager, manager.GameData.IdToObjectType["Tower Portal"], null)
        {
            Floor = floor;
        }

        public int Floor { get; set; }

        public override void Init(World owner)
        {
            base.Init(owner);
            if (owner is Tower)
                if (Floor == 0)
                    this.Name = "Exit Tower";
                else if (Floor > Tower.FLOORS)
                    this.Name = "Back to Nexus";
                else
                    this.Name = ((owner as Tower).Floor < Floor ? "Ascend" : "Descend") + " (Floor " + Floor.ToString() + ")";
            else
                this.Name = "Enter Tower";
        }
    }
}