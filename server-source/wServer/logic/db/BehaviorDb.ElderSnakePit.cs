using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ ElderSnakePit = () => Behav()
            .Init("Elder Stheno the Snake Queen",
                new State(
                    new State("Idle",
                        new PlayerWithinTransition(20, "Silver Blasts")
                        ),
                    new State("Silver Blasts",
                        new State("Silver Blasts 1",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blasts 2")
                            ),
                        new State("Silver Blasts 2",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blasts 3")
                            ),
                        new State("Silver Blasts 3",
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blasts 4")
                            ),
                        new State("Silver Blasts 4",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blasts 5")
                            ),
                        new State("Silver Blasts 5",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blasts 6")
                            ),
                        new State("Silver Blasts 6",
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blasts 7")
                            ),
                        new State("Silver Blasts 7",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blasts 8")
                            ),
                        new State("Silver Blasts 8",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 45, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 135, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 225, projectileIndex: 0),
                            new Shoot(10, count: 2, shootAngle: 10, angleOffset: 315, projectileIndex: 0),
                            new TimedTransition(1000, "Spawn Stheno Swarm")
                            )
                        ),
                    new State("Spawn Stheno Swarm",
                        new Prioritize(
                            new StayCloseToSpawn(0.4, 2),
                            new Wander(0.4)
                            ),
                        new Reproduce("Elder Stheno Swarm", 2.5, 8, coolDown: 750),
                        new State("Silver Blast 1",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 2")
                            ),
                        new State("Silver Blast 2",
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 3")
                            ),
                        new State("Silver Blast 3",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 4")
                            ),
                        new State("Silver Blast 4",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 5")
                            ),
                        new State("Silver Blast 5",
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 6")
                            ),
                        new State("Silver Blast 6",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 7")
                            ),
                        new State("Silver Blast 7",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 8")
                            ),
                        new State("Silver Blast 8",
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 9")
                            ),
                        new State("Silver Blast 9",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 10")
                            ),
                        new State("Silver Blast 10",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 11")
                            ),
                        new State("Silver Blast 11",
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 12")
                            ),
                        new State("Silver Blast 12",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 13")
                            ),
                        new State("Silver Blast 13",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 14")
                            ),
                        new State("Silver Blast 14",
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 15")
                            ),
                        new State("Silver Blast 15",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Silver Blast 16")
                            ),
                        new State("Silver Blast 16",
                            new Shoot(10, count: 1, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 270, projectileIndex: 0),
                            new Shoot(10, count: 1, angleOffset: 90, projectileIndex: 0),
                            new TimedTransition(1000, "Leave me")
                            ),
                        new State("Leave me",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Order(100, "Elder Stheno Swarm", "Despawn"),
                            new TimedTransition(1000, "Blind Ring Attack + ThrowAttack")
                            )
                        ),
                    new State("Blind Ring Attack + ThrowAttack",
                        new State("Blind Ring Attack + ThrowAttack 1",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 2")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 2",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 3")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 3",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 4")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 4",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 5")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 5",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 6")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 6",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 7")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 7",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 8")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 8",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 9")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 9",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 10")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 10",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 11")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 11",
                            new ConditionalEffect(ConditionEffectIndex.Invulnerable, true),
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Blind Ring Attack + ThrowAttack 12")
                            ),
                        new State("Blind Ring Attack + ThrowAttack 12",
                            new Shoot(10, count: 6, projectileIndex: 1),
                            new Grenade(2.5, 100, 10),
                            new TimedTransition(500, "Silver Blasts")

                            )
                        )
                    ),
                new KeyLoot(0, 2),
                new Threshold(0.0001,
                    new ItemLoot("Potion of Speed", 1),
                    new ItemLoot("Potion of Speed", 1),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Samurai's Armor", 0.01),
                    new ItemLoot("Lord Ruthven's Cape", 0.01),
                    new ItemLoot("Haunted Trap", 0.01),
                    new ItemLoot("Ruin +3", 0.01),
                    new ItemLoot("Halloween Crate", 0.01)
                    )
            )
            .Init("Elder Stheno Swarm",
                new State(
                    new State("Protect",
                        new Prioritize(
                            new Protect(0.3, "Elder Stheno the Snake Queen"),
                            new Wander(0.3)
                            ),
                        new Shoot(10, coolDown: new Cooldown(750, 250))
                        ),
                    new State("Despawn",
                        new Suicide()
                        )
                    )
            )
            .Init("Elder Stheno Pet",
                new State(
                    new State("Protect",
                        new Shoot(25, coolDown: 1000),
                        new State("Protect",
                            new EntityNotExistsTransition("Elder Stheno the Snake Queen", 100, "Wander"),
                            new Orbit(7.5, 10, acquireRange: 50, target: "Elder Stheno the Snake Queen")
                            ),
                        new State("Wander",
                            new Prioritize(
                                new Wander(1)
                                )
                            )
                        )
                    )
            )
            ;
    }
}
