using System;
using wServer.networking.cliPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class PlayerCheatEngineHandler : PacketHandlerBase<PlayerCheatPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.PlayerCheat; }
        }

        protected override void HandlePacket(Client client, PlayerCheatPacket packet)
        {
            Handle(client.Player, packet);
        }

        private void Handle(Player player, PlayerCheatPacket packet)
        {
            Item item = player.Inventory[0];
            ProjectileDesc prjDesc = item.Projectiles[0];

            bool CheaterPos = 
                (packet.atk_ > player.statsMgr.GetStats(2) + 5 || packet.def_ > player.statsMgr.GetStats(3) + 5 || packet.spd_ > player.statsMgr.GetStats(4) + 5 || packet.vit_ > player.statsMgr.GetStats(5) + 5 || packet.wis_ > player.statsMgr.GetStats(6) + 5 || packet.dex_ > player.statsMgr.GetStats(7) + 5);
            bool CheaterNeg = 
                (packet.atk_ < 0 || packet.def_ < -10 || packet.dex_ < 0 || packet.wis_ < 0 || packet.vit_ < 0 || packet.spd_ < 0);
            bool WeaponEdit =
                (packet.mindmg_ > (prjDesc.MinDamage * 1.20) || packet.maxdmg_ > (prjDesc.MaxDamage * 1.20));

            if (player.Owner == null || prjDesc == null || item == null)
                return;
            if (CheaterPos || CheaterNeg || WeaponEdit)
            {
                player.cheatCount++;
                player.Owner.Timers.Add(new WorldTimer(5500, (world, t) =>
                {
                    player.cheatCount--;
                    return;
                }));
            }
        }
    }
}
