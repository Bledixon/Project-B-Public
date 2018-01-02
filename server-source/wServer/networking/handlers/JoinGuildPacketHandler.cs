using wServer.networking.cliPackets;
using wServer.realm;

namespace wServer.networking.handlers
{
    internal class JoinGuildPacketHandler : PacketHandlerBase<JoinGuildPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.JoinGuild; }
        }

        protected override void HandlePacket(Client client, JoinGuildPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client, packet));
        }

        void Handle(Client client, JoinGuildPacket packet)
        {
            if (!client.Player.Invited)
            {
                client.Player.SendError("You were not invited to join this Guild!");
                return;
            }
            client.AddDatabaseOpperation(db =>
            {
                var gStruct = db.GetGuild(packet.GuildName);
                if (client.Player.Invited == false)
                {
                    client.Player.SendInfo("You need to be invited to join a guild!");
                }
                if (gStruct != null)
                {
                    var g = db.ChangeGuild(client.Account, gStruct.Id, 0, 0, false);
                    if (g != null)
                    {
                        client.Account.Guild = g;
                        GuildManager.CurrentManagers[packet.GuildName].JoinGuild(client.Player);
                    }
                }
                else
                    client.Player.SendError("Guild does not exist.");
            });
        }
    }
}