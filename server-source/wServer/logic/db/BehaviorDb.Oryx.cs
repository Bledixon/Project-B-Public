using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Oryx = () => Behav()
            .Init("Oryx the Mad God 2",
                new State(
                new Taunt(cooldown: 6000, text: "Pathetic Mortals! I have {HP} hitpoints!", probability: .5),

                new State("Attack",
                    new Shoot(99, count: 7, shootAngle: 360 / 7, projectileIndex: 0),
                    new Shoot(20, count: 3, shootAngle: 10, projectileIndex: 2, coolDown: 900),
                    new State("Minions",
                         new Wander(.2),
                         new Spawn("Henchman of Oryx", maxChildren: 4, initialSpawn: .5, coolDown: 5000),
                         new State("Shooting",
                         new State("ConfuseBlast",
                             new Shoot(30, count: 3, shootAngle: 12, projectileIndex: 4, predictive: .5),
                             new TimedTransition(600, "SlowBlast", randomized: true),
                             new TimedTransition(600, "QuietBlast", randomized: true)
                             ),
                         new State("SlowBlast",
                             new Shoot(30, count: 3, shootAngle: 12, projectileIndex: 1, coolDown: 1200),
                             new TimedTransition(600, "PinkRedBlast", randomized: true),
                             new TimedTransition(600, "PinkBlast", randomized: true)
                             ),
                         new State("PinkRedBlast",
                             new Shoot(30, count: 2, shootAngle: 12, projectileIndex: 3, coolDown: 1200),
                             new Shoot(30, count: 3, shootAngle: 12, projectileIndex: 6, coolDown: 1200),
                             new TimedTransition(600, "QuietBlast", randomized: true),
                             new TimedTransition(600, "ConfuseBlast", randomized: true),
                             new TimedTransition(600, "Respite", randomized: true)
                             ),
                         new State("QuietBlast",
                             new Shoot(30, count: 2, shootAngle: 12, projectileIndex: 5, coolDown: 1200, coolDownOffset: 340),
                             new TimedTransition(600, "SlowBlast", randomized: true),
                             new TimedTransition(600, "Respite", randomized: true)
                             ),
                         new State("PinkBlast",
                             new Shoot(30, count: 2, shootAngle: 12, projectileIndex: 3, coolDown: 1200),
                             new TimedTransition(600, "ConfuseBlast", randomized: true),
                             new TimedTransition(600, "QuietBlast", randomized: true),
                             new TimedTransition(600, "PinkRedBlast", randomized: true)
                             ),
                         new State("Respite",
                             new TimedTransition(600, "ConfuseBlast", randomized: true),
                             new TimedTransition(600, "SlowBlast", randomized: true),
                             new TimedTransition(600, "PinkBlast", randomized: true)
                             ),
                        new TimedTransition(10000, "Spawning")
                        ),
                        new State("Spawning",
                            new Spawn("Henchman of Oryx", maxChildren: 4, initialSpawn: .25, coolDown: 1000),
                            new TimedTransition(100, "Shooting")),
                             new HpLessTransition(.33, "NoMinions")
                        ),
                    new State("NoMinions",
                            new State("Opening",
                                 new Shoot(99, projectileIndex: 7, count: 36, fixedAngle: 0, shootAngle: 10, coolDown: 10000),
                                 new Taunt(cooldown: 100, text: "Can't... keep... minions... alive... anymore! ARGHH!!!"),
                                 new TimedTransition(10, "Respite2")
                                 ),
                            new Shoot(1, count: 36, shootAngle: 10, projectileIndex: 8, fixedAngle: 5, coolDown: 10000),
                            new Order(10, "Henchman of Oryx", "Suicide"),
                            new TossObject("Monstrosity Scarab", angle: 0, coolDown: 5000, range: 5),
                            new TossObject("Monstrosity Scarab", angle: 100, coolDown: 5000, range: 3),
                            new TossObject("Monstrosity Scarab", angle: 30, coolDown: 5000, range: 7),
                            new TossObject("Monstrosity Scarab", angle: 290, coolDown: 5000, range: 4),
                            new TossObject("Monstrosity Scarab", angle: 340, coolDown: 5000, range: 10),
                            new TossObject("Monstrosity Scarab", angle: 270, coolDown: 5000, range: 6),
                            new TossObject("Monstrosity Scarab", angle: 250, coolDown: 5000, range: 3),
                            new Prioritize(
                                new Follow(.4, acquireRange: 13, range: 1),
                                new Wander(.6)
                            ),
                              new State("ConfuseBlast2",
                                  new Shoot(30, count: 3, shootAngle: 12, projectileIndex: 4, predictive: .5),
                                  new TimedTransition(600, "SlowBlast2", randomized: true),
                                  new TimedTransition(600, "QuietBlast2", randomized: true)
                                  ),
                              new State("SlowBlast2",
                                  new Shoot(30, count: 3, shootAngle: 12, projectileIndex: 1, coolDown: 1200),
                                  new TimedTransition(600, "PinkRedBlast2", randomized: true),
                                  new TimedTransition(600, "PinkBlast2", randomized: true)
                                  ),
                              new State("PinkRedBlast2",
                                  new Shoot(30, count: 2, shootAngle: 12, projectileIndex: 3, coolDown: 1200),
                                  new Shoot(30, count: 3, shootAngle: 12, projectileIndex: 6, coolDown: 1200),
                                  new TimedTransition(600, "QuietBlast2", randomized: true),
                                  new TimedTransition(600, "ConfuseBlast2", randomized: true),
                                  new TimedTransition(600, "Respite2", randomized: true)
                                  ),
                              new State("QuietBlast2",
                                  new Shoot(30, count: 2, shootAngle: 12, projectileIndex: 5, coolDown: 1200, coolDownOffset: 340),
                                  new TimedTransition(600, "SlowBlast2", randomized: true),
                                  new TimedTransition(600, "Respite2", randomized: true)
                                  ),
                              new State("PinkBlast2",
                                  new Shoot(30, count: 2, shootAngle: 12, projectileIndex: 3, coolDown: 1200),
                                  new TimedTransition(600, "ConfuseBlast2", randomized: true),
                                  new TimedTransition(600, "QuietBlast2", randomized: true),
                                  new TimedTransition(600, "PinkRedBlast2", randomized: true)
                                  ),
                              new State("Respite2",
                                  new TimedTransition(600, "ConfuseBlast2", randomized: true),
                                  new TimedTransition(600, "SlowBlast2", randomized: true),
                                  new TimedTransition(600, "PinkBlast2", randomized: true)
                             )

                            )
                        )
                ),
                new GoldLoot(1, 5),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.07),
                    new TierLoot(11, ItemType.Weapon, 0.06),
                    new TierLoot(12, ItemType.Weapon, 0.05),
                    new TierLoot(5, ItemType.Ability, 0.07),
                    new TierLoot(6, ItemType.Ability, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.07),
                    new TierLoot(12, ItemType.Armor, 0.06),
                    new TierLoot(13, ItemType.Armor, 0.05),
                    new TierLoot(5, ItemType.Ring, 0.06),
                    new TierLoot(2, ItemType.Potion, 0.5),
                    new ItemLoot("Supply Crate Series #1", 0.33),
                    new ItemLoot("...", 0.005),
                    new ItemLoot("Milkyway Glove", 0.005),
                    new ItemLoot("King's Crown", 0.005),
                    new ItemLoot("Ancient Prism", 0.005),
                    new ItemLoot("Supply Crate Series #2", 0.33)
                    )
            )
            .Init("Henchman of Oryx",
                new State(
                    new State("Attack",
                        new Prioritize(
                            new Orbit(.2, 2, target: "Oryx the Mad God 2", radiusVariance: 1),
                            new Wander(.3)
                            ),
                    new Shoot(15, predictive: 1, coolDown: 2500),
                    new Shoot(10, count: 3, shootAngle: 10, projectileIndex: 1, coolDown: 2500),
                    new Spawn("Vintner of Oryx", maxChildren: 1, initialSpawn: 1, coolDown: 5000),
                    //  new Spawn("Bile of Oryx", maxChildren: 1, initialSpawn: 1, coolDown: 5000),
                    new Spawn("Aberrant of Oryx", maxChildren: 1, initialSpawn: 1, coolDown: 5000),
                    new Spawn("Monstrosity of Oryx", maxChildren: 1, initialSpawn: 1, coolDown: 5000),
                    new Spawn("Abomination of Oryx", maxChildren: 1, initialSpawn: 1, coolDown: 5000)
                            ),
                    new State("Suicide",
                        new Decay(0)
                             )
                            )
                            )
            .Init("Monstrosity of Oryx",
                new State(
                    new State("Wait", new PlayerWithinTransition(15, "Attack")),
                    new State("Attack",
                        new TimedTransition(10000, "Wait"),
                    new Prioritize(
                        new Orbit(.1, 6, target: "Oryx the Mad God 2", radiusVariance: 3),
                        new Follow(.1, acquireRange: 15),
                        new Wander(.2)
                        ),
                     new TossObject("Monstrosity Scarab", coolDown: 2500, range: 1, angle: 0, coolDownOffset: 1000)
                     )
                     ))
            .Init("Monstrosity Scarab",
                new State(
                    new State("Attack",
                    new State("Charge",
                        new Prioritize(
                            new Charge(range: 25, coolDown: 1000),
                            new Wander(.3)
                            ),
                        new PlayerWithinTransition(1, "Boom")
                        ),
                    new State("Boom",
                        new Shoot(1, count: 16, shootAngle: 360 / 16, fixedAngle: 0),
                        new Decay(0)
                       )
                       )
                       )
                       )
            .Init("Vintner of Oryx",
                new State(
                    new State("Attack",
                        new Prioritize(
                            new Protect(1, "Oryx the Mad God 2", protectionRange: 4, reprotectRange: 3),
                            new Charge(speed: 1, range: 15, coolDown: 2000),
                            new Protect(1, "Henchman of Oryx"),
                            new StayBack(1, 15),
                            new Wander(1)
                        ),
                        new Shoot(10, coolDown: 250)
                        )
                        ))
         .Init("Aberrant of Oryx",
            new State(
                new Prioritize(
                    new Protect(.2, "Oryx the Mad God 2"),
                    new Wander(.7)
                    ),
                new State("Wait", new PlayerWithinTransition(15, "Attack")),
                new State("Attack",
                new TimedTransition(10000, "Wait"),
                new State("Randomize",
                    new TimedTransition(100, "Toss1", randomized: true),
                    new TimedTransition(100, "Toss2", randomized: true),
                    new TimedTransition(100, "Toss3", randomized: true),
                    new TimedTransition(100, "Toss4", randomized: true),
                    new TimedTransition(100, "Toss5", randomized: true),
                    new TimedTransition(100, "Toss6", randomized: true),
                    new TimedTransition(100, "Toss7", randomized: true),
                    new TimedTransition(100, "Toss8", randomized: true)
                   ),
                new State("Toss1",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 0),
                    new TimedTransition(4900, "Randomize")
                    ),
                new State("Toss2",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 45),
                    new TimedTransition(4900, "Randomize")
                    ),
                new State("Toss3",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 90),
                    new TimedTransition(4900, "Randomize")
                    ),
                new State("Toss4",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 135),
                    new TimedTransition(4900, "Randomize")
                    ),
                new State("Toss5",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 180),
                    new TimedTransition(4900, "Randomize")
                    ),
                new State("Toss6",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 225),
                    new TimedTransition(4900, "Randomize")
                    ),
                new State("Toss7",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 270),
                    new TimedTransition(4900, "Randomize")
                    ),
                new State("Toss8",
                    new TossObject("Aberrant Blaster", coolDown: 40000, range: 5, angle: 315),
                    new TimedTransition(4900, "Randomize")
                    ))
             ))
        .Init("Aberrant Blaster",
            new State(
                new State("Wait",
                    new PlayerWithinTransition(3, "Boom")
                    ),
                new State("Boom",
                    new Shoot(10, count: 5, shootAngle: 7),
                    new Decay(0)
                         )
                    )
             )
        .Init("Bile of Oryx",
            new State(
                new Prioritize(
                    new Protect(.4, "Oryx the Mad God 2", protectionRange: 5, reprotectRange: 4),
                    new Wander(.5)
                    )//,
                     //new Spawn("Purple Goo", maxChildren: 20, initialSpawn: 0, coolDown: 1000)
                )
             )
        .Init("Abomination of Oryx",
            new State(
                new State("Shoot",
                    new Shoot(1, 3, shootAngle: 5, projectileIndex: 0),
                    new Shoot(1, 5, shootAngle: 5, projectileIndex: 1),
                    new Shoot(1, 7, shootAngle: 5, projectileIndex: 2),
                    new Shoot(1, 5, shootAngle: 5, projectileIndex: 3),
                    new Shoot(1, 3, shootAngle: 5, projectileIndex: 4),
                    new TimedTransition(1000, "Wait")
                    ),
                new State("Wait",
                    new PlayerWithinTransition(2, "Shoot")),
                new Prioritize(
                    new Charge(3, 10, 3000),
                    new Wander(.5))
                    )
              )
            .Init("Oryx the Mad God 1",
                new State(
                    new HpLessTransition(.2, "rage"),
                    new State("Slow",
                        new Taunt("Fools! I still have {HP} hitpoints!"),
                        new Spawn("Minion of Oryx", 5, 0, 350000),
                        new Reproduce("Minion of Oryx", 10, 5, 1500),
                        new Shoot(25, 4, 10, 4, coolDown: 1000),
                        new TimedTransition(20000, "Dance 1")
                        ),
                    new State("Dance 1",
                        new Flash(0xf389E13, 0.5, 60),
                        new Taunt("BE SILENT!!!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(50, 8, projectileIndex: 6, coolDown: 700, coolDownOffset: 200),
                        new TossObject("Ring Element", 9, 24, 320000),
                        new TossObject("Ring Element", 9, 48, 320000),
                        new TossObject("Ring Element", 9, 72, 320000),
                        new TossObject("Ring Element", 9, 96, 320000),
                        new TossObject("Ring Element", 9, 120, 320000),
                        new TossObject("Ring Element", 9, 144, 320000),
                        new TossObject("Ring Element", 9, 168, 320000),
                        new TossObject("Ring Element", 9, 192, 320000),
                        new TossObject("Ring Element", 9, 216, 320000),
                        new TossObject("Ring Element", 9, 240, 320000),
                        new TossObject("Ring Element", 9, 264, 320000),
                        new TossObject("Ring Element", 9, 288, 320000),
                        new TossObject("Ring Element", 9, 312, 320000),
                        new TossObject("Ring Element", 9, 336, 320000),
                        new TossObject("Ring Element", 9, 360, 320000),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        //new Grenade(radius: 4, damage: 150, fixedAngle: new Random().Next(0, 359), range: 5, coolDown: 2000),
                        //new Grenade(radius: 4, damage: 150, fixedAngle: new Random().Next(0, 359), range: 5, coolDown: 2000),
                        //new Grenade(radius: 4, damage: 150, fixedAngle: new Random().Next(0, 359), range: 5, coolDown: 2000),
                        new TimedTransition(25000, "artifacts")
                        ),
                    new State("artifacts",
                        new Taunt("My Artifacts will protect me!"),
                        new Flash(0xf389E13, 0.5, 60),
                        new Shoot(50, 3, projectileIndex: 9, coolDown: 1500, coolDownOffset: 200),
                        new Shoot(50, 10, projectileIndex: 8, coolDown: 2000, coolDownOffset: 200),
                        new Shoot(50, 10, projectileIndex: 7, coolDown: 500, coolDownOffset: 200),

                        //Inner Elements
                        new TossObject("Guardian Element 1", 1, 0, 90000001, 1000),
                        new TossObject("Guardian Element 1", 1, 90, 90000001, 1000),
                        new TossObject("Guardian Element 1", 1, 180, 90000001, 1000),
                        new TossObject("Guardian Element 1", 1, 270, 90000001, 1000),
                        new TossObject("Guardian Element 2", 9, 0, 90000001, 1000),
                        new TossObject("Guardian Element 2", 9, 90, 90000001, 1000),
                        new TossObject("Guardian Element 2", 9, 180, 90000001, 1000),
                        new TossObject("Guardian Element 2", 9, 270, 90000001, 1000),
                        new TimedTransition(25000, "gaze")
                        ),

                    #region gaze
                    new State("gaze",
                        new Taunt("All who looks upon my face shall die."),
                        new Shoot(count: 2, coolDown: 1000, projectileIndex: 1, radius: 7, shootAngle: 10,
                            coolDownOffset: 800),
                        new TimedTransition(10000, "Dance 2")
                        #endregion gaze

                        ),

                    #region Dance 2
                    new State("Dance 2",
                        new Flash(0xf389E13, 0.5, 60),
                        new Taunt("Time for more dancing!"),
                        new Shoot(50, 8, projectileIndex: 6, coolDown: 700, coolDownOffset: 200),
                        new TossObject("Ring Element", 9, 24, 320000),
                        new TossObject("Ring Element", 9, 48, 320000),
                        new TossObject("Ring Element", 9, 72, 320000),
                        new TossObject("Ring Element", 9, 96, 320000),
                        new TossObject("Ring Element", 9, 120, 320000),
                        new TossObject("Ring Element", 9, 144, 320000),
                        new TossObject("Ring Element", 9, 168, 320000),
                        new TossObject("Ring Element", 9, 192, 320000),
                        new TossObject("Ring Element", 9, 216, 320000),
                        new TossObject("Ring Element", 9, 240, 320000),
                        new TossObject("Ring Element", 9, 264, 320000),
                        new TossObject("Ring Element", 9, 288, 320000),
                        new TossObject("Ring Element", 9, 312, 320000),
                        new TossObject("Ring Element", 9, 336, 320000),
                        new TossObject("Ring Element", 9, 360, 320000),
                        new TimedTransition(1000, "Dance2, 1")
                        ),
                    new State("Dance2, 1",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(0, projectileIndex: 8, count: 4, shootAngle: 90, fixedAngle: 0, coolDown: 170),
                        new TimedTransition(200, "Dance2, 2")
                        ),
                    new State("Dance2, 2",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(0, projectileIndex: 8, count: 4, shootAngle: 90, fixedAngle: 30, coolDown: 170),
                        new TimedTransition(200, "Dance2, 3")
                        ),
                    new State("Dance2, 3",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(0, projectileIndex: 8, count: 4, shootAngle: 90, fixedAngle: 15, coolDown: 170),
                        new TimedTransition(200, "Dance2, 4")
                        ),
                    new State("Dance2, 4",
                        new Shoot(0, projectileIndex: 8, count: 4, shootAngle: 90, fixedAngle: 45, coolDown: 170),
                        new TimedTransition(200, "Dance2, 1")
                        ),

                    #endregion Dance 2
                    new State("rage",
                        new ChangeSize(10, 200),
                        new Taunt(.3, "I HAVE HAD ENOUGH OF YOU!!!",
                            "ENOUGH!!!",
                            "DIE!!!"),
                        new Spawn("Minion of Oryx", 10, 0, 350000),
                        new Reproduce("Minion of Oryx", 10, 5, 1500),
                        new Shoot(count: 2, coolDown: 1500, projectileIndex: 1, radius: 7, shootAngle: 10,
                            coolDownOffset: 2000),
                        new Shoot(count: 5, coolDown: 1500, projectileIndex: 16, radius: 7, shootAngle: 10,
                            coolDownOffset: 2000),
                        new Follow(0.85, range: 1, coolDown: 0),
                        new Flash(0xfFF0000, 0.5, 9000001)
                        )
                    )
            )
            .Init("Ring Element",
                new State(
                    new State(
                        new Shoot(50, 12, projectileIndex: 0, coolDown: 700, coolDownOffset: 200),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TimedTransition(20000, "Despawn")
                        ),
                    new State("Despawn", //new Decay(time:0)
                        new Suicide()
                        )
                    )
            )
            .Init("Minion of Oryx",
                new State(
                    new Wander(0.4),
                    new Shoot(3, 3, 10, 0, coolDown: 1000),
                    new Shoot(3, 3, projectileIndex: 1, shootAngle: 10, coolDown: 1000)
                    ),
                new TierLoot(7, ItemType.Weapon, 0.2),
                new ItemLoot("Health Potion", 0.03)
            )
            .Init("Guardian Element 1",
                new State(
                    new State(
                        new Orbit(1, 1, target: "Oryx the Mad God 1", radiusVariance: 0),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(25, 3, 10, 0, coolDown: 1000),
                        new TimedTransition(10000, "Grow")
                        ),
                    new State("Grow",
                        new ChangeSize(100, 200),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Orbit(1, 1, target: "Oryx the Mad God 1", radiusVariance: 0),
                        new Shoot(3, 1, 10, 0, coolDown: 700),
                        new TimedTransition(10000, "Despawn")
                        ),
                    new State("Despawn",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Orbit(1, 1, target: "Oryx the Mad God 1", radiusVariance: 0),
                        new ChangeSize(100, 100),
                        new Suicide()
                        )
                    )
            )
            .Init("Guardian Element 2",
                new State(
                    new State(
                        new Orbit(1.3, 9, target: "Oryx the Mad God 1", radiusVariance: 0),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(25, 3, 10, 0, coolDown: 1000),
                        new TimedTransition(20000, "Despawn")
                        ),
                    new State("Despawn", new Suicide()
                        )
                    )
            )
        	.Init("Elder Oryx the Mad God",
                new State(
        	      //	new SpawnOnDeath("Christmas Cellar Portal", 0.05),
        	      	new State(
        	      new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                  new EntityNotExistsTransition("Oryx Spirit", 200, "activate")
                     ),
        	      new State("activate",
        	            new Taunt("This will be your final destination!"),
                        new Shoot(25, projectileIndex: 0, count: 8, shootAngle: 45, coolDown: 1500, coolDownOffset: 1500),
                        new Shoot(25, projectileIndex: 1, count: 8, shootAngle: 45, coolDown: 1000, coolDownOffset: 1000),
                        new Shoot(count: 2, coolDown: 1500, projectileIndex: 2, radius: 7, shootAngle: 10,
                            coolDownOffset: 2000),
                        new HpLessTransition(.5, "speedup")
                       ),
        	      new State("speedup",
        	            new Taunt("You are weak."),
                        new Shoot(25, projectileIndex: 0, count: 8, shootAngle: 45, coolDown: 1000, coolDownOffset: 1500),
                        new Shoot(25, projectileIndex: 0, count: 4, shootAngle: 45, coolDown: 2000, coolDownOffset: 1500),
                        new Shoot(25, projectileIndex: 1, count: 8, shootAngle: 45, coolDown: 1000, coolDownOffset: 1000),
                        new Shoot(count: 2, coolDown: 750, projectileIndex: 2, radius: 7, shootAngle: 10,
                            coolDownOffset: 2000),
                        new Shoot(count: 2, coolDown: 750, projectileIndex: 2, radius: 7, shootAngle: 20,
                            coolDownOffset: 2000),
                        new HpLessTransition(.15, "rage")
                        ),
                    new State("rage",
        	      	    new Wander(0.1),
                        new Taunt("This can't be real.. ENOUGH!"),
                        new Shoot(25, projectileIndex: 0, count: 8, shootAngle: 45, coolDown: 500, coolDownOffset: 1500),
                        new Shoot(25, projectileIndex: 0, count: 4, shootAngle: 45, coolDown: 1000, coolDownOffset: 1500),
                        new Shoot(25, projectileIndex: 1, count: 8, shootAngle: 45, coolDown: 500, coolDownOffset: 1000),
                        new Shoot(count: 2, coolDown: 550, projectileIndex: 2, radius: 7, shootAngle: 1,
                            coolDownOffset: 2000),
                        new Shoot(count: 2, coolDown: 550, projectileIndex: 2, radius: 7, shootAngle: 2,
                            coolDownOffset: 2000),
                        new HpLessTransition(.1, "deathincoming")
                        ),
        	      new State("deathincoming",
        	      	new ConditionalEffect(ConditionEffectIndex.Invulnerable),          
        	        new Taunt("I'm.. too.. weak.."),
        	        new Taunt("Brother.. take revange.."),
        	        new TimedTransition(1800, "Despawn")
                        ),
                    new State("Despawn", new Suicide()
        	       )
                          ),
                new GoldLoot(5, 20),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Ability, 0.5),
                    new TierLoot(15, ItemType.Weapon, 0.5),
                    new TierLoot(16, ItemType.Armor, 0.5),
                    new TierLoot(2, ItemType.Potion, 1),
                    new ItemLoot("Ruin +6", 0.01),
                    new ItemLoot("Drows rettilpsykS", 0.0025),
                    new ItemLoot("Deku Shield", 0.0025),
                    new ItemLoot("Oryxs Horns", 0.0025),
                    new ItemLoot("Oryxs Left Face", 0.0025),
                    new ItemLoot("Oryxs Right Face", 0.0025)
                    )
               )
        .Init("Oryx Spirit",
                new State(
                    new State(
                        new Orbit(.6, 2, target: "Elder Oryx the Mad God", radiusVariance: 0.5)
                        )
                    )
            )
        .Init("XP Gift Spawner",
                  new State(
                    new State("weyycheckinglmaooo",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),    
					
                    new Reproduce("XP Gift C", 10, 10, 50),
					
                        new TimedTransition(4500, "soowhatwegetdrunk")
                        ),
                    new State("soowhatwegetdrunk",
                        new EntityNotExistsTransition("XP Gift C", 200, "weyycheckinglmaooo")
                        )
                    )
            )
        .Init("XP Gift C",
                  new State(
               new Follow(.1, 35, 3)
                        ),
                  new Threshold(0.0001,
                    new TierLoot(4, ItemType.Ability, 0.99),
                    new TierLoot(9, ItemType.Weapon, 0.99),
                    new TierLoot(9, ItemType.Armor, 0.99),
                    new TierLoot(4, ItemType.Ring, 0.99)
                      )
                 )
        	.Init("n Event Spawner",
                  new State(
                    new State("Cube God",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),    
					
                    new Spawn("Cube God", 1, coolDown: 10000),
					
                        new TimedTransition(12000, "Cube God Check")
                        ),
                    new State("Cube God Check",
                        new EntityNotExistsTransition("Cube God", 10000, "Skull Shrine")
                        ),
        	      	new State("Skull Shrine",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),    
					
                    new Spawn("Skull Shrine", 1, coolDown: 10000),
					
                        new TimedTransition(12000, "Skull Shrine Check")
                        ),
        	      	new State("Skull Shrine Check",
                        new EntityNotExistsTransition("Skull Shrine", 10000, "Crystal")
                        ),
        	      	new State("Crystal",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),    
					
                    new Spawn("Crystal Prisoner", 1, coolDown: 10000),
					
                        new TimedTransition(12000, "Prisoner Check")
                        ),
        	      	new State("Prisoner Check",
                        new EntityNotExistsTransition("Crystal Prisoner", 12000, "Grand Sphinx")
                        ),
        	      	new State("Grand Sphinx",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),    
					
                    new Spawn("Grand Sphinx", 1, coolDown: 10000),
					
                        new TimedTransition(12000, "Grand Sphinx Check")
                        ),
        	      	new State("Grand Sphinx Check",
                        new EntityNotExistsTransition("Grand Sphinx", 2000, "Lotll")
                        ),
        	      	new State("Lotll",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),    
					
                    new Spawn("Lord of the Lost Lands", 1, coolDown: 10000),
					
                        new TimedTransition(12000, "Lotll Check")
                        ),
        	      	new State("Lotll Check",
                        new EntityNotExistsTransition("Lord of the Lost Lands", 2000, "Hermit")
                        ),
                    new State("Hermit",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Hermit God", 1, coolDown: 10000),

                        new TimedTransition(12000, "Hermit Check")
                        ),
                      new State("Hermit Check",
                        new EntityNotExistsTransition("Hermit God", 2000, "Oryx Chicken")
                        ),
                      new State("Oryx Chicken",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),    
					
                    new Spawn("Test Egg", 1, coolDown: 10000),
					
                        new TimedTransition(12000, "Test Egg Check")
                        ),
        	      	new State("Test Egg Check",
                        new EntityNotExistsTransition("Test Egg", 12000, "Oryx Chicken Check")
                        ),
        	      	new State("Oryx Chicken Check",
                        new EntityNotExistsTransition("TestChicken 2", 12000, "Cube God")
                        )
                    )
            )
        .Init("n Elder Event Spawner",
                  new State(
                    new State("Elder Cube God",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Elder Cube God", 1, coolDown: 10000),

                        new TimedTransition(12000, "Elder Cube God Check")
                        ),
                    new State("Elder Cube God Check",
                        new EntitiesNotExistsTransition(10000, "Elder Skull Shrine", "Elder Cube Overseer", "Elder Cube Defender", "Elder Cube Blaster", "Elder Cube God")
                        ),
                      new State("Elder Skull Shrine",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Elder Skull Shrine", 1, coolDown: 10000),

                        new TimedTransition(12000, "Elder Skull Shrine Check")
                        ),
                      new State("Elder Skull Shrine Check",
                        new EntitiesNotExistsTransition(10000, "Elder Lich", "Elder Skull Shrine", "Elder Red Flaming Skull", "Elder Blue Flaming Skull")
                        ),
                      new State("Elder Lich",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Elder Lich", 1, coolDown: 10000),

                        new TimedTransition(12000, "Elder Lich Check")
                        ),
                      new State("Elder Lich Check",
                        new EntitiesNotExistsTransition(10000, "Elder Grand Sphinx", "Elder Lich", "Elder Actual Lich", "Elder Haunted Spirit", "Elder Phylactery Bearer", "Elder Mummy", "Elder Mummy King", "Elder Mummy Pharaoh")
                        ),
                      new State("Elder Grand Sphinx",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Elder Grand Sphinx", 1, coolDown: 10000),

                        new TimedTransition(12000, "Elder Grand Sphinx Check")
                        ),
                      new State("Elder Grand Sphinx Check",
                        new EntitiesNotExistsTransition(10000, "Elder Cube God", "Elder Grand Sphinx", "Elder Horrid Reaper")
                        )
                    )
            )
            .Init("Test Egg",
                new State(
                    new State("Idle",
                        new HpLessTransition(0.9, "1")
                    ),
                    new State("1",
                        new HpLessTransition(0.8, "2"),
                        new SetAltTexture(1)
                    ),
                    new State("2",
                        new HpLessTransition(0.7, "3"),
                        new SetAltTexture(2)
                    ),
                    new State("3",
                        new HpLessTransition(0.6, "4"),
                        new SetAltTexture(3)
                    ),
                    new State("4",
                        new ConditionalEffect(ConditionEffectIndex.Invincible),
                        new SetAltTexture(4),
                        new TimedTransition(250, "Break")
                    ),
                    new State("Break",
                        new Transform("TestChicken 2")
                    )
                )
            )
        .Init("n Elder Gland Spawner",
                  new State(
                    new State("Flying Brain",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Flying Brain", 1, coolDown: 10000),

                        new TimedTransition(12000, "Flying Brain Check")
                        ),
                    new State("Flying Brain Check",
                        new EntityNotExistsTransition("Flying Brain", 10000, "Medusa")
                        ),
                      new State("Medusa",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Medusa", 1, coolDown: 10000),

                        new TimedTransition(12000, "Medusa Check")
                        ),
                      new State("Medusa Check",
                        new EntityNotExistsTransition("Medusa", 10000, "Ghost God")
                        ),
                      new State("Ghost God",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Ghost God", 1, coolDown: 10000),

                        new TimedTransition(12000, "Ghost God Check")
                        ),
                      new State("Ghost God Check",
                        new EntityNotExistsTransition("Ghost God", 12000, "Slime God")
                        ),
                      new State("Slime God",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Slime God", 1, coolDown: 10000),

                        new TimedTransition(12000, "Slime God Check")
                        ),
                      new State("Slime God Check",
                        new EntityNotExistsTransition("Slime God", 2000, "Beholder")
                        ),
                      new State("Beholder",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Beholder", 1, coolDown: 10000),

                        new TimedTransition(12000, "Beholder Check")
                        ),
                      new State("Beholder Check",
                        new EntityNotExistsTransition("Beholder", 2000, "Sprite God")
                        ),
                    new State("Sprite God",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Sprite God", 1, coolDown: 10000),

                        new TimedTransition(12000, "Sprite God Check")
                        ),
                      new State("Sprite God Check",
                        new EntityNotExistsTransition("Sprite God", 2000, "Leviathan")
                        ),
                      new State("Leviathan",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Leviathan", 1, coolDown: 10000),

                        new TimedTransition(12000, "Leviathan Check")
                        ),
                      new State("Leviathan Check",
                        new EntityNotExistsTransition("Leviathan", 12000, "Djinn")
                        ),
                      new State("Djinn",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Djinn", 1, coolDown: 10000),

                        new TimedTransition(12000, "Djinn Check")
                        ),
                      new State("Djinn Check",
                        new EntityNotExistsTransition("Djinn", 12000, "Flying Brain")
                        )
                    )
            )
            .Init("TestChicken 2",
                new State(
                    new HpLessTransition(0.2, "Death"),
                    new Prioritize(
                        new StayCloseToSpawn(0.6, 5),
                        new Wander(0.6)
                    ), 
                    new State("Idle",
                        new ChangeSize(20, 100),
                        new TimedTransition(600, "Start")
                    ),
                    new State("Start",
                        new Taunt("CLUCK!"),
                        new State("Shoot",
                            new EntityNotExistsTransition("TestChicken Small", 10, "Spawn Minions"),
                            new Shoot(10, 2)
                        ),
                        new State("Spawn Minions",
                            new Spawn("TestChicken Small", 5, 1),
                            new TimedTransition(0, "Shoot")
                        )
                    ),
                    new State("Death",
                              new Taunt("CLLLUUUCCCKKK!"),
                              new ConditionalEffect(ConditionEffectIndex.Invincible),
                              new TimedTransition(1500, "Die")
                             ),
                   new State("Die",
                        new Shoot(100, 10, projectileIndex: 6),
                        new Suicide()
                    )
                ),
                  new GoldLoot(1, 5),
                  new Threshold(0.0001,
                    new ItemLoot("Anatis Staff", 0.01),
                    new ItemLoot("Chicken Leg of Doom", 0.01),
                    new ItemLoot("Potion of Defense", 1),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Defense", 0.1),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new TierLoot(8, ItemType.Weapon, 0.2),
                    new TierLoot(9, ItemType.Weapon, 0.175),
                    new TierLoot(10, ItemType.Weapon, 0.125),
                    new TierLoot(11, ItemType.Weapon, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.2),
                    new TierLoot(9, ItemType.Armor, 0.175),
                    new TierLoot(10, ItemType.Armor, 0.15),
                    new TierLoot(11, ItemType.Armor, 0.1),
                    new TierLoot(12, ItemType.Armor, 0.05),
                    new TierLoot(4, ItemType.Ability, 0.15),
                    new TierLoot(5, ItemType.Ability, 0.1),
                    new TierLoot(5, ItemType.Ring, 0.05)
            )
        	     )
            .Init("TestChicken Small",
                new State(
                    new Prioritize(
                        new Protect(0.6, "TestChicken 2"),
                        new Wander(0.6)
                    ),
                    new State("Default",
                        new Shoot(10, 8, projectileIndex: 2, coolDown: 1000)
                    ),
                    new State("Despawn",
                        new Suicide()
                    )
                )
            )
        	.Init("Oryx the Christmas God",
                new State(
                    new State("Attack",
                        new Follow(.05, 35, 2),
                        new Shoot(25, projectileIndex: 0, count: 8, shootAngle: 45, coolDown: 1500, coolDownOffset: 1500),
                        new Shoot(25, projectileIndex: 1, count: 3, shootAngle: 10, coolDown: 1000, coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 2, count: 3, shootAngle: 10, predictive: 0.2, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 3, count: 2, shootAngle: 10, predictive: 0.4, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 4, count: 3, shootAngle: 10, predictive: 0.6, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 5, count: 2, shootAngle: 10, predictive: 0.8, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 6, count: 3, shootAngle: 10, predictive: 1, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Taunt(1, 6000, "Merry Christmas! Still {HP} HP until you get your presents!"),
                        new Spawn("Ginger Man Big", 5, coolDown: 5000),
                        new HpLessTransition(.4, "rage")
                        ),
                    new State("rage",
                        new Follow(.1, 35, 3),
                        new Taunt("The presents are coming soon!"),
                        new Shoot(25, 30, projectileIndex: 7, coolDown: 90000001, coolDownOffset: 8000),
                        new Shoot(25, 30, projectileIndex: 8, coolDown: 90000001, coolDownOffset: 8500),
                        new Shoot(25, projectileIndex: 0, count: 8, shootAngle: 45, coolDown: 1500, coolDownOffset: 1500),
                        new Shoot(25, projectileIndex: 1, count: 3, shootAngle: 10, coolDown: 1000, coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 2, count: 3, shootAngle: 10, predictive: 0.2, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 3, count: 2, shootAngle: 10, predictive: 0.4, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 4, count: 3, shootAngle: 10, predictive: 0.6, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 5, count: 2, shootAngle: 10, predictive: 0.8, coolDown: 1000,
                            coolDownOffset: 1000),
                        new Shoot(25, projectileIndex: 6, count: 3, shootAngle: 10, predictive: 1, coolDown: 1000,
                            coolDownOffset: 1000),
                        new TossObject("Ginger Man Small", 7, 0, 1000, randomToss: true),
                        new Taunt(1, 6000, "Merry Christmas! Still {HP} HP until you get your presents!"),
                        new HpLessTransition(.2, "presents")
                        ),
        	      	new State("presents",
        	      	    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TossObject("Oryx Present", 6, 0, 90000001, 100),
                        new TossObject("Oryx Present", 6, 45, 90000001, 100),
                        new TossObject("Oryx Present", 6, 90, 90000001, 100),
                        new TossObject("Oryx Present", 6, 135, 90000001, 100),
                        new TossObject("Oryx Present", 6, 180, 90000001, 100),
                        new TossObject("Oryx Present", 6, 225, 90000001, 100),
                        new TossObject("Oryx Present", 6, 270, 90000001, 100),
                        new TossObject("Oryx Present", 6, 315, 90000001, 100),        	      	    
        	        new Taunt("Merry Christmas everyone!"),
        	        new TimedTransition(1800, "Despawn")
                        ),
                    new State("Despawn", new Suicide()
        	       )
                    )
        	     )
        	      .Init("Oryx Present",
                new State(
        	      	new Follow(.1, 35, 3)
        	      ),
                new GoldLoot(5, 20),
                new Threshold(0.0001,
                    new TierLoot(2, ItemType.Potion, 0.9),
                    new ItemLoot("Candy Apple", 0.01),
                    new ItemLoot("Dagger of Holy Enlightenment", 0.01),
                    new ItemLoot("Split-Candy Katana", 0.01),
                    new ItemLoot("Supply Crate Series #1", 0.33),
                    new ItemLoot("Supply Crate Series #2", 0.33)
                    )
            )
        	.Init("Ginger Man Big",
                new State(
                    new Prioritize(
                        new Orbit(.1, 1, target: "Oryx the Christmas God", radiusVariance: 0.5),
                        new Follow(.2, 8, 3, coolDown: 0)
                        ),
                    new Shoot(8, projectileIndex: 0, predictive: 1, coolDown: 1500),
                    new Shoot(8, projectileIndex: 1, count: 3, shootAngle: 20, coolDown: 1500, coolDownOffset: 500),
                    new TossObject("Ginger Man Small", 7, 0, 1000, randomToss: true)
                    ),
        	      new Threshold(0.0001,
        	         new ItemLoot("Peppermint Sword", 0.005)
                  )
        	     )
        	.Init("Ginger Man Small",
                new State(
                    new State("searching",
                        new Prioritize(
                            new Follow(2, range: 0)
                            ),
                        new PlayerWithinTransition(2, "creeping"),
                        new TimedTransition(5000, "creeping")
                        ),
                    new State("creeping",
                        new Shoot(2, 10, 36, fixedAngle: 0),
                        new Decay(0)
                        )
                    )
            );
    }
}