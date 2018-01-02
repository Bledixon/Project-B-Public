// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.math._kv

package com.hurlant.math {
import com.hurlant.math._03Q_;
import com.hurlant.math.bi_internal;
import com.hurlant.math.*;

use namespace bi_internal;

internal class _kv implements _0E_z {

    public function _kv(_arg1:_03Q_) {
        this.m = _arg1;
        this._7R_ = _arg1._else_();
        this._R_3 = (this._7R_ & 32767);
        this._c7 = (this._7R_ >> 15);
        this._0M_I_ = ((1 << (_03Q_._o3 - 15)) - 1);
        this._0J_c = (2 * _arg1.t);
    }
    private var m:_03Q_;
    private var _7R_:int;
    private var _R_3:int;
    private var _c7:int;
    private var _0M_I_:int;
    private var _0J_c:int;

    public function _0M_x(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        _arg1.abs()._6(this.m.t, _local2);
        _local2._gK_(this.m, null, _local2);
        if ((((_arg1.s < 0)) && ((_local2._Y_U_(_03Q_._lP_) > 0)))) {
            this.m._kA_(_local2, _local2);
        }
        return (_local2);
    }

    public function _sh(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        _arg1.copyTo(_local2);
        this._031(_local2);
        return (_local2);
    }

    public function _031(_arg1:_03Q_):void {
        var _local3:int;
        var _local4:int;
        while (_arg1.t <= this._0J_c) {
            var _local5 = _arg1.t++;
            _arg1.a[_local5] = 0;
        }
        var _local2:int;
        while (_local2 < this.m.t) {
            _local3 = (_arg1.a[_local2] & 32767);
            _local4 = (((_local3 * this._R_3) + ((((_local3 * this._c7) + ((_arg1.a[_local2] >> 15) * this._R_3)) & this._0M_I_) << 15)) & _03Q_._F_i);
            _local3 = (_local2 + this.m.t);
            _arg1.a[_local3] = (_arg1.a[_local3] + this.m.am(0, _local4, _arg1, _local2, 0, this.m.t));
            while (_arg1.a[_local3] >= _03Q_._2R_) {
                _arg1.a[_local3] = (_arg1.a[_local3] - _03Q_._2R_);
                _local5 = _arg1.a;
                var _local6 = ++_local3;
                _local5[_local6] = (_local5[_local6] + 1);
            }
            _local2++;
        }
        _arg1._F_b();
        _arg1._Q_Z_(this.m.t, _arg1);
        if (_arg1._Y_U_(this.m) >= 0) {
            _arg1._kA_(this.m, _arg1);
        }
    }

    public function _sb(_arg1:_03Q_, _arg2:_03Q_):void {
        _arg1._R_o(_arg2);
        this._031(_arg2);
    }

    public function _05a(_arg1:_03Q_, _arg2:_03Q_, _arg3:_03Q_):void {
        _arg1._G_8(_arg2, _arg3);
        this._031(_arg3);
    }

}
}//package com.hurlant.math

