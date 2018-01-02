// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._k6

package _sP_ {
import flash.events.Event;

public class _k6 extends Event {

    public static const SET_RANK:String = "SET_RANK";
    public static const REMOVE_MEMBER:String = "REMOVE_MEMBER";

    public function _k6(_arg1:String, _arg2:String, _arg3:int = -1) {
        super(_arg1, true);
        this.name_ = _arg2;
        this._S_e = _arg3;
    }
    public var name_:String;
    public var _S_e:int;
}
}//package _sP_

