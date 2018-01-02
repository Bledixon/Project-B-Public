using System;
using System.Collections.Generic;
using System.Xml.Linq;

[Flags]
public enum ConditionEffects
{
    Dead = 1 << 0,
    Quiet = 1 << 1,
    Weak = 1 << 2,
    Slowed = 1 << 3,
    Sick = 1 << 4,
    Dazed = 1 << 5,
    Stunned = 1 << 6,
    Blind = 1 << 7,
    Hallucinating = 1 << 8,
    Drunk = 1 << 9,
    Confused = 1 << 10,
    StunImmune = 1 << 11,
    Invisible = 1 << 12,
    Paralyzed = 1 << 13,
    Speedy = 1 << 14,
    Bleeding = 1 << 15,
    NotUsed = 1 << 16,
    Healing = 1 << 17,
    Damaging = 1 << 18,
    Berserk = 1 << 19,
    Paused = 1 << 20,
    Stasis = 1 << 21,
    StasisImmune = 1 << 22,
    Invincible = 1 << 23,
    Invulnerable = 1 << 24,
    Armored = 1 << 25,
    ArmorBroken = 1 << 26,
    ParalyzedImmune = 1 << 28,
}

public enum ConditionEffectIndex
{
    Dead = 0,
    Quiet = 1,
    Weak = 2,
    Slowed = 3,
    Sick = 4,
    Dazed = 5,
    Stunned = 6,
    Blind = 7,
    Hallucinating = 8,
    Drunk = 9,
    Confused = 10,
    StunImmune = 11,
    Invisible = 12,
    Paralyzed = 13,
    Speedy = 14,
    Bleeding = 15,
    NotUsed = 16,
    Healing = 17,
    Damaging = 18,
    Berserk = 19,
    Paused = 20,
    Stasis = 21,
    StasisImmune = 22,
    Invincible = 23,
    Invulnerable = 24,
    Armored = 25,
    ArmorBroken = 26,
    Hexed = 27,
    ParalyzedImmune = 28
}

public class ConditionEffect
{
    public ConditionEffect()
    {
    }

    public ConditionEffect(XElement elem)
    {
        Effect = (ConditionEffectIndex)Enum.Parse(typeof(ConditionEffectIndex), elem.Value.Replace(" ", ""));
        if (elem.Attribute("duration") != null)
            DurationMS = (int)(float.Parse(elem.Attribute("duration").Value) * 1000);
        if (elem.Attribute("range") != null)
            Range = float.Parse(elem.Attribute("range").Value);
    }

    public ConditionEffectIndex Effect { get; set; }
    public int DurationMS { get; set; }
    public float Range { get; set; }
}

public class ProjectileDesc
{
    public ProjectileDesc(XElement elem)
    {
        XElement n;
        if (elem.Attribute("id") != null)
            BulletType = Utils.FromString(elem.Attribute("id").Value);
        ObjectId = elem.Element("ObjectId").Value;
        LifetimeMS = Utils.FromString(elem.Element("LifetimeMS").Value);
        Speed = float.Parse(elem.Element("Speed").Value);
        if ((n = elem.Element("Size")) != null)
            Size = Utils.FromString(n.Value);

        XElement dmg = elem.Element("Damage");
        if (dmg != null)
            MinDamage = MaxDamage = Utils.FromString(dmg.Value);
        else
        {
            MinDamage = Utils.FromString(elem.Element("MinDamage").Value);
            MaxDamage = Utils.FromString(elem.Element("MaxDamage").Value);
        }

        var effects = new List<ConditionEffect>();
        foreach (XElement i in elem.Elements("ConditionEffect"))
            effects.Add(new ConditionEffect(i));
        Effects = effects.ToArray();

        MultiHit = elem.Element("MultiHit") != null;
        PassesCover = elem.Element("PassesCover") != null;
        ArmorPiercing = elem.Element("ArmorPiercing") != null;
        ParticleTrail = elem.Element("ParticleTrail") != null;
        Wavy = elem.Element("Wavy") != null;
        Parametric = elem.Element("Parametric") != null;
        Boomerang = elem.Element("Boomerang") != null;

        n = elem.Element("Amplitude");
        if (n != null)
            Amplitude = float.Parse(n.Value);
        else
            Amplitude = 0;
        n = elem.Element("Frequency");
        if (n != null)
            Frequency = float.Parse(n.Value);
        else
            Frequency = 1;
        n = elem.Element("Magnitude");
        if (n != null)
            Magnitude = float.Parse(n.Value);
        else
            Magnitude = 3;
    }

