﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011.Damage

package _011 {

import flash.utils.IDataInput;


public class Damage extends _01Q_ {

    public function Damage(_arg1:uint) {
        this.effects_ = new Vector.<uint>();
        super(_arg1);
    }
    public var targetId_:int;
    public var effects_:Vector.<uint>;
    public var damageAmount_:int;
    public var kill_:Boolean;
    public var bulletId_:uint;
    public var objectId_:int;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.targetId_ = _arg1.readInt();
        this.effects_.length = 0;
        var _local2:int = _arg1.readUnsignedByte();
        var _local3:uint;
        while (_local3 < _local2) {
            this.effects_.push(_arg1.readUnsignedByte());
            _local3++;
        }
        this.damageAmount_ = _arg1.readUnsignedShort();
        this.kill_ = _arg1.readBoolean();
        this.bulletId_ = _arg1.readUnsignedByte();
        this.objectId_ = _arg1.readInt();
    }

    override public function toString():String {
        return (formatToString("DAMAGE", "targetId_", "effects_", "damageAmount_", "kill_", "bulletId_", "objectId_"));
    }

}
}//package _011

