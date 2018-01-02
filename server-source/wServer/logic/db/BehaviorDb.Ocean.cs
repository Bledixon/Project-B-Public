using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Ocean = () => Behav()
            .Init("Thessal the Mermaid Goddess",
        	      new State(
                    new SpawnOnDeath("Glowing Realm Portal", 1),
                    new State("default",
                        new PlayerWithinTransition(8, "basic")
                        ),
                    new State("basic",
                        new Shoot(10, count: 4, shootAngle: (float)30, angleOffset: (float)45, projectileIndex: 0, coolDown: 1700),

                        new Shoot(10, count: 8, shootAngle: (float)30, angleOffset: (float)45, projectileIndex: 3, coolDown: 2700),

                        new Shoot(10, count: 12, shootAngle: (float)30, angleOffset: (float)45, projectileIndex: 1, coolDown: 3700),

                        new Shoot(10, count: 16, shootAngle: (float)30, angleOffset: (float)45, projectileIndex: 2, coolDown: 4700)
                        )

                    ),
                    new GoldLoot(5, 10),
                    new Threshold(0.0001,
                    new ItemLoot("Coral Bow", 0.01),
                    new ItemLoot("Quiver of the Mermaid", 0.005),
                    new ItemLoot("Ruin +2", 0.01),
                    new ItemLoot("Potion of Mana", 0.33)
                    )
        	     )
        .Init("Deep Sea Beast",
                new State(
                    new Shoot(8, 5, 10, coolDown: 1000)
                    )
            )
            .Init("Fishman",
                new State(
                    new Prioritize(
                        new Follow(1, 8, 5),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 3, shootAngle: 10, coolDown: 1000)
                    )
            )
            .Init("Sea Horse",
                new State(
                    new Prioritize(
                        new Follow(1, 8, 5),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 1, shootAngle: 10, coolDown: 1000)
                    )
            )
            .Init("Grey Sea Slurp",
                new State(
                    new Prioritize(
                        new Follow(1, 8, 5),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 3, shootAngle: 10, coolDown: 1000)
                    )
            )
        .Init("Sea Slurp Home",
                  new State(
                    new State("default",
                        new PlayerWithinTransition(4, "basic")
                        ),
                    new State("basic",
                new Reproduce("Grey Sea Slurp", densityMax: 1, spawnRadius: 1, coolDown: 1000)
                        )
                    )
            )
        .Init("Sea Mare",
                new State(
                    new Prioritize(
                        new Follow(1, 8, 5),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 3, shootAngle: 10, coolDown: 1000),

                    new Shoot(8, 2, shootAngle: 10, projectileIndex: 1, coolDown: 1000)

                    )
            )
            .Init("Ink Bubble",
                new State(
                    new Prioritize(
                        new Follow(1.5, 8, 1),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 3, shootAngle: 10, coolDown: 500)
                    )
            )
            .Init("Giant Squid",
                new State(
                    new Prioritize(

                        new Follow(1.5, 8, 1),
                        new Wander(0.25)
                        ),
                    new Shoot(8, 3, coolDown: 500)
                    )
            );
        }
}
        	      	          

