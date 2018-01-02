using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Test = () => Behav()
             .Init("Mysterious Head",
                new State(
        	      	new State("begin",
                      new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                      new EntityNotExistsTransition("Mysterious Hand", 200, "activate")
                     ),
        	        new State("activate",
                        new TimedTransition(500, "rage")
                        ),
                    new State("rage",
                        new Follow(0.7, acquireRange: 20, range: 4),
                        new Shoot(10, 17, coolDown: 750),
                        new Shoot(10, 10, 20, 1, coolDown: 750),
                        new TimedTransition(1000, "one more time")
                        ),
        	      	new State("one more time",
        	      	    new Spawn("Mysterious Hand", 2, coolDown: 3000),
        	      	    new TimedTransition(3000, "begin")
                   	   )
        	      ),
                  new KeyLoot(0, 2),
                  new Threshold(0.0001,
                    new ItemLoot("Potion of Life", 0.90),
                    new ItemLoot("Potion of Mana", 0.90),
                    new ItemLoot("Gladiator Armor", 0.005),
                    new ItemLoot("Rainbow Sword", 0.005),
                    new ItemLoot("...", 0.005),
                    new ItemLoot("The Forgotten Crown", 0.005)
                    )
            )
            .Init("Mysterious Hand",
                new State(
                    new State("default",
                        new ConditionalEffect(ConditionEffectIndex.Invincible),
                        new TimedTransition(1000, "attack1")
                        ),
                    new State("attack1",
                        new Shoot(20, 15, coolDown: 1000),
                        new Prioritize(
                            new StayCloseToSpawn(0.8, range: 10),
                            new Follow(0.8, acquireRange: 20, range: 3, duration: 2000, coolDown: 4000),
                            new Wander(0.8)
                            )
                        ),
                    new State("rage",
                        new Shoot(20, 15, coolDown: 750),
                        new Prioritize(
                            new Follow(1.2, acquireRange: 20, range: 1, duration: 5000, coolDown: 4000),
                            new Wander(0.8)
                            )
                        )
                    ),
        	      new Threshold(0.0001,
                    new ItemLoot("Spirit Sword", 0.001)
                    )
            )
            ;
    }
}