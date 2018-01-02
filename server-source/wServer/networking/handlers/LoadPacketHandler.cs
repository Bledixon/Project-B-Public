using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class LoadPacketHandler : PacketHandlerBase<LoadPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.Load; }
        }

        protected override void HandlePacket(Client client, LoadPacket packet)
        {
            client.Character = client.ClientDatabase.LoadCharacter(client.Account, packet.CharacterId);
            if (client.Character != null && client.ClientDatabase != null)
            {
                if (client.Character.Dead || client.Account.isBanned)
                {
                    SendFailure(client, "Character is dead.");
                    client.Disconnect();
                }
                else
                {
                    World target = client.Manager.Worlds[client.targetWorld];
                    client.SendPacket(new CreateSuccessPacket
                    {
                        CharacterID = client.Character.CharacterId,
                        ObjectID = target.EnterWorld(client.Player = new Player(client))
                    });
                    client.Stage = ProtocalStage.Ready;
                }
            }
            else
            {
                SendFailure(client, "Failed to load character.");
                client.Disconnect();
            }
        }
    }
}