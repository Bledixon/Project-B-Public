using db;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class CreatePacketHandler : PacketHandlerBase<CreatePacket>
    {
        public override PacketID ID
        {
            get { return PacketID.Create; }
        }

        protected override void HandlePacket(Client client, CreatePacket packet)
        {
            int nextCharId = 1;
            nextCharId = client.ClientDatabase.GetNextCharID(client.Account);
            using (var cmd = client.ClientDatabase.CreateQuery())
            {
                cmd.CommandText = "SELECT maxCharSlot FROM accounts WHERE id=@accId;";
                cmd.Parameters.AddWithValue("@accId", client.Account.AccountId);
                var maxChar = (int)cmd.ExecuteScalar();

                cmd.CommandText = "SELECT COUNT(id) FROM characters WHERE accId=@accId AND dead = FALSE;";
                var currChar = (int)(long)cmd.ExecuteScalar();

                if (currChar >= maxChar)
                {
                    SendFailure(client, "Not enough character slots.");
                    client.Disconnect();
                    return;
                }
            }

            client.Character = Database.CreateCharacter(client.Manager.GameData, packet.ObjectType, nextCharId);

            int[] stats =
            {
                client.Character.MaxHitPoints,
                client.Character.MaxMagicPoints,
                client.Character.Attack,
                client.Character.Defense,
                client.Character.Speed,
                client.Character.Dexterity,
                client.Character.HpRegen,
                client.Character.MpRegen,
                client.Character.Luck,
                client.Character.Crit
            };

            bool ok = true;
            using (var cmd = client.ClientDatabase.CreateQuery())
            {
                cmd.CommandText =
                    @"INSERT INTO characters(accId, charId, charType, level, exp, fame, items, itemDatas, hp, mp, stats, dead, pet)
VALUES(@accId, @charId, @charType, 1, 0, 0, @items, @itemDatas, 100, 100, @stats, FALSE, -1);";
                cmd.Parameters.AddWithValue("@accId", client.Account.AccountId);
                cmd.Parameters.AddWithValue("@charId", nextCharId);
                cmd.Parameters.AddWithValue("@charType", packet.ObjectType);
                cmd.Parameters.AddWithValue("@items", client.Character._Equipment);
                cmd.Parameters.AddWithValue("@itemDatas", client.Character._EquipData);
                cmd.Parameters.AddWithValue("@stats", Utils.GetCommaSepString(stats));
                int v = cmd.ExecuteNonQuery();
                ok = v > 0;

                if (ok)
                {
                    World target = client.Manager.Worlds[client.targetWorld];
                    target.Timers.Add(new WorldTimer(0, (w, t) => client.SendPacket(new CreateSuccessPacket
                    {
                        CharacterID = client.Character.CharacterId,
                        ObjectID = target.EnterWorld(client.Player = new Player(client))
                    })));
                    client.Stage = ProtocalStage.Ready;
                }
                else
                {
                    SendFailure(client, "Failed to create character.");
                    client.Disconnect();
                }
            }
        }
    }
}