using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ PirateCave = () => Behav()
            .Init("Dreadstump the Pirate King",
				new State(
                    new State("default",
						new Wander(0.2),
						new HpLessTransition(1.0, "waking")
                        ),
					new State("waking",
                        new Taunt("Hah! I'll drink my rum out of your skull!"),
						new Wander(0.2),
						new TimedTransition(2000, "attack")
                        ),
					new State("attack",
						new Taunt("Arr..."),
						new Wander(0.2),
						new Shoot(10, coolDown: 250),
						new Shoot(10, projectileIndex: 1, coolDownOffset: 2501, coolDown: 2500),
						new TimedTransition(10000, "cannonball")
                        ),
					new State("cannonball",
						new Taunt("Eat cannonballs!"),
						new Shoot(10, projectileIndex: 1, coolDownOffset: 2000, coolDown: 5000),
                        new Shoot(10, projectileIndex: 1, coolDownOffset: 2200, coolDown: 5000),
                        new Shoot(10, projectileIndex: 1, coolDownOffset: 2400, coolDown: 5000),
						new TimedTransition(3000, "attack")
                        )
                    ),
				new TierLoot(2, ItemType.Weapon, 0.5),
				new TierLoot(3, ItemType.Weapon, 0.33),
				new TierLoot(2, ItemType.Armor, 0.5),
				new TierLoot(3, ItemType.Armor, 0.33)
			)
			.Init("Pirate Lieutenant",
				new State(
					new Prioritize(
						new Protect(0.5, "Dreadstump the Pirate King", protectionRange: 6),
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
            .Init("Pirate Commander",
                new State(
                    new Prioritize(
                        new Protect(0.5, "Dreadstump the Pirate King", protectionRange: 6),
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
            .Init("Pirate Captain",
                new State(
                    new Prioritize(
                        new Protect(0.5, "Dreadstump the Pirate King", protectionRange: 6),
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
            .Init("Pirate Admiral",
                new State(
                    new Prioritize(
                        new Protect(0.5, "Dreadstump the Pirate King", protectionRange: 6),
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
            .Init("Cave Pirate Brawler",
                new State(
                    new Prioritize(
						new Follow(0.5, acquireRange: 6, range: 1),
                        new Wander(0.25)
                    ),
                    new Shoot(10, coolDown: 1000)
                    ),
				new ItemLoot("Health Potion", 0.05)
            )
            .Init("Cave Pirate Sailor",
                new State(
                    new Prioritize(
                        new Follow(0.5, acquireRange: 6, range: 1),
                        new Wander(0.25)
                    ),
                    new Shoot(10, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.05)
            )
            .Init("Cave Pirate Veteran",
                new State(
                    new Prioritize(
                        new Follow(0.5, acquireRange: 6, range: 1),
                        new Wander(0.25)
                    ),
                    new Shoot(10, coolDown: 1000)
                    ),
                new ItemLoot("Health Potion", 0.05)
            )
			.Init("Cave Pirate Cabin Boy",
				new State(
					new Wander(0.25)
                    ),
				new TierLoot(1, ItemType.Weapon, 0.1)
            )
            .Init("Cave Pirate Hunchback",
                new State(
                    new Wander(0.25)
                    ),
                new TierLoot(1, ItemType.Ability, 0.1)
            )
            .Init("Cave Pirate Macaw",
                new State(
                    new Wander(0.25)
                    ),
                new TierLoot(1, ItemType.Ability, 0.1)
            )
            .Init("Cave Pirate Moll",
                new State(
                    new Wander(0.25)
                    ),
                new TierLoot(1, ItemType.Ability, 0.1)
            )
            .Init("Cave Pirate Monkey",
                new State(
                    new Wander(0.25)
                    ),
                new TierLoot(1, ItemType.Ability, 0.1)
            )
            .Init("Cave Pirate Parrot",
                new State(
                    new Wander(0.25)
                    ),
                new TierLoot(1, ItemType.Ability, 0.1)
            )
            ;
    }
}
