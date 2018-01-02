using System.Collections.Generic;
using System.Linq;
using wServer.realm.terrain;

namespace wServer.realm.entities
{
    public partial class Player
    {
        private bool OxygenRegen;
        private long b;

        private void HandleGround(RealmTime time)
        {
            if (time.tickTimes - b > 100)
            {
                WmapTile tile = Owner.Map[(int)X, (int)Y];
                TileDesc tileDesc = Manager.GameData.Tiles[tile.TileId];

                if (Owner.Name != "The Void")
                    if (tileDesc.NoWalk)
                        if (time.tickCount % 30 == 0)
                        {
                            client.Player.SendError("Error Code 4044! Please contact a staff member!");
                            client.Save();
                            client.Player.Owner.Timers.Add(new WorldTimer(1500, (world, RealmTime) =>
                            {
                                client.Disconnect();
                            }));
                        }

                if (Owner.Name == "Ocean Trench")
                {
                    bool fObject = false;
                    foreach (
                        KeyValuePair<int, StaticObject> i in
                            Owner.StaticObjects.Where(i => i.Value.ObjectType == 0x0731)
                                .Where(i => (X - i.Value.X) * (X - i.Value.X) + (Y - i.Value.Y) * (Y - i.Value.Y) < 1))
                        fObject = true;

                    OxygenRegen = fObject;

                    if (!OxygenRegen)
                    {
                        if (OxygenBar == 0)
                            HP -= 2;
                        else
                            OxygenBar -= 1;

                        UpdateCount++;

                        if (HP <= 0)
                            Death("server.damage_suffocation");
                    }
                    else
                    {
                        if (OxygenBar < 100)
                            OxygenBar += 8;
                        if (OxygenBar > 100)
                            OxygenBar = 100;

                        UpdateCount++;
                    }
                }

                Owner.TileEvent(this, tile);

                b = time.tickTimes;
            }
        }
    }
}