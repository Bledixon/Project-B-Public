// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._T_m

package _011 {
import com.company.assembleegameclient.net.messages.data._Q_0;

import flash.utils.IDataInput;

public class _T_m extends _01Q_ {

    public function _T_m(_arg1:uint) {
        this.startingPos_ = new _Q_0();
        super(_arg1);
    }
    public var bulletId_:uint;
    public var ownerId_:int;
    public var containerType_:int;
    public var startingPos_:_Q_0;
    public var angle_:Number;
    public var damage_:int;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.bulletId_ = _arg1.readUnsignedByte();
        this.ownerId_ = _arg1.readInt();
        this.containerType_ = _arg1.readShort();
        this.startingPos_.parseFromInput(_arg1);
        this.angle_ = _arg1.readFloat();
        this.damage_ = _arg1.readShort();
    }

    override public function toString():String {
        return (formatToString("SHOOT", "bulletId_", "ownerId_", "containerType_", "startingPos_", "angle_", "damage_"));
    }

}
}//package _011

