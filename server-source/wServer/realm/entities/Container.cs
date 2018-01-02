using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace wServer.realm.entities
{
    public class Container : StaticObject, IContainer
    {
        public Container(RealmManager manager, ushort objType, int? life, bool dying, bool permanent = false)
            : base(manager, objType, life, false, dying, false)
        {
            Inventory = new Inventory(this);
            SlotTypes = new int[12];
            BagOwners = new int[0];
            Permanent = permanent;

            for (int i = 0; i < SlotTypes.Length; i++)
                if (SlotTypes[i] == 0) SlotTypes[i] = 10;

            XElement node = manager.GameData.ObjectTypeToElement[ObjectType];
            SlotTypes = Utils.FromCommaSepString32(node.Element("SlotTypes").Value);
            XElement eq = node.Element("Equipment");
            if (eq != null)
            {
                Item[] inv =
                    Utils.FromCommaSepString16(eq.Value)
                        .Select(_ => _ == 0xffff ? null : manager.GameData.Items[_])
                        .ToArray();
                Array.Resize(ref inv, 12);
                Inventory.SetItems(inv);
            }
        }

        public Container(RealmManager manager, ushort id, bool permanent = false)
            : this(manager, id, null, false, permanent)
        {
        }

        public int[] BagOwners { get; set; }
        public bool Permanent { get; set; }
        public int[] SlotTypes { get; private set; }
        public Inventory Inventory { get; private set; }

        protected override void ExportStats(IDictionary<StatsType, object> stats)
        {
            stats[StatsType.Inventory0] = (Inventory[0] != null ? Inventory[0].ObjectType : -1);
            stats[StatsType.Inventory1] = (Inventory[1] != null ? Inventory[1].ObjectType : -1);
            stats[StatsType.Inventory2] = (Inventory[2] != null ? Inventory[2].ObjectType : -1);
            stats[StatsType.Inventory3] = (Inventory[3] != null ? Inventory[3].ObjectType : -1);
            stats[StatsType.Inventory4] = (Inventory[4] != null ? Inventory[4].ObjectType : -1);
            stats[StatsType.Inventory5] = (Inventory[5] != null ? Inventory[5].ObjectType : -1);
            stats[StatsType.Inventory6] = (Inventory[6] != null ? Inventory[6].ObjectType : -1);
            stats[StatsType.Inventory7] = (Inventory[7] != null ? Inventory[7].ObjectType : -1);

            stats[StatsType.InvData0] = (Inventory.Data[0] != null ? Inventory.Data[0].GetJson() : "{}");
            stats[StatsType.InvData1] = (Inventory.Data[1] != null ? Inventory.Data[1].GetJson() : "{}");
            stats[StatsType.InvData2] = (Inventory.Data[2] != null ? Inventory.Data[2].GetJson() : "{}");
            stats[StatsType.InvData3] = (Inventory.Data[3] != null ? Inventory.Data[3].GetJson() : "{}");
            stats[StatsType.InvData4] = (Inventory.Data[4] != null ? Inventory.Data[4].GetJson() : "{}");
            stats[StatsType.InvData5] = (Inventory.Data[5] != null ? Inventory.Data[5].GetJson() : "{}");
            stats[StatsType.InvData6] = (Inventory.Data[6] != null ? Inventory.Data[6].GetJson() : "{}");
            stats[StatsType.InvData7] = (Inventory.Data[7] != null ? Inventory.Data[7].GetJson() : "{}");

            if (!Permanent)
                stats[StatsType.OwnerAccountId] = BagOwners.Length == 1 ? BagOwners[0] : -1;
            base.ExportStats(stats);
        }

        public override void Tick(RealmTime time)
        {
            if (ObjectType == 0x504 || Permanent) //Vault chest
                return;
            bool hasItem = false;
            foreach (Item i in Inventory)
                if (i != null)
                {
                    hasItem = true;
                    break;
                }
            if (!hasItem)
                Owner.LeaveWorld(this);
            base.Tick(time);
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            return false;
        }
    }
}