// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._078

package _03T_ {
import flash.utils.getQualifiedClassName;

public class _078 {

    private static var _0C_L_:uint;

    public static function create(_arg1:* = null):String {
        if ((_arg1 is Class)) {
            _arg1 = getQualifiedClassName(_arg1).split("::").pop();
        }
        return ((_arg1 ? _arg1 + "-" : "") + (_0C_L_++).toString(16) + "-" + (Math.random() * 0xFF).toString(16));
    }

}
}//package _03T_

