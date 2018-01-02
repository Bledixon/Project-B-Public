// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_U_._K_a

package _U_ {
import _0_p._v;

import _eZ_._08b;

import _0I_9._0J_r;

import _A_G_._v1;

import _E_E_._U_A_;

import _U_5._D_c;

import _F_F_._V_2;

import _U_5._06a;

import _F_F_._0C_O_;

import _U_5._V_l;

import _0G__._E_Z_;

import _U_5._057;

import _0G__._M_y;

import _F_1._zf;

import _zD_._0D_h;

import _F_1._E_r;

import _zD_._uf;

import _F_1._01_;

import _zD_._N_N_;

import _F_1._0H_h;

import _zD_._0F_Q_;

import _F_1.CurrentCharacterScreen;

import _zD_._xF_;

import _F_1._05p;

import _zD_._V_M_;

import _F_1._C_Q_;

import _zD_.__for;

import _F_1._3V_;

import _zD_._fy;

import _F_1._0H_2;

import _zD_._2H_;

import _D_d._hj;

import _zD_._0D_L_;

import com.company.assembleegameclient.screens.charrects.CurrentCharacterRect;

import _zD_._9M_;

import com.company.assembleegameclient.screens.charrects.CharacterRectList;

import _zD_._G_I_;

import _0L_C_._0G_y;

import _zD_._1k;

import _0L_C_._Z_t;

import _zD_._E_G_;

import _F_1._U_W_;

import _zD_._09b;

import _F_1._0B_m;

import _zD_.__else;

import _0L_C_._0D_W_;

import _zD_._Q_q;

import _0L_C_._s7;

import _zD_._G_9;

import _F_1._02a;

import _zD_._jT_;

import _0M_H_._sN_;
import _0M_H_._R_W_;
import _0M_H_._W_O_;

import _F_F_._0L_J_;

import _zD_._Y_w;
import _zD_._yP_;

import com.company.assembleegameclient.ui.InvTabs;

import _zD_._B_9;

public class _K_a implements _v {

    [Inject]
    public var _O_R_:_08b;
    [Inject]
    public var _Q_l:_0J_r;
    [Inject]
    public var mediatorMap:_v1;
    [Inject]
    public var _1G_:_U_A_;

    public function configure():void {
        this._1G_.map(_D_c, true)._1N_(_V_2);
        this._1G_.map(_06a)._1N_(_0C_O_);
        this._1G_.map(_V_l)._1N_(_E_Z_);
        this._1G_.map(_057)._1N_(_M_y);
        this.mediatorMap.map(_zf)._Y_u(_0D_h);
        this.mediatorMap.map(_E_r)._Y_u(_uf);
        this.mediatorMap.map(_01_)._Y_u(_N_N_);
        this.mediatorMap.map(_0H_h)._Y_u(_0F_Q_);
        this.mediatorMap.map(CurrentCharacterScreen)._Y_u(_xF_);
        this.mediatorMap.map(_05p)._Y_u(_V_M_);
        this.mediatorMap.map(_C_Q_)._Y_u(__for);
        this.mediatorMap.map(_3V_)._Y_u(_fy);
        this.mediatorMap.map(_0H_2)._Y_u(_2H_);
        this.mediatorMap.map(_hj)._Y_u(_0D_L_);
        this.mediatorMap.map(CurrentCharacterRect)._Y_u(_9M_);
        this.mediatorMap.map(CharacterRectList)._Y_u(_G_I_);
        this.mediatorMap.map(_0G_y)._Y_u(_1k);
        this.mediatorMap.map(_Z_t)._Y_u(_E_G_);
        this.mediatorMap.map(_U_W_)._Y_u(_09b);
        this.mediatorMap.map(_0B_m)._Y_u(__else);
        this.mediatorMap.map(_0D_W_)._Y_u(_Q_q);
        this.mediatorMap.map(_s7)._Y_u(_G_9);
        this.mediatorMap.map(_02a)._Y_u(_jT_);
        this._m6();
    }

    private function _m6():void {
        this._O_R_.map(_sN_)._q3(new _sN_());
        this._O_R_.map(_R_W_)._q3(new _R_W_());
        this._1G_.map(_W_O_)._1N_(_0L_J_);
        this.mediatorMap.map(_Y_w)._Y_u(_yP_);
        this.mediatorMap.map(InvTabs)._Y_u(_B_9);
    }

}
}//package _U_

