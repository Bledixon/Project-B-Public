// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._G_

package com.company.util {
import flash.utils.Dictionary;
import flash.display.BitmapData;
import flash.geom.ColorTransform;
import flash.geom.Point;
import flash.filters.BitmapFilter;

public class _G_ {

    private static var _re:Dictionary = new Dictionary();

    public static function _B_2(_arg1:BitmapData, _arg2:ColorTransform):BitmapData {
        var _local3:BitmapData;
        var _local4:Object = _re[_arg1];
        if (_local4 != null) {
            _local3 = _local4[_arg2];
        } else {
            _local4 = {};
            _re[_arg1] = _local4;
        }
        if (_local3 == null) {
            _local3 = _arg1.clone();
            _local3.colorTransform(_local3.rect, _arg2);
            _local4[_arg2] = _local3;
        }
        return (_local3);
    }

    public static function _R_9(_arg1:BitmapData, _arg2:BitmapFilter):BitmapData {
        var _local3:BitmapData;
        var _local4:Object = _re[_arg1];
        if (_local4 != null) {
            _local3 = _local4[_arg2];
        } else {
            _local4 = {};
            _re[_arg1] = _local4;
        }
        if (_local3 == null) {
            _local3 = _arg1.clone();
            _local3.applyFilter(_local3, _local3.rect, new Point(), _arg2);
            _local4[_arg2] = _local3;
        }
        return (_local3);
    }

    public static function _0C_m(_arg1:BitmapData, _arg2:Number):BitmapData {
        var _local3:int = int((_arg2 * 100));
        var _local4:ColorTransform = new ColorTransform(1, 1, 1, (_local3 / 100));
        return (_B_2(_arg1, _local4));
    }

    public static function clear():void {
        var _local1:Object;
        var _local2:BitmapData;
        for each (_local1 in _re) {
            for each (_local2 in _local1) {
                _local2.dispose();
            }
        }
        _re = new Dictionary();
    }

}
}//package com.company.util

