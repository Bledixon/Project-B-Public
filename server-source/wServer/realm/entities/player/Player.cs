using System;
using db;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using log4net;
using wServer.logic;
using wServer.networking;
using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    internal interface IPlayer
    {
        void Damage(int dmg, Entity chr, bool noDef, bool toSelf = false, float pvpReduction = 0.20f);
        bool IsVisibleToEnemy();
    }

    public partial class Player : Character, IContainer, IPlayer
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(Player));

        private readonly Client client;
        private FameCounter fames;
        private float hpRegenCounter;
        public bool isNotVisible = false;
        private float mpRegenCounter;
        public int checkForDex = 0;
        public int lastShootTime = -1;
        public int shootCounter = 0;
        private bool resurrecting;
        public StatsManager statsMgr;
        private byte[,] tiles;
        public bool usingShuriken = false;
        public int cheatCount = 0;
        public int connecting_Paused = 0;
        //private int pingSerial;

        public Player(Client client)
            : base(client.Manager, (ushort)client.Character.ObjectType, client.Random)
        {
            this.client = client;
            statsMgr = new StatsManager(this, client.Random.CurrentSeed);
            Name = client.Account.Name;
            AccountId = client.Account.AccountId;

            Name = client.Account.Name;
            Level = client.Character.Level;
            Experience = client.Character.Exp;
            ExperienceGoal = GetExpGoal(client.Character.Level);
            Stars = GetStars();
            switch (client.Account.Rank)
            {
                case 1: Stars = 200; break;
                case 2: Stars = 210; break;
                case 3: Stars = 220; break;
                case 4: Stars = 230; break;
                case 5: Stars = 240; break;
                case 6: Stars = 500; break;
                case 7: Stars = 1337; break;
            }
            Texture1 = client.Character.Tex1;
            Texture2 = client.Character.Tex2;
            Effect = client.Character.Effect;
            XmlEffect = "";
            Skin = client.Character.Skin;
            PermaSkin = client.Character.PermaSkin != 0;
            XpBoost = client.Character.XpBoost;
            Credits = client.Account.Credits;
            Keys = client.Account.Keys;
            NameChosen = client.Account.NameChosen;
            CurrentFame = client.Account.Stats.Fame;
            Fame = client.Character.CurrentFame;
            ClassStats state = client.Account.Stats.ClassStates.SingleOrDefault(_ => _.ObjectType == ObjectType);
            FameGoal = GetFameGoal(state != null ? state.BestFame : 0);

            Glowing = -1;
            switch (client.Account.Rank)
            {
                /*  if (client.Client.ClientDatabase.IsUserInLegends(AccountId))
                    Glowing = 0xFF0000; */
                case 6: Glowing = 0xFFFFFF; break;
                case 7: Glowing = 0xFF0080; break;
            }
            Guild = GuildManager.Add(this, client.Account.Guild);
            HP = client.Character.HitPoints;
            MP = client.Character.MagicPoints;
            ConditionEffects = 0;
            OxygenBar = 100;

            Party = Party.GetParty(this);
            if (Party != null)
                if (Party.Leader.AccountId == AccountId)
                    Party.Leader = this;
                else
                    Party.Members.Add(this);

            if (HP <= 0)
                HP = client.Character.MaxHitPoints;

            Locked = client.Account.Locked ?? new List<int>();
            Ignored = client.Account.Ignored ?? new List<int>();
            try
            {
                Locked = Client.ClientDatabase.GetLockeds(AccountId);
                Ignored = Client.ClientDatabase.GetIgnoreds(AccountId);
            } catch { }

            Inventory = new Inventory(this,
                client.Character.Equipment
                    .Select(_ => _ == 0xffff ? null : client.Manager.GameData.Items[_])
                    .ToArray(),
                client.Character.EquipData);
            Inventory.InventoryChanged += (sender, e) => CalculateBoost();
            SlotTypes =
                Utils.FromCommaSepString32(
                    Manager.GameData.ObjectTypeToElement[ObjectType].Element("SlotTypes").Value);
            Stats = new[]
            {
                client.Character.MaxHitPoints,
                client.Character.MaxMagicPoints,
                client.Character.Attack,
                client.Character.Defense,
                client.Character.Speed,
                client.Character.HpRegen,
                client.Character.MpRegen,
                client.Character.Dexterity,
                client.Character.Luck,
                client.Character.Crit
            };
           /* if (client.Character.Backpacks >= 1)
            {
                Inventory.SetItems(Inventory.Concat(client.Character.Backpack1.Select(_ => _ == 0xffff ? null : client.Manager.GameData.Items[_])).ToArray());
                SlotTypes = SlotTypes.Concat(new int[8] { 0, 0, 0, 0, 0, 0, 0, 0 }).ToArray();
            }
            if (client.Character.Backpacks == 2)
            {
                Inventory.SetItems(Inventory.Concat(client.Character.Backpack2.Select(_ => _ == 0xffff ? null : client.Manager.GameData.Items[_])).ToArray());
                SlotTypes = SlotTypes.Concat(new int[8] { 0, 0, 0, 0, 0, 0, 0, 0 }).ToArray();
            } */

            Pet = null;

            for (int i = 0; i < SlotTypes.Length; i++)
                if (SlotTypes[i] == 0) SlotTypes[i] = 10;

            AddRecipes();
        }

        public Client Client
        {
            get { return client; }
        }

        //public int HasBackpack { get; set; }

        //Stats
        public int AccountId { get; private set; }

        public Entity Pet { get; set; }

        public int Experience { get; set; }
        public int ExperienceGoal { get; set; }
        public int Level { get; set; }

        public List<int> Locked { get; set; }
        public List<int> Ignored { get; set; }

        public int CurrentFame { get; set; }
        public int Fame { get; set; }
        public int FameGoal { get; set; }
        public int Stars { get; set; }

        public GuildManager Guild { get; set; }

        public bool Invited { get; set; }

        public int Credits { get; set; }
        public int Keys { get; set; }
        public bool NameChosen { get; set; }
        public int OxygenBar { get; set; }
        public int Texture1 { get; set; }
        public int Texture2 { get; set; }
        public int Skin { get; set; }
        public bool PermaSkin { get; set; }

        public int Glowing { get; set; }
        public int MP { get; set; }

        public int[] Stats { get; private set; }
        public int[] Boost { get; private set; }

        public int? XpBoost { get; set; }

        public bool PvP { get; set; }
        public int Team { get; set; }
        public bool CanNexus { get; set; }
        public int Floors { get; set; }
        public Party Party { get; set; }

        public string Effect { get; set; }
        public string XmlEffect { get; set; }

        public FameCounter FameCounter
        {
            get { return fames; }
        }

        public int[] SlotTypes { get; private set; }
        public Inventory Inventory { get; private set; }

        public void Damage(int dmg, Entity chr, bool noDef, bool toSelf = false, float pvpReduction = 0.20f)
        {
            if (HasConditionEffect(ConditionEffects.Paused) || HasConditionEffect(ConditionEffects.Stasis) || HasConditionEffect(ConditionEffects.Invincible)) return;
            
            dmg = (int)statsMgr.GetPlayerDamage(dmg, noDef) / 2;
            if (chr is Player)
                dmg = Math.Max(1, (int)(dmg * pvpReduction));
            if (!HasConditionEffect(ConditionEffects.Invulnerable))
                HP -= dmg;
            UpdateCount++;
            if (chr == null)
                return;
            else
            {
                Owner.BroadcastPacket(new DamagePacket
                {
                    TargetId = Id,
                    Effects = 0,
                    Damage = (ushort)dmg,
                    Killed = HP <= 0,
                    BulletId = 0,
                    ObjectId = chr != null ? chr.Id : -1
                }, toSelf ? null : this);
                SaveToCharacter();
            }

            string killerName = chr is Player
                ? chr.Name
                : chr != null ? (chr.ObjectDesc.DisplayId ?? chr.ObjectDesc.ObjectId) : "Unknown";

            if (HP <= 0) Death(killerName);
        }

        protected override void ExportStats(IDictionary<StatsType, object> stats)
        {
            base.ExportStats(stats);
            stats[StatsType.AccountId] = AccountId;

            stats[StatsType.Experience] = Experience - GetLevelExp(Level);
            stats[StatsType.ExperienceGoal] = ExperienceGoal;
            stats[StatsType.Level] = Level;

            stats[StatsType.CurrentFame] = CurrentFame;
            stats[StatsType.Fame] = Fame;
            stats[StatsType.FameGoal] = FameGoal;
            stats[StatsType.Stars] = Stars;

            stats[StatsType.Guild] = Guild[AccountId].Name;
            stats[StatsType.GuildRank] = Guild[AccountId].Rank;

            stats[StatsType.Credits] = Credits;
            stats[StatsType.Keys] = Keys;
            stats[StatsType.NameChosen] = NameChosen ? 1 : 0;
            stats[StatsType.Texture1] = Texture1;
            stats[StatsType.Texture2] = Texture2;
            stats[StatsType.Skin] = Skin;

            stats[StatsType.Glowing] = Glowing;
            stats[StatsType.HP] = HP;
            stats[StatsType.MP] = MP;

            stats[StatsType.InvData0] = (Inventory.Data[0] != null ? Inventory.Data[0].GetJson() : "{}");
            stats[StatsType.InvData1] = (Inventory.Data[1] != null ? Inventory.Data[1].GetJson() : "{}");
            stats[StatsType.InvData2] = (Inventory.Data[2] != null ? Inventory.Data[2].GetJson() : "{}");
            stats[StatsType.InvData3] = (Inventory.Data[3] != null ? Inventory.Data[3].GetJson() : "{}");
            stats[StatsType.InvData4] = (Inventory.Data[4] != null ? Inventory.Data[4].GetJson() : "{}");
            stats[StatsType.InvData5] = (Inventory.Data[5] != null ? Inventory.Data[5].GetJson() : "{}");
            stats[StatsType.InvData6] = (Inventory.Data[6] != null ? Inventory.Data[6].GetJson() : "{}");
            stats[StatsType.InvData7] = (Inventory.Data[7] != null ? Inventory.Data[7].GetJson() : "{}");
            stats[StatsType.InvData8] = (Inventory.Data[8] != null ? Inventory.Data[8].GetJson() : "{}");
            stats[StatsType.InvData9] = (Inventory.Data[9] != null ? Inventory.Data[9].GetJson() : "{}");
            stats[StatsType.InvData10] = (Inventory.Data[10] != null ? Inventory.Data[10].GetJson() : "{}");
            stats[StatsType.InvData11] = (Inventory.Data[11] != null ? Inventory.Data[11].GetJson() : "{}");

            stats[StatsType.Inventory0] = (Inventory[0] != null ? Inventory[0].ObjectType : -1);
            stats[StatsType.Inventory1] = (Inventory[1] != null ? Inventory[1].ObjectType : -1);
            stats[StatsType.Inventory2] = (Inventory[2] != null ? Inventory[2].ObjectType : -1);
            stats[StatsType.Inventory3] = (Inventory[3] != null ? Inventory[3].ObjectType : -1);
            stats[StatsType.Inventory4] = (Inventory[4] != null ? Inventory[4].ObjectType : -1);
            stats[StatsType.Inventory5] = (Inventory[5] != null ? Inventory[5].ObjectType : -1);
            stats[StatsType.Inventory6] = (Inventory[6] != null ? Inventory[6].ObjectType : -1);
            stats[StatsType.Inventory7] = (Inventory[7] != null ? Inventory[7].ObjectType : -1);
            stats[StatsType.Inventory8] = (Inventory[8] != null ? Inventory[8].ObjectType : -1);
            stats[StatsType.Inventory9] = (Inventory[9] != null ? Inventory[9].ObjectType : -1);
            stats[StatsType.Inventory10] = (Inventory[10] != null ? Inventory[10].ObjectType : -1);
            stats[StatsType.Inventory11] = (Inventory[11] != null ? Inventory[11].ObjectType : -1);

           /* stats[StatsType.HasBackpack1] = Inventory.Length > 12 ? 1 : 0;
            stats[StatsType.HasBackpack2] = Inventory.Length > 20 ? 1 : 0; */

          /*  if (Inventory.Length > 12)
            {
                stats[StatsType.Backpack1_0] = (Inventory[12] != null ? Inventory[12].ObjectType : -1);
                stats[StatsType.Backpack1_1] = (Inventory[13] != null ? Inventory[13].ObjectType : -1);
                stats[StatsType.Backpack1_2] = (Inventory[14] != null ? Inventory[14].ObjectType : -1);
                stats[StatsType.Backpack1_3] = (Inventory[15] != null ? Inventory[15].ObjectType : -1);
                stats[StatsType.Backpack1_4] = (Inventory[16] != null ? Inventory[16].ObjectType : -1);
                stats[StatsType.Backpack1_5] = (Inventory[17] != null ? Inventory[17].ObjectType : -1);
                stats[StatsType.Backpack1_6] = (Inventory[18] != null ? Inventory[18].ObjectType : -1);
                stats[StatsType.Backpack1_7] = (Inventory[19] != null ? Inventory[19].ObjectType : -1);

                stats[StatsType.InvData0] = (Inventory.Data[12] != null ? Inventory.Data[12].GetJson() : "{}");
                stats[StatsType.InvData1] = (Inventory.Data[13] != null ? Inventory.Data[13].GetJson() : "{}");
                stats[StatsType.InvData2] = (Inventory.Data[14] != null ? Inventory.Data[14].GetJson() : "{}");
                stats[StatsType.InvData3] = (Inventory.Data[15] != null ? Inventory.Data[15].GetJson() : "{}");
                stats[StatsType.InvData4] = (Inventory.Data[16] != null ? Inventory.Data[16].GetJson() : "{}");
                stats[StatsType.InvData5] = (Inventory.Data[17] != null ? Inventory.Data[17].GetJson() : "{}");
                stats[StatsType.InvData6] = (Inventory.Data[18] != null ? Inventory.Data[18].GetJson() : "{}");
                stats[StatsType.InvData7] = (Inventory.Data[19] != null ? Inventory.Data[19].GetJson() : "{}");
            }
            if (Inventory.Length > 20)
            {
                stats[StatsType.Backpack2_0] = (Inventory[20] != null ? Inventory[20].ObjectType : -1);
                stats[StatsType.Backpack2_1] = (Inventory[21] != null ? Inventory[21].ObjectType : -1);
                stats[StatsType.Backpack2_2] = (Inventory[22] != null ? Inventory[22].ObjectType : -1);
                stats[StatsType.Backpack2_3] = (Inventory[23] != null ? Inventory[23].ObjectType : -1);
                stats[StatsType.Backpack2_4] = (Inventory[24] != null ? Inventory[24].ObjectType : -1);
                stats[StatsType.Backpack2_5] = (Inventory[25] != null ? Inventory[25].ObjectType : -1);
                stats[StatsType.Backpack2_6] = (Inventory[26] != null ? Inventory[26].ObjectType : -1);
                stats[StatsType.Backpack2_7] = (Inventory[27] != null ? Inventory[27].ObjectType : -1);

                stats[StatsType.InvData0] = (Inventory.Data[20] != null ? Inventory.Data[20].GetJson() : "{}");
                stats[StatsType.InvData1] = (Inventory.Data[21] != null ? Inventory.Data[21].GetJson() : "{}");
                stats[StatsType.InvData2] = (Inventory.Data[22] != null ? Inventory.Data[22].GetJson() : "{}");
                stats[StatsType.InvData3] = (Inventory.Data[23] != null ? Inventory.Data[23].GetJson() : "{}");
                stats[StatsType.InvData4] = (Inventory.Data[24] != null ? Inventory.Data[24].GetJson() : "{}");
                stats[StatsType.InvData5] = (Inventory.Data[25] != null ? Inventory.Data[25].GetJson() : "{}");
                stats[StatsType.InvData6] = (Inventory.Data[26] != null ? Inventory.Data[26].GetJson() : "{}");
                stats[StatsType.InvData7] = (Inventory.Data[27] != null ? Inventory.Data[27].GetJson() : "{}");
            } */

            if (Boost == null) CalculateBoost();

            stats[StatsType.MaximumHP] = Stats[0] + Boost[0];
            stats[StatsType.MaximumMP] = Stats[1] + Boost[1];
            stats[StatsType.Attack] = Stats[2] + Boost[2];
            stats[StatsType.Defense] = Stats[3] + Boost[3];
            stats[StatsType.Speed] = Stats[4] + Boost[4];
            stats[StatsType.Vitality] = Stats[5] + Boost[5];
            stats[StatsType.Wisdom] = Stats[6] + Boost[6];
            stats[StatsType.Dexterity] = Stats[7] + Boost[7];
            stats[StatsType.Luck] = Stats[8] + Boost[8];
            stats[StatsType.Crit] = Stats[9] + Boost[9];

            if (Owner.Name == "Ocean Trench" && Owner != null)
                stats[StatsType.OxygenBar] = OxygenBar;

            stats[StatsType.HPBoost] = Boost[0];
            stats[StatsType.MPBoost] = Boost[1];
            stats[StatsType.AttackBonus] = Boost[2];
            stats[StatsType.DefenseBonus] = Boost[3];
            stats[StatsType.SpeedBonus] = Boost[4];
            stats[StatsType.VitalityBonus] = Boost[5];
            stats[StatsType.WisdomBonus] = Boost[6];
            stats[StatsType.DexterityBonus] = Boost[7];
            stats[StatsType.LuckBonus] = Boost[8];
            stats[StatsType.CritBonus] = Boost[9];

            stats[StatsType.XpBoost] = XpBoost;

            stats[StatsType.PvP] = PvP ? 1 : 0;
            stats[StatsType.Team] = Team;
            stats[StatsType.CanNexus] = CanNexus ? 1 : 0;
            stats[StatsType.Party] = Party != null ? Party.ID : -1;
            stats[StatsType.PartyLeader] = Party != null ? (Party.Leader == this ? 1 : 0) : 0;

            stats[StatsType.Effect] = XmlEffect == string.Empty ? UnusualEffects.GetXML(Effect) : XmlEffect;
        }

        public void SaveToCharacter()
        {
            Char chr = client.Character;
            chr.Exp = Experience;
            chr.Level = Level;
            chr.Tex1 = Texture1;
            chr.Tex2 = Texture2;
          /*  if (Inventory.Length > 12)
            {
                chr.Backpack1 = new ushort[8]
                {
                    Inventory[12] != null ? Inventory[12].ObjectType : (ushort)0xffff,
                    Inventory[13] != null ? Inventory[13].ObjectType : (ushort)0xffff,
                    Inventory[14] != null ? Inventory[14].ObjectType : (ushort)0xffff,
                    Inventory[15] != null ? Inventory[15].ObjectType : (ushort)0xffff,
                    Inventory[16] != null ? Inventory[16].ObjectType : (ushort)0xffff,
                    Inventory[17] != null ? Inventory[17].ObjectType : (ushort)0xffff,
                    Inventory[18] != null ? Inventory[18].ObjectType : (ushort)0xffff,
                    Inventory[19] != null ? Inventory[19].ObjectType : (ushort)0xffff
                };
                chr.Backpacks = 1;
            }
            if (Inventory.Length > 20)
            {
                chr.Backpack2 = new ushort[8]
                {
                    Inventory[20] != null ? Inventory[20].ObjectType : (ushort)0xffff,
                    Inventory[21] != null ? Inventory[21].ObjectType : (ushort)0xffff,
                    Inventory[22] != null ? Inventory[22].ObjectType : (ushort)0xffff,
                    Inventory[23] != null ? Inventory[23].ObjectType : (ushort)0xffff,
                    Inventory[24] != null ? Inventory[24].ObjectType : (ushort)0xffff,
                    Inventory[25] != null ? Inventory[25].ObjectType : (ushort)0xffff,
                    Inventory[26] != null ? Inventory[26].ObjectType : (ushort)0xffff,
                    Inventory[27] != null ? Inventory[27].ObjectType : (ushort)0xffff
                };
                chr.Backpacks = 2;
            }
            chr.Equipment = new ushort[12]
            {
                Inventory[0] != null ? Inventory[0].ObjectType : (ushort)0xffff,
                Inventory[1] != null ? Inventory[1].ObjectType : (ushort)0xffff,
                Inventory[2] != null ? Inventory[2].ObjectType : (ushort)0xffff,
                Inventory[3] != null ? Inventory[3].ObjectType : (ushort)0xffff,
                Inventory[4] != null ? Inventory[4].ObjectType : (ushort)0xffff,
                Inventory[5] != null ? Inventory[5].ObjectType : (ushort)0xffff,
                Inventory[6] != null ? Inventory[6].ObjectType : (ushort)0xffff,
                Inventory[7] != null ? Inventory[7].ObjectType : (ushort)0xffff,
                Inventory[8] != null ? Inventory[8].ObjectType : (ushort)0xffff,
                Inventory[9] != null ? Inventory[9].ObjectType : (ushort)0xffff,
                Inventory[10] != null ? Inventory[10].ObjectType : (ushort)0xffff,
                Inventory[11] != null ? Inventory[11].ObjectType : (ushort)0xffff
            }; */
            chr.Effect = Effect;
            chr.Skin = Skin;
            chr.PermaSkin = PermaSkin ? 1 : 0;
            chr.Pet = (Pet != null ? Pet.ObjectType : -1);
            chr.CurrentFame = Fame;
            chr.HitPoints = HP;
            chr.MagicPoints = MP;
            chr.Equipment = Inventory.Select(_ => _ == null ? (ushort)0xffff : _.ObjectType).ToArray();
            chr.EquipData = Inventory.Data;
            chr.MaxHitPoints = Stats[0];
            chr.MaxMagicPoints = Stats[1];
            chr.Attack = Stats[2];
            chr.Defense = Stats[3];
            chr.Speed = Stats[4];
            chr.HpRegen = Stats[5];
            chr.MpRegen = Stats[6];
            chr.Dexterity = Stats[7];
            chr.Luck = Stats[8];
            chr.Crit = Stats[9];
            chr.XpBoost = XpBoost;
        }

        public void CalculateBoost()
        {
            if (Boost == null)
                Boost = new int[12];
            else
                for (int i = 0; i < Boost.Length; i++) Boost[i] = 0;
            for (int i = 0; i < 4; i++)
            {
                if (Inventory[i] == null) continue;
                foreach (var b in Inventory[i].StatsBoost)
                {
                    switch ((StatsType)b.Key)
                    {
                        case StatsType.MaximumHP:
                            Boost[0] += b.Value;
                            break;
                        case StatsType.MaximumMP:
                            Boost[1] += b.Value;
                            break;
                        case StatsType.Attack:
                            Boost[2] += b.Value;
                            break;
                        case StatsType.Defense:
                            Boost[3] += b.Value;
                            break;
                        case StatsType.Speed:
                            Boost[4] += b.Value;
                            break;
                        case StatsType.Vitality:
                            Boost[5] += b.Value;
                            break;
                        case StatsType.Wisdom:
                            Boost[6] += b.Value;
                            break;
                        case StatsType.Dexterity:
                            Boost[7] += b.Value;
                            break;
                        case StatsType.Luck:
                            Boost[8] += b.Value;
                            break;
                        case StatsType.Crit:
                            Boost[9] += b.Value;
                            break;
                    }
                }
            }
        }


        public override void Init(World owner)
        {
            Owner = owner;
            Move(0.5f, 0.5f);
            tiles = new byte[owner.Map.Width, owner.Map.Height];
            SetNewbiePeriod();

            base.Init(owner);
            tiles = new byte[owner.Map.Width, owner.Map.Height];
            fames = new FameCounter(this);
            if (client.Character.Pet >= 0)
                GivePet((ushort)client.Character.Pet);

            Client.AddDatabaseOpperation(db =>
            {
                db.UpdateLastSeen(Client.Account.AccountId, Client.Character.CharacterId, owner.Name);
                db.LockAccount(Client.Account);
            });

            SendAccountList(Locked, Client.LOCKED_LIST_ID);
            SendAccountList(Ignored, Client.IGNORED_LIST_ID);

            CanNexus = Owner.AllowNexus;
            UpdateCount++;
        }

        public override void Tick(RealmTime time)
        {
            if (client.Stage == ProtocalStage.Disconnected)
            {
                if (Owner.Pets != null)
                {
                    Owner.LeaveWorld(Pet);
                    Owner.LeaveWorld(this);
                }
                else
                    Owner.LeaveWorld(this);

                client.AddDatabaseOpperation(db => db.UnlockAccount(Client.Account));
                return;
            }

            if (!KeepAlive(time)) return;

            if (cheatCount > 10)
            {
                var x = Name;
                Client.Player.SendError("Error Code 2044! Please contact a staff member!");
                Client.Save();
                Client.Player.Owner.Timers.Add(new WorldTimer(1500, (world, RealmTime) =>
                {
                    Client.Disconnect();
                }));
                foreach(Player y in client.Player.Owner.Players.Values)
                {
                    if (y != null && y.Owner != null && y.Client.Account.Rank > 5)
                        y.SendInfo(x + " is using Cheat Engine!");
                }
                return;
            }

            if (Boost == null) CalculateBoost();

            CheckTradeTimeout(time);
            TradeTick(time);
            HandleRegen(time);
            HandleQuest(time);
            HandleGround(time);
            HandleEffects(time);
            RegulateParty();
            fames.Tick(time);

            if (usingShuriken)
            {
                if (MP > 0)
                    MP -= 1;
                else
                {
                    usingShuriken = false;
                    ApplyConditionEffect(new ConditionEffect
                    {
                        Effect = ConditionEffectIndex.Speedy,
                        DurationMS = 0
                    });
                }
            }

            try
            {
                SendUpdate();
            }
            catch
            {
            }

            if (HP <= -1)
            {
                Death("Unknown");
                return;
            }

            base.Tick(time);
        }

        private void HandleRegen(RealmTime time)
        {
            if (HP == Stats[0] + Boost[0] || !CanHpRegen())
                hpRegenCounter = 0;
            else
            {
                hpRegenCounter += statsMgr.GetHPRegen() * time.thisTickTimes / 1000f;
                var regen = (int)hpRegenCounter;
                if (regen > 0)
                {
                    HP = Math.Min(Stats[0] + Boost[0], HP + regen);
                    hpRegenCounter -= regen;
                    UpdateCount++;
                }
            }

            bool AboveMax = Stats[2] > client.Player.ObjectDesc.MaxAttack || Stats[0] > client.Player.ObjectDesc.MaxHitPoints || Stats[1] > client.Player.ObjectDesc.MaxMagicPoints || Stats[3] > client.Player.ObjectDesc.MaxDefense || Stats[4] > client.Player.ObjectDesc.MaxSpeed || Stats[5] > client.Player.ObjectDesc.MaxHpRegen || Stats[6] > client.Player.ObjectDesc.MaxMpRegen || Stats[7] > client.Player.ObjectDesc.MaxDexterity || Stats[8] > client.Player.ObjectDesc.MaxLuck || Stats[9] > client.Player.ObjectDesc.MaxCrit;

            if (AboveMax && client.Account.Rank <= 2)
                client.Disconnect();

            if (MP == Stats[1] + Boost[1] || !CanMpRegen())
                mpRegenCounter = 0;
            else
            {
                mpRegenCounter += statsMgr.GetMPRegen() * time.thisTickTimes / 1000f;
                var regen = (int)mpRegenCounter;
                if (regen > 0)
                {
                    MP = Math.Min(Stats[1] + Boost[1], MP + regen);
                    mpRegenCounter -= regen;
                    UpdateCount++;
                }
            }
        }

        public void Teleport(RealmTime time, int objId)
        {
            if (!TPCooledDown())
            {
                SendError("Too soon to teleport again!");
                return;
            }
            SetTPDisabledPeriod();
            Entity obj = Owner.GetEntity(objId);
            if (obj == null) return;
            Move(obj.X, obj.Y);
            fames.Teleport();
            SetNewbiePeriod();
            UpdateCount++;
            Owner.BroadcastPacket(new GotoPacket
            {
                ObjectId = Id,
                Position = new Position
                {
                    X = X,
                    Y = Y
                }
            }, null);
            if (!isNotVisible)
                Owner.BroadcastPacket(new ShowEffectPacket
                {
                    EffectType = EffectType.Teleport,
                    TargetId = Id,
                    PosA = new Position
                    {
                        X = X,
                        Y = Y
                    },
                    Color = new ARGB(0xFFFFFFFF)
                }, null);
            if (Pet != null)
            {
                Pet.Move(X, Y);
                Pet.UpdateCount++;
                Pet.Owner.BroadcastPacket(new GotoPacket
                {
                    ObjectId = Pet.Id,
                    Position = new Position
                    {
                        X = Pet.X,
                        Y = Pet.Y
                    }
                }, null);
            }
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            if (projectile.ProjectileOwner is Player ||
                HasConditionEffect(ConditionEffects.Paused) ||
                HasConditionEffect(ConditionEffects.Stasis) ||
                HasConditionEffect(ConditionEffects.Invincible))
                return false;

            return base.HitByProjectile(projectile, time);
        }

        public void Hit(Projectile proj)
        {
            int dmg = (int)statsMgr.GetPlayerDamage(proj.Damage, proj.Descriptor.ArmorPiercing) / 2;
            if (!HasConditionEffect(ConditionEffects.Invulnerable))
                HP -= dmg;
            ApplyConditionEffect(proj.Descriptor.Effects);
            UpdateCount++;
            Owner.BroadcastPacket(new DamagePacket
            {
                TargetId = Id,
                Effects = HasConditionEffect(ConditionEffects.Invincible) ? 0 : proj.ConditionEffects,
                Damage = (ushort)dmg,
                Killed = HP <= 0,
                BulletId = proj.ProjectileId,
                ObjectId = proj.ProjectileOwner.Self.Id
            }, this);

            string killerName = proj.ProjectileOwner is Player
                ? proj.ProjectileOwner.Self.Name
                : (proj.ProjectileOwner.Self.ObjectDesc.DisplayId ?? proj.ProjectileOwner.Self.ObjectDesc.ObjectId);

            if (HP <= 0)
                Death(killerName);

            if (HP <= 0 && !isDead)
                Death(killerName);
        }

        private bool CheckResurrection()
        {
            for (int i = 0; i < 4; i++)
            {
                Item item = Inventory[i];
                if (item == null || !item.Resurrects) continue;

                HP = Stats[0] + Stats[0];
                MP = Stats[1] + Stats[1];
                Inventory[i] = null;
                foreach (Player player in Owner.Players.Values)
                    player.SendInfo(string.Format("{0}'s {1} breaks and he disappears", Name, item.ObjectId));

                client.Reconnect(new ReconnectPacket
                {
                    Host = "",
                    Port = 2050,
                    GameId = World.NEXUS_ID,
                    Name = "Nexus",
                    Key = Empty<byte>.Array,
                });
                newbieTime += 1000;

                resurrecting = true;
                return true;
            }
            return false;
        }

        public List<string> GetMaxed()
        {
            List<string> maxed = new List<string>();
            foreach (XElement i in Manager.GameData.ObjectTypeToElement[ObjectType].Elements("LevelIncrease"))
            {
                int limit =
                    int.Parse(Manager.GameData.ObjectTypeToElement[ObjectType].Element(i.Value).Attribute("max").Value);
                int idx = StatsManager.StatsNameToIndex(i.Value);
                if (Stats[idx] >= limit)
                    maxed.Add(i.Value);
            }
            return maxed;
        }

        public void SaveToAcc()
        {
            var acc = Client.Account;
            acc.Credits = Credits;
        }

        private void GenerateGravestone()
        {
            int maxed = GetMaxed().Count;
            ushort objType;
            int? time;
            switch (maxed)
            {
                case 8:
                    objType = 0x0735;
                    time = null;
                    break;
                case 7:
                    objType = 0x0734;
                    time = null;
                    break;
                case 6:
                    objType = 0x072b;
                    time = null;
                    break;
                case 5:
                    objType = 0x072a;
                    time = null;
                    break;
                case 4:
                    objType = 0x0729;
                    time = null;
                    break;
                case 3:
                    objType = 0x0728;
                    time = null;
                    break;
                case 2:
                    objType = 0x0727;
                    time = null;
                    break;
                case 1:
                    objType = 0x0726;
                    time = null;
                    break;
                default:
                    if (Level <= 1)
                    {
                        objType = 0x0723;
                        time = 30 * 1000;
                    }
                    else if (Level < 20)
                    {
                        objType = 0x0724;
                        time = 60 * 1000;
                    }
                    else
                    {
                        objType = 0x0725;
                        time = 5 * 60 * 1000;
                    }
                    break;
            }
            var obj = new StaticObject(Manager, objType, time, true, time != null, false);
            obj.Move(X, Y);
            obj.Name = Name;
            Owner.EnterWorld(obj);
        }

        public void GivePet(ushort petId)
        {
            if (Pet != null)
                Owner.LeaveWorld(Pet);

            Pet = Resolve(Manager, petId);
            Pet.playerOwner = this;
            Pet.Move(X, Y);
            Pet.isPet = true;
            Owner.Timers.Add(new WorldTimer(2000, (world, RealmTime) =>
            {
                Owner.EnterWorld(Pet);
            }));
        }

        public void PetDissapearing(ushort petId)
        {
            if (Owner != null)
                Owner.LeaveWorld(Pet);
        }

        public bool CompareName(string name)
        {
            string rn = name.ToLower();
            if (rn.Split(' ')[0].StartsWith("[") || Name.Split(' ').Length == 1)
                if (Name.ToLower().StartsWith(rn)) return true;
                else return false;
            if (Name.Split(' ')[1].ToLower().StartsWith(rn)) return true;
            return false;
        }

        public string GetNameColor()
        {
            if (client.Account.Rank >= 2 && client.Account.Rank < 7)
                return "0xE678CC";
            if (client.Account.Rank == 7)
                return "0x00796B";
            else
                return "0xFF0000";
        }

        public void DropBag(Item i, bool sb)
        {
            ushort bagId = 0x0500;
            bool soulbound = false;
            for (int x = 0; x < Inventory.Length; x++)
                if (i.Soulbound || sb)
                {
                    bagId = 0x0503;
                    soulbound = true;
                }

            Container container = new Container(Manager, bagId, 1000 * 60, true);
            if (soulbound)
                container.BagOwners = new int[1] { AccountId };
            container.Inventory[0] = i;
            container.Move(X + (float)(0.5),
                           Y + (float)(0.5))
                           ;
            container.Size = 75;
            Owner.EnterWorld(container);
            return;
        }

        public void Death(string killer)
        {
            if (client.Stage == ProtocalStage.Disconnected || resurrecting || isDead)
                return;

            isDead = true;

            switch (Owner.Name)
            {
                case "Editor":
                    return;
                case "Testing and Stuff":
                case "Duel Arena":
                case "PVP Arena":
                case "Arena":
                    Owner.BroadcastPacket(new TextPacket
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = Name + " was eliminated by " + killer
                    }, null);
                    HP = Stats[0] + Stats[0];
                    MP = Stats[1] + Stats[1];
                    client.Reconnect(new ReconnectPacket
                    {
                        Host = "",
                        Port = 2050,
                        GameId = World.NEXUS_ID,
                        Name = "Nexus",
                        Key = Empty<byte>.Array,
                    });
                    return;
                case "Nexus":
                    HP = Stats[0] + Stats[0];
                    MP = Stats[1] + Stats[1];
                    client.Disconnect();
                    return;
            }
            if (Client.Account.Rank > 5)
            {
                HP = client.Character.MaxHitPoints;
                client.Disconnect();
                return;
            }
            if (CheckResurrection())
                return;

            if (client.Character.Pet != 0)
                Owner.LeaveWorld(Pet);
            
            if (client.Character.Dead)
            {
                if (client.Character.Pet != 0)
                {
                    Owner.LeaveWorld(Pet);
                }
                client.Disconnect();
                return;
            }

            GenerateGravestone();
            if (killer != "" && killer != "Unknown" && killer != "???")
            {
                Owner.BroadcastPacket(new TextPacket
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "",
                    Text = Name + " died at Level " + Level + ", killed by " + killer + " with " + Fame + " Basefame, such a Noob!"
                }, null);
            }
            try
            {
                client.Character.Dead = true;
                SaveToCharacter();
                Client.AddDatabaseOpperation(db => db.SaveCharacter(client.Account, client.Character));
                Client.AddDatabaseOpperation(db => db.Death(client.Manager.GameData, client.Account, client.Character, killer));
                client.SendPacket(new DeathPacket
                {
                    AccountId = AccountId,
                    CharId = client.Character.CharacterId,
                    Killer = killer
                });
                Owner.Timers.Add(new WorldTimer(1000, (w, t) => client.Disconnect()));
                Owner.LeaveWorld(this);
            }
            catch (Exception e)
            {
                log.Error(e);
            }
        }
    }
}