    public int BulletType { get; private set; }
    public string ObjectId { get; private set; }
    public int LifetimeMS { get; private set; }
    public float Speed { get; private set; }
    public int Size { get; private set; }
    public int MinDamage { get; private set; }
    public int MaxDamage { get; private set; }

    public ConditionEffect[] Effects { get; private set; }

    public bool MultiHit { get; private set; }
    public bool PassesCover { get; private set; }
    public bool ArmorPiercing { get; private set; }
    public bool ParticleTrail { get; private set; }
    public bool Wavy { get; private set; }
    public bool Parametric { get; private set; }
    public bool Boomerang { get; private set; }

    public float Amplitude { get; private set; }
    public float Frequency { get; private set; }
    public float Magnitude { get; private set; }
}

public enum ActivateEffects
{
    Shoot,
    StatBoostSelf,
    StatBoostAura,
    BulletNova,
    ConditionEffectAura,
    ConditionEffectSelf,
    Heal,
    HealNova,
    Magic,
    MagicNova,
    Teleport,
    VampireBlast,
    Trap,
    StasisBlast,
    Decoy,
    Lightning,
    PoisonGrenade,
    ShurikenAbility,
    RemoveNegativeConditions,
    RemoveNegativeConditionsSelf,
    IncrementStat,
    DecrementStat,
    Pet,
    PermaPet,
    Create,
    UnlockPortal,
    DazeBlast,
    ClearConditionEffectAura,
    ClearConditionEffectSelf,
    Dye,
    UnlockSkin,
    SwitchMusic,
    OpenCrate,
    RenameItem,
    RemoveSkin,
    BindSkin,
    StrangePart,
    Strangify,
    UnbindSkin,
    upgrade1,
    upgrade2,
    upgrade3,
    upgrade4,
    upgrade5,
    upgrade6,
    upgrade7,
    upgrade8,
    upgrade9,
    Backpack,
    Fame,
    Gold,
    HealthBlast
}

public class ActivateEffect
{
    public ActivateEffect(XElement elem)
    {
        Effect = (ActivateEffects)Enum.Parse(typeof(ActivateEffects), elem.Value);
        if (elem.Attribute("stat") != null)
            Stats = Utils.FromString(elem.Attribute("stat").Value);

        if (elem.Attribute("amount") != null)
            Amount = Utils.FromString(elem.Attribute("amount").Value);

        if (elem.Attribute("range") != null)
            Range = float.Parse(elem.Attribute("range").Value);
        if (elem.Attribute("duration") != null)
            DurationMS = (int)(float.Parse(elem.Attribute("duration").Value) * 1000);

        if (elem.Attribute("effect") != null)
            ConditionEffect =
                (ConditionEffectIndex)Enum.Parse(typeof(ConditionEffectIndex), elem.Attribute("effect").Value);
        if (elem.Attribute("condEffect") != null)
            ConditionEffect =
                (ConditionEffectIndex)Enum.Parse(typeof(ConditionEffectIndex), elem.Attribute("condEffect").Value);

        if (elem.Attribute("condDuration") != null)
            EffectDuration = float.Parse(elem.Attribute("condDuration").Value);

        if (elem.Attribute("maxDistance") != null)
            MaximumDistance = Utils.FromString(elem.Attribute("maxDistance").Value);

        if (elem.Attribute("radius") != null)
            Radius = float.Parse(elem.Attribute("radius").Value);

        if (elem.Attribute("totalDamage") != null)
            TotalDamage = Utils.FromString(elem.Attribute("totalDamage").Value);

        if (elem.Attribute("objectId") != null)
            ObjectId = elem.Attribute("objectId").Value;

        if (elem.Attribute("angleOffset") != null)
            AngleOffset = Utils.FromString(elem.Attribute("angleOffset").Value);

        if (elem.Attribute("maxTargets") != null)
            MaxTargets = Utils.FromString(elem.Attribute("maxTargets").Value);

        if (elem.Attribute("id") != null)
            Id = elem.Attribute("id").Value;

        if (elem.Attribute("dungeonName") != null)
            DungeonName = elem.Attribute("dungeonName").Value;

        if (elem.Attribute("lockedName") != null)
            LockedName = elem.Attribute("lockedName").Value;

        if (elem.Attribute("skinType") != null)
            SkinType = Utils.FromString(elem.Attribute("skinType").Value);
    }

