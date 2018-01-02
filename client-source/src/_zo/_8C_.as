// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zo._8C_

package _zo {
import flash.events.Event;

public class _8C_ extends Event {

    public static const GENERIC_DATA:String = "GENERIC_DATA";

    public function _8C_(_arg1:Object) {
        super(GENERIC_DATA);
        this.data_ = _arg1;
    }
    public var data_:Object;

    override public function toString():String {
        return (formatToString(GENERIC_DATA, "data_"));
    }

}
}//package _zo

