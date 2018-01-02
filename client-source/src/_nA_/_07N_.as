// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_nA_._07N_

package _nA_ {
import _C__._cM_;

import _05Z_._D_m;

import _0M_m._00V_;
import _0M_m._j5;

import _0I_9._0J_r;

import _W_D_._B_d;

import _aD_._09h;
import _aD_._sv;

import _qN_.Account;

import _W_D_._0I_z;

import _0L_C_._2k;

public class _07N_ extends _cM_ {

    private static const _y:String = "In order to buy the Beginners package, you must be a registered user.";

    [Inject]
    public var view:_0F_U_;
    [Inject]
    public var _0H_j:_D_m;
    [Inject]
    public var beginnersPackage:_00V_;
    [Inject]
    public var _0J_E_:_j5;
    [Inject]
    public var _Q_l:_0J_r;
    [Inject]
    public var platform:_B_d;
    [Inject]
    public var _03B_:_09h;
    private var _08t:int;
    private var data:_sv;

    override public function initialize():void {
        this.view.buy.add(this._02m);
        this._0H_j.dispatch(false);
        this.beginnersPackage._14();
        if (Account._get().isRegistered()) {
            this.beginnersPackage._J_1.addOnce(this._o6);
            this.beginnersPackage._03K_();
        } else {
            this._B_();
        }
    }

    override public function destroy():void {
        this.view.buy.remove(this._02m);
        this._0H_j.dispatch(true);
    }

    private function _o6():void {
        this._08t = this.beginnersPackage._tT_();
        if (this._08t == 0) {
            this.view._U_B_();
        } else {
            this._iG_();
        }
    }

    private function _iG_():void {
        this._0J_E_._Z_8.addOnce(this._B_);
        this._0J_E_._002();
    }

    private function _B_():void {
        this.view._B_(this._08t);
    }

    private function _02m():void {
        if (Account._get().isRegistered()) {
            this._B_X_();
        } else {
            this._0L_q();
        }
    }

    private function _B_X_():void {
        this.data = new _sv();
        this.data.offer = this.beginnersPackage._ao();
        this._03B_.complete.addOnce(this._pY_);
        switch (this.platform._R_K_()) {
            case _0I_z._nB_:
            case _0I_z._kj:
                this.view._M_F_();
                this.view._hz.addOnce(this._D_K_);
                return;
            default:
                this._03B_._U_Z_(this.data);
        }
    }

    private function _D_K_(_arg1:String):void {
        this.data.paymentMethod = _arg1;
        this._03B_._U_Z_(this.data);
    }

    private function _pY_():void {
        this.beginnersPackage._xh();
        this.view.destroy();
    }

    private function _0L_q():void {
        this._Q_l._v7.addChild(new _2k(_y));
        this.view.destroy();
    }

}
}//package _nA_

