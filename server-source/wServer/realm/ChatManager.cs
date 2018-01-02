using System.Linq;
using log4net;
using System;
using wServer.networking;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.realm
{
    public class ChatManager
    {
        private static readonly ILog log = LogManager.GetLogger(typeof (ChatManager));

        private readonly RealmManager manager;

        public ChatManager(RealmManager manager)
        {
            this.manager = manager;
        }

        public void Say(Player src, string text)
        {
            if (src.Client.Account.Muted) return;
            string tag = "";
            if (src.Client.Account.Tag != "")
                tag = "[" + src.Client.Account.Tag + "] ";
            src.Owner.BroadcastPacket(new TextPacket
            {
                Name = (src.Client.Account.Rank > 6 ? "!" : (src.Client.Account.Rank > 1 && src.Client.Account.Rank < 7) ? "@" : "") + tag + src.Name,
                ObjectId = src.Id,
                Stars = src.Stars,
                BubbleTime = 10,
                Recipient = "",
                Text = text.ToSafeText(),
                CleanText = text.ToSafeText()
            }, null);
            log.InfoFormat("[{0}({1})] <{2}> {3}", src.Owner.Name, src.Owner.Id, src.Name, text);
        }

        public void SayGuild(Player src, string text)
        {
            if (src.Client.Account.Muted) return;
            foreach (Client i in src.Manager.Clients.Values.Where(i => i.Player != null).Where(i => String.Equals(src.Guild, i.Player.Guild)))
            {
                i.SendPacket(new TextPacket()
                {
                    Name = src.ResolveGuildChatName(),
                    ObjectId = src.Id,
                    Stars = src.Stars,
                    BubbleTime = 10,
                    Recipient = "*Guild*",
                    Text = text.ToSafeText(),
                    CleanText = text.ToSafeText()
                });
            }
        }

        public void SayParty(Player src, string text)
        {
            if (src.Client.Account.Muted) return;
            src.Party.SendPacket(new TextPacket()
            {
                Name = src.Name,
                ObjectId = src.Id,
                Stars = src.Stars,
                BubbleTime = 10,
                Recipient = "*Party*",
                Text = text.ToSafeText(),
                CleanText = text.ToSafeText()
            }, null);
        }

        public void Announce(string text)
        {
            foreach (Client i in manager.Clients.Values)
                i.SendPacket(new TextPacket
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "@ANNOUNCEMENT",
                    Text = text.ToSafeText()
                });
            log.InfoFormat("<ANNOUNCEMENT> {0}", text);
        }

        public void Oryx(World world, string text)
        {
            world.BroadcastPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "#Oryx the Mad God",
                Text = text.ToSafeText()
            }, null);
            log.InfoFormat("[{0}({1})] <Oryx the Mad God> {2}", world.Name, world.Id, text);
        }
    }
}