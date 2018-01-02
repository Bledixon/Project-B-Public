// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._1u

package com.company.util {
public class _1u {

    public function _1u() {
        this.clear();
    }
    public var _S_n:Number;
    public var _N_M_:Number;
    public var _D_B_:Number;
    public var _I_q:Number;

    public function add(_arg1:Number, _arg2:Number):void {
        if (_arg1 < this._S_n) {
            this._S_n = _arg1;
        }
        if (_arg2 < this._N_M_) {
            this._N_M_ = _arg2;
        }
        if (_arg1 > this._D_B_) {
            this._D_B_ = _arg1;
        }
        if (_arg2 > this._I_q) {
            this._I_q = _arg2;
        }
    }

    public function clear():void {
        this._S_n = Number.MAX_VALUE;
        this._N_M_ = Number.MAX_VALUE;
        this._D_B_ = Number.MIN_VALUE;
        this._I_q = Number.MIN_VALUE;
    }

    public function toString():String {
        return ((((((((("min:(" + this._S_n) + ", ") + this._N_M_) + ") max:(") + this._D_B_) + ", ") + this._I_q) + ")"));
    }

}
}//package com.company.util

