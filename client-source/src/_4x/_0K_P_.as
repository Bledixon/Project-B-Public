// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_4x._0K_P_

package _4x {
public class _0K_P_ {

    public static function _am(_arg1:uint):_0K_P_ {
        return (new _0K_P_((((_arg1 >> 16) & 0xFF) / 0xFF), (((_arg1 >> 8) & 0xFF) / 0xFF), ((_arg1 & 0xFF) / 0xFF)));
    }

    public function _0K_P_(_arg1:Number, _arg2:Number, _arg3:Number) {
        this._9p = Math.max(0, Math.min(1, _arg1));
        this._e1 = Math.max(0, Math.min(1, _arg2));
        this._0F_x = Math.max(0, Math.min(1, _arg3));
    }
    public var _9p:Number;
    public var _e1:Number;
    public var _0F_x:Number;

    public function _025():_0I_y {
        var _local6:Number;
        var _local1:Number = Math.min(this._9p, this._e1, this._0F_x);
        var _local2:Number = Math.max(this._9p, this._e1, this._0F_x);
        var _local3:Number = _local2;
        var _local4:Number = (_local2 - _local1);
        if (_local2 == 0) {
            return (new _0I_y(0, 0, 0));
        }
        var _local5:Number = (_local4 / _local2);
        if (this._9p == _local2) {
            _local6 = ((this._e1 - this._0F_x) / _local4);
        } else {
            if (this._e1 == _local2) {
                _local6 = (2 + ((this._0F_x - this._9p) / _local4));
            } else {
                _local6 = (4 + ((this._9p - this._e1) / _local4));
            }
        }
        _local6 = (_local6 * 60);
        if (_local6 < 0) {
            _local6 = (_local6 + 360);
        }
        return (new _0I_y(_local6, _local5, _local3));
    }

    public function _aA_():uint {
        return ((((int(Math.min(0xFF, Math.floor((this._9p * 0xFF)))) << 16) | (int(Math.min(0xFF, Math.floor((this._e1 * 0xFF)))) << 8)) | int(Math.min(0xFF, Math.floor((this._0F_x * 0xFF))))));
    }

    public function toString():String {
        var _local1:int = int(Math.min(0xFF, Math.floor((this._9p * 0xFF))));
        var _local2:int = int(Math.min(0xFF, Math.floor((this._e1 * 0xFF))));
        var _local3:int = int(Math.min(0xFF, Math.floor((this._0F_x * 0xFF))));
        return ((((((_local1 <= 15)) ? ("0" + _local1.toString(16)) : _local1.toString(16)) + (((_local2 <= 15)) ? ("0" + _local2.toString(16)) : _local2.toString(16))) + (((_local3 <= 15)) ? ("0" + _local3.toString(16)) : _local3.toString(16))));
    }

}
}//package _4x

