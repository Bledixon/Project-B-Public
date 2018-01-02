// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._pa

package _0A_g {
import flash.utils.IDataOutput;

public class _pa extends _R_q {

    public function _pa(_arg1:uint) {
        this.text_ = String("");
        super(_arg1);
    }
    public var text_:String;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeUTF(this.text_);
    }

    override public function toString():String {
        return (formatToString("PLAYERTEXT", "text_"));
    }

}
}//package _0A_g

