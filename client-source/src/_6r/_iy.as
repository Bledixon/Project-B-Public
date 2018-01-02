// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_6r._iy

package _6r {
import _C__._cM_;

import _U_5._sC_;
import _U_5._sT_;

import _E_7._for_;

public class _iy extends _cM_ {

    [Inject]
    public var view:_0F_X_;
    [Inject]
    public var _0C__:_sC_;
    [Inject]
    public var _H_F_:_sT_;

    override public function initialize():void {
        this._0C__.add(this._06X_);
        this._H_F_.add(this._rG_);
    }

    override public function destroy():void {
        this._0C__.remove(this._06X_);
        this._H_F_.remove(this._rG_);
    }

    private function _06X_(_arg1:_for_):void {
        this.view.show(_arg1);
    }

    private function _rG_():void {
        this.view.hide();
    }

}
}//package _6r

