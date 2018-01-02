﻿using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ ElderLich = () => Behav()
            .Init("Elder Lich",
                new State(
                    new State("Idle",
                        new StayCloseToSpawn(0.5, range: 5),
                        new Wander(0.5),
                        new HpLessTransition(0.99999, "EvaluationStart1")
                        ),
                    new State("EvaluationStart1",
                        new Taunt("New recruits for my undead army? How delightful!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Prioritize(
                            new StayCloseToSpawn(0.35, range: 5),
                            new Wander(0.35)
                            ),
                        new TimedTransition(2500, "EvaluationStart2")
                        ),
                    new State("EvaluationStart2",
                        new Flash(0x0000ff, 0.1, 60),
                        new Prioritize(
                            new StayCloseToSpawn(0.35, range: 5),
                            new Wander(0.35)
                            ),
                        new Shoot(10, projectileIndex: 1, count: 3, shootAngle: 120, coolDown: 100000,
                            coolDownOffset: 200),
                        new Shoot(10, projectileIndex: 1, count: 3, shootAngle: 120, coolDown: 100000,
                            coolDownOffset: 400),
                        new Shoot(10, projectileIndex: 1, count: 3, shootAngle: 120, coolDown: 100000,
                            coolDownOffset: 2200),
                        new Shoot(10, projectileIndex: 1, count: 3, shootAngle: 120, coolDown: 100000,
                            coolDownOffset: 2400),
                        new Shoot(10, projectileIndex: 1, count: 3, shootAngle: 120, coolDown: 100000,
                            coolDownOffset: 4200),
                        new Shoot(10, projectileIndex: 1, count: 3, shootAngle: 120, coolDown: 100000,
                            coolDownOffset: 4400),
                        new HpLessTransition(0.87, "EvaluationEnd"),
                        new TimedTransition(6000, "EvaluationEnd")
                        ),
                    new State("EvaluationEnd",
                        new Taunt("Time to meet your future brothers and sisters..."),
                        new HpLessTransition(0.875, "HugeMob"),
                        new HpLessTransition(0.952, "Mob"),
                        new HpLessTransition(0.985, "SmallGroup"),
                        new HpLessTransition(0.99999, "Solo")
                        ),
                    new State("HugeMob",
                        new Taunt("...there's an ARMY of them! HahaHahaaaa!!!"),
                        new Flash(0x00ff00, 0.2, 300),
                        new Spawn("Elder Haunted Spirit", 5, 0, 3000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 0, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 120, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 240, 100000),
                        new TossObject("Elder Phylactery Bearer", 3, 60, 100000),
                        new TossObject("Elder Phylactery Bearer", 3, 180, 100000),
                        new Prioritize(
                            new Protect(0.9, "Elder Phylactery Bearer", 15, 2, 2),
                            new Wander(0.9)
                            ),
                        new TimedTransition(25000, "HugeMob2")
                        ),
                    new State("HugeMob2",
                        new Taunt("My minions have stolen your life force and fed it to me!"),
                        new Flash(0x00ff00, 0.2, 300),
                        new Spawn("Elder Haunted Spirit", 5, 0, 3000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 0, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 120, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 240, 100000),
                        new Prioritize(
                            new Protect(0.9, "Elder Phylactery Bearer", 15, 2, 2),
                            new Wander(0.9)
                            ),
                        new TimedTransition(5000, "Wait")
                        ),
                    new State("Mob",
                        new Taunt("...there's a lot of them! Hahaha!!"),
                        new Flash(0x00ff00, 0.2, 300),
                        new Spawn("Elder Haunted Spirit", 2, 0, 2000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 0, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 120, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 240, 100000),
                        new Prioritize(
                            new Protect(0.9, "Elder Phylactery Bearer", 15, 2, 2),
                            new Wander(0.9)
                            ),
                        new TimedTransition(22000, "Mob2")
                        ),
                    new State("Mob2",
                        new Taunt("My minions have stolen your life force and fed it to me!"),
                        new Spawn("Elder Haunted Spirit", 2, 0, 2000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 0, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 120, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 240, 100000),
                        new Prioritize(
                            new Protect(0.9, "Elder Phylactery Bearer", 15, 2, 2),
                            new Wander(0.9)
                            ),
                        new TimedTransition(5000, "Wait")
                        ),
                    new State("SmallGroup",
                        new Taunt("...and there's more where they came from!"),
                        new Flash(0x00ff00, 0.2, 300),
                        new TossObject("Elder Phylactery Bearer", 5.5, 0, 100000),
                        new TossObject("Elder Phylactery Bearer", 5.5, 240, 100000),
                        new Prioritize(
                            new Protect(0.9, "Elder Phylactery Bearer", 15, 2, 2),
                            new Wander(0.9)
                            ),
                        new TimedTransition(15000, "SmallGroup2")
                        ),
                    new State("SmallGroup2",
                        new Taunt("My minions have stolen your life force and fed it to me!"),
                        new Spawn("Elder Haunted Spirit", 1, 1, 9000),
                        new Prioritize(
                            new Protect(0.9, "Elder Phylactery Bearer", 15, 2, 2),
                            new Wander(0.9)
                            ),
                        new TimedTransition(5000, "Wait")
                        ),
                    new State("Solo",
                        new Taunt("...it's a small family, but you'll enjoy being part of it!"),
                        new Flash(0x00ff00, 0.2, 10),
                        new Wander(0.5),
                        new TimedTransition(3000, "Wait")
                        ),
                    new State("Wait",
                        new Taunt("Kneel before me! I am the master of life and death!"),
                        new Transform("Elder Actual Lich")
                        )
                    )
            )
            .Init("Elder Actual Lich",
                new State(
                    new Prioritize(
                        new Protect(0.9, "Elder Phylactery Bearer", 15, 2, 2),
                        new Wander(0.5)
                        ),
                    new Spawn("Elder Mummy", 4, coolDown: 4000),
                    new Spawn("Elder Mummy King", 2, coolDown: 4000),
                    new Spawn("Elder Mummy Pharaoh", 1, coolDown: 4000),
                    new State("typeA",
                        new Shoot(10, projectileIndex: 0, count: 2, shootAngle: 7, coolDown: 800),
                        new TimedTransition(8000, "typeB")
                        ),
                    new State("typeB",
                        new Taunt(0.7, "All that I touch turns to dust!",
                            "You will drown in a sea of undead!"
                            ),
                        new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 7, coolDown: 1000),
                        new Shoot(10, projectileIndex: 0, count: 2, shootAngle: 7, coolDown: 800),
                        new TimedTransition(6000, "typeA")
                        )
                    ),
                new Threshold(0.0001,
                new TierLoot(5, ItemType.Ring, 0.11),
                new TierLoot(4, ItemType.Ring, 0.01),
                new TierLoot(10, ItemType.Weapon, 0.3),
                new TierLoot(11, ItemType.Weapon, 0.2),
                new TierLoot(12, ItemType.Weapon, 0.05),
                new TierLoot(11, ItemType.Armor, 0.3),
                new TierLoot(12, ItemType.Armor, 0.2),
                new TierLoot(13, ItemType.Armor, 0.05),
                new TierLoot(4, ItemType.Ability, 0.9),
                new TierLoot(5, ItemType.Ability, 0.15),
                new TierLoot(6, ItemType.Ability, 0.02),
                new ItemLoot("The King's Great Blade", 0.01),
                new ItemLoot("The Great King's Helm", 0.01),
                new ItemLoot("Old Leather Armor", 0.01),
                new ItemLoot("Gold Medal", 0.01)
                    )
            )
            .Init("Elder Phylactery Bearer",
                new State(
                    new Heal(15, "Heros", 200),
                    new State("Attack1",
                        new Shoot(10, projectileIndex: 0, count: 3, shootAngle: 120, coolDown: 900, coolDownOffset: 400),
                        new State("AttackX",
                            new Prioritize(
                                new StayCloseToSpawn(0.55, range: 5),
                                new Orbit(0.55, 4, 5)
                                ),
                            new TimedTransition(1500, "AttackY")
                            ),
                        new State("AttackY",
                            new Taunt(0.05, "We feed the master!"),
                            new Prioritize(
                                new StayCloseToSpawn(0.55, range: 5),
                                new StayBack(0.55, 2),
                                new Wander(0.55)
                                ),
                            new TimedTransition(1500, "AttackX")
                            ),
                        new HpLessTransition(0.65, "Attack2")
                        ),
                    new State("Attack2",
                        new Shoot(10, projectileIndex: 0, count: 3, shootAngle: 15, predictive: 0.1, coolDown: 600,
                            coolDownOffset: 200),
                        new State("AttackX",
                            new Prioritize(
                                new StayCloseToSpawn(0.65, range: 5),
                                new Orbit(0.65, 4, acquireRange: 10)
                                ),
                            new TimedTransition(1500, "AttackY")
                            ),
                        new State("AttackY",
                            new Taunt(0.05, "We feed the master!"),
                            new Prioritize(
                                new StayCloseToSpawn(0.65, range: 5),
                                new Buzz(),
                                new Wander(0.65)
                                ),
                            new TimedTransition(1500, "AttackX")
                            ),
                        new HpLessTransition(0.3, "Attack3")
                        ),
                    new State("Attack3",
                        new Shoot(10, projectileIndex: 1, coolDown: 800),
                        new State("AttackX",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Prioritize(
                                new StayCloseToSpawn(1.3, range: 5),
                                new Wander(1.3)
                                ),
                            new TimedTransition(2500, "AttackY")
                            ),
                        new State("AttackY",
                            new Taunt(0.02, "We feed the master!"),
                            new Prioritize(
                                new StayCloseToSpawn(1, range: 5),
                                new Wander(1)
                                ),
                            new TimedTransition(2500, "AttackX")
                            )
                        ),
                    new Decay(130000)
                    ),
                new Threshold(0.0001,
                new ItemLoot("Tincture of Defense", 0.02),
                new ItemLoot("Orange Drake Egg", 0.06),
                new ItemLoot("Magic Potion", 0.03),
                new ItemLoot("Ancient Magma Sword", 0.005)
            )
            )
            .Init("Elder Haunted Spirit",
                new State(
                    new State("NewLocation",
                        new Taunt(0.1, "XxxXxxxXxXxXxxx..."),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(10, predictive: 0.2, coolDown: 700),
                        new Prioritize(
                            new StayCloseToSpawn(1, 11),
                            new Wander(1)
                            ),
                        new TimedTransition(7000, "Attack")
                        ),
                    new State("Attack",
                        new Taunt(0.1, "Hungry..."),
                        new Shoot(10, predictive: 0.3, coolDown: 700),
                        new Shoot(10, 2, 70, coolDown: 700, coolDownOffset: 200),
                        new TimedTransition(3000, "NewLocation")
                        ),
                    new Decay(90000)
                    ),
                new Threshold(0.0001,
                new ItemLoot("Magma Blast Spell", 0.005)
                )
            )
            .Init("Elder Mummy",
                new State(
                    new Prioritize(
                        new Protect(1, "Elder Lich", protectionRange: 10),
                        new Follow(1.2, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(10)
                    ),
                new Threshold(0.0001,
                new ItemLoot("Magic Potion", 0.02),
                new ItemLoot("Spirit Salve Tome", 0.02),
                new ItemLoot("Dagger of the Burning Sun", 0.01)
            )
            )
            .Init("Elder Mummy King",
                new State(
                    new Prioritize(
                        new Protect(1, "Elder Lich", protectionRange: 10),
                        new Follow(1.2, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(10)
                    ),
                new Threshold(0.0001,
                new ItemLoot("Magic Potion", 0.02),
                new ItemLoot("Spirit Salve Tome", 0.02),
                new ItemLoot("Dagger of the Burning Sun", 0.005)
                    )
            )
            .Init("Elder Mummy Pharaoh",
                new State(
                    new Prioritize(
                        new Protect(1, "Elder Lich", protectionRange: 10),
                        new Follow(1.2, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(10)
                    ),
                new Threshold(0.0001,
                new ItemLoot("Hell's Fire Wand", 0.02),
                new ItemLoot("Slayer Staff", 0.02),
                new ItemLoot("Golden Sword", 0.02),
                new ItemLoot("Golden Dagger", 0.02),
                new ItemLoot("It's a Trap", 0.005)
                    )
            )
            ;
    }
}
