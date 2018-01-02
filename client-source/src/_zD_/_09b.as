// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._09b

package _zD_ {
import _C__._cM_;

import _F_1._U_W_;

import _W_D_._0I_H_;
import _W_D_._G_J_;

import _U_5._dd;
import _U_5._6J_;
import _U_5._0_D_;

import _02b._Y_p;

import _4X_._zU_;

import _F_1._3V_;

public class _09b extends _cM_ {

    [Inject]
    public var view:_U_W_;
    [Inject]
    public var _0I_s:_0I_H_;
    [Inject]
    public var _0K_K_:_G_J_;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var _S_a:_6J_;
    [Inject]
    public var _o_:_0_D_;
    [Inject]
    public var fame:_Y_p;

    override public function initialize():void {
        this.view._0M_S_.add(this._m9);
        var _local1 = !(this._0K_K_._sr);
        this.view._yK_(_local1);
        if (((this._0K_K_.info) && (this._0K_K_.info.background))) {
            this.view._K_f(this._0K_K_.info.background);
        }
        this._o_.dispatch("/fame");
        if (this._0K_K_._dA_) {
            this._0K_K_._dA_ = false;
            this.fame.accountId = this._0I_s._T_1.accountId_;
            this.fame.charId = this._0I_s._sy;
        } else {
            this.fame.accountId = this._0K_K_._Z__;
            this.fame.charId = this._0K_K_._J_u;
        }
        this.fame._iu.addOnce(this._qU_);
        this.fame.start();
    }

    override public function destroy():void {
        this.view._0M_S_.remove(this._m9);
        if (this._0K_K_.info) {
            ((this._0K_K_.info.background) && (this._0K_K_.info.background.dispose()));
            this._0K_K_.info.background = null;
        }
    }

    private function _qU_(_arg1:_zU_, _arg2:Boolean, _arg3:String = ""):void {
        this.view._tC_(this.fame.name, this.fame.level, this.fame._type);
        this.view._ec(this.fame._0N__, this.fame._pp);
        this.view._sQ_(this.fame.character);
        this.view._0__(this.fame._P_9, this.fame.xml);
    }

    private function _m9():void {
        if (this._0K_K_._sr) {
            this._T__.dispatch(new _3V_());
        } else {
            this._S_a.dispatch();
        }
    }

}
}//package _zD_

