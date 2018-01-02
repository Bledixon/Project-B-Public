// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._2q

package _0A_g {

import flash.utils.IDataOutput;


public class _2q extends _R_q {

    public function _2q(_arg1:uint) {
        this.offer_ = new Vector.<Boolean>();
        super(_arg1);
    }
    public var offer_:Vector.<Boolean>;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeShort(this.offer_.length);
        var _local2:int;
        while (_local2 < this.offer_.length) {
            _arg1.writeBoolean(this.offer_[_local2]);
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("CHANGETRADE", "offer_"));
    }

}
}//package _0A_g

