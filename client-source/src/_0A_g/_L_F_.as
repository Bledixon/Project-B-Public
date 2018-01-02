// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._L_F_

package _0A_g {
import flash.utils.IDataOutput;

public class _L_F_ extends _R_q {

    public function _L_F_(_arg1:uint) {
        super(_arg1);
    }
    public var bulletId_:uint;
    public var objectId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeByte(this.bulletId_);
        _arg1.writeInt(this.objectId_);
    }

    override public function toString():String {
        return (formatToString("PLAYERHIT", "bulletId_", "objectId_"));
    }

}
}//package _0A_g

