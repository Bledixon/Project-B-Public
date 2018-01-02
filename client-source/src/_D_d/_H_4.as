// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._H_4

package _D_d {
import _060._H_G_;

import com.company.util._H_V_;

import _060._0F_z;
import _060._rp;

public class _H_4 extends _H_G_ {

    public static const _C_7:int = 0;
    public static const _3O_:int = 1;
    public static const _001:int = 2;
    public static const _mt:int = 3;
    public static const _X_V_:int = 4;

    public function _H_4() {
        _6B_("(D)raw", _H_V_.D, this.select, _3O_);
        _6B_("(E)rase", _H_V_.E, this.select, _001);
        _6B_("S(A)mple", _H_V_.A, this.select, _mt);
        _6B_("Ed(I)t", _H_V_.I, this.select, _X_V_);
        _6B_("(U)ndo", _H_V_.U, this._ck, _C_7);
        _6B_("(R)edo", _H_V_.R, this._0I_x, _C_7);
        _6B_("(C)lear", _H_V_.C, this._hm, _C_7);
        _034();
        _6B_("(L)oad", _H_V_.L, this._0E_o, _C_7);
        _6B_("(S)ave", _H_V_.S, this._na, _C_7);
        _6B_("(T)est", _H_V_.T, this._W_o, _C_7);
    }

    private function select(_arg1:_0F_z):void {
        setSelected(_arg1);
    }

    private function _ck(_arg1:_0F_z):void {
        dispatchEvent(new _rp(_rp.UNDO_COMMAND_EVENT));
    }

    private function _0I_x(_arg1:_0F_z):void {
        dispatchEvent(new _rp(_rp.REDO_COMMAND_EVENT));
    }

    private function _hm(_arg1:_0F_z):void {
        dispatchEvent(new _rp(_rp.CLEAR_COMMAND_EVENT));
    }

    private function _0E_o(_arg1:_0F_z):void {
        dispatchEvent(new _rp(_rp.LOAD_COMMAND_EVENT));
    }

    private function _na(_arg1:_0F_z):void {
        dispatchEvent(new _rp(_rp.SAVE_COMMAND_EVENT));
    }

    private function _W_o(_arg1:_0F_z):void {
        dispatchEvent(new _rp(_rp.TEST_COMMAND_EVENT));
    }

}
}//package _D_d

