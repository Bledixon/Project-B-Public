using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ ElderUndeadLair = () => Behav()
            .Init("Elder Septavius the Ghost God",
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
                        new Spawn("Elder Ghost Mage of Septavius", 2, 2),
                        new Spawn("Elder Ghost Rogue of Septavius", 2, 2),
                        new Spawn("Elder Ghost Warrior of Septavius", 2, 2),
                        new Reproduce("Elder Ghost Mage of Septavius", densityMax: 2, coolDown: 1000, spawnRadius: 0.5),
                        new Reproduce("Elder Ghost Rogue of Septavius", densityMax: 2, coolDown: 1000, spawnRadius: 0.5),
                        new Reproduce("Elder Ghost Warrior of Septavius", densityMax: 2, coolDown: 1000, spawnRadius: 0.5),
                        new Shoot(8, 3, shootAngle: 10, projectileIndex: 1, coolDown: 1000),
                        new TimedTransition(10000, "transition1")
                        )
                    ),
                new KeyLoot(0, 2),
                new Threshold(0.0001,
                    new TierLoot(7, ItemType.Weapon, 0.1),
                    new TierLoot(3, ItemType.Ability, 0.1),
                    new TierLoot(3, ItemType.Ring, 0.05),
                    new TierLoot(8, ItemType.Weapon, 0.05),
                    new TierLoot(4, ItemType.Ability, 0.05),
                    new TierLoot(4, ItemType.Ring, 0.025),
                    new ItemLoot("Potion of Wisdom", 1),
                    new ItemLoot("Potion of Wisdom", 1),
                    new ItemLoot("Wine Cellar Incantation", 0.01),
                    new ItemLoot("Staff of Ghostly Knowledge", 0.005),
                    new ItemLoot("Skull of The Graveyard", 0.005),
                    new ItemLoot("Robe of the Fallen Wizard", 0.005),
                    new ItemLoot("Ring of the Thousand Skulls", 0.005),
                    new ItemLoot("Ruin +3", 0.01),
                    new ItemLoot("Supply Crate Series #1", 0.01),
                    new ItemLoot("Halloween Crate", 0.01)
                    )
            )
            .Init("Elder Ghost Mage of Septavius",
                new State(
                    new Prioritize(
                        new Protect(0.625, "Elder Septavius the Ghost God", protectionRange: 6),
                        new Follow(0.75, range: 7)
                        ),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Elder Ghost Rogue of Septavius",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            .Init("Elder Ghost Warrior of Septavius",
                new State(
                    new Follow(0.75, range: 1),
                    new Wander(0.25),
                    new Shoot(8, 1, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.25),
                new ItemLoot("Magic Potion", 0.25)
            )
            ;
    }
}