    public ActivateEffects Effect { get; private set; }
    public int Stats { get; private set; }
    public int Amount { get; private set; }
    public float Range { get; private set; }
    public int DurationMS { get; private set; }
    public ConditionEffectIndex? ConditionEffect { get; private set; }
    public float EffectDuration { get; private set; }
    public int MaximumDistance { get; private set; }
    public float Radius { get; private set; }
    public int TotalDamage { get; private set; }
    public string ObjectId { get; private set; }
    public int AngleOffset { get; private set; }
    public int MaxTargets { get; private set; }
    public string Id { get; private set; }
    public string DungeonName { get; private set; }
    public string LockedName { get; private set; }
    public int SkinType { get; private set; }
}

public class PortalDesc
{
    public PortalDesc(ushort type, XElement elem)
    {
        XElement n;
        ObjectType = type;
        ObjectId = elem.Attribute("id").Value;
        if ((n = elem.Element("NexusPortal")) != null) //<NexusPortal/>
            NexusPortal = true;
        Party = elem.Element("Party") != null;
        if ((n = elem.Element("DungeonName")) != null) //<NexusPortal/>
            DungeonName = elem.Element("DungeonName").Value;
        TimeoutTime = 30;
    }

    public ushort ObjectType { get; private set; }
    public string DisplayId { get; private set; }
    public string ObjectId { get; private set; }
    public string DungeonName { get; private set; }
    public int TimeoutTime { get; private set; }
    public bool NexusPortal { get; private set; }
    public bool Party { get; private set; }
}

public class Item
{
    public Item(ushort type, XElement elem)
    {
        XElement n;
        ObjectType = type;
        ObjectId = elem.Attribute(XName.Get("id")).Value;
        if ((n = elem.Element("Class")) != null)
            Class = n.Value;
        SlotType = Utils.FromString(elem.Element("SlotType").Value);
        if ((n = elem.Element("Tier")) != null)
        {
            try
            {
                Tier = Utils.FromString(n.Value);
            }
            catch
            {
                Tier = -1;
            }
        }
        else
            Tier = -1;
        Description = elem.Element("Description").Value;
        if ((n = elem.Element("RateOfFire")) != null)
            RateOfFire = float.Parse(n.Value);
        else
            RateOfFire = 1;
        Usable = elem.Element("Usable") != null;
        if ((n = elem.Element("BagType")) != null)
            BagType = Utils.FromString(n.Value);
        else
            BagType = 0;
        if ((n = elem.Element("MpCost")) != null)
            MpCost = Utils.FromString(n.Value);
        else
            MpCost = 0;
        if ((n = elem.Element("MpEndCost")) != null)
            MpEndCost = Utils.FromString(n.Value);
        else
            MpEndCost = 0;
        if ((n = elem.Element("FameBonus")) != null)
            FameBonus = Utils.FromString(n.Value);
        else
            FameBonus = 0;
        if ((n = elem.Element("NumProjectiles")) != null)
            NumProjectiles = Utils.FromString(n.Value);
        else
            NumProjectiles = 1;
        if ((n = elem.Element("ArcGap")) != null)
            ArcGap = Utils.FromString(n.Value);
        else
            ArcGap = 11.25f;
        Consumable = elem.Element("Consumable") != null;
        Potion = elem.Element("Potion") != null;
       // Backpack = elem.Element("Backpack") != null;
        if ((n = elem.Element("DisplayId")) != null)
            DisplayId = n.Value;
        else
            DisplayId = null;
        if ((n = elem.Element("Doses")) != null)
            Doses = Utils.FromString(n.Value);
        else
            Doses = 0;
        if ((n = elem.Element("SuccessorId")) != null)
            SuccessorId = n.Value;
        else
            SuccessorId = null;
        Soulbound = elem.Element("Soulbound") != null;
        Material = elem.Element("Material") != null;
        AdminOnly = elem.Element("AdminOnly") != null;
        if ((n = elem.Element("XpBoost")) != null)
            XpBoost = Utils.FromString(n.Value);
        else
            XpBoost = null;
        if ((n = elem.Element("Cooldown")) != null)
            Cooldown = float.Parse(n.Value);
        else
            Cooldown = 0;
        Resurrects = elem.Element("Resurrects") != null;
        HalloweenItem = elem.Element("HalloweenItem") != null;
        Stackable = elem.Element("Stackable") != null;
        BypassCool = elem.Element("BypassCool") != null;
        if ((n = elem.Element("LevelReq")) != null)
            LevelRequirement = Utils.FromString(n.Value);
        else
            LevelRequirement = 0;

        if ((n = elem.Element("MaxStack")) != null)
            MaxStack = Utils.FromString(n.Value);
        else
            MaxStack = 1;

        Texture1 = (n = elem.Element("Tex1")) != null ? Convert.ToInt32(n.Value, 16) : 0;
        Texture2 = (n = elem.Element("Tex2")) != null ? Convert.ToInt32(n.Value, 16) : 0;

        if ((IsCrate = elem.Element("Crate") != null))
            Crate = Utils.FromString(elem.Element("Crate").Value);
        else
            Crate = 0;

        UnusualCrate = elem.Element("UnusualCrate") != null;
        Premium = elem.Element("Premium") != null;
        HalloweenCrate = elem.Element("HalloweenCrate") != null;

        if ((n = elem.Element("Price")) != null)
            Price = Utils.FromString(n.Value);
        else
            Price = 0;

        var stats = new List<KeyValuePair<int, int>>();
        foreach (XElement i in elem.Elements("ActivateOnEquip"))
            stats.Add(new KeyValuePair<int, int>(int.Parse(i.Attribute("stat").Value),
                int.Parse(i.Attribute("amount").Value)));
        StatsBoost = stats.ToArray();

        var activate = new List<ActivateEffect>();
        foreach (XElement i in elem.Elements("Activate"))
            activate.Add(new ActivateEffect(i));
        ActivateEffects = activate.ToArray();

        var prj = new List<ProjectileDesc>();
        foreach (XElement i in elem.Elements("Projectile"))
            prj.Add(new ProjectileDesc(i));
        Projectiles = prj.ToArray();
    }

