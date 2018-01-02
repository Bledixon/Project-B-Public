// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_lo._04G_

package _lo {
import flash.events.Event;

public class _04G_ extends Event {

    public static const _0B_x:String = "bindingEmpty";

    public function _04G_(_arg1:String) {
        super(_arg1);
    }

    override public function clone():Event {
        return (new _04G_(type));
    }

}
}//package _lo

