// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._0A_s

package com.company.util {
import mx.formatters.DateFormatter;

public class _0A_s {

    public static function _mP_():String {
        var _local1:Date = new Date();
        var _local2:Number = _local1.time;
        _local2 = (_local2 + (((_local1.timezoneOffset - 420) * 60) * 1000));
        _local1.setTime(_local2);
        var _local3:DateFormatter = new DateFormatter();
        _local3.formatString = "";
        return (_local3.format(_local1));
    }

}
}//package com.company.util

