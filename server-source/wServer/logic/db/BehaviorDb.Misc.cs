using wServer.logic.behaviors;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Misc = () => Behav()
            .Init("White Fountain",
                new State(
                    new NexusHealHp(5, 100, 1000)
                    )
            )
            .Init("Sheep",
                new State(
                    new PlayerWithinTransition(15, "player_nearby"),
                    new State("player_nearby",
                        new Prioritize(
                            new StayCloseToSpawn(0.1, 2),
                            new Wander(0.1)
                            ),
                        new Taunt(0.001, 1000, "baa", "baa baa")
                        )
                    )
            )
            .Init("Nexus Crier",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new State("fuckucunt",
               new Taunt("Useful commands: /shop /earena /gland /vault /goldshop /arena /raid!"),
               new TimedTransition(20000, "wtfuwant")
                             ),
                      new State("wtfuwant",
               new Taunt("Don't beg, dupe or spam any kind of things, you might get banned!"),
               new TimedTransition(20000, "wtfuwant1")
                        ),
                      new State("wtfuwant1",
               new Taunt("Be sure to farm for Gold bags, they contain epic items!"),
               new TimedTransition(20000, "wtfuwant2")
                        ),
                      new State("wtfuwant2",
               new Taunt("Newest Update: Halloween!"),
               new TimedTransition(20000, "fuckucunt")
                        )
                  )
            )
            .Init("Admin Pet",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 200, 69, 999),
                      new PetChasing()
                      )
              )
            .Init("Bunny Pet",
                new State(
                    new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                    new PetHeal(5, 14, 3, 3820),
                      new PetChasing()
                    )
            )
            .Init("Rock Pet",
                new State(
                    new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                    new PetHeal(5, 10, 5, 3820),
                      new PetChasing()
                    )
                 )
          .Init("Goblin Mage Pet",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 20, 10, 2660),
                      new PetChasing()
                      )
              )
          .Init("Lil Sumo Pet",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 30, 15, 1960),
                      new PetChasing()
                      )
              )
          .Init("Giant Crab Pet",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 40, 20, 1420),
                      new PetChasing()
                      )
              )
            .Init("Rock Pet1",
                new State(
                    new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                    new PetHeal(5, 14, 3, 3820),
                      new PetChasing()
                    )
                 )
          .Init("Rock Pet2",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 23, 8, 2660),
                      new PetChasing()
                      )
              )
          .Init("Rock Pet3",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 40, 17, 1960),
                      new PetChasing()
                      )
              )
          .Init("Rock Pet4",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 69, 33, 1420),
                      new PetChasing()
                      )
              )
        .Init("Rock Pet5",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 90, 45, 1000),
                      new PetChasing()
                      )
              )
        .Init("Bledixon New Year Dragon",
                  new State(
                      new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                      new PetHeal(5, 200, 69, 999),
                      new PetChasing()
                      )
              )
        .Init("Nexus Bat",
                new State(
                    new ConditionalEffect(ConditionEffectIndex.Invincible, true),
                    new Wander(0.5)
                         )
             )
                          /*  .InitMany("Black Cat", "Snowman", name =>
                                new State(
                                    new PetChasing(1.5, 7, 1)
                                    )
                            ) */ ;
    }
}