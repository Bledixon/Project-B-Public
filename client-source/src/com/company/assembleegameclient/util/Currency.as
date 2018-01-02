// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util.Currency

package com.company.assembleegameclient.util {
public class Currency {

    public static const INVALID:int = -1;
    public static const _class:int = 0;
    public static const FAME:int = 1;
    public static const _A_h:int = 2;
    public static const KEYS:int = 3;

    public static function _01r(_arg1:int):String {
        switch (_arg1) {
            case _class:
                return ("Gold");
            case FAME:
                return ("Fame");
            case _A_h:
                return ("Guild Fame");
            case KEYS:
                return ("Keys");
        }
        return ("");
    }

}
}//package com.company.assembleegameclient.util

