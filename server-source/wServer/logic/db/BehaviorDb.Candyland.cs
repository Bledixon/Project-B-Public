using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        static Threshold Candyloot =
            new Threshold(0.0001,
                    new TierLoot(9, ItemType.Weapon, 0.1),
                    new TierLoot(4, ItemType.Ability, 0.1),
                    new TierLoot(9, ItemType.Armor, 0.1),
                    new TierLoot(3, ItemType.Ring, 0.05),
                    new TierLoot(10, ItemType.Armor, 0.05),
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(4, ItemType.Ring, 0.025),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Fairy Claw", 0.005),
                    new ItemLoot("Fairy Cloak", 0.005),
                    new ItemLoot("Fairy Hide Armor", 0.005),
                    new ItemLoot("Fairy Charm", 0.005),
                    new ItemLoot("Pixie-Enchanted Sword", 0.005),
                    new ItemLoot("Ruin +1", 0.01),
                    new ItemLoot("Supply Crate Series #1", 0.33)
                );

        private _ Candyland = () => Behav()
            .Init("Gigacorn",
                new State(
                    new State("basic",
                          new Wander(0.1),
                          new Shoot(30, projectileIndex: 0, count: 1, predictive: 1, coolDown: 200)),
                          new TimedTransition(2500, "attack"),
                    new State("attack",
                        new Follow(2.0),
                        new Shoot(30, projectileIndex: 1, count: 3, shootAngle: 10, predictive: 1, coolDown: 500),
                        new TimedTransition(2500, "shotgun")
                        ),
                    new State("shotgun",
                        new Follow(2.0),
                        new Shoot(30, projectileIndex: 0, count: 1, predictive: 1, coolDown: 50),
                        new TimedTransition(2500, "basic")
                        )
                  ),
                  Candyloot
            )
        .Init("Spoiled Creampuff",
                new State(
                    new State("basic2",
                          new Wander(0.1),
                          new TimedTransition(500, "attack2"),
                    new State("attack2",
                        new Follow(2.0),
                        new Shoot(30, projectileIndex: 0, count: 5, predictive: 1, coolDown: 200)),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 100)
                        )
                  ),
                Candyloot
            )
        .Init("Megarototo",
                new State(
                    new State("basic3",
                          new Wander(0.1),
                          new Shoot(30, projectileIndex: 0, count: 4, shootAngle: 90, predictive: 1, coolDown: 10),
                          new Shoot(30, projectileIndex: 3, count: 4, shootAngle: 90, angleOffset: 45, predictive: 1, coolDown: 10),
                          new TimedTransition(5000, "attack3")
                        ),
                    new State("attack3",
                        new Follow(2.0),
                        new Shoot(30, projectileIndex: 2, count: 2, shootAngle: 10, predictive: 1, coolDown: 10),
                        new Shoot(30, projectileIndex: 3, count: 1, predictive: 1, coolDown: 10)
                        )
                  ),
                Candyloot
            )
        .Init("n Candyland Spawner",
                  new State(
                    new State("Gigacorn",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Gigacorn", 1, coolDown: 5000),

                        new TimedTransition(12000, "Gigacorn Check")
                        ),
                    new State("Gigacorn Check",
                        new EntityNotExistsTransition("Gigacorn", 5000, "Megarototo")
                        ),
                      new State("Megarototo",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Megarototo", 1, coolDown: 5000),

                        new TimedTransition(12000, "Megarototo Check")
                        ),
                      new State("Megarototo Check",
                        new EntityNotExistsTransition("Megarototo", 5000, "Spoiled Creampuff")
                        ),
                      new State("Spoiled Creampuff",
                    new ConditionalEffect(ConditionEffectIndex.Invincible),

                    new Spawn("Spoiled Creampuff", 1, coolDown: 5000),

                        new TimedTransition(12000, "Spoiled Creampuff Check")
                        ),
                      new State("Spoiled Creampuff Check",
                        new EntityNotExistsTransition("Spoiled Creampuff", 5000, "Gigacorn")
                        )
                      )
            );
     }
}
