using wServer.realm.entities;

namespace wServer
{
    public static class References
    {
        public static bool NameIsServerDev(this string name)
        {
            switch (name)
            {
                case "$Bledixon$":
                case "Quest":
                case "Jade":
                case "Miniguy":
                case "Skilly":
                    return true;
            }
            return false;
        }

        public static bool NameIsServerGM(this string name)
        {
            switch (name)
            {
                case "$Bledixon$":
                case "Quest":
                case "Jade":
                case "Miniguy":
                case "Skilly":
                    return true;
            }
            return false;
        }

        public static bool NameIsServerHighStaff(this string name)
        {
            switch (name)
            {
                case "$Bledixon$":
                case "Quest":
                case "Thessal":
                case "Lunar":
                case "Jade":
                case "Miniguy":
                case "AnfeLives":
                case "Heaven":
                case "Crisp":
                case "Antidote":
                case "Skilly":
                case "KinkyInky":
                case "ehide":
                case "JohnMH":
                    return true;
            }
            return false;
        }

        public static bool NameIsServerEligible(this string name)
        {
            switch (name)
            {
                case "$Bledixon$":
                case "Quest":
                case "Thessal":
                case "Lunar":
                case "Jade":
                case "Jiz":
                case "Miniguy":
                case "AnfeLives":
                case "Heaven":
                case "Crisp":
                case "Antidote":
                case "Skilly":
                case "KinkyInky":
                case "ehide":
                case "JohnMH":
                    return true;
            }
            return false;
        }

        public static bool IsServerDev(this Player player)
        {
             return player.Client.Account.Rank == 7 && player.Name.NameIsServerDev();
        }

        public static bool IsServerGM(this Player player)
        {
            return player.Client.Account.Rank > 5 && player.Client.Account.Rank < 8 && player.Name.NameIsServerGM();
        }

        public static bool IsServerHighStaff(this Player player)
        {
            return player.Client.Account.Rank > 5 && player.Client.Account.Rank < 8 && player.Name.NameIsServerHighStaff();
        }

        public static bool IsServerEligible(this Player player)
        {
            return player.Client.Account.Rank > 4 && player.Client.Account.Rank < 8 && player.Name.NameIsServerEligible();
        }
    }
}
