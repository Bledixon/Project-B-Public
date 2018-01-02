// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.SpiderWeb

package com.company.assembleegameclient.objects {

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.map.Square;

public class SpiderWeb extends GameObject {

    public function SpiderWeb(_arg1:XML) {
        super(_arg1);
    }
    private var _qZ_:Boolean = false;

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        if (!this._qZ_) {
            this._qZ_ = this._mj();
        }
        if (this._qZ_) {
            super.draw(_arg1, _arg2, _arg3);
        }
    }

    private function _mj():Boolean {
        var _local1:Square;
        _local1 = map_.lookupSquare((x_ - 1), y_);
        if (((!((_local1 == null))) && ((_local1.obj_ is Wall)))) {
            return (true);
        }
        _local1 = map_.lookupSquare(x_, (y_ - 1));
        if (((!((_local1 == null))) && ((_local1.obj_ is Wall)))) {
            _8J_.setPosition(x_, y_, 0, 90);
            return (true);
        }
        _local1 = map_.lookupSquare((x_ + 1), y_);
        if (((!((_local1 == null))) && ((_local1.obj_ is Wall)))) {
            _8J_.setPosition(x_, y_, 0, 180);
            return (true);
        }
        _local1 = map_.lookupSquare(x_, (y_ + 1));
        if (((!((_local1 == null))) && ((_local1.obj_ is Wall)))) {
            _8J_.setPosition(x_, y_, 0, 270);
            return (true);
        }
        return (false);
    }

}
}//package com.company.assembleegameclient.objects

