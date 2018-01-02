// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_G_A_._F_y

package _G_A_ {
import _0_p._v;
import _0_p._L_y;

import flash.display.DisplayObjectContainer;

import _eZ_._08b;

import _E_E_._U_A_;

import _A_G_._v1;

import _0I_9._0J_r;

import _W_D_._B_d;
import _W_D_._0M_A_;
import _W_D_.Domain;
import _W_D_._0I_H_;
import _W_D_._G_J_;

import _U_5._D_c;

import _0G__._Y_R_;
import _0G__._ci;

import _U_5._7e;

import _0G__._V_i;

import _U_5._0_D_;

import _0G__._ki;

import _U_5._M_d;

import _0G__._0H_1;

import _U_5._01W_;

import _0G__._G_b;

import _U_5._06a;

import _0G__._05L_;

import _4X_._E_h;

import _02b._0D_5;
import _02b._Y_p;
import _02b._0F_A_;
import _02b._6E_;

import _U_5._dd;
import _U_5._6J_;
import _U_5._0K_2;
import _U_5._sC_;
import _U_5._sT_;
import _U_5._bo;
import _U_5._zz;

import _0I_9._B_C_;
import _0I_9._C_6;
import _0I_9._gq;

public class _F_y implements _v {

    [Inject]
    public var context:_L_y;
    [Inject]
    public var _fR_:DisplayObjectContainer;
    [Inject]
    public var _O_R_:_08b;
    [Inject]
    public var _1G_:_U_A_;
    [Inject]
    public var mediatorMap:_v1;
    private var _Q_l:_0J_r;

    public function configure():void {
        this._A_v();
        this._ml();
        this._T_u();
        this._M_7();
        this._xD_();
        this.context._iL_._3a(this.init);
    }

    private function _A_v():void {
        this._O_R_.map(_B_d)._hZ_();
        this._O_R_.map(_0M_A_)._hZ_();
        this._O_R_.map(Domain)._hZ_();
        this._O_R_.map(_0I_H_)._hZ_();
        this._O_R_.map(_G_J_)._hZ_();
    }

    private function _ml():void {
        this._1G_.map(_D_c, true)._1N_(_Y_R_);
        //this._1G_.map(_D_c, true)._1N_(_ci);
        //this._1G_.map(_7e)._1N_(_V_i);
        //this._1G_.map(_0_D_)._1N_(_ki);
        this._1G_.map(_M_d)._1N_(_0H_1);
        this._1G_.map(_01W_)._1N_(_G_b);
        this._1G_.map(_06a)._1N_(_05L_);
    }

    private function _T_u():void {
        this._O_R_.map(_E_h)._hZ_();
        this._O_R_.map(_0D_5);
        this._O_R_.map(_Y_p);
        this._O_R_.map(_0F_A_);
        this._O_R_.map(_6E_)._hZ_();
    }

    private function _M_7():void {
        this._O_R_.map(_dd)._hZ_();
        this._O_R_.map(_6J_)._hZ_();
        this._O_R_.map(_0K_2)._hZ_();
        this._O_R_.map(_sC_)._hZ_();
        this._O_R_.map(_sT_)._hZ_();
        this._O_R_.map(_bo)._hZ_();
        this._O_R_.map(_zz)._q3(new _zz());
    }

    private function _xD_():void {
        this._Q_l = new _0J_r();
        this._O_R_.map(_0J_r)._q3(this._Q_l);
        this._fR_.addChild(this._Q_l);
        this.mediatorMap.map(projectblogo)._Y_u(_B_C_);
        this.mediatorMap.map(_C_6)._Y_u(_gq);
    }

    private function init():void {
        this.mediatorMap._jS_(this._fR_);
        this._Q_l._Q_h.addChild(new _C_6());
    }

}
}//package _G_A_

