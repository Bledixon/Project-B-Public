namespace wServer.realm.entities
{
    public abstract class Character : Entity
    {
        protected Character(RealmManager manager, ushort objType, wRandom rand)
            : base(manager, objType)
        {
            Random = rand;

            if (ObjectDesc != null)
            {
                if (ObjectDesc.SizeStep != 0)
                {
                    int step = Random.Next(0, (ObjectDesc.MaxSize - ObjectDesc.MinSize)/ObjectDesc.SizeStep + 1)*
                               ObjectDesc.SizeStep;
                    Size = ObjectDesc.MinSize + step;
                }
                else
                    Size = ObjectDesc.MinSize;

                HP = ObjectDesc.MaxHP;
            }
        }

        public wRandom Random { get; private set; }

        public int HP { get; set; }
    }
}