using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ ElderAbyss = () => Behav()
            .Init("Elder Archdemon Malphas",
                new State(
                    new State("default",
                        new PlayerWithinTransition(8, "basic")
                        ),
                    new State("basic",
                        new Prioritize(
                            new Follow(0.3),
                            new Wander(0.2)
                            ),
                        new Reproduce("Elder Malphas Missile", densityMax: 1, coolDown: 1000, spawnRadius: 1),
                        new Shoot(10, predictive: 1, coolDown: 800),
                        new TimedTransition(10000, "shrink")
                        ),
                    new State("shrink",
                        new Wander(0.4),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new ChangeSize(-15, 25),
                        new TimedTransition(1000, "smallAttack")
                        ),
                    new State("smallAttack",
                        new Prioritize(
                            new Follow(1, acquireRange: 15, range: 8),
                            new Wander(1)
                            ),
                        new Shoot(10, predictive: 1, coolDown: 750),
                        new Shoot(10, 6, projectileIndex: 1, predictive: 1, coolDown: 1000),
                        new TimedTransition(10000, "grow")
                        ),
                    new State("grow",
                        new Wander(0.1),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new ChangeSize(35, 200),
                        new TimedTransition(1050, "bigAttack")
                        ),
                    new State("bigAttack",
                        new Prioritize(
                            new Follow(0.2),
                            new Wander(0.1)
                            ),
                        new Shoot(10, projectileIndex: 2, predictive: 1, coolDown: 2000),
                        new Shoot(10, projectileIndex: 2, predictive: 1, coolDownOffset: 300, coolDown: 2000),
                        new Shoot(10, 3, projectileIndex: 3, predictive: 1, coolDownOffset: 100, coolDown: 2000),
                        new Shoot(10, 3, projectileIndex: 3, predictive: 1, coolDownOffset: 400, coolDown: 2000),
                        new TimedTransition(10000, "normalize")
                        ),
                    new State("normalize",
                        new Wander(0.3),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new ChangeSize(-20, 100),
                        new TimedTransition(1000, "basic")
                        )
                    ),
                new GoldLoot(0, 2),
                new KeyLoot(0, 2),
                new Threshold(0.0001,
                    new TierLoot(9, ItemType.Weapon, 0.1),
                    new TierLoot(4, ItemType.Ability, 0.1),
                    new TierLoot(9, ItemType.Armor, 0.1),
                    new TierLoot(3, ItemType.Ring, 0.05),
                    new TierLoot(10, ItemType.Armor, 0.05),
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(4, ItemType.Ring, 0.025),
                    new ItemLoot("Potion of Vitality", 1),
                    new ItemLoot("Potion of Defense", 0.9),
                    new ItemLoot("Potion of Vitality", 1),
                    new ItemLoot("Potion of Defense", 0.9),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Ruin +3", 0.01),
                    new ItemLoot("Blue Steel Karambit", 0.005),
                    new ItemLoot("Bow of Heavens", 0.005),
                    new ItemLoot("Staff of the Old Kingdom", 0.002),
                    new ItemLoot("Supply Crate Series #1", 0.2),
                    new ItemLoot("Supply Crate Series #2", 0.1),
                    new ItemLoot("Halloween Crate", 0.01)
                    )
            )
            .Init("Elder Malphas Missile",
                new State(
                    new State(
                        new Prioritize(
                            new Follow(0.4, range: 4),
                            new Wander(0.5)
                            ),
                        new HpLessTransition(0.5, "die"),
                        new TimedTransition(2000, "die")
                        ),
                    new State("die",
                        new Flash(0xFFFFFF, 0.2, 5),
                        new TimedTransition(1000, "explode")
                        ),
                    new State("explode",
                        new Shoot(10, 8),
                        new Decay(100)
                        )
                    )
            )
            ;
    }
}
