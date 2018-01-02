// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._xQ_

package _D_d {
import flash.events.Event;

import com.company.util.IntPoint;

internal class _xQ_ extends Event {

    public static const TILES_EVENT:String = "TILES_EVENT";

    public function _xQ_(_arg1:Vector.<IntPoint>) {
        super(TILES_EVENT);
        this.tiles_ = _arg1;
    }
    public var tiles_:Vector.<IntPoint>;
}
}//package _D_d

