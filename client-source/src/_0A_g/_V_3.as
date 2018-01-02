// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._V_3

package _0A_g {
import flash.utils.IDataOutput;

public class _V_3 extends _R_q {

    public function _V_3(_arg1:uint) {
        super(_arg1);
    }
    public var name_:String;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeUTF(this.name_);
    }

    override public function toString():String {
        return (formatToString("GUILDINVITE", "name_"));
    }

}
}//package _0A_g

