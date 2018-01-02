// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._W_c

package _0A_g {
import com.company.assembleegameclient.net.messages.data._Q_0;

import com.company.assembleegameclient.net.messages.data._jg;

import flash.utils.IDataOutput;


public class _W_c extends _R_q {

    public function _W_c(_arg1:uint) {
        this.newPosition_ = new _Q_0();
        this.records_ = new Vector.<_jg>();
        super(_arg1);
    }
    public var tickId_:int;
    public var time_:int;
    public var newPosition_:_Q_0;
    public var records_:Vector.<_jg>;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.tickId_);
        _arg1.writeInt(this.time_);
        this.newPosition_.writeToOutput(_arg1);
        _arg1.writeShort(this.records_.length);
        var _local2:int;
        while (_local2 < this.records_.length) {
            this.records_[_local2].writeToOutput(_arg1);
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("MOVE", "tickId_", "time_", "newPosition_", "records_"));
    }

}
}//package _0A_g

