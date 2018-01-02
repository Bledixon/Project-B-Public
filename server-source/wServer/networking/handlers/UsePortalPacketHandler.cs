using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;
using wServer.realm.worlds;

namespace wServer.networking.handlers
{
    internal class UsePortalPacketHandler : PacketHandlerBase<UsePortalPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.UsePortal; }
        }

        protected override void HandlePacket(Client client, UsePortalPacket packet)
        {
            if (client.Player.connecting_Paused == 1) return;
            client.Player.SendInfo("You will be connected shortly...");
            client.Player.connecting_Paused = 1;
            client.Player.ApplyConditionEffect(new ConditionEffect
            {
                Effect = ConditionEffectIndex.Paused,
                DurationMS = 5000
            });
            client.Save();
            client.Player.Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet))
            ));
        }

        private void Handle(Player player, UsePortalPacket packet)
        {
            if (player.Party != null && player.Party.Leader != player)
            {
                player.SendInfo("Only the party leader can use portals.");
                return;
            }
            if (player.Party != null && player.Owner.Id == World.VAULT_ID)
                player.Client.Disconnect();
            Entity entity = player.Owner.GetEntity(packet.ObjectId);
            if (entity == null) return;

            var eport = (Portal)entity;
            if (eport == null || !eport.Usable) return;

            Portal portal = null;
            World world = null;
            if (entity is Portal)
            {
                portal = entity as Portal;
                world = portal.WorldInstance;
            }
       /*     if (entity is TowerPortal)
            {
                int floor = (entity as TowerPortal).Floor;
                if(floor == 0 || floor > Tower.FLOORS)
                    world = player.Manager.GetWorld(World.NEXUS_ID);
                else
                    world = player.Manager.AddWorld(new Tower(floor));
            } */
            if (world == null)
            {
                if (portal != null)
                {
                    /*if (player.Party != null && !portal.Descriptor.Party)
                    {
                        player.SendInfo("This portal cannot be used with a party.");
                        return;
                    }*/
                    bool setInstance = true;
                    switch (entity.ObjectType) //handling default case for not found. Add more as implemented
                    {
                        case 0x0703: //portal of cowardice
                        {
                            if (player.Manager.PlayerWorldMapping.ContainsKey(player.AccountId))
                                //may not be valid, realm recycled?
                                world = player.Manager.PlayerWorldMapping[player.AccountId];
                                    //also reconnecting to vault is a little unexpected
                            else
                                world = player.Manager.GetWorld(World.NEXUS_ID);
                        }
                            break;
                        case 0x0712:
                            world = player.Manager.GetWorld(World.VAULT_ID);
                            break;
                        case 0x071c:
                            world = player.Manager.Monitor.GetRandomRealm();
                            break;
                        case 0x071d:
                            world = player.Manager.GetWorld(World.NEXUS_ID);
                            break;
                        case 0x071e:
                            world = player.Manager.AddWorld(new Kitchen());
                            break;
                        case 0x0720:
                            world = player.Manager.GetWorld(World.VAULT_ID);
                            break;
                        case 0x2000:
                            world = player.Manager.AddWorld(new Gauntlet());
                            break;
                        case 0x2001:
                            world = player.Manager.AddWorld(new PvpArena());
                            break;
                        case 0x2002:
                            world = player.Manager.AddWorld(new AdminTestWorld());
                            break;
                        case 0x2003:
                            world = DuelArena.GetBestDuelArena(player);
                            setInstance = false;
                            break;
                        case 0x2004:
                            world = player.Manager.AddWorld(new WineCellar());
                            break;
                        case 0x2006:
                            world = player.Manager.AddWorld(new ElderWineCellar());
                            break;
                        case 0x2007:
                            world = player.Manager.AddWorld(new LootWorld());
                            break;
                        case 0x2008:
                            world = player.Manager.AddWorld(new XpGift());
                            break;
                        case 0x071b:
                            world = player.Manager.AddWorld(new Abyss()); 
                            break;
                        case 0x0718:
                            world = player.Manager.AddWorld(new SnakePit());
                            break;
                        case 0x070c:
                            world = player.Manager.AddWorld(new SpriteWorld());
                            break;
                        case 0x072c:
                            world = player.Manager.AddWorld(new TombAncients());
                            break;
                        case 0x071a:
                            world = player.Manager.AddWorld(new UndeadLair());
                            break;
                        case 0x241a:
                            world = player.Manager.AddWorld(new GhostlyCaverns());
                            break;
                        case 0x0730:
                            world = player.Manager.AddWorld(new OceanTrench());
                            break;
                        case 0x0739:
                            world = player.Manager.AddWorld(new Manor());
                            break;
                        case 0x2700:
                            // world = player.Manager.AddWorld(new ChristmasCellar());
                            player.SendError("Only works on Christmas!");
                            break;
                        case 0x246e:
                            player.SendError("Portal has been removed.");
                            break;
                        case 0x246d:
                            world = player.Manager.GetWorld(World.EARENA_ID);
                            break;
                        case 0x246c:
                            world = player.Manager.GetWorld(World.XP_GIFT);
                            break;
                        case 0x247c:
                            world = player.Manager.AddWorld(new Candyland());
                            break;
                        case 0x247e:
                            world = player.Manager.AddWorld(new Halloween());
                            break;
                        case 0x2520:
                            world = player.Manager.GetWorld(World.EEARENA_ID);
                            break;
                        case 0x2523:
                            world = player.Manager.AddWorld(new ElderSnakePit());
                            break;
                        case 0x2525:
                            world = player.Manager.AddWorld(new ElderAbyss());
                            break;
                        case 0x2527:
                            world = player.Manager.AddWorld(new ElderUndeadLair());
                            break;
                        case 0x252a:
                            world = player.Manager.AddWorld(new Hive());
                            break;
                        case 0x2565:
                            world = player.Manager.AddWorld(new PirateTreasureCove());
                            break;
                        case 0x2574:
                            world = player.Manager.AddWorld(new Shaitan());
                            break;
                        case 0x2587:
                            world = player.Manager.AddWorld(new Shatters());
                            break;
                        case 0x072f:
                            if (player.Guild != null)
                                world = player.Guild.GuildHall;
                            break;
                        default:
                            player.SendError("Portal not added yet, please be patient!");
                            break;
                    }
                    if (setInstance)
                        portal.WorldInstance = world;
                }
                else
                {
                    switch (entity.ObjectType)
                    {
                        default:
                            player.SendError("Semi-Portal Not Implemented!");
                            break;
                    }
                }
            }

            //used to match up player to last realm they were in, to return them to it. Sometimes is odd, like from Vault back to Vault...
            if (player.Manager.PlayerWorldMapping.ContainsKey(player.AccountId))
            {
                World tempWorld;
                player.Manager.PlayerWorldMapping.TryRemove(player.AccountId, out tempWorld);
            }
            player.Manager.PlayerWorldMapping.TryAdd(player.AccountId, player.Owner);
            player.Client.Reconnect(new ReconnectPacket
            {
                Host = "",
                Port = 2050,
                GameId = world.Id,
                Name = world.Name,
                Key = Empty<byte>.Array,
            });
        }
    }
}