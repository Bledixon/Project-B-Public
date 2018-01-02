// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._h0

package _03T_ {
import _0_p._fq;

import _0_p._Q_5;


public class _h0 implements _fq {

    private const _nW_:Vector.<_fq> = new Vector.<_fq>();

    private var _0A_N_:uint = 16;

    public function get _39():uint {
        return (this._0A_N_);
    }

    public function set _39(_arg1:uint):void {
        this._0A_N_ = _arg1;
    }

    public function _0H_4(_arg1:Object):_Q_5 {
        return (new _0B_F_(_arg1, this));
    }

    public function _J_3(_arg1:_fq):void {
        this._nW_.push(_arg1);
    }

    public function log(_arg1:Object, _arg2:uint, _arg3:int, _arg4:String, _arg5:Array = null):void {
        var _local6:_fq;
        if (_arg2 > this._0A_N_) {
            return;
        }
        for each (_local6 in this._nW_) {
            _local6.log(_arg1, _arg2, _arg3, _arg4, _arg5);
        }
    }

}
}//package _03T_

