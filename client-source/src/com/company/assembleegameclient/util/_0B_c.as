// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util._0B_c

package com.company.assembleegameclient.util {
import flash.utils.Dictionary;

import flash.display.BitmapData;


public class _0B_c {

    private static var _0H_k:Dictionary = new Dictionary();

    public static function _J_v(_arg1:String, _arg2:int):_lJ_ {
        var _local3:Vector.<_lJ_> = _0H_k[_arg1];
        if ((((_local3 == null)) || ((_arg2 >= _local3.length)))) {
            return (null);
        }
        return (_local3[_arg2]);
    }

    public static function add(_arg1:String, _arg2:BitmapData, _arg3:BitmapData, _arg4:int, _arg5:int, _arg6:int, _arg7:int, _arg8:int):void {
        var _local11:_J_H_;
        var _local9:Vector.<_lJ_> = new Vector.<_lJ_>();
        var _local10:_x2 = new _x2();
        _local10.addFromBitmapData(_arg2, _arg3, _arg6, _arg7);
        for each (_local11 in _local10._W_u) {
            _local9.push(new _lJ_(_local11, _arg4, _arg5, _arg8));
        }
        _0H_k[_arg1] = _local9;
    }

}
}//package com.company.assembleegameclient.util

