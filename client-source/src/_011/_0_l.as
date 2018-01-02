// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._0_l

package _011 {
import com.company.assembleegameclient.net.messages.data.ObjectStatusData;
import com.company.assembleegameclient.util._wW_;

import flash.utils.IDataInput;

public class _0_l extends _01Q_ {

    public function _0_l(_arg1:uint) {
        this.statuses_ = new Vector.<ObjectStatusData>();
        super(_arg1);
    }
    public var tickId_:int;
    public var tickTime_:int;
    public var statuses_:Vector.<ObjectStatusData>;

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local3:int;
        this.tickId_ = _arg1.readInt();
        this.tickTime_ = _arg1.readInt();
        var _local2:int = _arg1.readShort();
        _local3 = _local2;
        while (_local3 < this.statuses_.length) {
            _wW_._ay(this.statuses_[_local3]);
            _local3++;
        }
        this.statuses_.length = Math.min(_local2, this.statuses_.length);
        while (this.statuses_.length < _local2) {
            this.statuses_.push((_wW_._B_1(ObjectStatusData) as ObjectStatusData));
        }
        _local3 = 0;
        while (_local3 < _local2) {
            this.statuses_[_local3].parseFromInput(_arg1);
            _local3++;
        }
    }

    override public function toString():String {
        return (formatToString("NEW_TICK", "tickId_", "tickTime_", "statuses_"));
    }

}
}//package _011

