// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9u._074

package _9u {
import _0_p._v;

import _eZ_._08b;

import _W_D_._B_d;

import _aD_._09h;

import _W_D_._0I_z;

import _aD_._G_a;

public class _074 implements _v {

    [Inject]
    public var _O_R_:_08b;
    [Inject]
    public var _0K_y:_B_d;

    public function configure():void {
        this._O_R_.map(_09h)._02g(this._085());
    }

    private function _085():Class {
        switch (this._0K_y._R_K_()) {
            case _0I_z._nB_:
            case _0I_z._kj:
            default:
                return (_G_a);
        }
    }

}
}//package _9u

