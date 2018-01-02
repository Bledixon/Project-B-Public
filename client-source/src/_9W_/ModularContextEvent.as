// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9W_.ModularContextEvent

package _9W_ {
import flash.events.Event;

import _0_p._L_y;

public class ModularContextEvent extends Event {

    public static const _qb:String = "contextAdd";
    public static const _L_D_:String = "contextRemove";

    public function ModularContextEvent(_arg1:String, _arg2:_L_y) {
        super(_arg1, true, true);
        this._rA_ = _arg2;
    }
    private var _rA_:_L_y;

    public function get context():_L_y {
        return (this._rA_);
    }

    override public function clone():Event {
        return (new ModularContextEvent(type, this.context));
    }

    override public function toString():String {
        return (formatToString("ModularContextEvent", "context"));
    }

}
}//package _9W_

