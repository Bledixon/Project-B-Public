// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._00q

package _011 {
import flash.display.BitmapData;
import flash.utils.IDataInput;

public class Death extends _01Q_ {

    public function Death(_arg1:uint) {
        super(_arg1);
    }
    public var accountId_:int;
    public var charId_:int;
    public var killedBy_:String;
    public var background:BitmapData;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.accountId_ = _arg1.readInt();
        this.charId_ = _arg1.readInt();
        this.killedBy_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("DEATH", "accountId_", "charId_", "killedBy_"));
    }

}
}//package _011

