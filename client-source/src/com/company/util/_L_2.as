﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._L_2

package com.company.util {
import flash.utils.ByteArray;

public class _L_2 {

    public static function _Z_S_(_arg1:String):ByteArray {
        var _local2:ByteArray = new ByteArray();
        var _local3:int;
        while (_local3 < _arg1.length) {
            _local2.writeByte(parseInt(_arg1.substr(_local3, 2), 16));
            _local3 = (_local3 + 2);
        }
        return (_local2);
    }

    public static function _L_O_(_arg1:String, _arg2:String):Number {
        return (_arg1.localeCompare(_arg2));
    }

}
}//package com.company.util

