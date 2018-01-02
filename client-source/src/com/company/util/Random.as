// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util.Random

package com.company.util {
public class Random {

    public static function _6Z_():uint {
        return (Math.round(((Math.random() * (uint.MAX_VALUE - 1)) + 1)));
    }

    public function Random(_arg1:uint = 1) {
        this.seed = _arg1;
    }
    public var seed:uint;

    public function _ds():uint {
        return (this._M_L_());
    }

    public function _J_t():Number {
        return ((this._M_L_() / 2147483647));
    }

    public function _9D_(_arg1:Number = 0, _arg2:Number = 1):Number {
        var _local3:Number = (this._M_L_() / 2147483647);
        var _local4:Number = (this._M_L_() / 2147483647);
        var _local5:Number = (Math.sqrt((-2 * Math.log(_local3))) * Math.cos(((2 * _local4) * Math.PI)));
        return ((_arg1 + (_local5 * _arg2)));
    }

    public function _0M_K_(_arg1:uint, _arg2:uint):uint {
        return ((((_arg1) == _arg2) ? _arg1 : (_arg1 + (this._M_L_() % (_arg2 - _arg1)))));
    }

    public function _0E_0(_arg1:Number, _arg2:Number):Number {
        return ((_arg1 + ((_arg2 - _arg1) * this._J_t())));
    }

    private function _M_L_():uint {
        var _local1:uint;
        var _local2:uint;
        _local2 = (16807 * (this.seed & 0xFFFF));
        _local1 = (16807 * (this.seed >> 16));
        _local2 = (_local2 + ((_local1 & 32767) << 16));
        _local2 = (_local2 + (_local1 >> 15));
        if (_local2 > 2147483647) {
            _local2 = (_local2 - 2147483647);
        }
        return ((this.seed = _local2));
    }

}
}//package com.company.util

