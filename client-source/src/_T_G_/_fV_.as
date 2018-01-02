// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_T_G_._fV_

package _T_G_ {
import _g2._00d;
import _g2._06n;

import flash.utils.Dictionary;

import _E_x._00J_;

import _g2._028;

import _E_x._K_T_;

public class _fV_ implements _00d, _06n {

    private const _0K_E_:Dictionary = new Dictionary();

    public function _fV_(_arg1:_00J_) {
        this._C_U_ = _arg1;
    }
    private var _C_U_:_00J_;

    public function _1N_(_arg1:Class):_028 {
        return (((this._D_t(this._0K_E_[_arg1])) || (this._21(_arg1))));
    }

    public function _f0(_arg1:Class):void {
        var _local2:_K_T_ = this._0K_E_[_arg1];
        ((_local2) && (this._C_U_._0A_W_(_local2)));
        delete this._0K_E_[_arg1];
    }

    public function _cp():void {
        var _local1:_K_T_;
        for each (_local1 in this._0K_E_) {
            this._C_U_._0A_W_(_local1);
            delete this._0K_E_[_local1.commandClass];
        }
    }

    private function _21(_arg1:Class):_0G_3 {
        var _local2:_0G_3 = new _0G_3(_arg1);
        this._C_U_._J_w(_local2);
        this._0K_E_[_arg1] = _local2;
        return (_local2);
    }

    private function _D_t(_arg1:_0G_3):_0G_3 {
        if (!_arg1) {
            return (null);
        }
        _arg1._0D_p();
        return (_arg1);
    }

}
}//package _T_G_

