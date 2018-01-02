﻿using System;
using System.IO;
using System.Xml;
using System.Xml.Serialization;

[Serializable, XmlRoot("Fame"), XmlType(TypeName = "Fame")]
public class FameStats
{
    //-_-||
    [XmlElement("Char")]
    public Char __Char { get; set; }


    public int Shots { get; set; }
    public int ShotsThatDamage { get; set; }
    public int SpecialAbilityUses { get; set; }
    public int TilesUncovered { get; set; }
    public int Teleports { get; set; }
    public int PotionsDrunk { get; set; }
    public int MonsterKills { get; set; }
    public int MonsterAssists { get; set; }
    public int GodKills { get; set; }
    public int GodAssists { get; set; }
    public int CubeKills { get; set; }
    public int OryxKills { get; set; }
    public int QuestsCompleted { get; set; }
    public int PirateCavesCompleted { get; set; }
    public int UndeadLairsCompleted { get; set; }
    public int AbyssOfDemonsCompleted { get; set; }
    public int SnakePitsCompleted { get; set; }
    public int SpiderDensCompleted { get; set; }
    public int SpriteWorldsCompleted { get; set; }
    public int LevelUpAssists { get; set; }
    public int MinutesActive { get; set; }
    public int TombsCompleted { get; set; }
    public int TrenchesCompleted { get; set; }
    public int JunglesCompleted { get; set; }
    public int ManorsCompleted { get; set; }

    public void Read(byte[] bytes)
    {
        var reader = new NReader(new MemoryStream(bytes));
        byte id;
        do
        {
            id = reader.ReadByte();
            switch (id)
            {
                case 0:
                    Shots = reader.ReadInt32();
                    break;
                case 1:
                    ShotsThatDamage = reader.ReadInt32();
                    break;
                case 2:
                    SpecialAbilityUses = reader.ReadInt32();
                    break;
                case 3:
                    TilesUncovered = reader.ReadInt32();
                    break;
                case 4:
                    Teleports = reader.ReadInt32();
                    break;
                case 5:
                    PotionsDrunk = reader.ReadInt32();
                    break;
                case 6:
                    MonsterKills = reader.ReadInt32();
                    break;
                case 7:
                    MonsterAssists = reader.ReadInt32();
                    break;
                case 8:
                    GodKills = reader.ReadInt32();
                    break;
                case 9:
                    GodAssists = reader.ReadInt32();
                    break;
                case 10:
                    CubeKills = reader.ReadInt32();
                    break;
                case 11:
                    OryxKills = reader.ReadInt32();
                    break;
                case 12:
                    QuestsCompleted = reader.ReadInt32();
                    break;
                case 13:
                    PirateCavesCompleted = reader.ReadInt32();
                    break;
                case 14:
                    UndeadLairsCompleted = reader.ReadInt32();
                    break;
                case 15:
                    AbyssOfDemonsCompleted = reader.ReadInt32();
                    break;
                case 16:
                    SnakePitsCompleted = reader.ReadInt32();
                    break;
                case 17:
                    SpiderDensCompleted = reader.ReadInt32();
                    break;
                case 18:
                    SpriteWorldsCompleted = reader.ReadInt32();
                    break;
                case 19:
                    LevelUpAssists = reader.ReadInt32();
                    break;
                case 20:
                    MinutesActive = reader.ReadInt32();
                    break;
                case 21:
                    TombsCompleted = reader.ReadInt32();
                    break;
                case 22:
                    TrenchesCompleted = reader.ReadInt32();
                    break;
                case 23:
                    JunglesCompleted = reader.ReadInt32();
                    break;
                case 24:
                    ManorsCompleted = reader.ReadInt32();
                    break;
            }
        } while (reader.PeekChar() != -1);
    }

    public byte[] Write()
    {
        var dat = new[]
        {
            new Tuple<byte, int>(0, Shots),
            new Tuple<byte, int>(1, ShotsThatDamage),
            new Tuple<byte, int>(2, SpecialAbilityUses),
            new Tuple<byte, int>(3, TilesUncovered),
            new Tuple<byte, int>(4, Teleports),
            new Tuple<byte, int>(5, PotionsDrunk),
            new Tuple<byte, int>(6, MonsterKills),
            new Tuple<byte, int>(7, MonsterAssists),
            new Tuple<byte, int>(8, GodKills),
            new Tuple<byte, int>(9, GodAssists),
            new Tuple<byte, int>(10, CubeKills),
            new Tuple<byte, int>(11, OryxKills),
            new Tuple<byte, int>(12, QuestsCompleted),
            new Tuple<byte, int>(13, PirateCavesCompleted),
            new Tuple<byte, int>(14, UndeadLairsCompleted),
            new Tuple<byte, int>(15, AbyssOfDemonsCompleted),
            new Tuple<byte, int>(16, SnakePitsCompleted),
            new Tuple<byte, int>(17, SpiderDensCompleted),
            new Tuple<byte, int>(18, SpriteWorldsCompleted),
            new Tuple<byte, int>(19, LevelUpAssists),
            new Tuple<byte, int>(20, MinutesActive),
            new Tuple<byte, int>(21, TombsCompleted),
            new Tuple<byte, int>(22, TrenchesCompleted),
            new Tuple<byte, int>(23, JunglesCompleted),
            new Tuple<byte, int>(24, ManorsCompleted)
        };

        var ret = new MemoryStream();
        using (var wtr = new NWriter(ret))
        {
            foreach (var i in dat)
            {
                wtr.Write(i.Item1);
                wtr.Write(i.Item2);
            }
        }
        return ret.ToArray();
    }

