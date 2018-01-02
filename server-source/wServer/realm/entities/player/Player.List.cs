#region

using System.Collections.Generic;
using wServer.networking.svrPackets;

#endregion

namespace wServer.realm.entities
{
    partial class Player
    {
        public void SendAccountList(List<int> list, int id)
        {
            Client.SendPacket(new AccountListPacket
            {
                AccountListId = id,
                AccountIds = list.ToArray(),
            });
        }
    }
}