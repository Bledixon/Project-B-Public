// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._05F_

package _011 {
import com.company.assembleegameclient.net.messages.data._Q_0;

import flash.utils.IDataInput;

public class _05F_ extends _01Q_ {

    public function _05F_(_arg1:uint) {
        this.pos_ = new _Q_0();
        super(_arg1);
    }
    public var pos_:_Q_0;
    public var radius_:Number;
    public var damage_:int;
    public var effect_:int;
    public var duration_:Number;
    public var origType_:int;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.pos_.parseFromInput(_arg1);
        this.radius_ = _arg1.readFloat();
        this.damage_ = _arg1.readUnsignedShort();
        this.effect_ = _arg1.readUnsignedByte();
        this.duration_ = _arg1.readFloat();
        this.origType_ = _arg1.readUnsignedShort();
    }

    override public function toString():String {
        return (formatToString("AOE", "pos_", "radius_", "damage_", "effect_", "duration_", "origType_"));
    }

}
}//package _011