    public int CalculateTotal(XmlData data, Account acc, Char chr, int baseFame, out bool firstBorn)
    {
        double bonus = 0;
        if (chr.CharacterId < 2) //Ancestor
        {
            bonus = Math.Floor(bonus) + ((baseFame + Math.Floor(bonus))*0.1) + 20;
        }
        //Legacy Builder???
        if (ShotsThatDamage == 0) //Pacifist
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
        }
        if (PotionsDrunk == 0) //Thirsty
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
        }
        if (SpecialAbilityUses == 0 && chr.Level == 20) //Mundane
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
        }
        if (Teleports == 0) //Boots on the Ground
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
        }
        if (PirateCavesCompleted > 0 &&
            UndeadLairsCompleted > 0 &&
            AbyssOfDemonsCompleted > 0 &&
            SnakePitsCompleted > 0 &&
            SpiderDensCompleted > 0 &&
            SpriteWorldsCompleted > 0 &&
            TombsCompleted > 0 &&
            TrenchesCompleted > 0 &&
            JunglesCompleted > 0 &&
            ManorsCompleted > 0) //Tunnel Rat
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if ((double)GodKills / (GodKills + MonsterKills) > 0.1 && chr.Level == 20) //Enemy of the Gods
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if ((double)GodKills / (GodKills + MonsterKills) > 0.5 && chr.Level == 20) //Slayer of the Gods
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if (OryxKills > 0) //Oryx Slayer
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if ((double)ShotsThatDamage / Shots > 0.25 && chr.Level == 20) //Accurate
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if ((double)ShotsThatDamage / Shots > 0.5 && chr.Level == 20) //Sharpshooter
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if ((double)ShotsThatDamage / Shots > 0.75 && chr.Level == 20) //Sniper
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if (TilesUncovered > 1000000) //Explorer
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.05;
        }
        if (TilesUncovered > 4000000) //Cartographer
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.05;
        }
        if (LevelUpAssists > 100) //Team Player
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if (LevelUpAssists > 1000) //Leader of Men
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if (QuestsCompleted > 1000) //Doer of Deeds
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        if (CubeKills == 0 && chr.Level == 20) //Friend of the Cubes
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
        }
        double eq = 0;
        for (int i = 0; i < 4; i++) //Well Equipped
        {
            if (chr.Equipment[i] == 0xffff) continue;
            int b = data.Items[chr.Equipment[i]].FameBonus;
            if (b > 0)
                eq += (baseFame + Math.Floor(bonus))*b/100;
        }
        bonus = Math.Floor(bonus) + Math.Floor(eq);
        if (baseFame + Math.Floor(bonus) > acc.Stats.BestCharFame) //First Born
        {
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            firstBorn = true;
        }
        else
            firstBorn = false;

        return (int) (baseFame + Math.Floor(bonus));
    }

    private void SerializeBonus(XmlDocument doc, XmlData dat, Account acc, Char chr, int baseFame, bool firstBorn)
    {
        double bonus = 0;
        if (chr.CharacterId < 2) //Ancestor
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Ancestor";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "First death of any of your characters";
            x.Attributes.Append(descAttr);
            x.InnerText = ((Math.Floor((baseFame + Math.Floor(bonus))*0.1) + 20)).ToString();
            bonus = Math.Floor(bonus) + ((baseFame + Math.Floor(bonus))*0.1) + 20;
            doc.DocumentElement.AppendChild(x);
        }
        //Legacy Builder???
        if (ShotsThatDamage == 0) //Pacifist
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Pacifist";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Never shot a bullet which hit an enemy";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.25)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
            doc.DocumentElement.AppendChild(x);
        }
        if (PotionsDrunk == 0) //Thirsty
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Thirsty";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Never drank a potion from inventory";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.25)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
            doc.DocumentElement.AppendChild(x);
        }
        if (SpecialAbilityUses == 0 && chr.Level == 20) //Mundane
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Mundane";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Never used special ability (requires level 20)";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.25)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
            doc.DocumentElement.AppendChild(x);
        }
        if (Teleports == 0) //Boots on the Ground
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Boots on the Ground";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Never teleported";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.25)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.25;
            doc.DocumentElement.AppendChild(x);
        }
        if (PirateCavesCompleted > 0 &&
            UndeadLairsCompleted > 0 &&
            AbyssOfDemonsCompleted > 0 &&
            SnakePitsCompleted > 0 &&
            SpiderDensCompleted > 0 &&
            SpriteWorldsCompleted > 0 &&
            TombsCompleted > 0 &&
            TrenchesCompleted > 0 &&
            JunglesCompleted > 0 &&
            ManorsCompleted > 0) //Tunnel Rat
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Tunnel Rat";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Completed every dungeon type";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if ((double)GodKills / (GodKills + MonsterKills) > 0.1 && chr.Level == 20) //Enemy of the Gods
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Enemy of the Gods";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "More than 10% of kills are gods (requires level 20)";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if ((double)GodKills / (GodKills + MonsterKills) > 0.5 && chr.Level == 20) //Slayer of the Gods
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Slayer of the Gods";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "More than 50% of kills are gods (requires level 20)";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if (OryxKills > 0) //Oryx Slayer
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Oryx Slayer";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Dealt Killing blow to Oryx";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if ((double)ShotsThatDamage / Shots > 0.25 && chr.Level == 20) //Accurate
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Accurate";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Accuracy of better than 25% (requires level 20)";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if ((double)ShotsThatDamage / Shots > 0.5 && chr.Level == 20) //Sharpshooter
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Sharpshooter";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Accuracy of better than 50% (requires level 20)";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if ((double)ShotsThatDamage / Shots > 0.75 && chr.Level == 20) //Sniper
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Sniper";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Accuracy of better than 75% (requires level 20)";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if (TilesUncovered > 1000000) //Explorer
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Explorer";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "More than 1 million tiles uncovered";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.05)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.05;
            doc.DocumentElement.AppendChild(x);
        }
        if (TilesUncovered > 4000000) //Cartographer
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Cartographer";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "More than 4 million tiles uncovered";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.05)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.05;
            doc.DocumentElement.AppendChild(x);
        }
        if (LevelUpAssists > 100) //Team Player
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Team Player";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "More than 100 party member level ups";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if (LevelUpAssists > 1000) //Leader of Men
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Leader of Men";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "More than 1000 party member level ups";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if (QuestsCompleted > 1000) //Doer of Deeds
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Doer of Deeds";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "More than 1000 quests completed";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        if (CubeKills == 0 && chr.Level == 20) //Friend of the Cubes
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Friend of the Cubes";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Never killed a cube (requires level 20)";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
        double bo = 0;
        for (int i = 0; i < 4; i++) //Well Equipped
        {
            if (chr.Equipment[i] == 0xffff) continue;
            int b = dat.Items[chr.Equipment[i]].FameBonus;
            if (b > 0)
                bo += (baseFame + Math.Floor(bonus))*b/100;
        }
        if (bo > 0)
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "Well Equipped";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Bonus for equipment";
            x.Attributes.Append(descAttr);
            x.InnerText = ((int) bo).ToString();
            bonus = Math.Floor(bonus) + Math.Floor(bo);
            doc.DocumentElement.AppendChild(x);
        }
        if (firstBorn)
        {
            XmlElement x = doc.CreateElement("Bonus");
            XmlAttribute idAttr = doc.CreateAttribute("id");
            idAttr.Value = "First Born";
            x.Attributes.Append(idAttr);
            XmlAttribute descAttr = doc.CreateAttribute("desc");
            descAttr.Value = "Best fame of any of your previous incarnations";
            x.Attributes.Append(descAttr);
            x.InnerText = (Math.Floor((baseFame + Math.Floor(bonus))*0.1)).ToString();
            bonus = Math.Floor(bonus) + (baseFame + Math.Floor(bonus))*0.1;
            doc.DocumentElement.AppendChild(x);
        }
    }

    public string Serialize(XmlData dat, Account acc, Char chr, int time, string killer, bool firstBorn)
    {
        __Char = chr;
        var xmlDoc = new XmlDocument();
        {
            var serializer = new XmlSerializer(GetType());
            using (XmlWriter wtr = xmlDoc.CreateNavigator().AppendChild())
                serializer.Serialize(wtr, this);
            xmlDoc.DocumentElement.Attributes.RemoveAll();
        }
        XmlElement ac = xmlDoc.CreateElement("Account");
        XmlElement name = xmlDoc.CreateElement("Name");
        name.InnerText = acc.Name;
        ac.AppendChild(name);

        xmlDoc.SelectSingleNode("/Fame/Char").AppendChild(ac);

        SerializeBonus(xmlDoc, dat, acc, chr, chr.CurrentFame, firstBorn);

        XmlElement basFame = xmlDoc.CreateElement("BaseFame");
        basFame.InnerText = chr.CurrentFame.ToString();
        xmlDoc.DocumentElement.AppendChild(basFame);
        XmlElement totalFame = xmlDoc.CreateElement("TotalFame");
        totalFame.InnerText = CalculateTotal(dat, acc, chr, chr.CurrentFame, out firstBorn).ToString();
        xmlDoc.DocumentElement.AppendChild(totalFame);
        XmlElement deathTime = xmlDoc.CreateElement("CreatedOn");
        deathTime.InnerText = time.ToString();
        xmlDoc.DocumentElement.AppendChild(deathTime);
        XmlElement killed = xmlDoc.CreateElement("KilledBy");
        killed.InnerText = killer;
        xmlDoc.DocumentElement.AppendChild(killed);


        var result = new StringWriter();
        xmlDoc.Save(result);
        return result.ToString();
    }
}