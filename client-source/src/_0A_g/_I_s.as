// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._I_s

package _0A_g {
import flash.utils.IDataOutput;

public class _I_s extends _R_q {

    public function _I_s(_arg1:uint) {
        super(_arg1);
    }
    public var name_:String;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeUTF(this.name_);
    }

    override public function toString():String {
        return (formatToString("REQUESTTRADE", "name_"));
    }

}
}//package _0A_g

