// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_j._M_V_

package _0_j {
import _060._P_2;

import _qD_._s_;

import _4x._0I_y;

public class _M_V_ extends _P_2 {

    public function _M_V_(_arg1:_s_, _arg2:_0I_y, _arg3:_0I_y) {
        this._fD_ = _arg1;
        this._0_a = (((_arg2) != null) ? _arg2.clone() : null);
        this._00t = (((_arg3) != null) ? _arg3.clone() : null);
    }
    public var _fD_:_s_;
    public var _0_a:_0I_y;
    public var _00t:_0I_y;

    override public function execute():void {
        this._fD_._L_V_(this._00t);
    }

    override public function unexecute():void {
        this._fD_._L_V_(this._0_a);
    }

}
}//package _0_j

