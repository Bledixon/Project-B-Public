using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Mountain = () => Behav()
            .Init("White Demon",
                new State(
        	      	new SpawnOnDeath("Ghosty Caverns Portal", 0.01),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(10, 3, 20, predictive: 1, coolDown: 500)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Attack", 0.5)
                    )
            )
            .Init("Sprite God",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Wander(0.4)
                        ),
                    new Shoot(12, projectileIndex: 0, count: 4, shootAngle: 10),
                    new Shoot(10, projectileIndex: 1, predictive: 1),
                    new Spawn("Sprite Child", maxChildren: 5)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Attack", 0.5)
                    )
            )
            .Init("Sprite Child",
                new State(
        	      	new SpawnOnDeath("Glowing Portal", 0.1),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Protect(0.4, "Sprite God", protectionRange: 1),
                        new Wander(0.4)
                        )
                    )
            )
            .Init("Medusa",
                new State(
                    new SpawnOnDeath("Abyss of Demons Portal", 0.1),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 5, 10, coolDown: 1000),
                    new Grenade(4, 150, 8, coolDown: 3000)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Ent God",
                new State(
        	      	new SpawnOnDeath("Wine Cellar Portal", 0.01),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 5, 10, predictive: 1, coolDown: 1250)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Defense", 0.5)
                    )
            )
            .Init("Beholder",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, projectileIndex: 0, count: 5, shootAngle: 72, predictive: 0.5, coolDown: 750),
                    new Shoot(10, projectileIndex: 1, predictive: 1)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Defense", 0.5)
                    )
            )
            .Init("Flying Brain",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 5, 72, coolDown: 500)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Attack", 0.5)
                    )
            )
            .Init("Slime God",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, projectileIndex: 0, count: 5, shootAngle: 10, predictive: 1, coolDown: 1000),
                    new Shoot(10, projectileIndex: 1, predictive: 1, coolDown: 650)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Defense", 0.5)
                    )
            )
            .Init("Ghost God",
                new State(
                    new SpawnOnDeath("Undead Lair Portal", 0.1),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 7, 25, predictive: 0.5, coolDown: 900)
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Rock Bot",
                new State(
                    new Spawn("Paper Bot", 1, 1, 10000),
                    new Spawn("Steel Bot", 1, 1, 10000),
                    new Swirl(0.6, 3, targeted: false),
                    new State("Waiting",
                        new PlayerWithinTransition(15, "Attacking")
                        ),
                    new State("Attacking",
                        new Shoot(8, coolDown: 2000),
                        new Heal(8, "Papers", 1000),
                        new Taunt(0.5, "We are impervious to non-mystic attacks!"),
                        new TimedTransition(10000, "Waiting")
                        )
                    ),
                new TierLoot(5, ItemType.Weapon, 0.16),
                new TierLoot(6, ItemType.Weapon, 0.08),
                new TierLoot(7, ItemType.Weapon, 0.04),
                new TierLoot(5, ItemType.Armor, 0.16),
                new TierLoot(6, ItemType.Armor, 0.08),
                new TierLoot(7, ItemType.Armor, 0.04),
                new TierLoot(3, ItemType.Ring, 0.05),
                new TierLoot(3, ItemType.Ability, 0.1),
                new ItemLoot("Purple Drake Egg", 0.01)
            )
            .Init("Paper Bot",
                new State(
                    new Prioritize(
                        new Orbit(0.4, 3, target: "Rock Bot"),
                        new Wander(0.8)
                        ),
                    new State("Idle",
                        new PlayerWithinTransition(15, "Attack")
                        ),
                    new State("Attack",
                        new Shoot(8, 3, 20, coolDown: 800),
                        new Heal(8, "Steels", 1000),
                        new NoPlayerWithinTransition(30, "Idle"),
                        new HpLessTransition(0.2, "Explode")
                        ),
                    new State("Explode",
                        new Shoot(0, 10, 36, fixedAngle: 0),
                        new Decay(0)
                        )
                    ),
                new TierLoot(6, ItemType.Weapon, 0.01),
                new ItemLoot("Health Potion", 0.04),
                new ItemLoot("Magic Potion", 0.01),
                new ItemLoot("Tincture of Life", 0.01)
            )
            .Init("Steel Bot",
                new State(
                    new Prioritize(
                        new Orbit(0.4, 3, target: "Rock Bot"),
                        new Wander(0.8)
                        ),
                    new State("Idle",
                        new PlayerWithinTransition(15, "Attack")
                        ),
                    new State("Attack",
                        new Shoot(8, 3, 20, coolDown: 800),
                        new Heal(8, "Rocks", 1000),
                        new Taunt(0.5, "Silly squishy. We heal our brothers in a circle."),
                        new NoPlayerWithinTransition(30, "Idle"),
                        new HpLessTransition(0.2, "Explode")
                        ),
                    new State("Explode",
                        new Shoot(0, 10, 36, fixedAngle: 0),
                        new Decay(0)
                        )
                    ),
                new TierLoot(6, ItemType.Weapon, 0.01),
                new ItemLoot("Health Potion", 0.04),
                new ItemLoot("Magic Potion", 0.01)
            )
            .Init("Djinn",
                new State(
                    new State("Idle",
                        new Prioritize(
                            new StayAbove(1, 200),
                            new Wander(0.8)
                            ),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new PlayerWithinTransition(8, "Attacking")
                        ),
                    new State("Attacking",
                        new State("Bullet",
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 90, coolDownOffset: 0, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 100, coolDownOffset: 200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 110, coolDownOffset: 400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 120, coolDownOffset: 600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 130, coolDownOffset: 800, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 140, coolDownOffset: 1000, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 150, coolDownOffset: 1200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 160, coolDownOffset: 1400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 170, coolDownOffset: 1600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 180, coolDownOffset: 1800, shootAngle: 90),
                            new Shoot(1, 8, coolDown: 10000, fixedAngle: 180, coolDownOffset: 2000, shootAngle: 45),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 180, coolDownOffset: 0, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 170, coolDownOffset: 200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 160, coolDownOffset: 400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 150, coolDownOffset: 600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 140, coolDownOffset: 800, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 130, coolDownOffset: 1000, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 120, coolDownOffset: 1200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 110, coolDownOffset: 1400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 100, coolDownOffset: 1600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 90, coolDownOffset: 1800, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 90, coolDownOffset: 2000, shootAngle: 22.5),
                            new TimedTransition(2000, "Wait")
                            ),
                        new State("Wait",
                            new Follow(0.7, range: 0.5),
                            new Flash(0xff00ff00, 0.1, 20),
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new TimedTransition(2000, "Bullet")
                            ),
                        new NoPlayerWithinTransition(13, "Idle"),
                        new HpLessTransition(0.5, "FlashBeforeExplode")
                        ),
                    new State("FlashBeforeExplode",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Flash(0xff0000, 0.3, 3),
                        new TimedTransition(1000, "Explode")
                        ),
                    new State("Explode",
                        new Shoot(0, 10, 36, fixedAngle: 0),
                        new Suicide()
                        )
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.04),
                    new TierLoot(7, ItemType.Weapon, 0.02),
                    new TierLoot(7, ItemType.Armor, 0.04),
                    new TierLoot(8, ItemType.Armor, 0.02),
                    new TierLoot(3, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ring, 0.005),
                    new TierLoot(4, ItemType.Ability, 0.02),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Leviathan",
                new State(
                    new State("pattern walk",
                        new StayAbove(2, 200),
                        new Sequence(
                            new Timed(2000,
                                new Prioritize(
                                    new StayBack(0.5, distance: 8),
                                    new BackAndForth(0.5)
                                    )),
                            new Timed(2000,
                                new Prioritize(
                                    new Orbit(0.5, 8, 11),
                                    new Swirl(0.5, 4, targeted: false)
                                    )),
                            new Timed(1000,
                                new Prioritize(
                                    new Follow(0.5, 11, 1),
                                    new StayCloseToSpawn(0.5, 1)
                                    )
                                )
                            ),
                        new State("1",
                            new Shoot(0, 3, 10, fixedAngle: 0, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 3, 10, fixedAngle: 120, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 3, 10, fixedAngle: 240, projectileIndex: 0, coolDown: 300),
                            new TimedTransition(1500, "2")
                            ),
                        new State("2",
                            new Shoot(0, 4, 10, fixedAngle: 40, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 160, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 280, projectileIndex: 0, coolDown: 300),
                            new TimedTransition(1500, "3")
                            ),
                        new State("3",
                            new Shoot(0, 4, 10, fixedAngle: 80, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 200, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 320, projectileIndex: 0, coolDown: 300),
                            new TimedTransition(1500, "1")
                            ),
                        new TimedTransition(4400, "follow")
                        ),
                    new State("follow",
                        new Prioritize(
                            new StayAbove(0.5, 200),
                            new Orbit(0.5, 4, 11),
                            new Wander(1)
                            ),
                        new Shoot(11, 2, 15, defaultAngle: 0, angleOffset: 0, projectileIndex: 1, predictive: 1,
                            coolDown: 900, coolDownOffset: 0),
                        new Shoot(11, 2, 15, defaultAngle: 0, angleOffset: -10, projectileIndex: 1, predictive: 1,
                            coolDown: 900, coolDownOffset: 300),
                        new Shoot(11, 2, 15, defaultAngle: 0, angleOffset: 10, projectileIndex: 1, predictive: 1,
                            coolDown: 900, coolDownOffset: 600),
                        new TimedTransition(4500, "pattern walk")
                        )
                    ),
                new Threshold(0.0001,
                    new TierLoot(6, ItemType.Weapon, 0.05),
                    new TierLoot(7, ItemType.Weapon, 0.04),
                    new TierLoot(8, ItemType.Weapon, 0.03),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(8, ItemType.Armor, 0.04),
                    new TierLoot(9, ItemType.Armor, 0.03),
                    new TierLoot(3, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(4, ItemType.Ability, 0.04),
                    new ItemLoot("Potion of Defense", 0.5)
                    )
            )
          .Init("Elder White Demon",
                new State(
                    new SpawnOnDeath("Elder Abyss of Demons Portal", 0.4),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(10, 3, 20, predictive: 1, coolDown: 100)
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Sprite God",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Wander(0.4)
                        ),
                    new Shoot(12, projectileIndex: 0, count: 4, shootAngle: 10),
                    new Shoot(10, projectileIndex: 1, predictive: 1)
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Medusa",
                new State(
                    new SpawnOnDeath("Elder Snake Pit Portal", 0.4),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 5, 10, coolDown: 1000),
                    new Grenade(4, 150, 8, coolDown: 3000)
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Ent God",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 5, 10, predictive: 1, coolDown: 1250)
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Beholder",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, projectileIndex: 0, count: 5, shootAngle: 72, predictive: 0.5, coolDown: 750),
                    new Shoot(10, projectileIndex: 1, predictive: 1)
                    ),
                new Threshold(0.0001,
                   new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Flying Brain",
                new State(
                    new SpawnOnDeath("Lair of Shaitan Portal", 0.2),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 5, 72, coolDown: 500)
                    ),
                new Threshold(0.0001,
                   new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Slime God",
                new State(
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, projectileIndex: 0, count: 5, shootAngle: 10, predictive: 1, coolDown: 1000),
                    new Shoot(10, projectileIndex: 1, predictive: 1, coolDown: 650)
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Ghost God",
                new State(
                    new SpawnOnDeath("Elder Undead Lair Portal", 0.4),
                    new Prioritize(
                        new StayAbove(1, 200),
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(12, 7, 25, predictive: 0.5, coolDown: 900)
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Djinn",
                new State(
                    new SpawnOnDeath("Pirate Treasure Cove Portal", 0.2),
                    new State("Idle",
                        new Prioritize(
                            new StayAbove(1, 200),
                            new Wander(0.8)
                            ),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new PlayerWithinTransition(8, "Attacking")
                        ),
                    new State("Attacking",
                        new State("Bullet",
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 90, coolDownOffset: 0, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 100, coolDownOffset: 200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 110, coolDownOffset: 400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 120, coolDownOffset: 600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 130, coolDownOffset: 800, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 140, coolDownOffset: 1000, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 150, coolDownOffset: 1200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 160, coolDownOffset: 1400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 170, coolDownOffset: 1600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 180, coolDownOffset: 1800, shootAngle: 90),
                            new Shoot(1, 8, coolDown: 10000, fixedAngle: 180, coolDownOffset: 2000, shootAngle: 45),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 180, coolDownOffset: 0, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 170, coolDownOffset: 200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 160, coolDownOffset: 400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 150, coolDownOffset: 600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 140, coolDownOffset: 800, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 130, coolDownOffset: 1000, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 120, coolDownOffset: 1200, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 110, coolDownOffset: 1400, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 100, coolDownOffset: 1600, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 90, coolDownOffset: 1800, shootAngle: 90),
                            new Shoot(1, 4, coolDown: 10000, fixedAngle: 90, coolDownOffset: 2000, shootAngle: 22.5),
                            new TimedTransition(2000, "Wait")
                            ),
                        new State("Wait",
                            new Follow(0.7, range: 0.5),
                            new Flash(0xff00ff00, 0.1, 20),
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new TimedTransition(2000, "Bullet")
                            ),
                        new NoPlayerWithinTransition(13, "Idle"),
                        new HpLessTransition(0.5, "FlashBeforeExplode")
                        ),
                    new State("FlashBeforeExplode",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Flash(0xff0000, 0.3, 3),
                        new TimedTransition(1000, "Explode")
                        ),
                    new State("Explode",
                        new Shoot(0, 10, 36, fixedAngle: 0),
                        new Suicide()
                        )
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            .Init("Elder Leviathan",
                new State(
                    new State("pattern walk",
                        new StayAbove(2, 200),
                        new Sequence(
                            new Timed(2000,
                                new Prioritize(
                                    new StayBack(1, distance: 8),
                                    new BackAndForth(1)
                                    )),
                            new Timed(2000,
                                new Prioritize(
                                    new Orbit(1, 8, 11),
                                    new Swirl(1, 4, targeted: false)
                                    )),
                            new Timed(1000,
                                new Prioritize(
                                    new Follow(1, 11, 1),
                                    new StayCloseToSpawn(1, 1)
                                    )
                                )
                            ),
                        new State("1",
                            new Shoot(0, 3, 10, fixedAngle: 0, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 3, 10, fixedAngle: 120, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 3, 10, fixedAngle: 240, projectileIndex: 0, coolDown: 300),
                            new TimedTransition(1500, "2")
                            ),
                        new State("2",
                            new Shoot(0, 4, 10, fixedAngle: 40, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 160, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 280, projectileIndex: 0, coolDown: 300),
                            new TimedTransition(1500, "3")
                            ),
                        new State("3",
                            new Shoot(0, 4, 10, fixedAngle: 80, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 200, projectileIndex: 0, coolDown: 300),
                            new Shoot(0, 4, 10, fixedAngle: 320, projectileIndex: 0, coolDown: 300),
                            new TimedTransition(1500, "1")
                            ),
                        new TimedTransition(4400, "follow")
                        ),
                    new State("follow",
                        new Prioritize(
                            new StayAbove(1, 200),
                            new Orbit(1, 4, 11),
                            new Wander(1)
                            ),
                        new Shoot(11, 2, 15, defaultAngle: 0, angleOffset: 0, projectileIndex: 1, predictive: 1,
                            coolDown: 900, coolDownOffset: 0),
                        new Shoot(11, 2, 15, defaultAngle: 0, angleOffset: -10, projectileIndex: 1, predictive: 1,
                            coolDown: 900, coolDownOffset: 300),
                        new Shoot(11, 2, 15, defaultAngle: 0, angleOffset: 10, projectileIndex: 1, predictive: 1,
                            coolDown: 900, coolDownOffset: 600),
                        new TimedTransition(4500, "pattern walk")
                        )
                    ),
                new Threshold(0.0001,
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(11, ItemType.Weapon, 0.04),
                    new TierLoot(9, ItemType.Weapon, 0.03),
                    new TierLoot(9, ItemType.Armor, 0.05),
                    new TierLoot(11, ItemType.Armor, 0.04),
                    new TierLoot(12, ItemType.Armor, 0.03),
                    new TierLoot(5, ItemType.Ring, 0.025),
                    new TierLoot(4, ItemType.Ring, 0.015),
                    new TierLoot(5, ItemType.Ability, 0.04),
                    new ItemLoot("Paper", 0.002),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Defense", 0.5),
                    new ItemLoot("Potion of Vitality", 0.5),
                    new ItemLoot("Potion of Dexterity", 0.5),
                    new ItemLoot("Potion of Wisdom", 0.5),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Potion of Speed", 0.5)
                    )
            )
            ;
    }
}