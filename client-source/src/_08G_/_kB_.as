// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_08G_._kB_

package _08G_ {
import _0_p._D_v;

import _03T_._078;

import _eZ_._08b;

import _0_p._Q_5;

import _g3.instanceOf;

import flash.display.DisplayObjectContainer;

import _0_p._L_y;

public class _kB_ implements _D_v {

    private const _ul:String = _078.create(_kB_);

    private var _vz:_08b;
    private var _eo:_Q_5;

    public function extend(_arg1:_L_y):void {
        this._vz = _arg1._O_R_;
        this._eo = _arg1._0H_4(this);
        _arg1._ty(instanceOf(DisplayObjectContainer), this._uI_);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _uI_(_arg1:DisplayObjectContainer):void {
        if (this._vz._d6(DisplayObjectContainer)) {
            this._eo._0E_Q_("A contextView has already been mapped, ignoring {0}", [_arg1]);
        } else {
            this._eo.debug("Mapping {0} as contextView", [_arg1]);
            this._vz.map(DisplayObjectContainer)._q3(_arg1);
        }
    }

}
}//package _08G_

