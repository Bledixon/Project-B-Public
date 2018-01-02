package _0A_g {
import flash.utils.IDataOutput;

public class ItemSelectResult extends _R_q {

    public function ItemSelectResult(_arg1:uint) {
        super(_arg1);
    }

    public var slot_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.slot_);
    }

    override public function toString():String {
        return formatToString("ITEMSELECTRESULT", "slot_");
    }
}
}
