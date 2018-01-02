using wServer.networking;

namespace wServer.realm.worlds
{
    public class RandomRealm : World
    {
        public RandomRealm()
        {
            Id = RAND_REALM;
            Name = "Random Realm";
            Background = 0;
            Difficulty = 0;
            IsLimbo = true;
        }

        public override World GetInstance(Client client)
        {
            return Manager.Monitor.GetRandomRealm();
        }
    }
}