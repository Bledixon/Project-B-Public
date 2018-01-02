// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._08K_

package _011 {
import flash.utils.IDataInput;

public class GetTextInput extends _01Q_ {

    public function GetTextInput(_arg1:uint) {
        super(_arg1);
    }

    public var name_:String;
    public var action_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.name_ = _arg1.readUTF();
        this.action_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("GETTEXTINPUT", "name_", "action_"));
    }

}
}//package _011

