// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util._x2

package com.company.assembleegameclient.util {

import com.company.util._kp;

import flash.display.BitmapData;


public class _x2 {

    public function _x2() {
        this._W_u = new Vector.<_J_H_>();
        super();
    }
    public var _W_u:Vector.<_J_H_>;

    public function addFromBitmapData(_arg1:BitmapData, _arg2:BitmapData, _arg3:int, _arg4:int):void {
        var _local5:_kp = new _kp();
        _local5.addFromBitmapData(_arg1, _arg3, _arg4);
        var _local6:_kp;
        if (_arg2 != null) {
            _local6 = new _kp();
            _local6.addFromBitmapData(_arg2, _arg3, _arg4);
        }
        var _local7:int;
        while (_local7 < _local5._W_u.length) {
            this._W_u.push(new _J_H_(_local5._W_u[_local7], (((_local6 == null)) ? null : _local6._W_u[_local7])));
            _local7++;
        }
    }

    public function _28(_arg1:_J_H_, _arg2:int, _arg3:int):void {
        this.addFromBitmapData(_arg1.image_, _arg1.mask_, _arg2, _arg3);
    }

}
}//package com.company.assembleegameclient.util

