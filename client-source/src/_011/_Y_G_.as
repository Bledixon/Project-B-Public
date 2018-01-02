// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._Y_G_

package _011 {
import flash.utils.IDataInput;

public class _Y_G_ extends _01Q_ {

    public function _Y_G_(_arg1:uint) {
        super(_arg1);
    }
    public var name_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.name_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("TRADEREQUESTED", "name_"));
    }

}
}//package _011

