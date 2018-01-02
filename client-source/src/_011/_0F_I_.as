// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._0F_I_

package _011 {
import flash.utils.IDataInput;

public class _0F_I_ extends _01Q_ {

    public function _0F_I_(_arg1:uint) {
        super(_arg1);
    }
    public var serial_:int;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.serial_ = _arg1.readInt();
    }

    override public function toString():String {
        return (formatToString("PING", "serial_"));
    }

}
}//package _011

