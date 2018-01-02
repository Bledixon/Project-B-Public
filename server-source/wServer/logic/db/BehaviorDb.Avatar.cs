﻿using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Avatar = () => Behav()
            .Init("Avatar",
                new State(
                    new State("spiral",
                        new Wander(0.2),
                        new SetAltTexture(0),
                        new Shoot(20, 1, 10, 1, 0),
                        new Shoot(20, 1, 10, 1, 10, coolDownOffset: 200),
                        new Shoot(20, 1, 10, 1, 20, coolDownOffset: 400),
                        new Shoot(20, 1, 10, 1, 30, coolDownOffset: 600),
                        new Shoot(20, 1, 10, 1, 40, coolDownOffset: 800),
                        new Shoot(20, 1, 10, 1, 50, coolDownOffset: 1000),
                        new Shoot(20, 1, 10, 1, 60, coolDownOffset: 1200),
                        new Shoot(20, 1, 10, 1, 70, coolDownOffset: 1400),
                        new Shoot(20, 1, 10, 1, 80, coolDownOffset: 1600),
                        new Shoot(20, 1, 10, 1, 90, coolDownOffset: 1800),
                        new Shoot(20, 1, 10, 1, 100, coolDownOffset: 2000),
                        new Shoot(20, 1, 10, 1, 110, coolDownOffset: 2200),
                        new Shoot(20, 1, 10, 1, 120, coolDownOffset: 2400),
                        new Shoot(20, 1, 10, 1, 130, coolDownOffset: 2600),
                        new Shoot(20, 1, 10, 1, 140, coolDownOffset: 2800),
                        new Shoot(20, 1, 10, 1, 150, coolDownOffset: 3000),
                        new Shoot(20, 1, 10, 1, 160, coolDownOffset: 3200),
                        new Shoot(20, 1, 10, 1, 170, coolDownOffset: 3400),
                        new Shoot(20, 1, 10, 1, 180, coolDownOffset: 3600),
                        new Shoot(20, 1, 10, 1, 190, coolDownOffset: 3800),
                        new Shoot(20, 1, 10, 1, 200, coolDownOffset: 4000),
                        new Shoot(20, 1, 10, 1, 210, coolDownOffset: 4200),
                        new Shoot(20, 1, 10, 1, 220, coolDownOffset: 4400),
                        new Shoot(20, 1, 10, 1, 230, coolDownOffset: 4600),
                        new Shoot(20, 1, 10, 1, 240, coolDownOffset: 4800),
                        new Shoot(20, 1, 10, 1, 250, coolDownOffset: 5000),
                        new Shoot(20, 1, 10, 1, 260, coolDownOffset: 5200),
                        new Shoot(20, 1, 10, 1, 270, coolDownOffset: 5400),
                        new Shoot(20, 1, 10, 1, 280, coolDownOffset: 5600),
                        new Shoot(20, 1, 10, 1, 290, coolDownOffset: 5800),
                        new Shoot(20, 1, 10, 1, 300, coolDownOffset: 6000),
                        new Shoot(20, 1, 10, 1, 310, coolDownOffset: 6200),
                        new Shoot(20, 1, 10, 1, 320, coolDownOffset: 6400),
                        new Shoot(20, 1, 10, 1, 330, coolDownOffset: 6600),
                        new Shoot(20, 1, 10, 1, 340, coolDownOffset: 7800),
                        new Shoot(20, 1, 10, 1, 350, coolDownOffset: 8000),
                        new TimedTransition(10000, "idle")
                        ),
                    new State("idle",
                        new SetAltTexture(0),
                        new Flash(0xfFF0000, 0.5, 9000001),
                        new TimedTransition(3000, "stars")
                        ),
                    new State("stars",
                        new SetAltTexture(0),
                        new Shoot(20, 3, 10, 0, 160),
                        new Shoot(20, 3, 10, 0, 180, coolDownOffset: 200),
                        new Shoot(20, 3, 10, 0, 200, coolDownOffset: 400),
                        new Shoot(20, 3, 10, 0, 260, coolDownOffset: 600),
                        new Shoot(20, 3, 10, 0, 280, coolDownOffset: 800),
                        new Shoot(20, 3, 10, 0, 300, coolDownOffset: 1000),
                        new Shoot(20, 3, 10, 0, 0, coolDownOffset: 1200),
                        new Shoot(20, 3, 10, 0, 20, coolDownOffset: 1400),
                        new Shoot(20, 3, 10, 0, 40, coolDownOffset: 1600),
                        new TimedTransition(10000, "spiral2")
                        ),
                    new State("spiral2",
                        new SetAltTexture(0),
                        new Shoot(20, 1, 10, 1, 360),

                        new Shoot(20, 1, 10, 1, 350, coolDownOffset: 200),

                        new Shoot(20, 1, 10, 1, 340, coolDownOffset: 400),

                        new Shoot(20, 1, 10, 1, 330, coolDownOffset: 600),

                        new Shoot(20, 1, 10, 1, 320, coolDownOffset: 800),

                        new Shoot(20, 1, 10, 1, 300, coolDownOffset: 1000),

                        new Shoot(20, 1, 10, 1, 290, coolDownOffset: 1200),

                        new Shoot(20, 1, 10, 1, 280, coolDownOffset: 1400),

                        new Shoot(20, 1, 10, 1, 270, coolDownOffset: 1600),

                        new Shoot(20, 1, 10, 1, 260, coolDownOffset: 1800),

                        new Shoot(20, 1, 10, 1, 250, coolDownOffset: 2000),

                        new Shoot(20, 1, 10, 1, 240, coolDownOffset: 2200),

                        new Shoot(20, 1, 10, 1, 230, coolDownOffset: 2400),

                        new Shoot(20, 1, 10, 1, 220, coolDownOffset: 2600),

                        new Shoot(20, 1, 10, 1, 210, coolDownOffset: 2800),

                        new Shoot(20, 1, 10, 1, 200, coolDownOffset: 3000),

                        new Shoot(20, 1, 10, 1, 190, coolDownOffset: 3200),

                        new Shoot(20, 1, 10, 1, 180, coolDownOffset: 3400),

                        new Shoot(20, 1, 10, 1, 170, coolDownOffset: 3600),

                        new Shoot(20, 1, 10, 1, 160, coolDownOffset: 3800),

                        new Shoot(20, 1, 10, 1, 150, coolDownOffset: 4000),

                        new Shoot(20, 1, 10, 1, 140, coolDownOffset: 4200),

                        new Shoot(20, 1, 10, 1, 130, coolDownOffset: 4400),

                        new Shoot(20, 1, 10, 1, 120, coolDownOffset: 4600),

                        new Shoot(20, 1, 10, 1, 110, coolDownOffset: 4800),

                        new Shoot(20, 1, 10, 1, 100, coolDownOffset: 5000),

                        new Shoot(20, 1, 10, 1, 90, coolDownOffset: 5200),

                        new Shoot(20, 1, 10, 1, 80, coolDownOffset: 5400),

                        new Shoot(20, 1, 10, 1, 70, coolDownOffset: 5600),

                        new Shoot(20, 1, 10, 1, 60, coolDownOffset: 5800),

                        new Shoot(20, 1, 10, 1, 50, coolDownOffset: 6000),

                        new Shoot(20, 1, 10, 1, 40, coolDownOffset: 6200),

                        new Shoot(20, 1, 10, 1, 30, coolDownOffset: 6400),

                        new Shoot(20, 1, 10, 1, 20, coolDownOffset: 6600),

                        new Shoot(20, 1, 10, 1, 10, coolDownOffset: 7800),

                        new Shoot(20, 1, 10, 1, 0, coolDownOffset: 8000),
                        new TimedTransition(10000, "spiral3")
                        ),
                    new State("spiral3",
                        new SetAltTexture(0),
                        new Shoot(20, 1, 10, 0, 0),

                        new Shoot(20, 1, 10, 0, 10, coolDownOffset: 200),

                        new Shoot(20, 1, 10, 0, 20, coolDownOffset: 400),

                        new Shoot(20, 1, 10, 0, 30, coolDownOffset: 600),

                        new Shoot(20, 1, 10, 0, 40, coolDownOffset: 800),

                        new Shoot(20, 1, 10, 0, 50, coolDownOffset: 1000),

                        new Shoot(20, 1, 10, 0, 60, coolDownOffset: 1200),

                        new Shoot(20, 1, 10, 0, 70, coolDownOffset: 1400),

                        new Shoot(20, 1, 10, 0, 80, coolDownOffset: 1600),

                        new Shoot(20, 1, 10, 0, 90, coolDownOffset: 1800),

                        new Shoot(20, 1, 10, 0, 100, coolDownOffset: 2000),

                        new Shoot(20, 1, 10, 0, 110, coolDownOffset: 2200),

                        new Shoot(20, 1, 10, 0, 120, coolDownOffset: 2400),

                        new Shoot(20, 1, 10, 0, 130, coolDownOffset: 2600),

                        new Shoot(20, 1, 10, 0, 140, coolDownOffset: 2800),

                        new Shoot(20, 1, 10, 0, 150, coolDownOffset: 3000),

                        new Shoot(20, 1, 10, 0, 160, coolDownOffset: 3200),

                        new Shoot(20, 1, 10, 0, 170, coolDownOffset: 3400),

                        new Shoot(20, 1, 10, 0, 180, coolDownOffset: 3600),

                        new Shoot(20, 1, 10, 0, 190, coolDownOffset: 3800),

                        new Shoot(20, 1, 10, 0, 200, coolDownOffset: 4000),

                        new Shoot(20, 1, 10, 0, 210, coolDownOffset: 4200),

                        new Shoot(20, 1, 10, 0, 220, coolDownOffset: 4400),

                        new Shoot(20, 1, 10, 0, 230, coolDownOffset: 4600),

                        new Shoot(20, 1, 10, 0, 240, coolDownOffset: 4800),

                        new Shoot(20, 1, 10, 0, 250, coolDownOffset: 5000),

                        new Shoot(20, 1, 10, 0, 260, coolDownOffset: 5200),

                        new Shoot(20, 1, 10, 0, 270, coolDownOffset: 5400),

                        new Shoot(20, 1, 10, 0, 280, coolDownOffset: 5600),

                        new Shoot(20, 1, 10, 0, 290, coolDownOffset: 5800),

                        new Shoot(20, 1, 10, 0, 300, coolDownOffset: 6000),

                        new Shoot(20, 1, 10, 0, 310, coolDownOffset: 6200),

                        new Shoot(20, 1, 10, 0, 320, coolDownOffset: 6400),

                        new Shoot(20, 1, 10, 0, 330, coolDownOffset: 6600),

                        new Shoot(20, 1, 10, 0, 340, coolDownOffset: 7800),

                        new Shoot(20, 1, 10, 0, 350, coolDownOffset: 8000),
                        new TimedTransition(10000, "spiral3")
                        )
                    ),
                      new Threshold(0.0001,
                      new TierLoot(12, ItemType.Armor, 0.1),
                    new TierLoot(11, ItemType.Weapon, 0.1),
                    new TierLoot(5, ItemType.Ring, 0.1),
                    new TierLoot(2, ItemType.Potion, 1),
                    new ItemLoot("Tablet of the King's Avatar", 0.01),
                    new ItemLoot("Spectral Bow", 0.01),
                    new ItemLoot("Moon Quiver", 0.01),
                    new ItemLoot("Spectral Armor", 0.01),
                    new ItemLoot("Full Moon Ring", 0.01)
                    )
                  )
            .Init("shtrs shadowmans",
                new State(
                    new ConditionalEffect(ConditionEffectIndex.Armored),
                    new State("shoot1",
                        new Shoot(20, 1, 0, 0, 0),
                        new Shoot(20, 1, 0, 0, 90),
                        new Shoot(20, 1, 0, 0, 180),
                        new Shoot(20, 1, 0, 0, 270),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 1000),
                        new TimedTransition(2000, "shoot2")
                        ),
                    new State("shoot2",
                        new Shoot(20, 1, 0, 0, 45),
                        new Shoot(20, 1, 0, 0, 135),
                        new Shoot(20, 1, 0, 0, 225),
                        new Shoot(20, 1, 0, 0, 315),
                        new TimedTransition(2000, "shoot1")
                        )
                    )
                        )
            .Init("shtrs eyeswarmer",
                new State(
                    new State("shoot",
                        new Orbit(1.0, 2, 5, "Avatar"),
                        new Shoot(20, 1, projectileIndex: 0, coolDown: 5000)
                        )
                    )
            )
            .Init("shtrs Pillar 1",
                new State(
                    new State("idle",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable)
                        ),
                    new State("PROTECT",
                        new Taunt("PROTECT THE AVATAR!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 1000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 4000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 7000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 10000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 13000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 16000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 19000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 22000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 25000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDownOffset: 1000, coolDown: 3000),
                        new TimedTransition(4000, "preparing")
                        ),
                    new State("preparing",
                        new ConditionalEffect(ConditionEffectIndex.Armored),
                        new Flash(0x0D00FF, 0.4, 10),
                        new TimedTransition(20000, "PROTECT2")
                        ),
                    new State("PROTECT2",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 1000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 4000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 7000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 10000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 13000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 16000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 19000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 22000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 25000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 3000, coolDownOffset: 1000),
                        new TimedTransition(4000, "preparing")
                    )
                    )
            )
            .Init("shtrs Pillar 2",
                new State(
                    new State("idle",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable)
                        ),
                    new State("PROTECT",
                        new Taunt("PROTECT THE AVATAR!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 11000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 14000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 17000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 20000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 23000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 26000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 29000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 32000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 35000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 3000, coolDownOffset: 11000),
                        new TimedTransition(8000, "preparing")
                        ),
                    new State("preparing",
                        new ConditionalEffect(ConditionEffectIndex.Armored),
                        new Flash(0x0D00FF, 0.4, 10),
                        new TimedTransition(20000, "PROTECT2")
                        ),
                    new State("PROTECT2",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 1000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 4000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 7000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 10000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 13000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 16000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 19000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 22000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 25000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 3000, coolDownOffset: 1000),
                        new TimedTransition(8000, "preparing")
                    )
                    )
                    )
            .Init("shtrs Pillar 3",
                new State(
                    new State("idle",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable)
                        ),
                    new State("PROTECT",
                        new Taunt("PROTECT THE AVATAR!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 6000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 9000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 12000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 15000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 18000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 21000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 24000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 27000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 30000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 3000, coolDownOffset: 6000),
                        new TimedTransition(12000, "preparing")
                        ),
                    new State("preparing",
                        new ConditionalEffect(ConditionEffectIndex.Armored),
                        new Flash(0x0D00FF, 0.4, 10),
                        new TimedTransition(20000, "PROTECT2")
                        ),
                    new State("PROTECT2",
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 1000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 4000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 7000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 10000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 13000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 16000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 19000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 22000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 25000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 3000, coolDownOffset: 1000),
                        new TimedTransition(12000, "preparing")
                    )
                    )
                    )
            .Init("shtrs Pillar 4",
                new State(
                    new State("idle",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable)
                        ),
                    new State("PROTECT",
                        new Taunt("PROTECT THE AVATAR!"),
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 16000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 19000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 22000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 25000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 28000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 31000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 34000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 37000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 40000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 3000, coolDownOffset: 16000),
                        new TimedTransition(16000, "preparing")
                        ),
                    new State("preparing",
                        new ConditionalEffect(ConditionEffectIndex.Armored),
                        new Flash(0x0D00FF, 0.4, 10),
                        new TimedTransition(20000, "PROTECT2")
                        ),
                    new State("PROTECT2",
                        new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 1000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 4000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 7000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 10000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 13000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 16000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 19000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 22000),
                        new Shoot(20, count: 10, projectileIndex: 0, fixedAngle: 45, coolDownOffset: 25000),
                        new Shoot(10, 1, 20, angleOffset: 0 / 1, projectileIndex: 1, coolDown: 3000, coolDownOffset: 11000),
                        new TimedTransition(16000, "preparing")
        )
                    )
            )
            .Init("shtrs blobomb maker",
                new State(
                    new State("Idle",
                        new ConditionalEffect(ConditionEffectIndex.Invincible)
                    ),
                    new State("Spawn",
                        new Spawn("shtrs Blobomb", coolDown: 1000),
                        new TimedTransition(6000, "Idle")
                     ),
                    new State("blobombs avatar",
                        new Spawn("shtrs Blobomb", maxChildren: 1, coolDown: 2000)
                        ),
                    new State("AVATAR HELP!",
                        new Spawn("shtrs Blobomb", maxChildren: 1, coolDown: 2000),
                        new TimedTransition(2000, "Idle")
                    )
                )
            );
    }
}