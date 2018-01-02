// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_c._b7

package _0I_c {
import flash.events.Event;

public class _b7 extends Event {

    public static const _X_b:String = "dataPrepareProgress";
    public static const _0C_C_:String = "dataPrepareComplete";

    public function _b7(_arg1:String, _arg2:uint = 0, _arg3:uint = 0) {
        super(_arg1);
        this.bytesTotal = _arg3;
        this._0G_n = _arg2;
    }
    public var _0G_n:uint = 0;
    public var bytesTotal:uint = 0;
}
}//package _0I_c

