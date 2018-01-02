// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.tutorial.UIDrawBox

package com.company.assembleegameclient.tutorial {
import flash.geom.Point;
import flash.geom.Rectangle;

import com.company.util.ConversionUtil;

import flash.display.Graphics;

public class UIDrawBox {

    public const _c5:int = 500;
    public const _P_5:Point = new Point(250, 200);

    public function UIDrawBox(_arg1:XML) {
        this.rect_ = ConversionUtil._0M_q(_arg1);
        this.color_ = uint(_arg1.@color);
    }
    public var rect_:Rectangle;
    public var color_:uint;

    public function draw(_arg1:int, _arg2:Graphics, _arg3:int):void {
        var _local4:Number;
        var _local5:Number;
        var _local6:Number = (this.rect_.width - _arg1);
        var _local7:Number = (this.rect_.height - _arg1);
        if (_arg3 < this._c5) {
            _local4 = (this._P_5.x + (((this.rect_.x - this._P_5.x) * _arg3) / this._c5));
            _local5 = (this._P_5.y + (((this.rect_.y - this._P_5.y) * _arg3) / this._c5));
            _local6 = (_local6 * (_arg3 / this._c5));
            _local7 = (_local7 * (_arg3 / this._c5));
        } else {
            _local4 = (this.rect_.x + (_arg1 / 2));
            _local5 = (this.rect_.y + (_arg1 / 2));
        }
        _arg2.lineStyle(_arg1, this.color_);
        _arg2.drawRect(_local4, _local5, _local6, _local7);
    }

}
}//package com.company.assembleegameclient.tutorial

