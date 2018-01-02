// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._S_M_

package _011 {

import com.company.assembleegameclient.net.messages.data._35;
import com.company.assembleegameclient.util._wW_;

import flash.utils.IDataInput;


public class ItemSelectStart extends _01Q_ {

    public function ItemSelectStart(_arg1:uint) {
        this.myItems_ = new Vector.<_35>();
        super(_arg1);
    }
    public var myItems_:Vector.<_35>;

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local2:int;
        var _local3:int = _arg1.readShort();
        _local2 = _local3;
        while (_local2 < this.myItems_.length) {
            _wW_._ay(this.myItems_[_local2]);
            _local2++;
        }
        this.myItems_.length = Math.min(_local3, this.myItems_.length);
        while (this.myItems_.length < _local3) {
            this.myItems_.push((_wW_._B_1(_35) as _35));
        }
        _local2 = 0;
        while (_local2 < _local3) {
            this.myItems_[_local2].parseFromInput(_arg1);
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("ItemSelectStart", "myItems_"));
    }

}
}//package _011

