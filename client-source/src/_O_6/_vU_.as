// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_O_6._vU_

package _O_6 {
import _mY_._07T_;
import _mY_._0C_j;
import _mY_._0A_k;

import flash.utils.Dictionary;

import _W_G_._09a;

import _A_G_._0A_Z_;

import _mY_._0D_c;

import _A_G_._08I_;

public class _vU_ implements _07T_, _0C_j, _0A_k {

    private const _0K_E_:Dictionary = new Dictionary();

    public function _vU_(_arg1:_09a, _arg2:_0A_Z_) {
        this._matcher = _arg1;
        this._handler = _arg2;
    }
    private var _matcher:_09a;
    private var _handler:_0A_Z_;

    public function _Y_u(_arg1:Class):_0D_c {
        return (((this._0L_y(_arg1)) || (this._21(_arg1))));
    }

    public function _vl(_arg1:Class):_08I_ {
        return (this._0K_E_[_arg1]);
    }

    public function _04_(_arg1:Class):void {
        var _local2:_08I_ = this._0K_E_[_arg1];
        delete this._0K_E_[_arg1];
        this._handler._0A_W_(_local2);
    }

    public function _08h():void {
        var _local1:_08I_;
        for each (_local1 in this._0K_E_) {
            delete this._0K_E_[_local1._T_X_];
            this._handler._0A_W_(_local1);
        }
    }

    private function _21(_arg1:Class):_3C_ {
        var _local2:_3C_ = new _3C_(this._matcher, _arg1);
        this._handler._J_w(_local2);
        this._0K_E_[_arg1] = _local2;
        return (_local2);
    }

    private function _0L_y(_arg1:Class):_3C_ {
        var _local2:_3C_ = this._0K_E_[_arg1];
        if (_local2) {
            _local2._0D_p();
        }
        return (_local2);
    }

}
}//package _O_6

