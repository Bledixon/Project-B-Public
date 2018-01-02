// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_H_h._0L_j

package _H_h {
import _0_p._D_v;

import _03T_._078;

import _eZ_._08b;

import _A_G_._v1;

import _s3._im;

import _O_6._zu;

import _A_G_._07A_;

import _O_6._x9;
import _O_6._Q_6;

import _0_p._L_y;

import _s3._yp;

public class _0L_j implements _D_v {

    private const _ul:String = _078.create(_0L_j);

    private var _vz:_08b;
    private var _R_j:_v1;
    private var _yv:_im;
    private var _60:_zu;

    public function extend(_arg1:_L_y):void {
        this._vz = _arg1._O_R_;
        this._vz.map(_07A_)._00S_(_x9);
        this._vz.map(_v1)._00S_(_Q_6);
        _arg1._iL_._8u(this._8u);
        _arg1._iL_._zi(this._zi);
        _arg1._iL_._kf(this._kf);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _8u():void {
        this._R_j = this._vz.getInstance(_v1);
        this._60 = this._vz.getInstance(_zu);
        if (this._vz._d6(_im)) {
            this._yv = this._vz.getInstance(_im);
            this._yv._eq((this._R_j as _yp));
        }
    }

    private function _zi():void {
        var _local1:_07A_ = this._vz.getInstance(_07A_);
        _local1._N_y();
        if (this._vz._d6(_im)) {
            this._yv = this._vz.getInstance(_im);
            this._yv._9k((this._R_j as _yp));
        }
    }

    private function _kf():void {
        if (this._vz._d6(_v1)) {
            this._vz._1Y_(_v1);
        }
        if (this._vz._d6(_07A_)) {
            this._vz._1Y_(_07A_);
        }
    }

}
}//package _H_h

