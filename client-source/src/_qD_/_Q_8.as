// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._Q_8

package _qD_ {
import flash.events.Event;

import _4x._0I_y;

public class _Q_8 extends Event {

    public static const PIXEL_EVENT:String = "PIXEL_EVENT";
    public static const TEMP_PIXEL_EVENT:String = "TEMP_PIXEL_EVENT";
    public static const UNDO_TEMP_EVENT:String = "UNDO_TEMP_EVENT";

    public function _Q_8(_arg1:String, _arg2:_s_) {
        super(_arg1, true);
        this._fD_ = _arg2;
        this._0_a = this._fD_._U_d;
    }
    public var _fD_:_s_;
    public var _0_a:_0I_y;
}
}//package _qD_

