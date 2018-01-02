// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._kT_

package _0A_g {
import flash.utils.IDataOutput;

public class _kT_ extends _R_q {

    public function _kT_(_arg1:uint) {
        super(_arg1);
    }
    public var time_:int;
    public var bulletId_:uint;
    public var objectId_:int;
    public var targetId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        _arg1.writeByte(this.bulletId_);
        _arg1.writeInt(this.objectId_);
        _arg1.writeInt(this.targetId_);
    }

    override public function toString():String {
        return (formatToString("OTHERHIT", "time_", "bulletId_", "objectId_", "targetId_"));
    }

}
}//package _0A_g

