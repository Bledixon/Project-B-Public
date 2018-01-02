// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._0G_8

package _0A_g {
import flash.utils.IDataOutput;

public class _0G_8 extends _R_q {

    public function _0G_8(_arg1:uint) {
        super(_arg1);
    }
    public var guildName_:String;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeUTF(this.guildName_);
    }

    override public function toString():String {
        return (formatToString("JOINGUILD", "guildName_"));
    }

}
}//package _0A_g

