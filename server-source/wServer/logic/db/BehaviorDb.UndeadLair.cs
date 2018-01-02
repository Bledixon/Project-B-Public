﻿using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ UndeadLair = () => Behav()
            .Init("Septavius the Ghost God",
                new State(
                    new State(
                        new PlayerWithinTransition(8, "transition1")
                        ),
                    new State(
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Flash(0x00FF00, 0.25, 12),
                        new Wander(0.1),
                        new HpLessTransition(0.8, "minions"),
                        new State("transition1",
                            new TimedTransition(3000, "spiral")
                            ),
                        new State("transition2",
                            new TimedTransition(3000, "ring")
                            ),
                        new State("transition3",
                            new TimedTransition(3000, "quiet")
                            ),
                        new State("transition4",
                            new TimedTransition(3000, "spawn")
                            )
                        ),
                    new State("minions",
                        new Spawn("Lair Ghost Archer", 1, 1),
                        new Spawn("Lair Ghost Knight", 1, 1),
                        new Spawn("Lair Ghost Mage", 1, 1),
                        new Spawn("Lair Ghost Rogue", 1, 1),
                        new Spawn("Lair Ghost Paladin", 1, 1),
                        new Spawn("Lair Ghost Warrior", 1, 1)
                        ),
                    new State("spiral",
                        new Shoot(10, 3, fixedAngle: 0, coolDownOffset: 0, coolDown: 1000),
                        new Shoot(10, 3, fixedAngle: 24, coolDownOffset: 200, coolDown: 1000),
                        new Shoot(10, 3, fixedAngle: 48, coolDownOffset: 400, coolDown: 1000),
                        new Shoot(10, 3, fixedAngle: 72, coolDownOffset: 600, coolDown: 1000),
                        new Shoot(10, 3, fixedAngle: 96, coolDownOffset: 800, coolDown: 1000),
                        new TimedTransition(10000, "transition2")
                        ),
                    new State("ring",
                        new Wander(0.1),
                        new Shoot(10, 12, projectileIndex: 4, coolDown: 2000),
                        new TimedTransition(10000, "transition3")
                        ),
                    new State("quiet",
                        new Wander(0.1),
                        new Shoot(10, 8, projectileIndex: 1, coolDown: 1000),
                        new Shoot(10, 8, projectileIndex: 1, coolDownOffset: 500, angleOffset: 22.5, coolDown: 1000),
                        new Shoot(8, 3, shootAngle: 20, projectileIndex: 2, coolDown: 2000),
                        new TimedTransition(10000, "transition4")
                        ),
                    new State("spawn",
                        new Wander(0.1),
                        new Spawn("Ghost Mage of Septavius", 2, 2),
                        new Spawn("Ghost Rogue of Septavius", 2, 2),
                        new Spawn("Ghost Warrior of Septavius", 2, 2),
                        new Reproduce("Ghost Mage of Septavius", densityMax: 2, coolDown: 1000, spawnRadius: 0.5),
                        new Reproduce("Ghost Rogue of Septavius", densityMax: 2, coolDown: 1000, spawnRadius: 0.5),
                        new Reproduce("Ghost Warrior of Septavius", densityMax: 2, coolDown: 1000, spawnRadius: 0.5),
                        new Shoot(8, 3, shootAngle: 10, projectileIndex: 1, coolDown: 1000),
                        new TimedTransition(10000, "transition1")
                        )
                    ),
                new KeyLoot(0, 2),
                new Threshold(0.000025,
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1),
                    new TierLoot(3, ItemType.Ring, 0.05),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(4, ItemType.Ability, 0.05),
                    new TierLoot(4, ItemType.Ring, 0.025),
                    new ItemLoot("Potion of Wisdom", 1),
                    new ItemLoot("Wine Cellar Incantation", 0.01),
                    new ItemLoot("Kitten Shield", 0.005),
                    new ItemLoot("Doom Bow", 0.01),
                    new ItemLoot("Ruin +2", 0.01),
                    new ItemLoot("Bow of the Morning Star", 0.005),
                    new ItemLoot("Supply Crate Series #1", 0.01)
                    )
            )
            .Init("Ghost Mage of Septavius",
                new State(
                    new Prioritize(
                        new Protect(0.625, "Septavius the Ghost God", protectionRange: 6),
                        new Follow(0.75, range: 7)
                        ),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Ghost Rogue of Septavius",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Ghost Warrior of Septavius",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Lair Ghost Archer",
                new State(
                    new Prioritize(
                        new Protect(0.625, "Septavius the Ghost God", protectionRange: 6),
                        new Follow(0.75, range: 7)
                        ),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Lair Ghost Knight",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Lair Ghost Mage",
                new State(
                    new Prioritize(
                        new Protect(0.625, "Septavius the Ghost God", protectionRange: 6),
                        new Follow(0.75, range: 7)
                        ),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Lair Ghost Paladin",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000),
                    new Heal(5, "Lair Ghosts", 5000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Lair Ghost Rogue",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Lair Ghost Warrior",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )

            .Init("Lair Skeleton",
                new State(
                    new Shoot(6),
                    new Prioritize(
                        new Follow(1, range: 1),
                        new Wander(0.4)
                        )
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Skeleton King",
                new State(
                    new Shoot(10, 3, shootAngle: 10),
                    new Prioritize(
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        )
                    ),
                new TierLoot(5, ItemType.Armor, 0.2),
                new Threshold(0.5,
                    new TierLoot(6, ItemType.Weapon, 0.2),
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(6, ItemType.Armor, 0.1),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(3, ItemType.Ring, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1)
                    )
            )
            .Init("Lair Skeleton Mage",
                new State(
                    new Shoot(10),
                    new Prioritize(
                        new Follow(1, range: 7),
                        new Wander(0.4)
                        )
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Skeleton Swordsman",
                new State(
                    new Shoot(5),
                    new Prioritize(
                        new Follow(1, range: 1),
                        new Wander(0.4)
                        )
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Skeleton Veteran",
                new State(
                    new Shoot(5),
                    new Prioritize(
                        new Follow(1, range: 1),
                        new Wander(0.4)
                        )
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Mummy",
                new State(
                    new Shoot(10),
                    new Prioritize(
                        new Follow(0.9, range: 7),
                        new Wander(0.4)
                        )
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Mummy King",
                new State(
                    new Shoot(10),
                    new Prioritize(
                        new Follow(0.9, range: 7),
                        new Wander(0.4)
                        )
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Mummy Pharaoh",
                new State(
                    new Shoot(10),
                    new Prioritize(
                        new Follow(0.9, range: 7),
                        new Wander(0.4)
                        )
                    ),
                new TierLoot(5, ItemType.Armor, 0.2),
                new Threshold(0.5,
                    new TierLoot(6, ItemType.Weapon, 0.2),
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(6, ItemType.Armor, 0.1),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(3, ItemType.Ring, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1)
                    )
            )

            .Init("Lair Big Brown Slime",
                new State(
                    new Shoot(10, 3, shootAngle: 10, coolDown: 500),
                    new Wander(0.1),
                    new SpawnOnDeath("Lair Little Brown Slime", 1.0, 6)
                    )
            )
            .Init("Lair Little Brown Slime",
                new State(
                    new Shoot(10, 3, shootAngle: 10, coolDown: 500),
                    new Protect(0.1, "Lair Big Brown Slime", acquireRange: 5, protectionRange: 2),
                    new Wander(0.1)
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Big Black Slime",
                new State(
                    new Shoot(10, coolDown: 1000),
                    new Wander(0.1),
                    new SpawnOnDeath("Lair Medium Black Slime", 1.0, 4)
                    )
            )
            .Init("Lair Medium Black Slime",
                new State(
                    new Shoot(10, coolDown: 1000),
                    new Wander(0.1),
                    new SpawnOnDeath("Lair Little Black Slime", 1.0, 4)
                    )
            )
            .Init("Lair Little Black Slime",
                new State(
                    new Shoot(10, coolDown: 1000),
                    new Wander(0.1)
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )

            .Init("Lair Construct Giant",
                new State(
                    new Prioritize(
                        new Follow(0.8, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(10, 3, shootAngle: 20, coolDown: 1000),
                    new Shoot(10, projectileIndex: 1, coolDown: 1000)
                    ),
                new TierLoot(5, ItemType.Armor, 0.2),
                new Threshold(0.5,
                    new TierLoot(6, ItemType.Weapon, 0.2),
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(6, ItemType.Armor, 0.1),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(3, ItemType.Ring, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1)
                    )
            )
            .Init("Lair Construct Titan",
                new State(
                    new Prioritize(
                        new Follow(0.8, range: 7),
                        new Wander(0.4)
                        ),
                    new Shoot(10, 3, shootAngle: 20, coolDown: 1000),
                    new Shoot(10, 3, shootAngle: 20, projectileIndex: 1, coolDownOffset: 100, coolDown: 2000)
                    ),
                new TierLoot(5, ItemType.Armor, 0.2),
                new Threshold(0.5,
                    new TierLoot(6, ItemType.Weapon, 0.2),
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(6, ItemType.Armor, 0.1),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(3, ItemType.Ring, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1)
                    )
            )

            .Init("Lair Brown Bat",
                new State(
                    new Wander(0.1),
                    new Charge(3, 8, 2000),
                    new Shoot(3, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Ghost Bat",
                new State(
                    new Wander(0.1),
                    new Charge(3, 8, 2000),
                    new Shoot(3, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )

            .Init("Lair Reaper",
                new State(
                    new Shoot(3),
                    new Follow(1.3, range: 1),
                    new Wander(0.1)
                    ),
                new TierLoot(5, ItemType.Armor, 0.2),
                new Threshold(0.5,
                    new TierLoot(6, ItemType.Weapon, 0.2),
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(6, ItemType.Armor, 0.1),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(3, ItemType.Ring, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1)
                    )
            )
            .Init("Lair Vampire",
                new State(
                    new Shoot(10, coolDown: 500),
                    new Shoot(3, coolDown: 1000),
                    new Follow(1.3, range: 1),
                    new Wander(0.1)
                    ),
                new ItemLoot("Health Potion", 0.05),
                new ItemLoot("Magic Potion", 0.05)
            )
            .Init("Lair Vampire King",
                new State(
                    new Shoot(10, coolDown: 500),
                    new Shoot(3, coolDown: 1000),
                    new Follow(1.3, range: 1),
                    new Wander(0.1)
                    ),
                new TierLoot(5, ItemType.Armor, 0.2),
                new Threshold(0.5,
                    new TierLoot(6, ItemType.Weapon, 0.2),
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(6, ItemType.Armor, 0.1),
                    new TierLoot(7, ItemType.Armor, 0.05),
                    new TierLoot(3, ItemType.Ring, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1)
                    )
            )

            .Init("Lair Grey Spectre",
                new State(
                    new Wander(0.1),
                    new Shoot(10, coolDown: 1000),
                    new Grenade(2.5, 50, 8, coolDown: 1000)
                    )
            )
            .Init("Lair Blue Spectre",
                new State(
                    new Wander(0.1),
                    new Shoot(10, coolDown: 1000),
                    new Grenade(2.5, 70, 8, coolDown: 1000)
                    )
            )
            .Init("Lair White Spectre",
                new State(
                    new Wander(0.1),
                    new Shoot(10, coolDown: 1000),
                    new Grenade(2.5, 90, 8, coolDown: 1000)
                    ),
                new Threshold(0.5,
                    new TierLoot(4, ItemType.Ability, 0.15)
                    )
            )
            ;
    }
}
