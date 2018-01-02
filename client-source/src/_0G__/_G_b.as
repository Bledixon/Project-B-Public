// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G__._G_b

package _0G__ {
import _W_D_._0I_H_;

import _U_5._dd;

import flash.display.Sprite;

import _4X_._E_h;

import _02b._0D_5;

import _F_1._zf;

import _4X_._o8;
import _4X_._03L_;

public class _G_b {

    [Inject]
    public var _0I_s:_0I_H_;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var view:Sprite;
    [Inject]
    public var _H_d:_E_h;
    [Inject]
    public var _ys:_0D_5;

    public function execute():void {
        if (this._0I_s._34) {
            this._qx();
        } else {
            this._T__.dispatch(this.view);
        }
    }

    private function _qx():void {
        this._T__.dispatch(new _zf());
        var _local1:_o8 = new _o8();
        _local1.add(this._ys);
        _local1.add(new _03L_(this._T__, this.view));
        this._H_d.add(_local1);
        _local1.start();
    }

}
}//package _0G__

