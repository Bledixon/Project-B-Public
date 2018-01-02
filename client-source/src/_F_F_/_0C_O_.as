// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_F_._0C_O_

package _F_F_ {
import _W_D_._G_J_;
import _W_D_._0I_H_;

import _02b._0D_5;

import _4X_._E_h;

import _U_5._dd;

import _F_1._U_W_;

import _4X_._o8;
import _4X_._03L_;

public class _0C_O_ {

    [Inject]
    public var _0K_K_:_G_J_;
    [Inject]
    public var _0I_s:_0I_H_;
    [Inject]
    public var _ys:_0D_5;
    [Inject]
    public var _H_d:_E_h;
    [Inject]
    public var _T__:_dd;

    public function execute():void {
        if ((((this._0I_s._T_1.accountId_ == -1)) && (this._0K_K_._sr))) {
            this._04a();
        } else {
            this._T__.dispatch(new _U_W_());
        }
    }

    private function _04a():void {
        this._0K_K_._dA_ = true;
        var _local1:_o8 = new _o8();
        _local1.add(this._ys);
        _local1.add(new _03L_(this._T__, new _U_W_()));
        this._H_d.add(_local1);
        _local1.start();
    }

}
}//package _F_F_

