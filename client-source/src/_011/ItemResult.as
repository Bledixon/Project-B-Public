// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._08K_

package _011 {
import flash.utils.IDataInput;

public class ItemResult extends _01Q_ {

    public function ItemResult(_arg1:uint) {
        super(_arg1);
    }

    public var item_:int;
    public var data_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.item_ = _arg1.readInt();
        this.data_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("ITEMRESULT", "item_", "data_"));
    }

}
}//package _011

