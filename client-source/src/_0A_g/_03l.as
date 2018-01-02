// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._03l

package _0A_g {
import flash.utils.IDataOutput;

public class _03l extends _R_q {

    public function _03l(_arg1:uint) {
        super(_arg1);
    }
    public var objectId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.objectId_);
    }

    override public function toString():String {
        return (formatToString("USEPORTAL", "objectId_"));
    }

}
}//package _0A_g

