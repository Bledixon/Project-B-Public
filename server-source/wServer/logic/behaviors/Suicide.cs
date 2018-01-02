﻿using System;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.logic.behaviors
{
    internal class Suicide : Behavior
    {
        //State storage: timer

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            if (!(host is Enemy))
                throw new NotSupportedException("Use Decay instead");
            (host as Enemy).Death(time);
        }
    }
}