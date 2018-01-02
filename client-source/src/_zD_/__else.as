// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_.__else

package _zD_ {
import _C__._cM_;

import _F_1._0B_m;

import _W_D_._G_J_;

import _U_5._dd;

import _F_1._U_W_;

public class __else extends _cM_ {

    [Inject]
    public var view:_0B_m;
    [Inject]
    public var _0I_s:_G_J_;
    [Inject]
    public var _T__:_dd;

    override public function initialize():void {
        this.view._H_r.add(this._c3);
    }

    override public function destroy():void {
        this.view._H_r.remove(this._c3);
    }

    private function _c3(_arg1:int):void {
        this._0I_s._Z__ = this.view.accountId;
        this._0I_s._J_u = _arg1;
        this._T__.dispatch(new _U_W_());
    }

}
}//package _zD_

