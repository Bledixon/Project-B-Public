// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.math._gb

package com.hurlant.math {
import com.hurlant.math._03Q_;
import com.hurlant.math.bi_internal;

use namespace bi_internal;

internal class _gb implements _0E_z {

    public function _gb(_arg1:_03Q_) {
        this._7o = new _03Q_();
        this._6W_ = new _03Q_();
        _03Q_._override._6((2 * _arg1.t), this._7o);
        this._6Q_ = this._7o._jd(_arg1);
        this.m = _arg1;
    }
    private var m:_03Q_;
    private var _7o:_03Q_;
    private var _6W_:_03Q_;
    private var _6Q_:_03Q_;

    public function _sh(_arg1:_03Q_):_03Q_ {
        return (_arg1);
    }

    public function _05a(_arg1:_03Q_, _arg2:_03Q_, _arg3:_03Q_):void {
        _arg1._G_8(_arg2, _arg3);
        this._031(_arg3);
    }

    public function _sb(_arg1:_03Q_, _arg2:_03Q_):void {
        _arg1._R_o(_arg2);
        this._031(_arg2);
    }

    public function _0M_x(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_;
        if ((((_arg1.s < 0)) || ((_arg1.t > (2 * this.m.t))))) {
            return (_arg1._ln(this.m));
        }
        if (_arg1._Y_U_(this.m) < 0) {
            return (_arg1);
        }
        _local2 = new _03Q_();
        _arg1.copyTo(_local2);
        this._031(_local2);
        return (_local2);
    }

    public function _031(_arg1:_03Q_):void {
        var _local2:_03Q_ = (_arg1 as _03Q_);
        _local2._Q_Z_((this.m.t - 1), this._7o);
        if (_local2.t > (this.m.t + 1)) {
            _local2.t = (this.m.t + 1);
            _local2._F_b();
        }
        this._6Q_._T_t(this._7o, (this.m.t + 1), this._6W_);
        this.m._0E_g(this._6W_, (this.m.t + 1), this._7o);
        while (_local2._Y_U_(this._7o) < 0) {
            _local2._u(1, (this.m.t + 1));
        }
        _local2._kA_(this._7o, _local2);
        while (_local2._Y_U_(this.m) >= 0) {
            _local2._kA_(this.m, _local2);
        }
    }

}
}//package com.hurlant.math

