﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.tutorial.UIDrawArrow

package com.company.assembleegameclient.tutorial {
import flash.geom.Point;

import com.company.util.ConversionUtil;
import com.company.util.PointUtil;

import flash.display.Graphics;

public class UIDrawArrow {

    public const _c5:int = 500;

    public function UIDrawArrow(_arg1:XML) {
        var _local2:Array = ConversionUtil._b3(_arg1);
        this.p0_ = _local2[0];
        this.p1_ = _local2[1];
        this.color_ = uint(_arg1.@color);
    }
    public var p0_:Point;
    public var p1_:Point;
    public var color_:uint;

    public function draw(_arg1:int, _arg2:Graphics, _arg3:int):void {
        var _local6:Point;
        var _local4:Point = new Point();
        if (_arg3 < this._c5) {
            _local4.x = (this.p0_.x + (((this.p1_.x - this.p0_.x) * _arg3) / this._c5));
            _local4.y = (this.p0_.y + (((this.p1_.y - this.p0_.y) * _arg3) / this._c5));
        } else {
            _local4.x = this.p1_.x;
            _local4.y = this.p1_.y;
        }
        _arg2.lineStyle(_arg1, this.color_);
        _arg2.moveTo(this.p0_.x, this.p0_.y);
        _arg2.lineTo(_local4.x, _local4.y);
        var _local5:Number = PointUtil._C_q(_local4, this.p0_);
        _local6 = PointUtil._b9(_local4, (_local5 + (Math.PI / 8)), 30);
        _arg2.lineTo(_local6.x, _local6.y);
        _local6 = PointUtil._b9(_local4, (_local5 - (Math.PI / 8)), 30);
        _arg2.moveTo(_local4.x, _local4.y);
        _arg2.lineTo(_local6.x, _local6.y);
    }

}
}//package com.company.assembleegameclient.tutorial

