// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0J_k._Z_T_

package _0J_k {
import flash.utils.Dictionary;

import _eZ_._08b;

import _Y_3._5d;

import _4u.SsInternal;

import _M_Q_._B_h;

import avmplus.getQualifiedClassName;

public class _Z_T_ extends _5W_ {

    private static const _0_N_:Array = [];

    public function _Z_T_(_arg1:String, _arg2:Array, _arg3:uint, _arg4:Boolean, _arg5:Dictionary) {
        this._0C_V_ = _arg1;
        this._C_d = _arg2;
        this._mm = _arg3;
        this._R_r = _arg4;
        this.injectParameters = _arg5;
    }
    protected var _C_d:Array;
    protected var _mm:int;
    private var _R_r:Boolean;
    private var _0C_V_:String;

    override public function applyInjection(_arg1:Object, _arg2:Class, _arg3:_08b):void {
        var _local4:Array = this._fx(_arg1, _arg2, _arg3);
        if (_local4.length >= this._mm) {
            (_arg1[this._0C_V_] as Function).apply(_arg1, _local4);
        }
        _local4.length = 0;
    }

    protected function _fx(_arg1:Object, _arg2:Class, _arg3:_08b):Array {
        var _local7:String;
        var _local8:_5d;
        var _local4:int = this._C_d.length;
        var _local5:Array = _0_N_;
        _local5.length = _local4;
        var _local6:int;
        while (_local6 < _local4) {
            _local7 = this._C_d[_local6];
            _local8 = _arg3.SsInternal::_L_E_(_local7);
            if (!_local8) {
                if ((((_local6 >= this._mm)) || (this._R_r))) break;
                throw (new _B_h(((((((((('Injector is missing a mapping to handle injection into target "' + _arg1) + '" of type "') + getQualifiedClassName(_arg2)) + '". \t\t\t\t\t\tTarget dependency: ') + _local7) + ", method: ") + this._0C_V_) + ", parameter: ") + (_local6 + 1))));
            }
            _local5[_local6] = _local8.apply(_arg2, _arg3, injectParameters);
            _local6++;
        }
        return (_local5);
    }

}
}//package _0J_k

