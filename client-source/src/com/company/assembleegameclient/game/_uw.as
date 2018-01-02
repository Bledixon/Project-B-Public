// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game._uw

package com.company.assembleegameclient.game {

import com.company.assembleegameclient.net.messages.data._jg;


public class _uw {

    public function _uw() {
        this.records_ = new Vector.<_jg>();
        super();
    }
    public var lastClearTime_:int = -1;
    public var records_:Vector.<_jg>;

    public function _F_5(_arg1:int, _arg2:Number, _arg3:Number):void {
        if (this.lastClearTime_ < 0) {
            return;
        }
        var _local4:int = this._0E_8(_arg1);
        if ((((_local4 < 1)) || ((_local4 > 10)))) {
            return;
        }
        if (this.records_.length == 0) {
            this.records_.push(new _jg(_arg1, _arg2, _arg3));
            return;
        }
        var _local5:_jg = this.records_[(this.records_.length - 1)];
        var _local6:int = this._0E_8(_local5.time_);
        if (_local4 != _local6) {
            this.records_.push(new _jg(_arg1, _arg2, _arg3));
            return;
        }
        var _local7:int = this._0F_a(_local4, _arg1);
        var _local8:int = this._0F_a(_local4, _local5.time_);
        if (_local7 < _local8) {
            _local5.time_ = _arg1;
            _local5.x_ = _arg2;
            _local5.y_ = _arg3;

        }
    }

    public function clear(_arg1:int):void {
        this.records_.length = 0;
        this.lastClearTime_ = _arg1;
    }

    private function _0E_8(_arg1:int):int {
        return ((((_arg1 - this.lastClearTime_) + 50) / 100));
    }

    private function _0F_a(_arg1:int, _arg2:int):int {
        return (Math.abs(((_arg2 - this.lastClearTime_) - (_arg1 * 100))));
    }

}
}//package com.company.assembleegameclient.game

