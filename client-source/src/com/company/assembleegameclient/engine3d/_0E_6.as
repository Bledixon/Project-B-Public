// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.engine3d._0E_6

package com.company.assembleegameclient.engine3d {


public class _0E_6 {

    public static function _N_Q_(_arg1:_0E_6, _arg2:_0E_6):Number {
        var _local3:Number;
        var _local4:int;
        var _local5:Number = Number.MAX_VALUE;
        var _local6:Number = Number.MIN_VALUE;
        _local4 = 0;
        while (_local4 < _arg1._0V_.length) {
            _local3 = _arg2._00n.vL_[((_arg1._0V_[_local4] * 3) + 2)];
            _local5 = (((_local3 < _local5)) ? _local3 : _local5);
            _local6 = (((_local3 > _local6)) ? _local3 : _local6);
            _local4++;
        }
        var _local7:Number = Number.MAX_VALUE;
        var _local8:Number = Number.MIN_VALUE;
        _local4 = 0;
        while (_local4 < _arg2._0V_.length) {
            _local3 = _arg2._00n.vL_[((_arg2._0V_[_local4] * 3) + 2)];
            _local7 = (((_local3 < _local7)) ? _local3 : _local7);
            _local8 = (((_local3 > _local8)) ? _local3 : _local8);
            _local4++;
        }
        if (_local7 > _local5) {
            return (-1);
        }
        if (_local7 < _local5) {
            return (1);
        }
        if (_local8 > _local6) {
            return (-1);
        }
        if (_local8 < _local6) {
            return (1);
        }
        return (0);
    }

    public function _0E_6(_arg1:_B_5, _arg2:Vector.<int>, _arg3:Boolean) {
        this._00n = _arg1;
        this._0V_ = _arg2;
        this._hg = _arg3;
    }
    public var _00n:_B_5;
    public var _0V_:Vector.<int>;
    public var _hg:Boolean;

}
}//package com.company.assembleegameclient.engine3d

