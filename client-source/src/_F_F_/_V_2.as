// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_F_._V_2

package _F_F_ {
import _W_D_.Domain;

import _U_5._dd;

import com.company.assembleegameclient.util.loadEmbeds;

import _F_1._E_r;

import _0I_9._05b;

import flash.display.Sprite;

public class _V_2 {

    [Inject]
    public var domain:Domain;
    [Inject]
    public var _T__:_dd;

    public function execute():void {
        this._T__.dispatch(this._0E_M_());
    }

    private function _0E_M_():Sprite {
        return (((this.domain._F_N_()) ? new _E_r() : new _05b()));
    }

}
}//package _F_F_

