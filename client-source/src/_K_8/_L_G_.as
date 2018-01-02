// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_K_8._L_G_

package _K_8 {
import _C__._cM_;

import _0_j._kW_;

import _W_D_._0I_H_;

import _U_5._0_D_;

public class _L_G_ extends _cM_ {

    [Inject]
    public var view:_kW_;
    [Inject]
    public var _0I_s:_0I_H_;
    [Inject]
    public var _o_:_0_D_;

    override public function initialize():void {
        this.view.initialize(this._0I_s._T_1);
        this._o_.dispatch("/textureScreen");
    }

    override public function destroy():void {
        super.destroy();
    }

}
}//package _K_8

