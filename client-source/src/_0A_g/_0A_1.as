// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._0A_1

package _0A_g {

import flash.utils.IDataOutput;


public class _0A_1 extends _R_q {

    public function _0A_1(_arg1:uint) {
        this.myOffer_ = new Vector.<Boolean>();
        this.yourOffer_ = new Vector.<Boolean>();
        super(_arg1);
    }
    public var myOffer_:Vector.<Boolean>;
    public var yourOffer_:Vector.<Boolean>;

    override public function writeToOutput(_arg1:IDataOutput):void {
        var _local2:int;
        _arg1.writeShort(this.myOffer_.length);
        _local2 = 0;
        while (_local2 < this.myOffer_.length) {
            _arg1.writeBoolean(this.myOffer_[_local2]);
            _local2++;
        }
        _arg1.writeShort(this.yourOffer_.length);
        _local2 = 0;
        while (_local2 < this.yourOffer_.length) {
            _arg1.writeBoolean(this.yourOffer_[_local2]);
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("ACCEPTTRADE", "myOffer_", "yourOffer_"));
    }

}
}//package _0A_g

