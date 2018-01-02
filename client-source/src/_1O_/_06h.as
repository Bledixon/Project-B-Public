// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_1O_._06h

package _1O_ {
import _0_p._D_v;

import _lo._t5;

import _03T_._078;

import _eZ_._08b;

import _s3._im;

import _lo._5u;

import _0_p._L_y;

public class _06h implements _D_v {

    private const _ul:String = _078.create(_06h);
    private static var _mT_:_t5;
    private var _vz:_08b;
    private var _yv:_im;

    public function extend(_arg1:_L_y):void {
        this._vz = _arg1._O_R_;
        _mT_ = ((_mT_) || (new _t5()));
        this._vz.map(_t5)._q3(_mT_);
        this._vz.map(_im)._00S_(_5u);
        _arg1._iL_._0C_t(this._0C_t);
        _arg1._iL_._kf(this._kf);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _0C_t():void {
        this._yv = this._vz.getInstance(_im);
    }

    private function _kf():void {
        this._yv._F_P_();
        this._vz._1Y_(_im);
        this._vz._1Y_(_t5);
    }

}
}//package _1O_

