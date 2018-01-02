// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_T_Y_._4A_

package _T_Y_ {
import _0_p._fq;
import _0_p._L_y;
import _0_p._C_P_;

public class _4A_ implements _fq {

    private const _Z_p:_08n = new _08n();

    public function _4A_(_arg1:_L_y) {
        this._rA_ = _arg1;
    }
    private var _rA_:_L_y;

    public function log(_arg1:Object, _arg2:uint, _arg3:int, _arg4:String, _arg5:Array = null):void {
        trace(((((((((_arg3 + " ") + _C_P_._A_n[_arg2]) + " ") + this._rA_) + " ") + _arg1) + " - ") + this._Z_p._nx(_arg4, _arg5)));
    }

}
}//package _T_Y_

