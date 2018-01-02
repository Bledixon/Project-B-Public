using wServer.networking;

namespace wServer.realm.worlds
{
    public class DonorPets : World
    {
        public const string DONORPETSMAP = "wServer.realm.worlds.donorpetshop.jm";

        public DonorPets()
        {
            Id = DONORPETS_ID;
            Name = "Donator Pet Shop";
            Background = 0;
            AllowTeleport = true;
        }
        protected override void Init()
        {
            LoadMap(DONORPETSMAP, MapType.Json);
        }

        public override World GetInstance(Client Client)
        {
            return Manager.AddWorld(new Market());
        }
    }
}
