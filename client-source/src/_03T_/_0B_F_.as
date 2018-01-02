// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._0B_F_

package _03T_ {
import _0_p._Q_5;
import _0_p._fq;

import flash.utils.getTimer;

public class _0B_F_ implements _Q_5 {

    public function _0B_F_(_arg1:Object, _arg2:_fq) {
        this._08C_ = _arg1;
        this._R_d = _arg2;
    }
    private var _08C_:Object;
    private var _R_d:_fq;

    public function debug(_arg1:*, _arg2:Array = null):void {
        this._R_d.log(this._08C_, 32, getTimer(), _arg1, _arg2);
    }

    public function info(_arg1:*, _arg2:Array = null):void {
        this._R_d.log(this._08C_, 16, getTimer(), _arg1, _arg2);
    }

    public function _0E_Q_(_arg1:*, _arg2:Array = null):void {
        this._R_d.log(this._08C_, 8, getTimer(), _arg1, _arg2);
    }

    public function error(_arg1:*, _arg2:Array = null):void {
        this._R_d.log(this._08C_, 4, getTimer(), _arg1, _arg2);
    }

    public function _0_6(_arg1:*, _arg2:Array = null):void {
        this._R_d.log(this._08C_, 2, getTimer(), _arg1, _arg2);
    }

}
}//package _03T_

