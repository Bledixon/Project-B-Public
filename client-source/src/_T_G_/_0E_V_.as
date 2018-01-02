// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_T_G_._0E_V_

package _T_G_ {
import _E_x._F_B_;

import flash.utils.Dictionary;

import _g2._06n;

import _E_x._00J_;

import _g2._00d;

public class _0E_V_ implements _F_B_ {

    private const _qk:Dictionary = new Dictionary();
    private const _03_:_06n = new _8z();

    public function map(_arg1:_00J_):_00d {
        return ((this._qk[_arg1] = ((this._qk[_arg1]) || (new _fV_(_arg1)))));
    }

    public function _1Y_(_arg1:_00J_):_06n {
        return (((this._qk[_arg1]) || (this._03_)));
    }

}
}//package _T_G_