    public ushort ObjectType { get; private set; }
    public string ObjectId { get; private set; }
    public string Class { get; private set; }
    public int SlotType { get; private set; }
    public int Tier { get; private set; }
    public string Description { get; private set; }
    public float RateOfFire { get; private set; }
    public bool Usable { get; private set; }
    public int BagType { get; private set; }
    public int MpCost { get; private set; }
    public int MpEndCost { get; private set; }
    public int FameBonus { get; private set; }
    public int NumProjectiles { get; private set; }
    public float ArcGap { get; private set; }
    public bool Consumable { get; private set; }
    public bool Potion { get; private set; }
   // public bool Backpack { get; private set; }
    public string DisplayId { get; private set; }
    public int Doses { get; set; }
    public string SuccessorId { get; private set; }
    public bool Soulbound { get; private set; }
    public bool Material { get; private set; }
    public bool AdminOnly { get; private set; }
    public float Cooldown { get; private set; }
    public bool Resurrects { get; private set; }
    public bool HalloweenItem { get; private set; }
    public bool Stackable { get; private set; }
    public bool BypassCool { get; private set; }
    public int Texture1 { get; private set; }
    public int Texture2 { get; private set; }
    public int? XpBoost { get; private set; }
    public int LevelRequirement { get; private set; }
    public bool IsCrate { get; private set; }
    public int Crate { get; private set; }
    public bool UnusualCrate { get; private set; }
    public bool Premium { get; private set; }
    public bool HalloweenCrate { get; private set; }
    public int Price { get; private set; }
    public int MaxStack { get; private set; }
    public int[] SlotTypes { get; private set; }

    public KeyValuePair<int, int>[] StatsBoost { get; private set; }
    public ActivateEffect[] ActivateEffects { get; private set; }
    public ProjectileDesc[] Projectiles { get; private set; }
}

public class SpawnCount
{
    public SpawnCount(XElement elem)
    {
        Mean = Utils.FromString(elem.Element("Mean").Value);
        StdDev = Utils.FromString(elem.Element("StdDev").Value);
        Min = Utils.FromString(elem.Element("Min").Value);
        Max = Utils.FromString(elem.Element("Max").Value);
    }

    public int Mean { get; private set; }
    public int StdDev { get; private set; }
    public int Min { get; private set; }
    public int Max { get; private set; }
}

