using wServer.logic.behaviors;
using wServer.logic.transitions;
using wServer.logic.loot;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        static Threshold Spookyloot =
                new Threshold(0.0001,
                    new ItemLoot("Ruin +3", 0.01),
                    new ItemLoot("Pumpkin Sword", 0.01),
                    new ItemLoot("Katana of the Pumpkin Murderer", 0.01), 
                    new ItemLoot("Pumpkin Star", 0.01),
                    new ItemLoot("Seal of Reoccurring Nightmares", 0.002),
                    new ItemLoot("Pet Ruin 1", 0.001),
                    new ItemLoot("Potion of Life", 0.8),
                    new ItemLoot("Potion of Mana", 0.8),
                    new ItemLoot("Potion of Defense", 0.8),
                    new ItemLoot("Potion of Wisdom", 0.8),
                    new ItemLoot("Potion of Attack", 0.8),
                    new ItemLoot("Potion of Defense", 0.8),
                    new ItemLoot("Potion of Wisdom", 0.8),
                    new ItemLoot("Potion of Attack", 0.8),
                    new ItemLoot("Halloween Crate", 0.2),
                    new TierLoot(11, ItemType.Weapon, 0.30),
                    new TierLoot(12, ItemType.Weapon, 0.15),
                    new TierLoot(13, ItemType.Weapon, 0.05),
                    new TierLoot(12, ItemType.Armor, 0.30),
                    new TierLoot(13, ItemType.Armor, 0.15),
                    new TierLoot(13, ItemType.Armor, 0.05),
                    new TierLoot(5, ItemType.Ability, 0.30),
                    new TierLoot(6, ItemType.Ability, 0.15),
                    new TierLoot(5, ItemType.Ring, 0.30)
                );

        static Threshold Thornloot =
                new Threshold(0.0001,
                    new ItemLoot("Ruin +4", 0.01),
                    new ItemLoot("Aqua Bona", 0.005),
                    new ItemLoot("Eyeball Katana", 0.005),
                    new ItemLoot("Princess's Sword", 0.0001),
                    new ItemLoot("Ezio's Dagger", 0.005),
                    new ItemLoot("Ezio's Cloak", 0.005),
                    new ItemLoot("Ezio's Armor", 0.005),
                    new ItemLoot("Ezio's Relict", 0.005),
                    new ItemLoot("Pet Ruin 1", 0.001),
                    new ItemLoot("Potion of Defense", 0.8),
                    new ItemLoot("Potion of Wisdom", 0.8),
                    new ItemLoot("Potion of Attack", 0.8),
                    new ItemLoot("Potion of Defense", 0.8),
                    new ItemLoot("Potion of Wisdom", 0.8),
                    new ItemLoot("Potion of Attack", 0.8),
                    new ItemLoot("Potion of Mana", 0.8),
                    new ItemLoot("Potion of Life", 0.8),
                    new ItemLoot("Halloween Crate", 0.05),
                    new TierLoot(12, ItemType.Weapon, 0.05),
                    new TierLoot(13, ItemType.Weapon, 0.01),
                    new TierLoot(13, ItemType.Armor, 0.05),
                    new TierLoot(14, ItemType.Armor, 0.01),
                    new TierLoot(5, ItemType.Ability, 0.15),
                    new TierLoot(6, ItemType.Ability, 0.1),
                    new TierLoot(5, ItemType.Ring, 0.05)
                );

        static Threshold Raidloot =
                new Threshold(0.0001,
                    new ItemLoot("Ruin +1", 0.001),
                    new ItemLoot("Pet Ruin 1", 0.0001),
                    new ItemLoot("Rainbow Sword", 0.0005),
                    new ItemLoot("Master Sword", 0.0005),
                    new ItemLoot("Etherite Dagger", 0.0005),
                    new ItemLoot("Doom Bow", 0.0005),
                    new ItemLoot("Demon Blade", 0.0005),
                    new ItemLoot("The Forgotten Crown", 0.0005),
                    new ItemLoot("Forest Bow", 0.0005),
                    new ItemLoot("Gladiator Armor", 0.0005),
                    new ItemLoot("Snowman Armor", 0.0005),
                    new ItemLoot("Slime Ball", 0.0005),
                    new ItemLoot("Octopussy", 0.0005),
                    new ItemLoot("Harlequin Armor", 0.0005),
                    new ItemLoot("Potion of Wisdom", 0.7),
                    new ItemLoot("Potion of Attack", 0.7),
                    new ItemLoot("Potion of Defense", 0.7),
                    new ItemLoot("Potion of Dexterity", 0.7),
                    new ItemLoot("Potion of Vitality", 0.7),
                    new ItemLoot("Potion of Speed", 0.7),
                    new ItemLoot("Potion of Mana", 0.1),
                    new ItemLoot("Potion of Mana", 0.05),
                    new ItemLoot("Potion of Life", 0.1),
                    new ItemLoot("Potion of Life", 0.05),
                    new ItemLoot("Halloween Crate", 0.01),
                    new TierLoot(11, ItemType.Weapon, 0.1),
                    new TierLoot(12, ItemType.Weapon, 0.05),
                    new TierLoot(13, ItemType.Weapon, 0.01),
                    new TierLoot(12, ItemType.Armor, 0.1),
                    new TierLoot(13, ItemType.Armor, 0.05),
                    new TierLoot(14, ItemType.Armor, 0.01),
                    new TierLoot(5, ItemType.Ability, 0.1),
                    new TierLoot(6, ItemType.Ability, 0.05),
                    new TierLoot(5, ItemType.Ring, 0.1)
                );

        private _ Custom = () => Behav()
            /* <-- Pumpkin Skeleton --> */
            .Init("Pumpkinius Skeletius",
                new State(
                    new State("default",
                        new HpLessTransition(0.99999, "basic")
                        ),
                    new State("basic",
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                    new Taunt("Happy Halloween, you noobs!"),
                    new TimedTransition(2000, "1")
                    ),
                    new State("1",
                       new Wander(0.2),
                       new Shoot(10, projectileIndex: 2, count: 3, predictive: 1, coolDown: 333),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 0, coolDownOffset: 0, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 36, coolDownOffset: 100, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 72, coolDownOffset: 200, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 108, coolDownOffset: 300, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 144, coolDownOffset: 400, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 180, coolDownOffset: 500, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 216, coolDownOffset: 600, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 252, coolDownOffset: 700, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 288, coolDownOffset: 800, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 324, coolDownOffset: 900, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 360, coolDownOffset: 1000, coolDown: 2000),
                       new HpLessTransition(0.8, "2")
                  ),
                    new State("2",
                       new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                       new ReturnToSpawn(speed: 1),
                       new Taunt("You can do nothing against my minions!"),
                       new TimedTransition(2500, "3")
                        ),
                    new State("3",
                       new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                       new TossObject("SPumkin Minion", 6, 90, 90000001, 100),
                       new TossObject("SPumkin Minion", 6, 180, 90000001, 100),
                       new TossObject("SPumkin Minion", 6, 270, 90000001, 100),
                       new TossObject("SPumkin Minion", 6, 360, 90000001, 100),
                       new TimedTransition(10000, "minioncheck")
                  ),
                    new State("minioncheck",
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                    new EntityNotExistsTransition("SPumkin Minion", 10, "4")
                    ),
                    new State("4",
                       new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                       new Taunt("This... this can't be.."),
                       new TimedTransition(2000, "5")
                  ),
                    new State("5",
                new Shoot(10, projectileIndex: 2, count: 4, shootAngle: 90, angleOffset: 0, predictive: 0, coolDown: 1800, coolDownOffset: 0),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 10, predictive: 0, coolDown: 1800, coolDownOffset: 200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 20, predictive: 0, coolDown: 1800, coolDownOffset: 400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 30, predictive: 0, coolDown: 1800, coolDownOffset: 600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 40, predictive: 0, coolDown: 1800, coolDownOffset: 800),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 50, predictive: 0, coolDown: 1800, coolDownOffset: 1000),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 60, predictive: 0, coolDown: 1800, coolDownOffset: 1200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 70, predictive: 0, coolDown: 1800, coolDownOffset: 1400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 80, predictive: 0, coolDown: 1800, coolDownOffset: 1600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 90, predictive: 0, coolDown: 1800, coolDownOffset: 1800),
                new Shoot(10, projectileIndex: 0, count: 6, shootAngle: 60, angleOffset: 0, predictive: 0, coolDown: 2000, coolDownOffset: 0),
                new Shoot(10, projectileIndex: 0, count: 6, shootAngle: 60, angleOffset: 45, predictive: 0, coolDown: 2000, coolDownOffset: 1000),
                new HpLessTransition(0.2, "rage")
                        ),
                    new State("rage",
                new Wander(0.2),
                new Taunt("DIE! DIE! DIE"),
                new Shoot(10, projectileIndex: 2, count: 4, shootAngle: 90, angleOffset: 0, predictive: 0, coolDown: 1800, coolDownOffset: 0),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 10, predictive: 0, coolDown: 1800, coolDownOffset: 200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 20, predictive: 0, coolDown: 1800, coolDownOffset: 400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 30, predictive: 0, coolDown: 1800, coolDownOffset: 600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 40, predictive: 0, coolDown: 1800, coolDownOffset: 800),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 50, predictive: 0, coolDown: 1800, coolDownOffset: 1000),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 60, predictive: 0, coolDown: 1800, coolDownOffset: 1200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 70, predictive: 0, coolDown: 1800, coolDownOffset: 1400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 80, predictive: 0, coolDown: 1800, coolDownOffset: 1600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 90, predictive: 0, coolDown: 1800, coolDownOffset: 1800),
                new Shoot(10, projectileIndex: 0, count: 6, shootAngle: 60, angleOffset: 0, predictive: 0, coolDown: 500, coolDownOffset: 0),
                new Shoot(10, projectileIndex: 0, count: 6, shootAngle: 60, angleOffset: 45, predictive: 0, coolDown: 500, coolDownOffset: 200)
                        )
               ),
            new GoldLoot(10, 25),
            Spookyloot
            )
        .Init("SPumkin Minion",
            new State(
                new Orbit(.2, 5, target: "Pumpkinius Skeletius", radiusVariance: 1.5),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 0, predictive: 0, coolDown: 5000, coolDownOffset: 0),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 10, predictive: 0, coolDown: 5000, coolDownOffset: 200),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 20, predictive: 0, coolDown: 5000, coolDownOffset: 400),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 30, predictive: 0, coolDown: 5000, coolDownOffset: 600),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 40, predictive: 0, coolDown: 5000, coolDownOffset: 800),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 50, predictive: 0, coolDown: 5000, coolDownOffset: 1000),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 60, predictive: 0, coolDown: 5000, coolDownOffset: 1200),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 70, predictive: 0, coolDown: 5000, coolDownOffset: 1400),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 80, predictive: 0, coolDown: 5000, coolDownOffset: 1600),
                new Shoot(10, projectileIndex: 0, count: 4, shootAngle: 90, angleOffset: 90, predictive: 0, coolDown: 5000, coolDownOffset: 1800)
                )
            )

     /* <-- Event Dragon --> */
        .Init("Thorn Dragco Nimissime",
                new State(
                    new State("default",
                        new HpLessTransition(0.99999, "basic")
                        ),
                    new State("basic",
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                    new Taunt("You have awoken me.."),
                    new TimedTransition(2000, "1")
                    ),
                    new State("1",
                       new Wander(0.2),
                       new Shoot(10, projectileIndex: 0, count: 16, shootAngle: 22.5, coolDown: 2000),
                       new Shoot(10, projectileIndex: 2, count: 3, predictive: 1, coolDown: 333),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 0, coolDownOffset: 0, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 36, coolDownOffset: 100, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 72, coolDownOffset: 200, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 108, coolDownOffset: 300, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 144, coolDownOffset: 400, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 180, coolDownOffset: 500, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 216, coolDownOffset: 600, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 252, coolDownOffset: 700, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 288, coolDownOffset: 800, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 324, coolDownOffset: 900, coolDown: 2000),
                       new Shoot(10, projectileIndex: 1, count: 4, shootAngle: 90, fixedAngle: 360, coolDownOffset: 1000, coolDown: 2000),
                       new HpLessTransition(0.8, "2")
                  ),
                    new State("2",
                       new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                       new ReturnToSpawn(speed: 1),
                       new Taunt("Knights, rescue your savior!"),
                       new TimedTransition(2500, "3")
                        ),
                    new State("3",
                       new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                       new TossObject("Thorns Knight", 6, 90, 90000001, 100),
                       new TossObject("Thorns Knight", 6, 180, 90000001, 100),
                       new TossObject("Thorns Knight", 6, 270, 90000001, 100),
                       new TossObject("Thorns Knight", 6, 360, 90000001, 100),
                       new TimedTransition(10000, "minioncheck")
                  ),
                    new State("minioncheck",
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                    new EntityNotExistsTransition("Thorns Knight", 10, "4")
                    ),
                    new State("4",
                       new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                       new Taunt("Knights.. You failed me.."),
                       new TimedTransition(2000, "5")
                  ),
                    new State("5",
                new Shoot(10, projectileIndex: 0, count: 16, shootAngle: 22.5, coolDown: 2000),
                new Shoot(10, projectileIndex: 2, count: 4, shootAngle: 90, angleOffset: 0, predictive: 0, coolDown: 1800, coolDownOffset: 0),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 10, predictive: 0, coolDown: 1800, coolDownOffset: 200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 20, predictive: 0, coolDown: 1800, coolDownOffset: 400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 30, predictive: 0, coolDown: 1800, coolDownOffset: 600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 40, predictive: 0, coolDown: 1800, coolDownOffset: 800),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 50, predictive: 0, coolDown: 1800, coolDownOffset: 1000),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 60, predictive: 0, coolDown: 1800, coolDownOffset: 1200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 70, predictive: 0, coolDown: 1800, coolDownOffset: 1400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 80, predictive: 0, coolDown: 1800, coolDownOffset: 1600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 90, predictive: 0, coolDown: 1800, coolDownOffset: 1800),
                new HpLessTransition(0.2, "rage")
                        ),
                    new State("rage",
                new Wander(0.2),
                new Taunt("YOU FOOLS!"),
                new Shoot(10, projectileIndex: 0, count: 16, predictive: 1, shootAngle: 22.5, coolDown: 2000),
                new Shoot(10, projectileIndex: 2, count: 4, shootAngle: 90, angleOffset: 0, predictive: 0, coolDown: 1800, coolDownOffset: 0),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 10, predictive: 0, coolDown: 1800, coolDownOffset: 200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 20, predictive: 0, coolDown: 1800, coolDownOffset: 400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 30, predictive: 0, coolDown: 1800, coolDownOffset: 600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 40, predictive: 0, coolDown: 1800, coolDownOffset: 800),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 50, predictive: 0, coolDown: 1800, coolDownOffset: 1000),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 60, predictive: 0, coolDown: 1800, coolDownOffset: 1200),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 70, predictive: 0, coolDown: 1800, coolDownOffset: 1400),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 80, predictive: 0, coolDown: 1800, coolDownOffset: 1600),
                new Shoot(10, projectileIndex: 2, count: 6, shootAngle: 60, angleOffset: 90, predictive: 0, coolDown: 1800, coolDownOffset: 1800)
                        )
               ),
            new GoldLoot(10, 25),
            Thornloot
            )
        .Init("Thorns Knight",
            new State(
                new Orbit(.2, 5, target: "Thorn Dragco Nimissime", radiusVariance: 1.5),
                new Shoot(10, projectileIndex: 0, count: 5, shootAngle: 72, angleOffset: 0, predictive: 0, coolDown: 500, coolDownOffset: 0)
                )
            )

        /* <-- Raid --> */
        .Init("Raid Mob",
                new State(
                    new State("default",
                        new HpLessTransition(0.99999, "basic")
                        ),
                    new State("basic",
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                    new Taunt("Raid Level: One"),
                    new TimedTransition(2000, "1")
                    ),
                    new State("1",
                       new Wander(0.2),
                       new Shoot(10, projectileIndex: 0, count: 6, shootAngle: 10, predictive: 0.5, coolDown: 1000)
                        )
               ),
            new GoldLoot(5, 10),
            Raidloot
            )

        .Init("Raid Mob Two",
                new State(
                    new State("default",
                        new HpLessTransition(0.99999, "basic")
                        ),
                    new State("basic",
                    new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                    new Taunt("Raid Level: Two"),
                    new TimedTransition(2000, "2")
                    ),
                    new State("2",
                       new Wander(0.2),
                       new Shoot(10, projectileIndex: 0, count: 6, shootAngle: 10, predictive: 1, coolDown: 1000),
                       new Shoot(10, projectileIndex: 0, count: 3, shootAngle: 20, predictive: 1, coolDown: 1000, coolDownOffset: 500)
                        )
               ),
            new FameLoot(25, 50),
            Raidloot
            )

        .Init("Raid Spawner",
                  new State(
                    new ConditionalEffect(ConditionEffectIndex.Invincible),
                    new State("sexyaf",
                        new Reproduce("Raid Mob", 10, 1, 50),
                        new TimedTransition(4500, "cancer")
                        ),
                    new State("cancer",
                        new EntityNotExistsTransition("Raid Mob", 200, "adolf")
                        ),
                      new State("adolf",
                          new Taunt("New Boss in 20 seconds!"), 
                        new TimedTransition(20000, "sexyaf")
                        )
                    )
            )

        .Init("Raid Two Spawner",
                  new State(
                    new ConditionalEffect(ConditionEffectIndex.Invincible),
                    new State("sexyaf",
                        new Reproduce("Raid Mob Two", 10, 1, 50),
                        new TimedTransition(4500, "cancer")
                        ),
                    new State("cancer",
                        new EntityNotExistsTransition("Raid Mob Two", 200, "adolf")
                        ),
                      new State("adolf",
                          new Taunt("New Boss in 20 seconds!"),
                        new TimedTransition(20000, "sexyaf")
                        )
                    )
            )
        ;
    }
}
