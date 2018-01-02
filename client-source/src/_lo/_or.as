// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_lo._or

package _lo {
import flash.events.Event;
import flash.display.DisplayObjectContainer;

public class _or extends Event {

    public static const _0K_h:String = "containerAdd";
    public static const _mh:String = "containerRemove";
    public static const _Y_N_:String = "rootContainerAdd";
    public static const _O_U_:String = "rootContainerRemove";

    public function _or(_arg1:String, _arg2:DisplayObjectContainer) {
        super(_arg1);
        this._0J_w = _arg2;
    }
    private var _0J_w:DisplayObjectContainer;

    public function get container():DisplayObjectContainer {
        return (this._0J_w);
    }

    override public function clone():Event {
        return (new _or(type, this._0J_w));
    }

}
}//package _lo

