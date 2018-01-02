// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._iD_

package _011 {
import flash.utils.IDataInput;

public class GlobalNotification extends _01Q_ {

    public function GlobalNotification(_arg1:uint) {
        super(_arg1);
    }
    public var _type:int;
    public var text:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this._type = _arg1.readInt();
        this.text = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("GLOBAL_NOTIFICATION", "type", "text"));
    }

}
}//package _011

