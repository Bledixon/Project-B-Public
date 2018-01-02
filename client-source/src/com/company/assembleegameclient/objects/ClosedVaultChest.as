// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.ClosedVaultChest

package com.company.assembleegameclient.objects {
import _E_7._aS_;
import _E_7._for_;

import flash.display.BitmapData;

public class ClosedVaultChest extends SellableObject {

    public function ClosedVaultChest(_arg1:XML) {
        super(_arg1);
    }

    override public function soldObjectName():String {
        return ("Vault Chest");
    }

    override public function soldObjectInternalName():String {
        return ("Vault Chest");
    }

    override public function getTooltip():_for_ {
        return (new _aS_(0x2A2A2A, 0x9B9B9B, this.soldObjectName(), ("A chest that will safely store 8 items and is " + "accessible by all of your characters."), 200));
    }

    override public function getIcon():BitmapData {
        return (ObjectLibrary.getRedrawnTextureFromType(ObjectLibrary._pb["Vault Chest"], 80, true));
    }

}
}//package com.company.assembleegameclient.objects

