// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_I_j._V_4

package _I_j {
import _0_p._v;

import _eZ_._08b;

import _A_G_._v1;

import _E_E_._U_A_;

import _0M_m._j5;
import _0M_m._0E_v;
import _0M_m._00V_;
import _0M_m._E_e;

import _nA_._ax;
import _nA_._bN_;
import _nA_._0F_U_;
import _nA_._07N_;
import _nA_._O_g;
import _nA_._V_y;

import _P_E_._W_2;

import _R_S_._I_y;

public class _V_4 implements _v {

    [Inject]
    public var _O_R_:_08b;
    [Inject]
    public var mediatorMap:_v1;
    [Inject]
    public var _1G_:_U_A_;

    public function configure():void {
        this._O_R_.map(_j5)._00S_(_0E_v);
        this._O_R_.map(_00V_)._00S_(_E_e);
        this.mediatorMap.map(_ax)._Y_u(_bN_);
        this.mediatorMap.map(_0F_U_)._Y_u(_07N_);
        this.mediatorMap.map(_O_g)._Y_u(_V_y);
        this._1G_.map(_W_2)._1N_(_I_y);
    }

}
}//package _I_j

