// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_tg._07k

package _tg {
import flash.events.Event;
import flash.display.BitmapData;

public class _07k extends Event {

    public static const LOAD_COMPLETE_EVENT:String = "LOAD_COMPLETE_EVENT";

    public function _07k(_arg1:String, _arg2:int, _arg3:String, _arg4:BitmapData) {
        super(LOAD_COMPLETE_EVENT);
        this.name_ = _arg1;
        this.type_ = _arg2;
        this._0D_z = _arg3;
        this.bitmapData_ = _arg4;
    }
    public var name_:String;
    public var type_:int;
    public var _0D_z:String;
    public var bitmapData_:BitmapData;

    override public function clone():Event {
        return (new _07k(this.name_, this.type_, this._0D_z, this.bitmapData_));
    }

}
}//package _tg

