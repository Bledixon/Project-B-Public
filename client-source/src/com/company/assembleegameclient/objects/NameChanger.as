// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.NameChanger

package com.company.assembleegameclient.objects {
import _panels._0K_o;

import com.company.assembleegameclient.game.GameSprite;

import _panels.Panel;

public class NameChanger extends GameObject implements _G_4 {

    public function NameChanger(_arg1:XML) {
        super(_arg1);
        _064 = true;
    }
    public var _0I_a:int = 0;

    public function _Y__(_arg1:int):void {
        this._0I_a = _arg1;
    }

    public function getPanel(_arg1:GameSprite):Panel {
        return (new _0K_o(_arg1, this._0I_a));
    }

}
}//package com.company.assembleegameclient.objects

