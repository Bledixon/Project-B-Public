﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.messages.data._iZ_

package com.company.assembleegameclient.net.messages.data {
import flash.utils.IDataInput;

public class _iZ_ {

    public var x_:int;
    public var y_:int;
    public var type_:uint;

    public function parseFromInput(_arg1:IDataInput):void {
        this.x_ = _arg1.readShort();
        this.y_ = _arg1.readShort();
        this.type_ = _arg1.readUnsignedByte();
    }

    public function toString():String {
        return (((((("x_: " + this.x_) + " y_: ") + this.y_) + " type_:") + this.type_));
    }

}
}//package com.company.assembleegameclient.net.messages.data

