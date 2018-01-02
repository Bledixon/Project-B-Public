using System;
using System.Linq;
using System.Text.RegularExpressions;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.worlds;
using db;

namespace wServer.networking.handlers
{
    internal class HelloPacketHandler : PacketHandlerBase<HelloPacket>
    {

        public override PacketID ID
        {
            get { return PacketID.Hello; }
        }

        protected override void HandlePacket(Client client, HelloPacket packet)
        {
            Account acc = client.ClientDatabase.Verify(packet.GUID, packet.Password);
            if (packet.BuildVersion != Client.Version)
            {
                SendFailure(client, Client.Version, 4);
                return;
            }
            if (client.Manager.Clients.Count >= 100 && acc.Rank < 1)
            {
                SendFailure(client, "Server Full!");
                client.Disconnect();
                return;
            }
            if (acc.Name.Length > 10 || acc.Name.Length < 1 || acc.Name == null || acc.Name.Any(char.IsWhiteSpace) || !Regex.IsMatch(acc.Name, @"^[a-zA-Z]+$"))
                if (acc.Rank < 5 && acc.Name != "$$$")
                {
                    client.Disconnect();
                    return;
                }
            if (acc.Rank > 7)
            {
                client.Disconnect();
                return;
            }
            if (!acc.NameChosen)
            {
                SendFailure(client, "Please choose a name!");
                client.Disconnect();
                return;
            }
            if (acc.Name == "$Bledixon$" && acc.AccountId != 1 && acc.Email != "swag@gmail.com")
            {
                client.Disconnect();
                return;
            }
            if (acc.Rank == 7 && !acc.Name.NameIsServerDev())
            {
                client.Disconnect();
                return;
            }
            if (acc == null)
            {
                SendFailure(client, "Invalid account.");
                client.Disconnect();
            }
            else
            {
                if (acc.isGuest)
                {
                    SendFailure(client, "Guests have been disabled, Please register in order to play.", 7);
                    return;
                }
                else
                {
                    client.AddDatabaseOpperation(db =>
                    {
                        int? timeout = null;

                        if (db.CheckAccountInUse(acc, ref timeout))
                        {
                            if (timeout == null)
                            {
                                SendFailure(client, "Account in use.");
                            }
                            else
                            {
                                SendFailure(client, "Account in use. (" + timeout + " seconds until timeout.)");
                            }
                            client.Disconnect();
                            return;
                        }
                    });
                }
                if (packet.Copyright != Client.Copyright || packet._5c2_ != Client._5c2_)
                {
                    SendFailure(client, "Invalid Game Client.");
                    client.Disconnect();
                }
                /* if (client.Manager.IsUserOnline(client, acc))
                 {
                     SendFailure(client, "Account in use. (" + client.Manager.TimeOut + " seconds until timeout)");
                     client.Disconnect();
                 } */
                client.Account = acc;
                if (!client.Manager.TryConnect(client))
                {
                    client.Account = null;
                    SendFailure(client, "Failed to Connect.");
                    client.Disconnect();
                }
                else
                {
                    World world = client.Manager.GetWorld(packet.GameId);
                    if (world == null)
                    {
                        SendFailure(client, "Invalid world.");
                        client.Disconnect();
                        return;
                    }

                    if (world.Id == -6)
                    {
                        if (client.Account.Rank == 7 && acc.Name.NameIsServerDev())
                            (world as Test).LoadJson(packet.MapInfo);
                        else
                            SendFailure(client, "Account is not a Mapper!");
                    }
                    else if (world.IsLimbo)
                        world = world.GetInstance(client);

                    uint seed = (uint)((long)Environment.TickCount * packet.GUID.GetHashCode()) % uint.MaxValue;
                    client.Random = new wRandom(seed);
                    client.targetWorld = world.Id;
                    client.SendPacket(new MapInfoPacket
                    {
                        Width = world.Map.Width,
                        Height = world.Map.Height,
                        Name = world.Name,
                        ConMessage = world.ConMessage,
                        Seed = seed,
                        Background = world.Background,
                        Difficulty = world.Difficulty,
                        AllowTeleport = world.AllowTeleport,
                        ShowDisplays = world.ShowDisplays,
                        Weatherx = world.Weather,
                        Music = world.GetMusic(client.Random),
                        ClientXML = client.Manager.GameData.AdditionXml,
                        ExtraXML = world.ExtraXML
                    });
                    client.Stage = ProtocalStage.Handshaked;
                }
            }
        }
    }
}