public class ObjectDesc
{
    public ObjectDesc(ushort type, XElement elem)
    {
        XElement n;
        ObjectType = type;
        ObjectId = elem.Attribute("id").Value;
        Class = elem.Element("Class").Value;
        if ((n = elem.Element("Group")) != null)
            Group = n.Value;
        else
            Group = null;
        if ((n = elem.Element("DisplayId")) != null)
            DisplayId = n.Value;
        else
            DisplayId = null;
        Player = elem.Element("Player") != null;
        Enemy = elem.Element("Enemy") != null;
        OccupySquare = elem.Element("OccupySquare") != null;
        FullOccupy = elem.Element("FullOccupy") != null;
        EnemyOccupySquare = elem.Element("EnemyOccupySquare") != null;
        Static = elem.Element("Static") != null;
        NoMiniMap = elem.Element("NoMiniMap") != null;
        ProtectFromGroundDamage = elem.Element("ProtectFromGroundDamage") != null;
        ProtectFromSink = elem.Element("ProtectFromSink") != null;
        Flying = elem.Element("Flying") != null;
        ShowName = elem.Element("ShowName") != null;
        DontFaceAttacks = elem.Element("DontFaceAttacks") != null;
        BlocksSight = elem.Element("BlocksSight") != null;

        if (Class != "Wall")
        {
            if ((n = elem.Element("Size")) != null)
            {
                MinSize = MaxSize = Utils.FromString(n.Value);
                SizeStep = 0;
            }
            else
            {
                if ((n = elem.Element("MinSize")) != null)
                    MinSize = Utils.FromString(n.Value);
                else
                    MinSize = 100;
                if ((n = elem.Element("MaxSize")) != null)
                    MaxSize = Utils.FromString(n.Value);
                else
                    MaxSize = 100;
                if ((n = elem.Element("SizeStep")) != null)
                    SizeStep = Utils.FromString(n.Value);
                else
                    SizeStep = 0;
            }
        }

        var prj = new List<ProjectileDesc>();
        foreach (XElement i in elem.Elements("Projectile"))
            prj.Add(new ProjectileDesc(i));
        Projectiles = prj.ToArray();

        if ((n = elem.Element("MaxHitPoints")) != null)
            MaxHP = Utils.FromString(n.Value);
        if ((n = elem.Element("Defense")) != null)
            Defense = Utils.FromString(n.Value);
        if ((n = elem.Element("Terrain")) != null)
            Terrain = n.Value;
        if ((n = elem.Element("SpawnProbability")) != null)
            SpawnProbability = float.Parse(n.Value);
        if ((n = elem.Element("Spawn")) != null)
            Spawn = new SpawnCount(n);

        God = elem.Element("God") != null;
        Cube = elem.Element("Cube") != null;
        Quest = elem.Element("Quest") != null;
        if ((n = elem.Element("Level")) != null)
            Level = Utils.FromString(n.Value);
        else
            Level = null;

        KeepDamageRecord = elem.Element("KeepDamageRecord") != null;

        StasisImmune = elem.Element("StasisImmune") != null;
        StunImmune = elem.Element("StunImmune") != null;
        ParalyzedImmune = elem.Element("ParalyzeImmune") != null;
        Oryx = elem.Element("Oryx") != null;
        Hero = elem.Element("Hero") != null;
        if ((n = elem.Element("MaxHitPoints")) != null)
        {
            MaxHitPoints = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
            MaxHP = Utils.FromString(n.Value);
        }
        if ((n = elem.Element("MaxMagicPoints")) != null)
            MaxMagicPoints = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;

        if ((n = elem.Element("Attack")) != null)
            MaxAttack = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
        if ((n = elem.Element("Dexterity")) != null)
            MaxDexterity = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
        if ((n = elem.Element("Speed")) != null)
            MaxSpeed = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
        if ((n = elem.Element("HpRegen")) != null)
            MaxHpRegen = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
        if ((n = elem.Element("MpRegen")) != null)
            MaxMpRegen = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
        if ((n = elem.Element("Luck")) != null)
            MaxLuck = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
        if ((n = elem.Element("Crit")) != null)
            MaxCrit = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;

        if ((n = elem.Element("Defense")) != null)
        {
            Defense = Utils.FromString(n.Value);
            MaxDefense = n.Attribute("max") != null ? Utils.FromString(n.Attribute("max").Value) : -1;
        }

        if ((n = elem.Element("PerRealmMax")) != null)
            PerRealmMax = Utils.FromString(n.Value);
        else
            PerRealmMax = null;
        if ((n = elem.Element("XpMult")) != null)
            ExpMultiplier = float.Parse(n.Value);
        else
            ExpMultiplier = null;
    }

