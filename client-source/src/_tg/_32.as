// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_tg._32

package _tg {
import flash.events.Event;

public class _32 extends Event {

    public static const DELETE_PICTURE_EVENT:String = "DELETE_PICTURE_EVENT";

    public function _32(_arg1:String, _arg2:int) {
        super(DELETE_PICTURE_EVENT, true);
        this.name_ = _arg1;
        this.id_ = _arg2;
    }
    public var name_:String;
    public var id_:int;
}
}//package _tg

