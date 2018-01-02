// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._ns

package _0A_g {
import flash.utils.IDataOutput;

public class _ns extends _R_q {

    public function _ns(_arg1:uint) {
        super(_arg1);
    }
    public var time_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
    }

    override public function toString():String {
        return (formatToString("GOTOACK", "time_"));
    }

}
}//package _0A_g

