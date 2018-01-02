package _0A_g {
import flash.utils.IDataOutput;

public class Craft extends _R_q {

    public function Craft(_arg1:uint) {
        super(_arg1);
    }

    public var objectId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.objectId_);
    }

    override public function toString():String {
        return formatToString("CRAFT", "objectId_");
    }
}
}
