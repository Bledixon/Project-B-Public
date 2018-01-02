// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._U_2

package _0A_g {
import flash.utils.IDataOutput;

public class _U_2 extends _R_q {

    public function _U_2(_arg1:uint) {
        super(_arg1);
    }
    public var name_:String;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeUTF(this.name_);
    }

    override public function toString():String {
        return (formatToString("CREATEGUILD", "name_"));
    }

}
}//package _0A_g

