// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.BasicObject

package com.company.assembleegameclient.objects {
import com.company.assembleegameclient.map._X_l;
import com.company.assembleegameclient.map.Square;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;


public class BasicObject {

    private static var _D_p:int = 0;

    public static function _7y():int {
        return ((0x7F000000 | _D_p++));
    }

    public function BasicObject() {
        this._050 = new Vector.<Number>();
        this._bY_ = new Vector.<Number>();
        super();
        this.clear();
    }
    public var map_:_X_l;
    public var _0H_B_:Square;
    public var objectId_:int;
    public var x_:Number;
    public var y_:Number;
    public var z_:Number;
    public var _P_m:Boolean;
    public var _1D_:Boolean;
    public var _050:Vector.<Number>;
    public var _bY_:Vector.<Number>;
    public var sortVal_:Number;

    public function clear():void {
        this.map_ = null;
        this._0H_B_ = null;
        this.objectId_ = -1;
        this.x_ = 0;
        this.y_ = 0;
        this.z_ = 0;
        this._P_m = false;
        this._1D_ = false;
        this._050.length = 0;
        this._bY_.length = 0;
        this.sortVal_ = 0;
    }

    public function dispose():void {
        this.map_ = null;
        this._0H_B_ = null;
        this._050 = null;
        this._bY_ = null;
    }

    public function update(_arg1:int, _arg2:int):Boolean {
        return (true);
    }

    public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
    }

    public function drawShadow(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
    }

    public function _0E_T_(_arg1:_0D_v):void {
        this._050.length = 0;
        this._050.push(this.x_, this.y_, 0, this.x_, this.y_, this.z_);
        this._bY_.length = 0;
        _arg1.wToS_.transformVectors(this._050, this._bY_);
        this.sortVal_ = this._bY_[1];
    }

    public function addTo(_arg1:_X_l, _arg2:Number, _arg3:Number):Boolean {
        this.map_ = _arg1;
        this._0H_B_ = this.map_.getSquare(_arg2, _arg3);
        if (this._0H_B_ == null) {
            this.map_ = null;
            return (false);
        }
        this.x_ = _arg2;
        this.y_ = _arg3;
        return (true);
    }

    public function removeFromMap():void {
        this.map_ = null;
        this._0H_B_ = null;
    }

}
}//package com.company.assembleegameclient.objects

