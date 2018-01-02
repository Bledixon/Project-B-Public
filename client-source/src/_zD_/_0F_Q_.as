// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._0F_Q_

package _zD_ {
import _C__._cM_;

import _F_1._0H_h;

import _U_5._dd;

import _F_1._C_Q_;

public class _0F_Q_ extends _cM_ {

    [Inject]
    public var view:_0H_h;
    [Inject]
    public var _T__:_dd;

    override public function initialize():void {
        this.view.close.add(this._0H_N_);
        this.view.initialize();
    }

    override public function destroy():void {
        this.view.close.remove(this._0H_N_);
    }

    private function _0H_N_():void {
        this._T__.dispatch(new _C_Q_());
    }

}
}//package _zD_

