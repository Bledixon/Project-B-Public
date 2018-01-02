using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Wasps = () => Behav()
            .Init("Mellow the Wasp Queen",
                new State(
                    new State("default",
                        new PlayerWithinTransition(8, "basic")
                        ),
                    new State("basic",
                        new Prioritize(
                            new Follow(2),
                            new Wander(0.2)
                        ),
                        new Reproduce("Mellow's Worker Wasp", densityMax: 3, coolDown: 1000, spawnRadius: 1),
                        new Shoot(10, projectileIndex: 0, predictive: 1, count: 6, coolDown: 200),
                        new TimedTransition(10000, "shrink")
                        ),
                    new State("shrink",
                        new Shoot(10, projectileIndex: 1, predictive: 1, count: 5, coolDown: 500, shootAngle: 72),
                        new ConditionalEffect(ConditionEffectIndex.Armored),
                        new TimedTransition(1000, "smallAttack")
                        ),
                    new State("smallAttack",
                        new Prioritize(
                            new Follow(1, acquireRange: 15, range: 8),
                            new Wander(1)
                        ),
                        new Shoot(10, projectileIndex: 0, predictive: 1, coolDown: 100),
                        new Shoot(10, 6, projectileIndex: 1, predictive: 1, coolDown: 200),
                        new TimedTransition(10000, "grow")
                        ),
                    new State("grow",
                        new Wander(0.1),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TimedTransition(1050, "bigAttack")
                        ),
                    new State("bigAttack",
                        new Prioritize(
                            new Follow(0.2),
                            new Wander(0.1)
                        ),
                        new Shoot(10, projectileIndex: 2, predictive: 1, coolDown: 500),
                        new Shoot(10, projectileIndex: 2, predictive: 1, coolDownOffset: 300, coolDown: 500),
                        new Shoot(10, 3, projectileIndex: 0, predictive: 1, coolDownOffset: 100, coolDown: 500),
                        new Shoot(10, 3, projectileIndex: 0, predictive: 1, coolDownOffset: 400, coolDown: 500),
                        new TimedTransition(10000, "normalize")
                        ),
                    new State("normalize",
                        new Wander(0.3),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new TimedTransition(1000, "basic")
                        )
                    ),
                new GoldLoot(0, 50),
                new KeyLoot(0, 2),
                new Threshold(0.000025,
                    new TierLoot(13, ItemType.Weapon, 0.1),
                    new TierLoot(6, ItemType.Ability, 0.1),
                    new TierLoot(12, ItemType.Armor, 0.1),
                    new TierLoot(5, ItemType.Ring, 0.05),
                    new TierLoot(13, ItemType.Armor, 0.05),
                    new TierLoot(14, ItemType.Weapon, 0.05),
                    new TierLoot(4, ItemType.Ring, 0.025),
                    new ItemLoot("Potion of Vitality", 1),
                    new ItemLoot("Potion of Wisdom", 1),
                    new ItemLoot("Potion of Defense", 1),
                    new ItemLoot("Potion of Defense", 0.8),
                    new ItemLoot("Potion of Life", 0.8),
                    new ItemLoot("Potion of Mana", 0.8),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Molten Kings Armor", 0.005),
                    new ItemLoot("Cursed Flame", 0.005),
                    new ItemLoot("{/REMOVED}", 0.005),
                    new ItemLoot("Poseidon's Wrath", 0.005),
                    new ItemLoot("Ancient Spell: Pierce", 0.005),
                    new ItemLoot("Pet Ruin 1", 0.005),
                    new ItemLoot("Ruin +4", 0.0025)
                    )
            )
        .Init("Mellow's Worker Wasp",
                new State(
                    new Prioritize(
                        new Follow(1, 8, 5),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 2, shootAngle: 10, coolDown: 1000)
                    ),
                
                new Threshold(0.5,
                    new ItemLoot("Potion of Attack", 0.01)
                    )
            )
        .Init("Mellow's Warrior Wasp",
                new State(
                    new Prioritize(
                        new Follow(1, 8, 5),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 2, shootAngle: 10, coolDown: 200)
                    ),
                new Threshold(0.5,
                    new ItemLoot("Potion of Attack", 0.01)
                    )
            )
        .Init("Mellow's Servant Wasp",
                new State(
                    new Prioritize(
                        new Follow(1, 8, 5),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 2, shootAngle: 10, coolDown: 500)
                    ),
                new Threshold(0.5,
                    new ItemLoot("Potion of Attack", 0.01)
                    )
            )
        ;
        }
}
