// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.messages.data._jg

package com.company.assembleegameclient.net.messages.data {
import flash.utils.IDataOutput;

public class _jg {

    public function _jg(_arg1:int, _arg2:Number, _arg3:Number) {
        this.time_ = _arg1;
        this.x_ = _arg2;
        this.y_ = _arg3;
    }
    public var time_:int;
    public var x_:Number;
    public var y_:Number;

    public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        _arg1.writeFloat(this.x_);
        _arg1.writeFloat(this.y_);
    }

    public function toString():String {
        return (((((("time_: " + this.time_) + " x_: ") + this.x_) + " y_: ") + this.y_));
    }

}
}//package com.company.assembleegameclient.net.messages.data

