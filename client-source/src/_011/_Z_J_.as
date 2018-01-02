// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._Z_J_

package _011 {

import flash.utils.IDataInput;


public class _Z_J_ extends _01Q_ {

    public function _Z_J_(_arg1:uint) {
        this.offer_ = new Vector.<Boolean>();
        super(_arg1);
    }
    public var offer_:Vector.<Boolean>;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.offer_.length = 0;
        var _local2:int = _arg1.readShort();
        var _local3:int;
        while (_local3 < _local2) {
            this.offer_.push(_arg1.readBoolean());
            _local3++;
        }
    }

    override public function toString():String {
        return (formatToString("TRADECHANGED", "offer_"));
    }

}
}//package _011

