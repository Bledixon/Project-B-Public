// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011.Update

package _011 {

import com.company.assembleegameclient.net.messages.data._iZ_;
import com.company.assembleegameclient.net.messages.data._0H_9;
import com.company.assembleegameclient.util._wW_;

import flash.utils.IDataInput;


public class Update extends _01Q_ {

    public function Update(_arg1:uint) {
        this.tiles_ = new Vector.<_iZ_>();
        this.newObjs_ = new Vector.<_0H_9>();
        this.drops_ = new Vector.<int>();
        super(_arg1);
    }
    public var tiles_:Vector.<_iZ_>;
    public var newObjs_:Vector.<_0H_9>;
    public var drops_:Vector.<int>;

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local2:int;
        var _local3:int = _arg1.readShort();
        _local2 = _local3;
        while (_local2 < this.tiles_.length) {
            _wW_._ay(this.tiles_[_local2]);
            _local2++;
        }
        this.tiles_.length = Math.min(_local3, this.tiles_.length);
        while (this.tiles_.length < _local3) {
            this.tiles_.push((_wW_._B_1(_iZ_) as _iZ_));
        }
        _local2 = 0;
        while (_local2 < _local3) {
            this.tiles_[_local2].parseFromInput(_arg1);
            _local2++;
        }
        this.newObjs_.length = 0;
        _local3 = _arg1.readShort();
        _local2 = _local3;
        while (_local2 < this.newObjs_.length) {
            _wW_._ay(this.newObjs_[_local2]);
            _local2++;
        }
        this.newObjs_.length = Math.min(_local3, this.newObjs_.length);
        while (this.newObjs_.length < _local3) {
            this.newObjs_.push((_wW_._B_1(_0H_9) as _0H_9));
        }
        _local2 = 0;
        while (_local2 < _local3) {
            this.newObjs_[_local2].parseFromInput(_arg1);
            _local2++;
        }
        this.drops_.length = 0;
        var _local4:int = _arg1.readShort();
        _local2 = 0;
        while (_local2 < _local4) {
            this.drops_.push(_arg1.readInt());
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("UPDATE", "tiles_", "newObjs_", "drops_"));
    }

}
}//package _011

