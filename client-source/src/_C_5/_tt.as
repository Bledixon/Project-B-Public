// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_C_5._tt

package _C_5 {
import _0_p._v;

import _eZ_._08b;

import _A_G_._v1;

import _E_E_._U_A_;

import _05Z_._D_m;

import com.company.assembleegameclient.game.GameSprite;

import _R_e._L_Z_;

import _05Z_._08i;

import _0J_2._qQ_;

public class _tt implements _v {

    [Inject]
    public var _O_R_:_08b;
    [Inject]
    public var mediatorMap:_v1;
    [Inject]
    public var _1G_:_U_A_;

    public function configure():void {
        this._O_R_.map(_D_m)._hZ_();
        this.mediatorMap.map(GameSprite)._Y_u(_L_Z_);
        this._1G_.map(_08i)._1N_(_qQ_);
    }

}
}//package _C_5

