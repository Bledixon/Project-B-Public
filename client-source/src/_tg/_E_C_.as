// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_tg._E_C_

package _tg {
import flash.events.Event;
import flash.display.BitmapData;

public class _E_C_ extends Event {

    public static const ADD_PICTURE_EVENT:String = "ADD_PICTURE_EVENT";

    public function _E_C_(_arg1:BitmapData) {
        super(ADD_PICTURE_EVENT, true);
        this.bitmapData_ = _arg1;
    }
    public var bitmapData_:BitmapData;
}
}//package _tg

