using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private const float fixedAngle_RingAttack2 = 22.5f;

        private _ Shaitan = () => Behav()
            .Init("md1 Head of Shaitan",
                new State(
                    new SpawnOnDeath("Glowing Realm Portal", 1),

                    //new TransformOnDeath("md1 Loot Balloon Shaitan", returnToSpawn: true, min: 1, max: 1, probability: 1),
                    new CopyDamageOnDeath("md1 Loot Balloon Shaitan"),
                    new Taunt(new string[3]
                    {
                        "Start",
                        "Ring_Attack",
                        "Ring_Attack2"
                    },
                    text: "You are nothing more than nutiment for my roots.", cooldown: 15000),         //Feel free to make the cooldown between 11500->16500 depending
                                                                                                        //On the latency of your server, or how quick you want it.

                    new State("Idle",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new PlayerWithinTransition(3, "Start")
                    ),
                    new State("Start",
                        new Taunt("Come closer, feel the HELL!"),
                        new Shoot(10, count: 9, shootAngle: (float)(180 / 4), predictive: 0.7, coolDown: 1000),
                        new Shoot(10, count: 1, shootAngle: (float)30, angleOffset: (float)45, projectileIndex: 1, coolDown: 1000),
                        new Shoot(10, count: 1, shootAngle: (float)30, angleOffset: (float)-45, projectileIndex: 0, coolDown: 1000),
                        new HpLessTransition(0.95, "Ring_Attack")
                    ),
                    new State("Ring_Attack",
                        new Prioritize(
                            new StayCloseToSpawn(0.5, 10)
                        ),
                        new Shoot(10, count: 24, projectileIndex: 1, coolDown: 5000),
                        new Shoot(10, count: 24, projectileIndex: 1, coolDown: 3000),
                        new HpLessTransition(0.8, "Ring_Attack2")
                    ),
                    new State("Ring_Attack2",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new State("Yo_man_I_show_you_what_I_can_do",
                            new Timed(600, new Shoot(2, count: 12)),
                            new TimedTransition(800, "Ring")
                        ),
                        new State("Ring",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(0, count: 3, projectileIndex: 1, fixedAngle: 0),
                            new TimedTransition(250, "Ring1")
                        ),
                        new State("Ring1",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(0, count: 5, projectileIndex: 0, fixedAngle: fixedAngle_RingAttack2),
                            new TimedTransition(250, "Ring2")
                        ),
                        new State("Ring2",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(0, count: 2, projectileIndex: 1, fixedAngle: fixedAngle_RingAttack2 * 2),
                            new TimedTransition(250, "Ring3")
                        ),
                        new State("Ring3",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 7, projectileIndex: 0, fixedAngle: fixedAngle_RingAttack2 * 3),
                            new TimedTransition(250, "Ring4")
                        ),
                        new State("Ring4",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 11, projectileIndex: 1, fixedAngle: fixedAngle_RingAttack2 * 4),
                            new TimedTransition(250, "Ring5")
                        ),
                        new State("Ring5",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 3, projectileIndex: 0, fixedAngle: fixedAngle_RingAttack2 * 5),
                            new TimedTransition(250, "-Ring")
                        ),
                        new State("-Ring",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 4, projectileIndex: 1, fixedAngle: fixedAngle_RingAttack2 * 6),
                            new TimedTransition(250, "-Ring1")
                        ),
                        new State("-Ring1",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 5, projectileIndex: 0, fixedAngle: fixedAngle_RingAttack2 * 5),
                            new TimedTransition(250, "-Ring2")
                        ),
                        new State("-Ring2",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 6, projectileIndex: 1, fixedAngle: fixedAngle_RingAttack2 * 4),
                            new TimedTransition(250, "-Ring3")
                        ),
                        new State("-Ring3",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 2, projectileIndex: 0, fixedAngle: fixedAngle_RingAttack2 * 3),
                            new TimedTransition(250, "-Ring4")
                        ),
                        new State("-Ring4",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 3, projectileIndex: 1, fixedAngle: fixedAngle_RingAttack2 * 2),
                            new TimedTransition(250, "-Ring5")
                        ),
                        new State("-Ring5",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 12, projectileIndex: 0, fixedAngle: fixedAngle_RingAttack2),
                            new TimedTransition(250, "-Ring6")
                        ),
                        new State("-Ring6",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 7, projectileIndex: 1, fixedAngle: 0),
                            new Timed(200, new Shoot(10, count: 3, shootAngle: (float)30, defaultAngle: (float)45, projectileIndex: 1)),
                            new Timed(200, new Shoot(10, count: 3, shootAngle: (float)30, defaultAngle: (float)135, projectileIndex: 1)),
                            new TimedTransition(200, "StartTheFun")
                        )
                    ),
                    new State("StartTheFun",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Taunt(true, 0, "Die!"),
                        new Flash(0xf0e68c, flashPeriod: 0.5, flashRepeats: 10),
                        new ReturnToSpawn(speed: 1),
                        new TimedTransition(5000, "RAGE_MODE")
                    ),
                    new State("RAGE_MODE",
                        new State("Everything_is_cool",
                            new State("spawn_minions",
                                new HpLessTransition(0.2, "Ending Phase"),
                                new InvisiToss("md1 Right Hand of Shaitan", range: 5, angle: 180),
                                new InvisiToss("md1 Left Hand of Shaitan", range: 5, angle: 360),

                                new TimedTransition(0, "shoot1")
                            ),
                            new State("shoot1",
                                new HpLessTransition(0.3, "Ending Phase"),
                                new Shoot(0, projectileIndex: 1, fixedAngle: 225),
                                new Shoot(0, projectileIndex: 0, fixedAngle: 315),
                                new TimedTransition(800, "shoot2")
                            ),
                            new State("shoot2",
                                new HpLessTransition(0.3, "Ending Phase"),
                                new Shoot(0, 2, shootAngle: 10, projectileIndex: 1, fixedAngle: 45),
                                new Shoot(0, 2, shootAngle: 10, projectileIndex: 0, fixedAngle: 135),
                                new TimedTransition(800, "shoot3")
                            ),
                            new State("shoot3",
                                new HpLessTransition(0.3, "Ending Phase"),
                                new Shoot(0, 2, shootAngle: 15, projectileIndex: 0, fixedAngle: 45),
                                new Shoot(0, 2, shootAngle: 15, projectileIndex: 1, fixedAngle: 135),
                                new TimedTransition(800, "shoot1")
                            )
                        )
                    ),
                    new State("Ending Phase",
                        new Taunt(1, true, "Ahahaha!"),
                        new Shoot(10, count: 6, projectileIndex: 1),
                        new Shoot(10, count: 3, shootAngle: 15, predictive: 0.7, coolDown: 1000),
                        new State("shoot1",
                            new Shoot(0, projectileIndex: 0, fixedAngle: 45),
                            new Shoot(0, projectileIndex: 1, fixedAngle: 135),
                            new TimedTransition(1000, "shoot2")
                        ),
                        new State("shoot2",
                            new Shoot(0, 2, shootAngle: 15, projectileIndex: 0, fixedAngle: 45),
                            new Shoot(0, 2, shootAngle: 15, projectileIndex: 0, fixedAngle: 135),
                            new TimedTransition(1000, "shoot1")
                        )
                    )
                )
            )
            .Init("md1 Right Hand of Shaitan",
                new State(
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),

                    new EntityNotExistsTransition("md1 Head of Shaitan", 100, "Despawn"),

                                new TossObject("md1 CreepyHead", coolDown: 3600, coolDownOffset: 0),
                        new Shoot(10, count: 3, shootAngle: 15, predictive: 0.7, coolDown: 2000),
                    new State("I_WILL_HALP_YOU_BUD_<3",
                        new State("IMMA_MOVE_NAOW",
                                new InvisiToss("md1 CreepyHead", range: 5.0, angle: 180),
                            new PlayerWithinTransition(1, "IMMA_DONT_MOVE_NAOW"),
                            new State("shoot1",
                                new Shoot(10, fixedAngle: 25),
                                new TimedTransition(333, "shoot2")
                            ),
                            new State("shoot2",
                                new Shoot(10, fixedAngle: 50),
                            new Follow(.4, 14, 1),
                                new TimedTransition(333, "shoot3")
                            ),
                            new State("shoot3",

                                new Shoot(10, fixedAngle: 75),
                                new TimedTransition(333, "shoot1")
                            )
                        ),
                        new State("IMMA_DONT_MOVE_NAOW",
                            new TimedTransition(2000, "IMMA_MOVE_NAOW"),
                            new State("shoot1",
                                new Shoot(50, fixedAngle: 145),
                                new TimedTransition(333, "shoot2")
                            ),
                            new State("shoot2",
                                new Shoot(70, fixedAngle: 265),
                                new TimedTransition(333, "shoot3")
                            ),
                            new State("shoot3",
                                new Shoot(10, fixedAngle: 385),

                                new TimedTransition(333, "shoot1")
                            )
                        )
                    ),
                    new State("CUTIES_PROTECT_ME",
                        new Orbit(0.7, 1, target: "md1 Head of Shaitan", radiusVariance: 1),
                        new Shoot(10, coolDown: 2000)
                    ),
                    new State("Despawn",
                        new Suicide()
                    )
                )
            )
            .Init("md1 Left Hand of Shaitan",
                new State(
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                    new EntityNotExistsTransition("md1 Head of Shaitan", 100, "Despawn"),

                                new TossObject("md1 CreepyHead", coolDown: 3600, coolDownOffset: 0),
                        new Shoot(10, count: 3, shootAngle: 15, predictive: 0.7, coolDown: 2000),
                    new State("I_WILL_HALP_YOU_BUD_<3",
                        new State("IMMA_MOVE_NAOW",
                            new PlayerWithinTransition(1, "IMMA_DONT_MOVE_NAOW"),
                            new State("shoot1",
                                new Shoot(10, fixedAngle: 145),
                                new TimedTransition(333, "shoot2")
                            ),
                            new State("shoot2",
                                new Shoot(10, fixedAngle: 165),
                                new TimedTransition(333, "shoot3")
                            ),
                            new State("shoot3",
                                new Shoot(10, fixedAngle: 185),
                            new Follow(.4, 14, 1),
                                new TimedTransition(333, "shoot1")
                            )
                        ),
                        new State("IMMA_DONT_MOVE_NAOW",
                            new TimedTransition(2000, "IMMA_MOVE_NAOW"),
                            new State("shoot1",
                                new Shoot(10, fixedAngle: 145),
                                new TimedTransition(333, "shoot2")
                            ),
                            new State("shoot2",
                                new Shoot(10, fixedAngle: 65),
                                new TimedTransition(333, "shoot3")
                            ),
                            new State("shoot3",
                                new Shoot(10, fixedAngle: 285),
                                new TimedTransition(333, "shoot1")
                            )
                        )
                    ),
                    new State("CUTIES_PROTECT_ME",
                        new Orbit(0.7, 1, target: "md1 Head of Shaitan", radiusVariance: 1),
                        new Shoot(10, coolDown: 2000)
                    ),
                    new State("Despawn",
                        new Suicide()
                    )
                )
            )

                    .Init("md1 CreepyHead",
                new State(
                    new EntityNotExistsTransition("md1 Left Hand of Shaitan", 100, "Despawn"),
                    new State("I_WILL_HALP_YOU_BUD_<3",
                        new State("IMMA_MOVE_NAOW",
                            new Follow(.2, 14, 1),
                            new PlayerWithinTransition(1, "shoot1"),
                            new State("shoot1",
                        new Shoot(10, count: 1, shootAngle: (float)30, angleOffset: (float)45, projectileIndex: 0, coolDown: 1000)
                            )
                        )
                    ),
                    new State("CUTIES_PROTECT_ME",
                        new Orbit(0.7, 1, target: "md1 Head of Shaitan", radiusVariance: 1),
                        new Shoot(10, coolDown: 2000)
                    ),
                    new State("Despawn",
                        new Suicide()                               //If this code doesn't work properly, or gives you errors, change the code to;
                                                                    //new Decay()        I never had issues, but just a heads up -KO
                    )
                )
            )

        //md1 Chest spawner
        .Init("md1 Chest spawner",
            new State(
                new SpawnOnDeath("md1 Loot Balloon Shaitan", probability: 1, amount: 1),
                new EntityNotExistsTransition("md1 Head of Shaitan", 100, "die"),
                new State("Idle",
                    new ConditionalEffect(ConditionEffectIndex.Invincible)
                    ),
                new State("die",
                    new Suicide()
                    )
                )
            )

            .Init("md1 Loot Balloon Shaitan",
                new State(
                    new State("Idle",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TimedTransition(5000, "UnsetEffect")
                    ),
                    new State("UnsetEffect")
                ),
                new KeyLoot(0, 2),
                new Threshold(0.00001,
                    new ItemLoot("Skull of Endless Torment", 0.012),
                    new ItemLoot("Wand of the Cyber Scientist", 0.002),
                    new ItemLoot("Cyber Scientist's Scepter", 0.002),
                    new ItemLoot("Cyber Scientist's Robe", 0.002),
                    new ItemLoot("Cyber Scientist's Ring", 0.002),
                    new ItemLoot("Potion of Attack", 1),
                    new ItemLoot("Potion of Defense", 1),
                    new ItemLoot("Potion of Life", 0.8),
                    new ItemLoot("Potion of Mana", 0.8)
                )
            );
    }
}