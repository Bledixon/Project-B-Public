using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Manor = () => Behav()
            .Init("Lord Ruthven",
				new State(
                    new State("default",
        	      	    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new PlayerWithinTransition(8, "basic")
                        ),
                    new State("basic", 
        	      	    new Shoot(30, projectileIndex: 0, count: 30, shootAngle: 12, predictive: 1, coolDown: 200))
        	      ),
                new KeyLoot(0, 2),
                new GoldLoot(0, 2),
                new Threshold(0.025,
                    new TierLoot(9, ItemType.Weapon, 0.1),
                    new TierLoot(4, ItemType.Ability, 0.1),
                    new TierLoot(9, ItemType.Armor, 0.1),
                    new TierLoot(3, ItemType.Ring, 0.05),
                    new TierLoot(10, ItemType.Armor, 0.05),
                    new TierLoot(10, ItemType.Weapon, 0.05),
                    new TierLoot(4, ItemType.Ring, 0.025),
                    new ItemLoot("Potion of Attack", 0.5),
                    new ItemLoot("Wine Cellar Key", 0.01),
                    new ItemLoot("Tome of Purification", 0.01),
                    new ItemLoot("Frozen ring of Endless Power", 0.005),
                    new ItemLoot("Frozen weed Armor", 0.005),
                    new ItemLoot("Frozen Blade", 0.005),
                    new ItemLoot("Helm of the Frozen Worm", 0.005),
                    new ItemLoot("Ruin +1", 0.01),
                    new ItemLoot("Supply Crate Series #1", 0.5),
                    new ItemLoot("Supply Crate Series #2", 0.33)
                    )
               );
    }
}

