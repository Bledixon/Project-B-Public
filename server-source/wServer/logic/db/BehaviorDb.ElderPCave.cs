using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        static Threshold EPCSoloLoot =
            new Threshold(1,
                new ItemLoot("100 Gold", 1),
                new ItemLoot("500 Gold", 0.10),
                new ItemLoot("500 Gold", 0.01),
                new ItemLoot("500 Gold", 0.001)
                );
        static Threshold EPCLoot =
            new Threshold(0.0001,
                    new TierLoot(13, ItemType.Weapon, 0.1),
                    new TierLoot(6, ItemType.Ability, 0.1),
                    new TierLoot(14, ItemType.Armor, 0.1),
                    new TierLoot(5, ItemType.Ring, 0.1),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Richard's Harpoon", 0.0015),
                    new ItemLoot("Doubloon", 0.002),
                    new ItemLoot("Richard's Coat", 0.002),
                    new ItemLoot("Richard's Eyepatch", 0.002),
                    new ItemLoot("Ruin +4", 0.0025),
                    new ItemLoot("Supply Crate Series #2", 0.9),
                    new ItemLoot("Supply Crate Series #2", 0.8),
                    new ItemLoot("Supply Crate Series #2", 0.7),
                    new ItemLoot("Supply Crate Series #2", 0.6)
                );

        private _ ElderPCave = () => Behav()
            .Init("Richard_epc",
                new State(
                    new State(
                        new PlayerWithinTransition(8, "start")
                        ),
                    new State("start",
                          new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                          new Taunt("You want me treasure..?"),
                          new TimedTransition(2500, "start2")
                        ),
                    new State("start2",
                          new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                          new Taunt("har..har..har.. Die."),
                          new TimedTransition(2500, "attack")
                        ),
                    new State("attack",
                        new Wander(0.1),
                        new Shoot(30, projectileIndex: 0, count: 8, shootAngle: 45, predictive: 1, coolDown: 800),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 500),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 1000),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 1500),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 2000),
                        new HpLessTransition(0.75, "Canons")
                        ),
                    new State("Canons",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new ReturnToSpawn(speed: 1),
                        new Taunt("Cannons, attack! har.. har.. har.."),
                        new TimedTransition(1000, "canonattack")
                        ),
                    new State("canonattack",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Order(30, "Cannon_epc", "attack"),
                        new TimedTransition(15000, "Back")
                        ),
                    new State("Back",
                        new Order(30, "Cannon_epc", "idle"),
                        new Taunt("Ayy.. I'll crusheth thy corpse.. feeleth mine own Vortex gun!"),
                        new Wander(0.2),
                        new Shoot(30, projectileIndex: 0, count: 8, shootAngle: 45, predictive: 1, coolDown: 800),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 1000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 2000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 3000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 4000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 5000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 6000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 7000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 8000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 9000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 10000),
                        new HpLessTransition(0.25, "rage")
                        ),
                    new State("rage",
                        new Taunt("Enow, beest gone"),
                        new Wander(0.4),
                        new Shoot(30, projectileIndex: 0, count: 8, shootAngle: 45, predictive: 1, coolDown: 800),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 500),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 1000),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 1500),
                        new Shoot(30, projectileIndex: 1, count: 1, predictive: 1, coolDown: 2000, coolDownOffset: 2000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 1000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 2000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 3000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 4000),
                        new Shoot(30, projectileIndex: 2, count: 1, predictive: 0.3, coolDown: 2000, coolDownOffset: 5000)
                        )
                  ),
                new GoldLoot(50, 150),
                new KeyLoot(0, 2),
                  EPCSoloLoot,
                  EPCLoot
            )
            .Init("Cannon_epc",
                new State(
                    new State("idle",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable)
                        ),
                    new State("attack",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(30, projectileIndex: 0, count: 1, predictive: 30, coolDown: 300)
                        )
                    )
            )
           .Init("Elder Cave Pirate Sailor",
                new State(
                    new Prioritize(
                        new Follow(0.5, acquireRange: 6, range: 1),
                        new Wander(0.25)
                    ),
                    new Shoot(10, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.05)
            )
            .Init("Elder Pirate Commander",
                new State(
                    new Prioritize(
                        new Wander(0.25)
                    ),
                    new Shoot(10, coolDown: 1500)
                    ),
                new TierLoot(2, ItemType.Weapon, 0.2),
                new TierLoot(3, ItemType.Weapon, 0.1),
                new TierLoot(1, ItemType.Armor, 0.2),
                new TierLoot(1, ItemType.Ring, 0.1),
                new Threshold(0.5,
                    new ItemLoot("Pirate Rum", 0.02)
                    )
            )
            .Init("Elder Pirate Captain",
                new State(
                    new Prioritize(
                        new Wander(0.25)
                    ),
                    new Shoot(10, coolDown: 1500)
                    ),
                new TierLoot(2, ItemType.Weapon, 0.2),
                new TierLoot(3, ItemType.Weapon, 0.1),
                new TierLoot(1, ItemType.Armor, 0.2),
                new TierLoot(1, ItemType.Ring, 0.1),
                new Threshold(0.5,
                    new ItemLoot("Pirate Rum", 0.02)
                    )
            )
            .Init("Elder Pirate Admiral",
                new State(
                    new Prioritize(
                        new Wander(0.25)
                    ),
                    new Shoot(10, coolDown: 1500)
                    ),
                new TierLoot(2, ItemType.Weapon, 0.2),
                new TierLoot(3, ItemType.Weapon, 0.1),
                new TierLoot(1, ItemType.Armor, 0.2),
                new TierLoot(1, ItemType.Ring, 0.1),
                new Threshold(0.5,
                    new ItemLoot("Pirate Rum", 0.02)
                    )
            )
        ;
    }
}
