﻿using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.behaviors
{
    internal class SetAltTexture : Behavior
    {
        //State storage: none

        private readonly int index;

        public SetAltTexture(int index)
        {
            this.index = index;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            if ((host as Enemy).AltTextureIndex != index)
            {
                (host as Enemy).AltTextureIndex = index;
                host.UpdateCount++;
            }
        }
    }
}