    public int MaxHitPoints { get; private set; }
    public int MaxMagicPoints { get; private set; }
    public int MaxAttack { get; private set; }
    public int MaxDefense { get; private set; }
    public int MaxSpeed { get; private set; }
    public int MaxDexterity { get; private set; }
    public int MaxHpRegen { get; private set; }
    public int MaxMpRegen { get; private set; }
    public int MaxLuck { get; private set; }
    public int MaxCrit { get; private set; }
    public ushort ObjectType { get; private set; }
    public string ObjectId { get; private set; }
    public string DisplayId { get; private set; }
    public string Group { get; private set; }
    public string Class { get; private set; }
    public bool Player { get; private set; }
    public bool Enemy { get; private set; }
    public bool OccupySquare { get; private set; }
    public bool FullOccupy { get; private set; }
    public bool EnemyOccupySquare { get; private set; }
    public bool Static { get; private set; }
    public bool NoMiniMap { get; private set; }
    public bool ProtectFromGroundDamage { get; private set; }
    public bool ProtectFromSink { get; private set; }
    public bool Flying { get; private set; }
    public bool ShowName { get; private set; }
    public bool DontFaceAttacks { get; private set; }
    public bool BlocksSight { get; private set; }
    public int MinSize { get; private set; }
    public int MaxSize { get; private set; }
    public int SizeStep { get; private set; }
    public bool KeepDamageRecord { get; private set; }
    public ProjectileDesc[] Projectiles { get; private set; }


    public int MaxHP { get; private set; }
    public int Defense { get; private set; }
    public string Terrain { get; private set; }
    public float SpawnProbability { get; private set; }
    public SpawnCount Spawn { get; private set; }
    public bool Cube { get; private set; }
    public bool God { get; private set; }
    public bool Quest { get; private set; }
    public int? Level { get; private set; }
    public bool StasisImmune { get; private set; }
    public bool StunImmune { get; private set; }
    public bool ParalyzedImmune { get; private set; }
    public bool Oryx { get; private set; }
    public bool Hero { get; private set; }
    public int? PerRealmMax { get; private set; }
    public float? ExpMultiplier { get; private set; } //Exp gained = level total / 10 * multi
}

public class TileDesc
{
    public TileDesc(ushort type, XElement elem)
    {
        XElement n;
        ObjectType = type;
        ObjectId = elem.Attribute("id").Value;
        NoWalk = elem.Element("NoWalk") != null;
        if ((n = elem.Element("MinDamage")) != null)
        {
            MinDamage = Utils.FromString(n.Value);
            Damaging = true;
        }
        if ((n = elem.Element("MaxDamage")) != null)
        {
            MaxDamage = Utils.FromString(n.Value);
            Damaging = true;
        }
        if ((n = elem.Element("Speed")) != null)
            Speed = float.Parse(n.Value);
        Push = elem.Element("Push") != null;
        if (Push)
        {
            XElement anim = elem.Element("Animate");
            if (anim.Attribute("dx") != null)
                PushX = float.Parse(anim.Attribute("dx").Value);
            if (elem.Attribute("dy") != null)
                PushY = float.Parse(anim.Attribute("dy").Value);
        }
    }

    public ushort ObjectType { get; private set; }
    public string ObjectId { get; private set; }
    public bool NoWalk { get; private set; }
    public bool Damaging { get; private set; }
    public int MinDamage { get; private set; }
    public int MaxDamage { get; private set; }
    public float Speed { get; private set; }
    public bool Push { get; private set; }
    public float PushX { get; private set; }
    public float PushY { get; private set; }
}

public class SkinDesc
{
    public SkinDesc(ushort type, XElement elem)
    {
        XElement n;
        ObjectType = type;
        ObjectId = elem.Attribute("id").Value;
        if ((n = elem.Element("PlayerClassType")) != null)
            PlayerClassType = Utils.FromString(n.Value);
        else
            PlayerClassType = -1;
    }

    public ushort ObjectType { get; private set; }
    public string ObjectId { get; private set; }
    public int PlayerClassType { get; private set; }
}