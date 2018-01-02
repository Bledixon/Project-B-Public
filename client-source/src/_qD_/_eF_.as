// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._eF_

package _qD_ {
import flash.events.Event;


public class _eF_ extends Event {

    public static const SET_PIXELS_EVENT:String = "SET_PIXELS_EVENT";

    public function _eF_(_arg1:Vector.<_L_e>) {
        super(SET_PIXELS_EVENT, true);
        this._R_D_ = _arg1;
    }
    public var _R_D_:Vector.<_L_e>;
}
}//package _qD_

