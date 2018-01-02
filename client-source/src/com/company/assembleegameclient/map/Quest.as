// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map.Quest

package com.company.assembleegameclient.map {
import flash.utils.getTimer;

import com.company.assembleegameclient.objects.GameObject;

public class Quest {

    public function Quest(_arg1:_X_l) {
        this.map_ = _arg1;
    }
    public var map_:_X_l;
    public var objectId_:int = -1;
    private var _F_2:int = 0;
    private var _vx:int = 0;

    public function setObject(_arg1:int):void {
        if ((((this.objectId_ == -1)) && (!((_arg1 == -1))))) {
            this._F_2 = (getTimer() + 4000);
            this._vx = (this._F_2 + 2000);
        }
        this.objectId_ = _arg1;
    }

    public function completed():void {
        this._F_2 = ((getTimer() + 15000) - (Math.random() * 10000));
        this._vx = (this._F_2 + 2000);
    }

    public function getObject(_arg1:int):GameObject {
        if (_arg1 < this._F_2) {
            return (null);
        }
        return (this.map_.goDict_[this.objectId_]);
    }

    public function isNew(_arg1:int):Boolean {
        return ((_arg1 < this._vx));
    }

}
}//package com.company.assembleegameclient.map

