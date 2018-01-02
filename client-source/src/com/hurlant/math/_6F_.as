// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.math._6F_

package com.hurlant.math {
import com.hurlant.math._03Q_;
import com.hurlant.math.bi_internal;

use namespace bi_internal;

internal class _6F_ implements _0E_z {

    public function _6F_(_arg1:_03Q_) {
        this.m = _arg1;
    }
    private var m:_03Q_;

    public function _0M_x(_arg1:_03Q_):_03Q_ {
        if ((((_arg1.s < 0)) || ((_arg1._Y_U_(this.m) >= 0)))) {
            return (_arg1._ln(this.m));
        }
        return (_arg1);
    }

    public function _sh(_arg1:_03Q_):_03Q_ {
        return (_arg1);
    }

    public function _031(_arg1:_03Q_):void {
        _arg1._gK_(this.m, null, _arg1);
    }

    public function _05a(_arg1:_03Q_, _arg2:_03Q_, _arg3:_03Q_):void {
        _arg1._G_8(_arg2, _arg3);
        this._031(_arg3);
    }

    public function _sb(_arg1:_03Q_, _arg2:_03Q_):void {
        _arg1._R_o(_arg2);
        this._031(_arg2);
    }

}
}//package com.hurlant.math

