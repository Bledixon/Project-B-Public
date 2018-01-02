// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util.PointUtil

package com.company.util {
import flash.geom.Point;

public class PointUtil {

    public static const _P_5:Point = new Point(0, 0);

    public static function _rg(_arg1:Point):Point {
        var _local2:Point = _arg1.clone();
        _local2.x = Math.round(_local2.x);
        _local2.y = Math.round(_local2.y);
        return (_local2);
    }

    public static function _P_1(_arg1:Point, _arg2:Point):Number {
        return (_bm(_arg1.x, _arg1.y, _arg2.x, _arg2.y));
    }

    public static function _bm(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number):Number {
        var _local5:Number = (_arg3 - _arg1);
        var _local6:Number = (_arg4 - _arg2);
        return (((_local5 * _local5) + (_local6 * _local6)));
    }

    public static function _R_O_(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number):Number {
        var _local5:Number = (_arg3 - _arg1);
        var _local6:Number = (_arg4 - _arg2);
        return (Math.sqrt(((_local5 * _local5) + (_local6 * _local6))));
    }

    public static function __null(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number):Point {
        return (new Point((_arg1 + ((_arg3 - _arg1) * _arg5)), (_arg2 + ((_arg4 - _arg2) * _arg5))));
    }

    public static function _C_q(_arg1:Point, _arg2:Point):Number {
        return (Math.atan2((_arg2.y - _arg1.y), (_arg2.x - _arg1.x)));
    }

    public static function _b9(_arg1:Point, _arg2:Number, _arg3:Number):Point {
        var _local4:Point = new Point();
        _local4.x = (_arg1.x + (_arg3 * Math.cos(_arg2)));
        _local4.y = (_arg1.y + (_arg3 * Math.sin(_arg2)));
        return (_local4);
    }

    public function PointUtil(_arg1:StaticEnforcer) {
    }

}
}//package com.company.util

class StaticEnforcer {

}

