// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._9S_

package com.company.util {
public class _9S_ {

    public static const _kK_:RegExp = /^[A-Z]{3,12}$/i;
    public static const emailRes:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;

    public static function _02A_(_arg1:String):Boolean {
        return (Boolean(_arg1.match(_kK_)));
    }

    public static function isEmail(_arg1:String):Boolean {
        return (Boolean(_arg1.match(emailRes)));
    }

}
}//package com.company.util

