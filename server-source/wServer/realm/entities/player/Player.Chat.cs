using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    partial class Player
    {
        public void SendInfo(string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "",
                Text = text
            });
        }

        public void SendError(string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "*Error*",
                Text = text
            });
        }

        public void SendClientText(string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "*Client*",
                Text = text
            });
        }

        public void SendHelp(string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "*Help*",
                Text = text
            });
        }

        public void SendEnemy(string name, string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "#" + name,
                Text = text
            });
        }

        public void SendText(string sender, string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = sender,
                Text = text
            });
        }

        public void SendGuild(string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "",
                Recipient = "*Guild*",
                Text = text
            });
        }

        public void GuildRecieved(int objId, int stars, string from, string text)
        {
            client.SendPacket(new TextPacket
            {
                BubbleTime = 10,
                Stars = stars,
                Name = "*Guild*",
                Recipient = from,
                Text = text
            });
        }
    }
}