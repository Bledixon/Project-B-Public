// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._0J_n

package _E_7 {
public class _0J_n {

    public static const _rJ_:String = "#00FF00";
    public static const _at:String = "#FF0000";
    public static const _iF_:String = "#FFFF8F";

    public static function _M_w(_arg1:String, _arg2:String):String {
        return ('<font color="' + _arg2 + '">' + _arg1 + "</font>");
    }

    public static function _A_l(_arg1:Number):String {
        var _local2:Number = (_arg1 - int(_arg1));
        return (int(_local2 * 10) == 0 ? int(_arg1).toString() : _arg1.toFixed(1));
    }

    public static function _qy(_arg1:Number):String {
        if (_arg1 < 0) {
            return (_at);
        }
        if (_arg1 > 0) {
            return (_rJ_);
        }
        return (_iF_);
    }

}
}//package _E_7

