// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._00x

package _03T_ {
import flash.utils.Dictionary;

import _0B_K_._0I_q;
import _0B_K_._0D_C_;

import _0_p._L_y;
import _0_p._Q_5;

public class _00x {

    private const _ul:String = _078.create(_00x);
    private const __each:Dictionary = new Dictionary(true);
    private const _07e:_0I_q = new _0D_C_();

    public function _00x(_arg1:_L_y) {
        this._rA_ = _arg1;
        this._eo = this._rA_._0H_4(this);
    }
    private var _rA_:_L_y;
    private var _eo:_Q_5;

    public function _0M_y(_arg1:Object):void {
        var _local2:Class;
        if ((_arg1 is Class)) {
            ((this.__each[_arg1]) || (this._0M_y(new ((_arg1 as Class))())));
        } else {
            _local2 = this._07e.getClass(_arg1);
            if (this.__each[_local2]) {
                return;
            }
            this._eo.debug("Installing extension {0}", [_arg1]);
            this.__each[_local2] = true;
            _arg1.extend(this._rA_);
        }
    }

    public function toString():String {
        return (this._ul);
    }

}
}//package _03T_

