using System.Collections.Generic;
using wServer.networking;
using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    public class Party
    {
        public static int nextID = 0;
        public static Dictionary<int, Party> Parties = new Dictionary<int, Party>();
        public static Dictionary<int, int> AccountStorage = new Dictionary<int, int>();

        public static Party GetParty(Player player)
        {
            if (AccountStorage.ContainsKey(player.AccountId))
                return GetParty(AccountStorage[player.AccountId]);
            return null;
        }

        public static Party GetParty(int ID)
        {
            if (Parties.ContainsKey(ID))
                return Parties[ID];
            return null;
        }

        public int ID;
        public Player Leader;
        public List<Player> Members;
        public List<int> Invitations;

        public World World;

        public Party(Player leader)
        {
            ID = Party.nextID++;
            if (Party.nextID == int.MaxValue)
                Party.nextID = 0;
            Leader = leader;
            Members = new List<Player>();
            Invitations = new List<int>();

            World = Leader.Owner;

            Parties.Add(ID, this);
            AccountStorage.Add(Leader.AccountId, ID);
            Leader.SendInfo("Created new party!");
            Leader.SendInfo("Type \"/party help\" for party commands.");
        }

        public void SendPacket(Packet packet, Player exclude)
        {
            if (Leader.Client != null && Leader != exclude)
                Leader.Client.SendPacket(packet);
            foreach (var i in Members)
                if (i.Client != null && i != exclude)
                    i.Client.SendPacket(packet);
        }

        public void AddMember(Player member)
        {
            Members.Add(member);
            member.Party = this;
            SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "",
                Recipient = "*Party*",
                Text = member.Name + " has joined the party"
            }, null);
            member.UpdateCount++;
            AccountStorage.Add(member.AccountId, ID);
            if (Invitations.Contains(member.AccountId))
                Invitations.Remove(member.AccountId);
        }

        public void RemoveMember(Player member)
        {
            SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "",
                Recipient = "*Party*",
                Text = member.Name + " has left the party"
            }, null);
            Members.Remove(member);
            member.Party = null;
            member.UpdateCount++;
            AccountStorage.Remove(member.AccountId);
        }

        public void Disband()
        {
            SendPacket(new TextPacket
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "",
                Recipient = "*Party*",
                Text = "The party has been disbanded"
            }, null);
            Leader.Party = null;
            Leader.UpdateCount++;
            AccountStorage.Remove(Leader.AccountId);
            foreach (var i in Members)
            {
                i.Party = null;
                AccountStorage.Remove(i.AccountId);
                if (i.Client != null && i.Owner.Id != World.NEXUS_ID)
                    i.Client.Reconnect(new ReconnectPacket()
                        {
                            Host = "",
                            Port = 2050,
                            Name = "Nexus",
                            GameId = World.NEXUS_ID,
                            Key = Empty<byte>.Array
                        });
            }
            Parties.Remove(ID);
        }
    }

    partial class Player
    {
        bool partyReconnecting = false;
        public void RegulateParty()
        {
            if (Party == null || partyReconnecting)
                return;
            if (Owner != Party.World)
            {
                if (connecting_Paused == 1) return;
                SendInfo("You will be connected shortly...");
                connecting_Paused = 1;
                ApplyConditionEffect(new ConditionEffect
                {
                    Effect = ConditionEffectIndex.Paused,
                    DurationMS = 5000
                });
                Client.Save();
                Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
                {
                    Client.Save();
                    partyReconnecting = true;
                    Client.Reconnect(new ReconnectPacket
                    {
                        Host = "",
                        Port = 2050,
                        GameId = Party.World.Id,
                        Name = Party.World.Name,
                        Key = Empty<byte>.Array
                    });
                }));
            }
        }
    }
}