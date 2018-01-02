using db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    public partial class Player
    {
        private static readonly Dictionary<string, Tuple<int, int, int>> QuestDat =
            new Dictionary<string, Tuple<int, int, int>> //Priority, Min, Max
            {
                {"Scorpion Queen", Tuple.Create(1, 1, 6)},
                {"Bandit Leader", Tuple.Create(1, 1, 6)},
                {"Hobbit Mage", Tuple.Create(3, 3, 8)},
                {"Undead Hobbit Mage", Tuple.Create(3, 3, 8)},
                {"Giant Crab", Tuple.Create(3, 3, 8)},
                {"Desert Werewolf", Tuple.Create(3, 3, 8)},
                {"Sandsman King", Tuple.Create(4, 4, 9)},
                {"Goblin Mage", Tuple.Create(4, 4, 9)},
                {"Elf Wizard", Tuple.Create(4, 4, 9)},
                {"Dwarf King", Tuple.Create(5, 5, 10)},
                {"Swarm", Tuple.Create(6, 6, 11)},
                {"Shambling Sludge", Tuple.Create(6, 6, 11)},
                {"Deathmage", Tuple.Create(5, 6, 11)},
                {"Great Coil Snake", Tuple.Create(6, 6, 12)},
                {"Actual Lich", Tuple.Create(8, 7, 120)},
                {"Elder Lich", Tuple.Create(8, 6, 120)},
                {"Great Lizard", Tuple.Create(7, 7, 12)},
                {"Ent Ancient", Tuple.Create(9, 7, 120)},
                {"Skull Shrine", Tuple.Create(13, 15, 120)},
                {"Pentaract", Tuple.Create(13, 15, 120)},
                {"Cube God", Tuple.Create(13, 15, 120)},
                {"Grand Sphinx", Tuple.Create(13, 15, 120)},
                {"Lord of the Lost Lands", Tuple.Create(13, 15, 120)},
                {"Hermit God", Tuple.Create(13, 15, 120)},
                {"Ghost Ship", Tuple.Create(13, 15, 120)},
                {"Avatar", Tuple.Create(13, 1, 120)},
                {"Thorn Dragco Nimissime", Tuple.Create(13, 15, 120)},
                {"Elder Cube God", Tuple.Create(13, 15, 120)},
                {"Elder Skull Shrine", Tuple.Create(13, 15, 120)},
                {"Elder Grand Sphinx", Tuple.Create(13, 15, 120)},
                {"Richard_epc", Tuple.Create(13, 15, 120)},
                {"Elder Lord of the Lost Lands", Tuple.Create(13, 15, 120)},
                {"Bridge Sentinel", Tuple.Create(13, 1, 120)},
                {"shtrs Twilight Archmage", Tuple.Create(14, 1, 120)},
                {"Red Demon", Tuple.Create(14, 15, 120)},
                {"Evil Chicken God", Tuple.Create(15, 1, 120)},
                {"Bonegrind the Butcher", Tuple.Create(15, 1, 120)},
                {"Dreadstump the Pirate King", Tuple.Create(15, 1, 120)},
                {"Arachna the Spider Queen", Tuple.Create(15, 1, 120)},
                {"Stheno the Snake Queen", Tuple.Create(15, 1, 120)},
                {"Mixcoatl the Masked God", Tuple.Create(15, 1, 120)},
                {"Limon the Sprite God", Tuple.Create(15, 1, 120)},
                {"Septavius the Ghost God", Tuple.Create(15, 1, 120)},
                {"Davy Jones", Tuple.Create(15, 1, 120)},
                {"Lord Ruthven", Tuple.Create(15, 1, 120)},
                {"Archdemon Malphas", Tuple.Create(15, 1, 120)},
                {"Thessal the Mermaid Goddess", Tuple.Create(15, 1, 120)},
                {"Dr. Terrible", Tuple.Create(15, 1, 120)},
                {"Horrific Creation", Tuple.Create(15, 1, 120)},
                {"Masked Party God", Tuple.Create(15, 1, 120)},
                {"Stone Guardian Left", Tuple.Create(15, 1, 120)},
                {"Stone Guardian Right", Tuple.Create(15, 1, 120)},
                {"Oryx the Mad God 1", Tuple.Create(15, 1, 120)},
                {"Oryx the Mad God 2", Tuple.Create(15, 1, 120)},
                {"shtrs The Forgotten King", Tuple.Create(15, 1, 121)}
                // {"Actual Ent Ancient", Tuple.Create(9, 7, 120)},
               // {"Oasis Giant", Tuple.Create(10, 8, 120)},
               // {"Phoenix Lord", Tuple.Create(10, 9, 120)},
               // {"Ghost King", Tuple.Create(11, 10, 120)},
               // {"Actual Ghost King", Tuple.Create(11, 10, 120)},
               // {"Cyclops God", Tuple.Create(12, 10, 120)},
               // {"Lich", Tuple.Create(8, 6, 120)},
               // {"Wasp Queen", Tuple.Create(8, 7, 120)},
               // {"Horned Drake", Tuple.Create(8, 7, 120)},
            };

        private Entity questEntity;

        public Entity Quest
        {
            get { return questEntity; }
        }

        private static int GetExpGoal(int level)
        {
            if (level < 120) return 50 + (level - 1) * 100;
        	return 50;
        }
        

        private static int GetLevelExp(int level)
        {
            if (level == 0) return 0;
            if (level < 120) return 50*(level - 1) + (level - 2)*(level - 1)*50;
            return 2000;
        }

        private static int GetFameGoal(int fame)
        {
            if (fame >= 6500) return 0;
            if (fame >= 2000) return 6500;
            if (fame >= 800) return 2000;
            if (fame >= 400) return 800;
            if (fame >= 150) return 400;
            if (fame >= 20) return 150;
            return 100;
        }

        public int GetStars()
        {
            int ret = 0;
            foreach (ClassStats i in client.Account.Stats.ClassStates)
            {
                if (i.BestFame >= 6500) ret += 6;
                else if (i.BestFame >= 2000) ret += 5;
                else if (i.BestFame >= 800) ret += 4;
                else if (i.BestFame >= 400) ret += 3;
                else if (i.BestFame >= 150) ret += 2;
                else if (i.BestFame >= 20) ret += 1;
            }
            return ret;
        }

        private Entity FindQuest()
        {
            Entity ret = null;
            double bestScore = 0;
            foreach (Enemy i in Owner.Quests.Values
                .OrderBy(quest => MathsUtils.DistSqr(quest.X, quest.Y, X, Y)))
            {
                if (i.ObjectDesc == null || !i.ObjectDesc.Quest) continue;

                Tuple<int, int, int> x;
                if (!QuestDat.TryGetValue(i.ObjectDesc.ObjectId, out x)) continue;

                if ((Level >= x.Item2 && Level <= x.Item3))
                {
                    double score = (120 - Math.Abs((i.ObjectDesc.Level ?? 0) - Level))*x.Item1 - //priority * level diff
                                   this.Dist(i)/100; //minus 1 for every 100 tile distance
                    if (score > bestScore)
                    {
                        bestScore = score;
                        ret = i;
                    }
                }
            }
            return ret;
        }

        private void HandleQuest(RealmTime time)
        {
            if (time.tickCount%500 == 0 || questEntity == null || questEntity.Owner == null)
            {
                Entity newQuest = FindQuest();
                if (newQuest != null && newQuest != questEntity)
                {
                    Owner.Timers.Add(new WorldTimer(100, (w, t) => client.SendPacket(new QuestObjIdPacket
                    {
                        ObjectID = newQuest.Id
                    })));
                    questEntity = newQuest;
                }
            }
        }

        private void CalculateFame()
        {
            int newFame = 0;
            if (Experience < 200*1000) newFame = Experience/1000;
            else newFame = 200 + (Experience - 200*1000)/1000;
            if (newFame != Fame && this != null && this.Owner != null)
            {
                Fame = newFame;
                int newGoal;
                ClassStats state = client.Account.Stats.ClassStates.SingleOrDefault(_ => _.ObjectType == ObjectType);
                if (state != null && state.BestFame > Fame)
                    newGoal = GetFameGoal(state.BestFame);
                else
                    newGoal = GetFameGoal(Fame);
                if (newGoal > FameGoal)
                {
                    BroadcastSync(new NotificationPacket
                    {
                        ObjectId = Id,
                        Color = new ARGB(0xFF00FF00),
                        Text = "Class Quest Complete!"
                    }, p => this.Dist(p) < 25);
                    Stars = GetStars();
                }
                FameGoal = newGoal;
                UpdateCount++;
            }
        }

        public bool CheckLevelUp()
        {
            if (Experience - GetLevelExp(Level) >= ExperienceGoal && Level < 120)
            {
                Level++;
                if (Level == 20 && XpBoost > 0)
                    XpBoost = 0;
                ExperienceGoal = GetExpGoal(Level);
                if (Level < 21 && this != null && this.Owner != null && this.Client != null)
                {
                    try
                    {
                        foreach (XElement i in Manager.GameData.ObjectTypeToElement[ObjectType].Elements("LevelIncrease"))
                        {
                            var rand = new Random();
                            int min = int.Parse(i.Attribute("min").Value);
                            int max = int.Parse(i.Attribute("max").Value) + 1;
                            int limit =
                                int.Parse(
                                    Manager.GameData.ObjectTypeToElement[ObjectType].Element(i.Value).Attribute("max").Value);
                            int idx = StatsManager.StatsNameToIndex(i.Value);
                            if (Level < 21)
                            {
                                Stats[idx] += rand.Next(min, max);
                            }
                            if (Stats[idx] > limit)
                            {
                                Stats[idx] = limit;
                            }
                        }
                    }
                    catch { }
                    HP = Stats[0] + Boost[0];
                    MP = Stats[1] + Boost[1];
                    UpdateCount++;
                }

                if (Level == 120 && this != null && this.Owner != null && this.Client != null)
                {
                    foreach (Player i in Owner.Players.Values)
                        if (i != null && i.Owner != null && i.Client != null)
                            i.SendInfo(Name + " is now able to join the Elder Realms!");
                }
                questEntity = null;
                return true;
            }
            CalculateFame();
            return false;
        }

        public bool EnemyKilled(Enemy enemy, int exp, bool killer, int slotId)
        {
            try
            {
                if (enemy == questEntity)
                    BroadcastSync(new NotificationPacket
                    {
                        ObjectId = Id,
                        Color = new ARGB(0xFF00FF00),
                        Text = "Quest Complete!"
                    }, p => this.Dist(p) < 25);
                if (killer)
                {
                    if (slotId != -1 && Inventory[slotId] != null && Inventory.Data[slotId] != null && Inventory.Data[slotId].Strange)
                    {
                        ItemData data = Inventory.Data[slotId];
                        data.Kills++;
                        foreach (var i in data.StrangeParts)
                            switch (i.Key)
                            {
                                case "God Kills":
                                    if (enemy.ObjectDesc.God)
                                        data.StrangeParts[i.Key]++;
                                    break;
                                case "Quest Kills":
                                    if (enemy == questEntity)
                                        data.StrangeParts[i.Key]++;
                                    break;
                                case "Oryx Kills":
                                    if (enemy.ObjectDesc.Oryx)
                                        data.StrangeParts[i.Key]++;
                                    break;
                                case "Kills While Cloaked":
                                    if (HasConditionEffect(ConditionEffects.Invisible))
                                        data.StrangeParts[i.Key]++;
                                    break;
                                case "Kills Near Death":
                                    if (HP < Stats[0] * 0.2)
                                        data.StrangeParts[i.Key]++;
                                    break;
                                default:
                                    break;
                            }
                        switch (Inventory.Data[slotId].Kills)
                        {
                            case 0:
                                Inventory.Data[slotId].NamePrefix = "Strange"; break;
                            case 10:
                                Inventory.Data[slotId].NamePrefix = "Unremarkable"; break;
                            case 25:
                                Inventory.Data[slotId].NamePrefix = "Scarcely Lethal"; break;
                            case 45:
                                Inventory.Data[slotId].NamePrefix = "Mildly Menacing"; break;
                            case 70:
                                Inventory.Data[slotId].NamePrefix = "Somewhat Threatening"; break;
                            case 100:
                                Inventory.Data[slotId].NamePrefix = "Uncharitable"; break;
                            case 135:
                                Inventory.Data[slotId].NamePrefix = "Notably Dangerous"; break;
                            case 175:
                                Inventory.Data[slotId].NamePrefix = "Sufficiently Lethal"; break;
                            case 225:
                                Inventory.Data[slotId].NamePrefix = "Truly Feared"; break;
                            case 275:
                                Inventory.Data[slotId].NamePrefix = "Spectacularly Lethal"; break;
                            case 350:
                                Inventory.Data[slotId].NamePrefix = "Gore-Spattered"; break; 
                            case 500:
                                Inventory.Data[slotId].NamePrefix = "Wicked Nasty"; break;
                            case 750:
                                Inventory.Data[slotId].NamePrefix = "Positively Inhumane"; break;
                            case 999:
                                Inventory.Data[slotId].NamePrefix = "Totally Ordinary"; break;
                            case 1000:
                                Inventory.Data[slotId].NamePrefix = "Face-Melting"; break;
                            case 1500:
                                Inventory.Data[slotId].NamePrefix = "Rage-Inducing"; break;
                            case 2500:
                                Inventory.Data[slotId].NamePrefix = "Realm-Clearing"; break;
                            case 5000:
                                Inventory.Data[slotId].NamePrefix = "Epic";
                                Inventory.Data[slotId].DmgPercentage = 5; break;
                            case 7500:
                                Inventory.Data[slotId].NamePrefix = "Legendary"; 
                                Inventory.Data[slotId].DmgPercentage = 5; break;
                            case 7616:
                                Inventory.Data[slotId].NamePrefix = "Austrian"; 
                                Inventory.Data[slotId].DmgPercentage = 5; break;
                            case 8500:
                                Inventory.Data[slotId].NamePrefix = "Brutal"; 
                                Inventory.Data[slotId].DmgPercentage = 5; break;
                            case 10000:
                                Inventory.Data[slotId].NamePrefix = "Insanus";
                                Inventory.Data[slotId].DmgPercentage = 10;
                                Inventory.Data[slotId].CondEffect = 15;
                                Inventory.Data[slotId].CondChance = 5; break; 
                        }
                        UpdateCount++;
                    }
                }
                if (exp > 0)
                {
                    Experience += (XpBoost != 0) ? (exp * (int)XpBoost) : exp;
                    UpdateCount++;
                    foreach (Entity i in Owner.PlayersCollision.HitTest(X, Y, 15))
                    {
                        if (i != this && i != null)
                        {
                            (i as Player).Experience += exp;
                            (i as Player).UpdateCount++;
                            (i as Player).CheckLevelUp();
                        }
                    }
                }
                fames.Killed(enemy, killer, slotId);
                return CheckLevelUp();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return false;
            }
        }
    }
}