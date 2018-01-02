using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Events = () => Behav()
        #region Custom Events


        #endregion

        #region Cube God

            .Init("Cube God",
                new State(
                    new Shoot(25, 9, 10, 0, null, 0, null, 1, 0, 750),
                    //                    new Shoot(25, 4, 10, 1, null, 0, null, 1, 0, 750),
                    new Wander(0.1),
                    new Spawn("Cube Overseer", 4, coolDown: 5000),
                    new Spawn("Cube Defender", 20, coolDown: 1000),
                    new Spawn("Cube Blaster", 4, coolDown: 5000),
                    new Reproduce("Cube Overseer", 10, 4, 5000),
                    new Reproduce("Cube Defender", 10, 20, 1000),
                    new Reproduce("Cube Blaster", 10, 20, 1000)
                    ),
                new TierLoot(3, ItemType.Ring, 0.2),
                new TierLoot(7, ItemType.Armor, 0.2),
                new TierLoot(8, ItemType.Weapon, 0.2),
                new TierLoot(4, ItemType.Ability, 0.1),
                new TierLoot(8, ItemType.Armor, 0.1),
                new TierLoot(4, ItemType.Ring, 0.05),
                new TierLoot(9, ItemType.Armor, 0.03),
                new TierLoot(5, ItemType.Ability, 0.03),
                new TierLoot(9, ItemType.Weapon, 0.03),
                new TierLoot(10, ItemType.Armor, 0.02),
                new TierLoot(10, ItemType.Weapon, 0.02),
                new TierLoot(11, ItemType.Armor, 0.01),
                new TierLoot(11, ItemType.Weapon, 0.01),
                new TierLoot(5, ItemType.Ring, 0.01),
                new GoldLoot(10, 30),
                new Threshold(0.0001,
                    new ItemLoot("Ruin +1", 0.01),
                    new ItemLoot("Pet Ruin 1", 0.001),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Dirk of Cronus", 0.01),
                    new ItemLoot("Merlins Quiver", 0.005),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Halloween Crate", 0.01)
                )
            )
            .Init("Cube Overseer",
                new State(
                    new State(
                    new Shoot(10, 4, 10, 0, predictive: 1, coolDown: 1000),
                    new Shoot(10, 1, projectileIndex: 1, predictive: 1, coolDown: 2000),
                    new Orbit(1, 5, target: "Cube God", radiusVariance: 0.5),
                    new EntityNotExistsTransition("Cube God", 10, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                    )
            .Init("Cube Defender",
                new State(
                    new State(
                    new Shoot(10, 1, 10, 0, coolDown: 1000),
                    new Orbit(1, 7.5, target: "Cube God", radiusVariance: 0.5),
                    new EntityNotExistsTransition("Cube God", 10, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                    )
            .Init("Cube Blaster",
                new State(
                    new State(
                    new Shoot(10, 1, projectileIndex: 1, coolDown: 1000),
                    new Shoot(10, 2, 10, 0, coolDown: 1000),
                    new Orbit(1, 7.5, target: "Cube God", radiusVariance: 0.5),
                    new EntityNotExistsTransition("Cube God", 10, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                    )
        #endregion

        #region Skull Shrine

            .Init("Skull Shrine",
                new State(
                    new Shoot(25, 9, 10, predictive: 1),
                    new Spawn("Red Flaming Skull", 8, coolDown: 5000),
                    new Spawn("Blue Flaming Skull", 10, coolDown: 1000),
                    new Reproduce("Red Flaming Skull", 10, 8, 5000),
                    new Reproduce("Blue Flaming Skull", 10, 10, 1000)
                    ),
                new TierLoot(3, ItemType.Ring, 0.2),
                new TierLoot(7, ItemType.Armor, 0.2),
                new TierLoot(8, ItemType.Weapon, 0.2),
                new TierLoot(4, ItemType.Ability, 0.1),
                new TierLoot(8, ItemType.Armor, 0.1),
                new TierLoot(4, ItemType.Ring, 0.05),
                new TierLoot(9, ItemType.Armor, 0.03),
                new TierLoot(5, ItemType.Ability, 0.03),
                new TierLoot(9, ItemType.Weapon, 0.03),
                new TierLoot(10, ItemType.Armor, 0.02),
                new TierLoot(10, ItemType.Weapon, 0.02),
                new TierLoot(11, ItemType.Armor, 0.01),
                new TierLoot(11, ItemType.Weapon, 0.01),
                new TierLoot(5, ItemType.Ring, 0.01),
                new GoldLoot(10, 30),
                new Threshold(0.0001,
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Pet Ruin 1", 0.001),
                    new ItemLoot("Orb of Conflict", 0.01),
                    new ItemLoot("Deck of Cards", 0.005),
                    new ItemLoot("Ruin +1", 0.01),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Halloween Crate", 0.01)
                )
            )
            .Init("Red Flaming Skull",
                new State(
                    new Prioritize(
                        new Wander(.6),
                        new Follow(.6, 20, 3)
                       ),
                    new Shoot(15, 2, 5, 0, predictive: 1, coolDown: 750),
                    new EntityNotExistsTransition("Skull Shrine", 500, "Go away"),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
            .Init("Blue Flaming Skull",
                new State(
                    new Prioritize(
                        new Orbit(1, 20, target: "Skull Shrine", radiusVariance: 0.5),
                        new Wander(.6)
                        ),
                    new Shoot(15, 2, 5, 0, predictive: 1, coolDown: 750),
                    new EntityNotExistsTransition("Skull Shrine", 500, "Go away"),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
        #endregion

        #region Hermit God

            .Init("Hermit God",
                new State(
                    new State("invis",
                        new SetAltTexture(3),
                        new ConditionalEffect(ConditionEffectIndex.Invincible),
                        new InvisiToss("Hermit Minion", 9, 0, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 45, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 90, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 135, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 180, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 225, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 270, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 315, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 15, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 30, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 90, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 120, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 150, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 180, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 210, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 240, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 50, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 100, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 150, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 200, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 250, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit Minion", 9, 300, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit God Tentacle", 5, 45, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit God Tentacle", 5, 90, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit God Tentacle", 5, 135, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit God Tentacle", 5, 180, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit God Tentacle", 5, 225, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit God Tentacle", 5, 270, 90000001, coolDownOffset: 0),
                        new InvisiToss("Hermit God Tentacle", 5, 315, 90000001, coolDownOffset: 0),
                        //new InvisiToss("Hermit God Drop", 5, 0, coolDown: 90000001, coolDownOffset: 0),

                        //new Spawn("Hermit God Tentacle", 8, 8, coolDown:9000001),
                        new TimedTransition(1000, "check")
                        ),
                    new State("check",
                        new ConditionalEffect(ConditionEffectIndex.Invincible),
                        new EntityNotExistsTransition("Hermit God Tentacle", 20, "active")
                        ),
                    new State("active",
                        new SetAltTexture(2),
                        new TimedTransition(500, "active2")
                        ),
                    new State("active2",
                        new SetAltTexture(0),
                        new Shoot(25, 3, 10, 0, coolDown: 200),
                        new Wander(.2),
                        new TossObject("Whirlpool", 6, 0, 90000001, 100),
                        new TossObject("Whirlpool", 6, 45, 90000001, 100),
                        new TossObject("Whirlpool", 6, 90, 90000001, 100),
                        new TossObject("Whirlpool", 6, 135, 90000001, 100),
                        new TossObject("Whirlpool", 6, 180, 90000001, 100),
                        new TossObject("Whirlpool", 6, 225, 90000001, 100),
                        new TossObject("Whirlpool", 6, 270, 90000001, 100),
                        new TossObject("Whirlpool", 6, 315, 90000001, 100),
                        new TimedTransition(20000, "rage")
                        ),
                    new State("rage",
                        new SetAltTexture(4),
                        new Order(20, "Whirlpool", "despawn"),
                        new Flash(0xfFF0000, .8, 9000001),
                        new Shoot(25, 8, projectileIndex: 1, coolDown: 2000),
                        new Shoot(25, 20, projectileIndex: 2, coolDown: 3000, coolDownOffset: 5000),
                        new TimedTransition(17000, "invis")
                        )
                     ),
                    new GoldLoot(10, 30),
                    new Threshold(0.0001,
                    new ItemLoot("Potion of Dexterity", 0.99),
                    new ItemLoot("Helm of the Juggernaut", 0.01),
                    new ItemLoot("Ruin +1", 0.01),
                    new ItemLoot("Octopussy", 0.01),
                    new ItemLoot("Pet Ruin 1", 0.001),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Potion of Vitality", 0.99),
                    new ItemLoot("Halloween Crate", 0.01)
                )
                    )
            .Init("Whirlpool",
                new State(
                    new State("active",
                        new Shoot(25, 8, projectileIndex: 0, coolDown: 1000),
                        new Orbit(.5, 4, target: "Hermit God", radiusVariance: 0),
                        new EntityNotExistsTransition("Hermit God", 20, "despawn")
                        ),
                    new State("despawn",
                        new Suicide()
                        )
                    )
            )
            .Init("Hermit God Tentacle",
                new State(
                    new Prioritize(
                        new Orbit(.5, 5, target: "Hermit God", radiusVariance: 0.5),
                        new Follow(0.85, range: 1, duration: 2000, coolDown: 0)
                        ),
                    new Shoot(4, 8, projectileIndex: 0, coolDown: 1000)
                    )
            )
            .Init("Hermit Minion",
                new State(
                    new Prioritize(
                        new Wander(.5),
                        new Follow(0.85, 3, 1, 2000, 0)
                        ),
                    new Shoot(5, 1, 1, 1, coolDown: 2300),
                    new Shoot(5, 3, 1, 0, coolDown: 1000)
                    )
            )
            .Init("Hermit God Drop",
                new State(
                    new State(
                        new ConditionalEffect(ConditionEffectIndex.Invincible),
                        new EntityNotExistsTransition("Hermit God", 10, "despawn")
                        ),
                    new State("despawn",
                        new Suicide()
                        )
                    ),
                new Threshold(0.0001,
                    new ItemLoot("Potion of Dexterity", 0.99),
                    new ItemLoot("Helm of the Juggernaut", 0.01),
                    new ItemLoot("Ruin +1", 0.01),
                    new ItemLoot("Octopussy", 0.005),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Potion of Vitality", 0.99),
                    new ItemLoot("Halloween Crate", 0.01)
                )
            )
        #endregion

        #region Pentaract

            .Init("Pentaract",
                new State(
                    new Taunt("Uhm... What?")
                    )
            )
            .Init("Pentaract Tower",
                new State(
                    new Grenade(2, 50, 2.5, coolDown: 2000)
                    )
            )
            .Init("Pentaract Eye",
                new State(
                    new Shoot(2, coolDown: 333)
                    )
            )
        #endregion

        #region Grand Sphinx

            .Init("Grand Sphinx",
                    new State(
                        //new Spawn("Horrid Reaper", maxChildren: 6, initialSpawn: 1),
                        new State("BlindAttack",
                            new Wander(0.0005),
                            new StayCloseToSpawn(0.5, 8),
                            new Taunt("You hide like cowards... but you can't hide from this!"),
                            new State("1",
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 0),
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 180),
                                new TimedTransition(1500, "2")
                            ),
                            new State("2",
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 270),
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 90),
                                new TimedTransition(1500, "1")
                            ),
                            new TimedTransition(10000, "Ilde")
                        ),
                        new State("Ilde",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Flash(0xff00ff00, 0.01, 50),
                            new TimedTransition(2000, "ArmorBreakAttack")
                        ),
                        new State("ArmorBreakAttack",
                            new Wander(0.0005),
                            new StayCloseToSpawn(0.5, 8),
                            new Shoot(0, projectileIndex: 2, count: 8, shootAngle: 5, coolDown: 300),
                            new TimedTransition(10000, "Ilde2")
                        ),
                        new State("Ilde2",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Flash(0xff00ff00, 0.01, 50),
                            new TimedTransition(2000, "WeakenAttack")
                        ),
                        new State("WeakenAttack",
                            new Wander(0.0005),
                            new StayCloseToSpawn(0.5, 8),
                            //new Shoot(10, projectileIndex: 3, count: 3, shootAngle: 120, coolDown: 900),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 40, coolDown: 1600, coolDownOffset: 0),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 220, coolDown: 1600, coolDownOffset: 0),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 130, coolDown: 1600, coolDownOffset: 800),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 310, coolDown: 1600, coolDownOffset: 800),
                            new TimedTransition(10000, "Ilde3")
                        ),
                        new State("Ilde3",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Flash(0xff00ff00, 0.01, 50),
                            new TimedTransition(2000, "BlindAttack")
                        )
                    ),
                    new GoldLoot(10, 30),
                    new Threshold(0.0001,
                        new ItemLoot("Potion of Vitality", 1),
                        new ItemLoot("Potion of Wisdom", 1)
                    ),
                    new Threshold(0.0001,
                        new ItemLoot("Helm of the Juggernaut", 0.01),
                        new ItemLoot("Gladiator Armor", 0.005),
                        new ItemLoot("Pet Ruin 1", 0.001)
                        )
                    )
                .Init("Horrid Reaper",
                    new State(
                        //    new Shoot(radius: 25, shootAngle: 10 * (float)Math.PI / 180, count: 1, projectileIndex: 0, coolDown: 1000),
                        new State("Idle",
                            new ConditionalEffect(ConditionEffectIndex.Invincible),
                            new StayCloseToSpawn(0.5, 15),
                            new Wander(0.5),
                            new EntityNotExistsTransition("Grand Sphinx", 500, "Go away")
                        ),
                        new State("Go away",
                            new ConditionalEffect(ConditionEffectIndex.Invincible),
                            new TimedTransition(2000, "I AM OUT"),
                            new Taunt("OOaoaoAaAoaAAOOAoaaoooaa!!!")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
        #endregion

        #region Lord of the Lost Lands

            .Init("Lord of the Lost Lands",
                new State(
                    new HpLessTransition(0.15, "IMDONELIKESOOOODONE!"),
                    new State("timetogeticey",
                        new PlayerWithinTransition(8, "startupandfireup")
                        ),
                    new State("startupandfireup",
                        new SetAltTexture(0),
                        new Wander(0.3),
                        new Shoot(10, count: 7, shootAngle: 7, coolDownOffset: 1100, angleOffset: 270, coolDown: 2250),
                        new Shoot(10, count: 7, shootAngle: 7, coolDownOffset: 1100, angleOffset: 90, coolDown: 2250),

                        new Shoot(10, count: 7, shootAngle: 7, coolDown: 2250),
                        new Shoot(10, count: 7, shootAngle: 7, angleOffset: 180, coolDown: 2250),

                        new TimedTransition(8500, "GatherUp")
                        ),
                    new State("GatherUp",
                        new SetAltTexture(3),
                        new Taunt("GATHERING POWER!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1, coolDown: 4550),
                        new Shoot(8.4, count: 6, shootAngle: 60, predictive: 2, projectileIndex: 1, coolDown: 2700),
                        new TimedTransition(5750, "protect")
                        ),
                    new State("protect",
                        //Minions spawn
                        new TossObject("Guardian of the Lost Lands", 5, 0, coolDown: 9999999, randomToss: false),
                        new TossObject("Guardian of the Lost Lands", 5, 90, coolDown: 9999999, randomToss: false),
                        new TossObject("Guardian of the Lost Lands", 5, 180, coolDown: 9999999, randomToss: false),
                        new TossObject("Guardian of the Lost Lands", 5, 270, coolDown: 9999999, randomToss: false),
                        new TimedTransition(1000, "crystals")
                        ),
                    new State("crystals",
                        new SetAltTexture(1),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TossObject("Protection Crystal", 4, 0, coolDown: 9999999, randomToss: false),
                        new TossObject("Protection Crystal", 4, 45, coolDown: 9999999, randomToss: false),
                        new TossObject("Protection Crystal", 4, 90, coolDown: 9999999, randomToss: false),
                        new TossObject("Protection Crystal", 4, 135, coolDown: 9999999, randomToss: false),
                        new TossObject("Protection Crystal", 4, 180, coolDown: 9999999, randomToss: false),
                        new TossObject("Protection Crystal", 4, 225, coolDown: 9999999, randomToss: false),
                        new TossObject("Protection Crystal", 4, 270, coolDown: 9999999, randomToss: false),
                        new TossObject("Protection Crystal", 4, 315, coolDown: 9999999, randomToss: false),
                        new TimedTransition(2100, "checkforcrystals")
                        ),
                    new State("checkforcrystals",
                        new SetAltTexture(1),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new EntityNotExistsTransition("Protection Crystal", 9999, "startupandfireup")
                        ),
                    new State("IMDONELIKESOOOODONE!",
                        new Taunt("NOOOOOOOOOOOOOOO!"),
                        new SetAltTexture(3),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                        new Flash(0xFF0000, 0.2, 3),
                        new TimedTransition(4250, "dead")
                        ),
                    new State("dead",
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1),
                        new Suicide()
                        )
                    ),
                new GoldLoot(10, 30),
                new Threshold(0.0001,
                    new ItemLoot("Shield of Ogmur", 0.01),
                    new ItemLoot("Armor of Ogmur", 0.005),
                    new ItemLoot("Green Fairy Robe", 0.005),
                    new ItemLoot("Purple Fairy Robe", 0.005),
                    new ItemLoot("Pet Ruin 1", 0.001),
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
                    new TierLoot(5, ItemType.Ring, 0.05),
                    new ItemLoot("Halloween Crate", 0.01)
                )
            )
            .Init("Protection Crystal",
                new State(
                    new State("PROTECT!",
                        new Orbit(0.3, 3, 20, "Lord of the Lost Lands"),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 10, coolDown: 100),
                        new EntityNotExistsTransition("Lord of the Lost Lands", 500, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(5000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
            .Init("Guardian of the Lost Lands",
                new State(
                    new State("Tough",
                        new Follow(0.35, 8, 1),
                        new Spawn("Knight of the Lost Lands", initialSpawn: 1, maxChildren: 1),
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1, coolDown: 2000),
                        new Shoot(8.4, count: 6, projectileIndex: 0, coolDown: 1300),
                        new HpLessTransition(0.35, "Scrub")
                        ),
                    new State("Scrub",
                        new StayBack(0.75, 5),
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1, coolDown: 2000),
                        new Shoot(8.4, count: 5, projectileIndex: 0, coolDown: 1300),
                        new EntityNotExistsTransition("Lord of the Lost Lands", 500, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(5000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    ),
                new ItemLoot("Health Potion", 0.07),
                new ItemLoot("Magic Potion", 0.07)
            )
            .Init("Knight of the Lost Lands",
                new State(
                    new State("Fighting",
                        new Follow(0.4, 8, 1),
                        new Shoot(8.4, count: 1, projectileIndex: 0, coolDown: 900),
                        new EntityNotExistsTransition("Lord of the Lost Lands", 500, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(5000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    ),
                new ItemLoot("Health Potion", 0.04),
                new ItemLoot("Magic Potion", 0.04)
            )

        #endregion

            .Init("Elder Cube God",
                new State(
                    new Shoot(25, 9, 10, 0, null, 0, null, 1, 0, 750),
                    //                    new Shoot(25, 4, 10, 1, null, 0, null, 1, 0, 750),
                    new Wander(0.1),
                    new Spawn("Elder Cube Overseer", 2, coolDown: 5000),
                    new Spawn("Elder Cube Defender", 10, coolDown: 1000),
                    new Spawn("Elder Cube Blaster", 2, coolDown: 5000),
                    new Reproduce("Elder Cube Overseer", 10, 4, 5000),
                    new Reproduce("Elder Cube Defender", 10, 20, 1000),
                    new Reproduce("Elder Cube Blaster", 10, 20, 1000)
                    ),
                new TierLoot(3, ItemType.Ring, 0.2),
                new TierLoot(7, ItemType.Armor, 0.2),
                new TierLoot(8, ItemType.Weapon, 0.2),
                new TierLoot(4, ItemType.Ability, 0.1),
                new TierLoot(8, ItemType.Armor, 0.1),
                new TierLoot(4, ItemType.Ring, 0.05),
                new TierLoot(9, ItemType.Armor, 0.03),
                new TierLoot(5, ItemType.Ability, 0.03),
                new TierLoot(9, ItemType.Weapon, 0.03),
                new TierLoot(10, ItemType.Armor, 0.02),
                new TierLoot(10, ItemType.Weapon, 0.02),
                new TierLoot(11, ItemType.Armor, 0.01),
                new TierLoot(11, ItemType.Weapon, 0.01),
                new TierLoot(5, ItemType.Ring, 0.01),
                new GoldLoot(10, 30),
                new Threshold(0.0001,
                    new ItemLoot("Ruin +3", 0.01),
                    new ItemLoot("Pet Ruin 1", 0.001),
                    new ItemLoot("Potion of Life", 0.9),
                    new ItemLoot("Potion of Mana", 0.9),
                    new ItemLoot("Potion of Defense", 0.9),
                    new ItemLoot("Potion of Vitality", 0.9),
                    new ItemLoot("Potion of Dexterity", 0.9),
                    new ItemLoot("Potion of Wisdom", 0.9),
                    new ItemLoot("Potion of Attack", 0.9),
                    new ItemLoot("Potion of Speed", 0.9),
                    new ItemLoot("Real Master Sword", 0.005),
                    new ItemLoot("Halloween Crate", 0.01)
                )
               )
            .Init("Elder Cube Overseer",
                new State(
                    new Shoot(10, 4, 10, 0, predictive: 1, coolDown: 1500),
                    new Shoot(10, 1, projectileIndex: 1, predictive: 1, coolDown: 2500),
                    new Orbit(1, 5, target: "Elder Cube God", radiusVariance: 0.5),
                    new EntityNotExistsTransition("Elder Cube God", 500, "Go away"),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
            .Init("Elder Cube Defender",
                new State(
                    new Shoot(10, 1, 10, 0, coolDown: 1500),
                    new Orbit(1, 7.5, target: "Elder Cube God", radiusVariance: 0.5),
                    new EntityNotExistsTransition("Elder Cube God", 500, "Go away"),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
            .Init("Elder Cube Blaster",
                new State(
                    new Shoot(10, 1, projectileIndex: 1, coolDown: 1500),
                    new Shoot(10, 2, 10, 0, coolDown: 1500),
                    new Orbit(1, 7.5, target: "Elder Cube God", radiusVariance: 0.5),
                    new EntityNotExistsTransition("Elder Cube God", 500, "Go away"),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )

            .Init("Elder Skull Shrine",
                new State(
                    new State(
                    new Shoot(25, 9, 10, predictive: 1),
                    new HpLessTransition(0.1, "Suicide"),
                    new Spawn("Elder Red Flaming Skull", 4, coolDown: 5000),
                    new Spawn("Elder Blue Flaming Skull", 5, coolDown: 1000),
                    new Reproduce("Elder Red Flaming Skull", 4, 8, 5000),
                    new Reproduce("Elder Blue Flaming Skull", 5, 10, 1000)
                    ),
                    new State("Suicide",
                        new Suicide()
                    )
                    ),
                new TierLoot(3, ItemType.Ring, 0.2),
                new TierLoot(7, ItemType.Armor, 0.2),
                new TierLoot(8, ItemType.Weapon, 0.2),
                new TierLoot(4, ItemType.Ability, 0.1),
                new TierLoot(8, ItemType.Armor, 0.1),
                new TierLoot(4, ItemType.Ring, 0.05),
                new TierLoot(9, ItemType.Armor, 0.03),
                new TierLoot(5, ItemType.Ability, 0.03),
                new TierLoot(9, ItemType.Weapon, 0.03),
                new TierLoot(10, ItemType.Armor, 0.02),
                new TierLoot(10, ItemType.Weapon, 0.02),
                new TierLoot(11, ItemType.Armor, 0.01),
                new TierLoot(11, ItemType.Weapon, 0.01),
                new TierLoot(5, ItemType.Ring, 0.01),
                new GoldLoot(5, 20),
                new Threshold(0.0001,
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Ruin +3", 0.01),
                    new ItemLoot("Pet Ruin 1", 0.01),
                    new ItemLoot("Jack's Nightmare", 0.01),
                    new ItemLoot("Jack's Murder Suit", 0.01),
                    new ItemLoot("Potion of Life", 0.5),
                    new ItemLoot("Potion of Mana", 0.5),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5),
                    new ItemLoot("The Forgotten Tresure", 0.005),
                    new ItemLoot("Halloween Crate", 0.01)
                )
            )
            .Init("Elder Red Flaming Skull",
                new State(
                    new Prioritize(
                        new Wander(.6),
                        new Follow(.6, 20, 3)
                        ),
                    new Shoot(15, 2, 5, 0, predictive: 1, coolDown: 750),
                    new EntityNotExistsTransition("Elder Skull Shrine", 500, "Go away"),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
            .Init("Elder Blue Flaming Skull",
                new State(
                    new Prioritize(
                        new Orbit(1, 20, target: "Elder Skull Shrine", radiusVariance: 0.5),
                        new Wander(.6)
                        ),
                    new Shoot(15, 2, 5, 0, predictive: 1, coolDown: 750),
                    new EntityNotExistsTransition("Elder Skull Shrine", 500, "Go away"),
                        new State("Go away",
                            new TimedTransition(2000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
        #region Elder Grand Sphinx

            .Init("Elder Grand Sphinx",
                    new State(
                    //    new Spawn("Elder Horrid Reaper", maxChildren: 6, initialSpawn: 1),
                        new State("BlindAttack",
                            new Wander(0.0005),
                            new StayCloseToSpawn(0.5, 8),
                            new Taunt("You hide like cowards... but you can't hide from this!"),
                            new State("1",
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 0),
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 180),
                                new TimedTransition(1500, "2")
                            ),
                            new State("2",
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 270),
                                new Shoot(10, projectileIndex: 1, count: 10, shootAngle: 10, fixedAngle: 90),
                                new TimedTransition(1500, "1")
                            ),
                            new TimedTransition(10000, "Ilde")
                        ),
                        new State("Ilde",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Flash(0xff00ff00, 0.01, 50),
                            new TimedTransition(2000, "ArmorBreakAttack")
                        ),
                        new State("ArmorBreakAttack",
                            new Wander(0.0005),
                            new StayCloseToSpawn(0.5, 8),
                            new Shoot(0, projectileIndex: 2, count: 8, shootAngle: 5, coolDown: 300),
                            new TimedTransition(10000, "Ilde2")
                        ),
                        new State("Ilde2",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Flash(0xff00ff00, 0.01, 50),
                            new TimedTransition(2000, "WeakenAttack")
                        ),
                        new State("WeakenAttack",
                            new Wander(0.0005),
                            new StayCloseToSpawn(0.5, 8),
                            //new Shoot(10, projectileIndex: 3, count: 3, shootAngle: 120, coolDown: 900),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 40, coolDown: 1600, coolDownOffset: 0),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 220, coolDown: 1600, coolDownOffset: 0),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 130, coolDown: 1600, coolDownOffset: 800),
                            new Shoot(10, projectileIndex: 2, count: 3, shootAngle: 15, fixedAngle: 310, coolDown: 1600, coolDownOffset: 800),
                            new TimedTransition(10000, "Ilde3")
                        ),
                        new State("Ilde3",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Flash(0xff00ff00, 0.01, 50),
                            new TimedTransition(2000, "BlindAttack")
                        )
                    ),
                    new GoldLoot(5, 20),
                    new Threshold(0.0001,
                        new ItemLoot("Potion of Vitality", 1),
                        new ItemLoot("Potion of Wisdom", 1)
                    ),
                    new Threshold(0.0001,
                        new ItemLoot("Deaths Bone", 0.01),
                        new ItemLoot("Bone Star", 0.005),
                        new ItemLoot("Skull'd Blade", 0.01),
                        new ItemLoot("Re's Wrath", 0.005),
                        new ItemLoot("Pet Ruin 1", 0.001)
                        )
                    )
                .Init("Elder Horrid Reaper",
                    new State(
                        //    new Shoot(radius: 25, shootAngle: 10 * (float)Math.PI / 180, count: 1, projectileIndex: 0, coolDown: 1000),
                        new State("Idle",
                            new ConditionalEffect(ConditionEffectIndex.Invincible),
                            new StayCloseToSpawn(0.5, 15),
                            new Wander(0.5),
                            new EntityNotExistsTransition("Elder Grand Sphinx", 500, "Go away")
                        ),
                        new State("Go away",
                            new ConditionalEffect(ConditionEffectIndex.Invincible),
                            new TimedTransition(2000, "I AM OUT"),
                            new Taunt("OOaoaoAaAoaAAOOAoaaoooaa!!!")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
        #endregion

        #region Elder Lord of the Lost Lands
        .Init("Elder Lord of the Lost Lands",
                new State(
                    new HpLessTransition(0.15, "IMDONELIKESOOOODONE!"),
                    new State("timetogeticey",
                        new PlayerWithinTransition(8, "startupandfireup")
                        ),
                    new State("startupandfireup",
                        new SetAltTexture(0),
                        new Wander(0.3),
                        new Shoot(10, count: 7, shootAngle: 7, coolDownOffset: 1100, angleOffset: 270, coolDown: 2250),
                        new Shoot(10, count: 7, shootAngle: 7, coolDownOffset: 1100, angleOffset: 90, coolDown: 2250),

                        new Shoot(10, count: 7, shootAngle: 7, coolDown: 2250),
                        new Shoot(10, count: 7, shootAngle: 7, angleOffset: 180, coolDown: 2250),

                        new TimedTransition(8500, "GatherUp")
                        ),
                    new State("GatherUp",
                        new SetAltTexture(3),
                        new Taunt("GATHERING POWER!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1, coolDown: 4550),
                        new Shoot(8.4, count: 6, shootAngle: 60, predictive: 2, projectileIndex: 1, coolDown: 2700),
                        new TimedTransition(5750, "protect")
                        ),
                    new State("protect",
                        //Minions spawn
                        new TossObject("Elder Guardian of the Lost Lands", 5, 0, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Guardian of the Lost Lands", 5, 90, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Guardian of the Lost Lands", 5, 180, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Guardian of the Lost Lands", 5, 270, coolDown: 9999999, randomToss: false),
                        new TimedTransition(1000, "crystals")
                        ),
                    new State("crystals",
                        new SetAltTexture(1),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TossObject("Elder Protection Crystal", 4, 0, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Protection Crystal", 4, 45, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Protection Crystal", 4, 90, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Protection Crystal", 4, 135, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Protection Crystal", 4, 180, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Protection Crystal", 4, 225, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Protection Crystal", 4, 270, coolDown: 9999999, randomToss: false),
                        new TossObject("Elder Protection Crystal", 4, 315, coolDown: 9999999, randomToss: false),
                        new TimedTransition(2100, "checkforcrystals")
                        ),
                    new State("checkforcrystals",
                        new SetAltTexture(1),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new EntityNotExistsTransition("Elder Protection Crystal", 15, "startupandfireup")
                        ),
                    new State("IMDONELIKESOOOODONE!",
                        new Taunt("NOOOOOOOOOOOOOOO!"),
                        new SetAltTexture(3),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                        new Flash(0xFF0000, 0.2, 3),
                        new TimedTransition(4250, "dead")
                        ),
                    new State("dead",
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1),
                        new Suicide()
                        )
                    ),
                new GoldLoot(25, 100),
                new Threshold(0.0001,
                    new ItemLoot("Potion of Life", 0.8),
                    new ItemLoot("Potion of Mana", 0.8),
                    new ItemLoot("Potion of Defense", 0.8),
                    new ItemLoot("Potion of Vitality", 0.8),
                    new ItemLoot("Potion of Dexterity", 0.8),
                    new ItemLoot("Potion of Wisdom", 0.8),
                    new ItemLoot("Potion of Attack", 0.8),
                    new ItemLoot("Potion of Speed", 0.8),
                    new ItemLoot("Shield of Ogmur", 0.01),
                    new ItemLoot("Armor of Ogmur", 0.01), 
                    new ItemLoot("Staff of Ancient Powers", 0.0001),
                    new ItemLoot("Orb of Ancient Powers", 0.002),
                    new ItemLoot("Robe of Ancient Powers", 0.002),
                    new ItemLoot("Ring of Ancient Powers", 0.002),
                    new ItemLoot("Pet Ruin 1", 0.001),
                    new TierLoot(9, ItemType.Weapon, 0.2),
                    new TierLoot(10, ItemType.Weapon, 0.175),
                    new TierLoot(11, ItemType.Weapon, 0.125),
                    new TierLoot(12, ItemType.Weapon, 0.05),
                    new TierLoot(9, ItemType.Armor, 0.2),
                    new TierLoot(10, ItemType.Armor, 0.175),
                    new TierLoot(11, ItemType.Armor, 0.15),
                    new TierLoot(12, ItemType.Armor, 0.1),
                    new TierLoot(13, ItemType.Armor, 0.05),
                    new TierLoot(5, ItemType.Ability, 0.15),
                    new TierLoot(6, ItemType.Ability, 0.1),
                    new TierLoot(5, ItemType.Ring, 0.05),
                    new ItemLoot("Halloween Crate", 0.01)
                )
            )
            .Init("Elder Protection Crystal",
                new State(
                    new State("PROTECT!",
                        new Orbit(0.3, 3, 20, "Elder Lord of the Lost Lands"),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 10, coolDown: 100),
                        new EntityNotExistsTransition("Elder Lord of the Lost Lands", 15, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(5000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    )
                 )
            .Init("Elder Guardian of the Lost Lands",
                new State(
                    new State("Tough",
                        new Follow(0.35, 8, 1),
                        new Spawn("Elder Knight of the Lost Lands", initialSpawn: 1, maxChildren: 1),
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1, coolDown: 2000),
                        new Shoot(8.4, count: 6, projectileIndex: 0, coolDown: 1300),
                        new HpLessTransition(0.35, "Scrub")
                        ),
                    new State("Scrub",
                        new StayBack(0.75, 5),
                        new Shoot(8.4, count: 6, shootAngle: 60, projectileIndex: 1, coolDown: 2000),
                        new Shoot(8.4, count: 5, projectileIndex: 0, coolDown: 1300),
                        new EntityNotExistsTransition("Elder Lord of the Lost Lands", 15, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(5000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    ),
                new ItemLoot("Health Potion", 0.07),
                new ItemLoot("Magic Potion", 0.07)
            )
            .Init("Elder Knight of the Lost Lands",
                new State(
                    new State("Fighting",
                        new Follow(0.4, 8, 1),
                        new Shoot(8.4, count: 1, projectileIndex: 0, coolDown: 900),
                        new EntityNotExistsTransition("Elder Lord of the Lost Lands", 15, "Go away")
                        ),
                        new State("Go away",
                            new TimedTransition(5000, "I AM OUT")
                        ),
                        new State("I AM OUT",
                              new Suicide()
                        )
                    ),
                new ItemLoot("Health Potion", 0.04),
                new ItemLoot("Magic Potion", 0.04)
            )
        #endregion
        #region Ghost Ship
        .Init("Vengeful Spirit",
                new State(
                    new State("Start",
                        new ChangeSize(50, 120),
                        new Prioritize(
                            new Follow(0.48, 8, 1),
                            new Wander(0.45)
                            ),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 16, coolDown: 1000),
                        new TimedTransition(1000, "Vengeful")
                        ),
                    new State("Vengeful",
                        new Prioritize(
                            new Follow(1, 8, 1),
                            new Wander(0.45)
                            ),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 16, coolDown: 1645),
                        new TimedTransition(3000, "Vengeful2")
                        ),
                        new State("Vengeful2",
                        new ReturnToSpawn(once: false, speed: 0.6),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 16, coolDown: 1500),
                        new TimedTransition(1500, "Vengeful")
                        )))
                   .Init("Water Mine",
                    new State(
                       new State("Seek",
                        new Prioritize(
                            new Follow(0.45, 8, 1),
                            new Wander(0.55)
                            ),
                        new TimedTransition(3750, "Boom")
                        ),
                        new State("Boom",
                        new Shoot(8.4, count: 10, projectileIndex: 0, coolDown: 1000),
                        new Suicide()
                 )))
                 .Init("Beach Spectre",
                    new State(
                       new State("Fight",
                           new Wander(0.03),
                       new ChangeSize(10, 120),
                       new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 14, coolDown: 1750)
                 )))

                 .Init("Beach Spectre Spawner",
                    new State(
                       new ConditionalEffect(ConditionEffectIndex.Invincible),
                       new State("Spawn",
                       new Reproduce("Beach Spectre", densityMax: 1, densityRadius: 3, spawnRadius: 1, coolDown: 1250)
                 )))
                  .Init("Tempest Cloud",
                    new State(
                        new ConditionalEffect(ConditionEffectIndex.Invincible),
                    new State("Start1",
                       new ChangeSize(70, 130),
                       new TimedTransition(3000, "Start2")
                 ),
                    new State("Start2",
                       new SetAltTexture(1),
                       new TimedTransition(1, "Start3")
                 ),
                    new State("Start3",
                       new SetAltTexture(2),
                       new TimedTransition(1, "Start4")
                 ),
                     new State("Start4",
                       new SetAltTexture(3),
                       new TimedTransition(1, "Start5")
                 ),
                     new State("Start5",
                       new SetAltTexture(4),
                       new TimedTransition(1, "Start6")
                 ),
                     new State("Start6",
                       new SetAltTexture(5),
                       new TimedTransition(1, "Start7")
                 ),
                     new State("Start7",
                       new SetAltTexture(6),
                       new TimedTransition(1, "Start8")
                 ),
                     new State("Start8",
                       new SetAltTexture(7),
                       new TimedTransition(1, "Start9")
                 ),
                     new State("Start9",
                       new SetAltTexture(8),
                       new TimedTransition(1, "Final")
                 ),
                     new State("Final",
                       new SetAltTexture(9),
                       new TimedTransition(1, "CircleAndStorm")
                 ),
                     new State("CircleAndStorm",
                       new Orbit(0.25, 9, 20, "Ghost Ship Anchor", speedVariance: 0.1),
                       new Shoot(8.4, count: 7, projectileIndex: 0, coolDown: 1000)
                 )))
                .Init("Ghost Ship Anchor",
                    new State(
                       new State("idle",
                       new ConditionalEffect(ConditionEffectIndex.Invincible)
                 ),
                    new State("tempestcloud",
                        new InvisiToss("Tempest Cloud", 9, 0, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 45, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 90, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 135, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 180, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 225, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 270, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 315, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 350, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 250, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 110, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 200, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 10, coolDown: 9999999),
                        new InvisiToss("Tempest Cloud", 9, 290, coolDown: 9999999),

                        //Spectre Spawner
                        new InvisiToss("Beach Spectre Spawner", 17, 0, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 45, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 90, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 135, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 180, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 225, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 270, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 315, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 250, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 110, coolDown: 9999999),
                        new InvisiToss("Beach Spectre Spawner", 17, 200, coolDown: 9999999),
                       new ConditionalEffect(ConditionEffectIndex.Invincible)
                 )

                        ))
                    .Init("Ghost Ship",
                new State(
                //    new SpawnOnDeath("Davy Jones' Locker Portal", 21),
                    new OnDeath(
                        new RemoveEntity("Ghost Ship", 100, "Tempest Cloud"),
                        new RemoveEntity("Ghost Ship", 100, "Beach Spectre"),
                        new RemoveEntity("Ghost Ship", 100, "Beach Spectre Spawner")
                        ),
                    new State("idle",
                        new SetAltTexture(1),
                        new Wander(0.1),
                        new HpLessTransition(2000, "pause")
                        ),
                    new State("pause",
                         new SetAltTexture(2),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TimedTransition(2000, "start")
                        ),
                      new State("start",
                           new SetAltTexture(0),
                      new Reproduce("Vengeful Spirit", densityMax: 2, spawnRadius: 1, coolDown: 1000),
                      new TimedTransition(15000, "midfight"),
                       new State("2",
                        new SetAltTexture(0),
                        new Prioritize(
                             new Wander(0.45),
                             new StayBack(0.3, 5)
                            ),
                        new Shoot(8.4, count: 1, projectileIndex: 0, coolDown: 450),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 20, coolDown: 1750),
                        new TimedTransition(3250, "1")
                        ),
                     new State("1",
                        new TossObject("Water Mine", 5, angle: 0, coolDown: 1500),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new ReturnToSpawn(once: false, speed: 0.4),
                        new Shoot(8.4, count: 1, projectileIndex: 0, coolDown: 450),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 20, coolDown: 1750),
                        new TimedTransition(1500, "2")
                         )
                        ),


                       new State("midfight",
                     new Order(100, "Ghost Ship Anchor", "tempestcloud"),
                      new Reproduce("Vengeful Spirit", densityMax: 1, spawnRadius: 1, coolDown: 1000),
                      new TossObject("Water Mine", 5, angle: 0, coolDown: 2250),
                      new TimedTransition(10000, "countdown"),
                       new State("2",
                        new SetAltTexture(0),
                        new ReturnToSpawn(once: false, speed: 0.4),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(10, count: 4, projectileIndex: 0, coolDownOffset: 1100, angleOffset: 270, coolDown: 1250),
                        new Shoot(10, count: 4, projectileIndex: 0, coolDownOffset: 1100, angleOffset: 90, coolDown: 1250),
                        new Shoot(8.4, count: 1, projectileIndex: 1, coolDown: 1250),
                        new TimedTransition(3000, "1")
                        ),
                     new State("1",
                        new Prioritize(
                             new Follow(0.45, 8, 1),
                             new Wander(0.3)
                            ),
                        new Taunt(1.00, "Fire at will!"),
                        new Shoot(8.4, count: 2, shootAngle: 25, projectileIndex: 1, coolDown: 3850),
                        new Shoot(8.4, count: 6, projectileIndex: 0, shootAngle: 10, coolDown: 2750),
                        new TimedTransition(4000, "2")
                         )
                        ),
                    new State("countdown",
                        new Wander(0.1),
                        new Timed(1000,
                            new Taunt(1.00, "Ready..")
                            ),
                         new Timed(2000,
                            new Taunt(1.00, "Aim..")
                            ),
                        new Shoot(8.4, count: 1, projectileIndex: 0, coolDown: 450),
                        new Shoot(8.4, count: 3, projectileIndex: 0, shootAngle: 20, coolDown: 750),
                        new TimedTransition(2000, "fire")
                        ),
                    new State("fire",
                       new Prioritize(
                             new Follow(0.36, 8, 1),
                             new Wander(0.12)
                            ),
                         new Shoot(10, count: 4, projectileIndex: 1, coolDownOffset: 1100, angleOffset: 270, coolDown: 1250),
                        new Shoot(10, count: 4, projectileIndex: 1, coolDownOffset: 1100, angleOffset: 90, coolDown: 1250),
                        new Shoot(8.4, count: 10, projectileIndex: 0, coolDown: 3400),
                        new TimedTransition(3400, "midfight")
                        )

               ),
                new ItemLoot("Ghost Pirate Rum", 1.0),
                new Threshold(0.0001,
                    new TierLoot(9, ItemType.Weapon, 0.1),
                    new TierLoot(4, ItemType.Ability, 0.1),
                    new TierLoot(5, ItemType.Ability, 0.05),
                    new TierLoot(9, ItemType.Armor, 0.1),
                    new TierLoot(3, ItemType.Ring, 0.05),
                    new TierLoot(10, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(4, ItemType.Ring, 0.025),
                    new TierLoot(5, ItemType.Ring, 0.02)
                )
             )
        #endregion
            ;
    }
}