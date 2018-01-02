// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0J_k._Q_m

package _0J_k {
import flash.utils.Dictionary;

import _eZ_._N_p;

import flash.utils.getQualifiedClassName;

public class _Q_m {

    public function _Q_m(_arg1:Boolean = true) {
        if (_arg1) {
            this.ctor = new _00m();
        }
    }
    public var ctor:_N_D_;
    public var injectionPoints:_5W_;
    public var __case:_tv;
    private var _y_:Boolean;

    public function _V_9(_arg1:Array, _arg2:Array = null, _arg3:uint = 2147483647, _arg4:Dictionary = null):_Q_m {
        this.ctor = new _N_D_(this._st(_arg1, ((_arg2) || ([]))), _arg3, _arg4);
        return (this);
    }

    public function _88(_arg1:String, _arg2:Class, _arg3:String = "", _arg4:Boolean = false, _arg5:Dictionary = null):_Q_m {
        if (this._y_) {
            throw (new _N_p("Can't add injection point after post construct method"));
        }
        this._ph(new _0J_f(((getQualifiedClassName(_arg2) + "|") + _arg3), _arg1, _arg4, _arg5));
        return (this);
    }

    public function _J_A_(_arg1:String, _arg2:Array, _arg3:Array = null, _arg4:uint = 2147483647, _arg5:Boolean = false, _arg6:Dictionary = null):_Q_m {
        if (this._y_) {
            throw (new _N_p("Can't add injection point after post construct method"));
        }
        this._ph(new _Z_T_(_arg1, this._st(_arg2, ((_arg3) || ([]))), Math.min(_arg4, _arg2.length), _arg5, _arg6));
        return (this);
    }

    public function _jw(_arg1:String, _arg2:Array, _arg3:Array = null, _arg4:uint = 2147483647):_Q_m {
        this._y_ = true;
        this._ph(new _kG_(_arg1, this._st(_arg2, ((_arg3) || ([]))), Math.min(_arg4, _arg2.length), 0));
        return (this);
    }

    public function _I_L_(_arg1:String, _arg2:Array, _arg3:Array = null, _arg4:uint = 2147483647):_Q_m {
        var _local5:_tv = new _tv(_arg1, this._st(_arg2, ((_arg3) || ([]))), Math.min(_arg4, _arg2.length), 0);
        if (this.__case) {
            this.__case._jO_.next = _local5;
            this.__case._jO_ = _local5;
        } else {
            this.__case = _local5;
            this.__case._jO_ = _local5;
        }
        return (this);
    }

    public function _ph(_arg1:_5W_):void {
        if (this.injectionPoints) {
            this.injectionPoints._jO_.next = _arg1;
            this.injectionPoints._jO_ = _arg1;
        } else {
            this.injectionPoints = _arg1;
            this.injectionPoints._jO_ = _arg1;
        }
    }

    private function _st(_arg1:Array, _arg2:Array):Array {
        var _local3:Array = new Array(_arg1.length);
        var _local4:int = _local3.length;
        while (_local4--) {
            _local3[_local4] = ((getQualifiedClassName(_arg1[_local4]) + "|") + ((_arg2[_local4]) || ("")));
        }
        return (_local3);
    }

}
}//package _0J_k

