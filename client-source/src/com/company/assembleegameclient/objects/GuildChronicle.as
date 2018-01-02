// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GuildChronicle

package com.company.assembleegameclient.objects {
import _panels._f;

import com.company.assembleegameclient.game.GameSprite;

import _panels.Panel;

public class GuildChronicle extends GameObject implements _G_4 {

    public function GuildChronicle(_arg1:XML) {
        super(_arg1);
        _064 = true;
    }

    public function getPanel(_arg1:GameSprite):Panel {
        return (new _f(_arg1));
    }

}
}//package com.company.assembleegameclient.objects

