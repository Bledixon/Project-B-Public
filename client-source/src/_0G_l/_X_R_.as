// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G_l._X_R_

package _0G_l {

import flash.display.BitmapData;
import flash.geom.Point;

import _q8._9l;

import flash.utils.ByteArray;


public class _X_R_ {

    private static const WIDTH:int = 128;
    private static const HEIGHT:int = 0x0100;

    public function _X_R_() {
        this._yA_ = new Vector.<BitmapData>();
        super();
    }
    public var _yA_:Vector.<BitmapData>;

    public function _io(_arg1:BitmapData):void {
        this._yA_.push(_arg1);
    }

    public function _05W_():ByteArray {
        var _local4:BitmapData;
        var _local1:BitmapData = new BitmapData(WIDTH, HEIGHT, true, 0);
        var _local2:Point = new Point(0, 0);
        var _local3:int;
        for each (_local4 in this._yA_) {
            if ((_local2.x + _local4.width) > WIDTH) {
                _local2.y = (_local2.y + _local3);
                _local2.x = 0;
                _local3 = 0;
            }
            if ((_local2.y + _local4.height) > HEIGHT) break;
            _local1.copyPixels(_local4, _local4.rect, _local2);
            _local2.x = (_local2.x + _local4.width);
            if (_local4.height > _local3) {
                _local3 = _local4.height;
            }
        }
        return (_9l.encode(_local1));
    }

}
}//package _0G_l

