// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._L_X_

package _D_d {

import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Matrix;
import flash.display.Bitmap;
import flash.display.Sprite;


public class _L_X_ {

    private static const _hW_:int = 0x0100;

    public function _L_X_(_arg1:int, _arg2:int, _arg3:Boolean, _arg4:uint) {
        var _local6:int;
        var _local7:int;
        var _local8:int;
        super();
        this.width_ = _arg1;
        this.height_ = _arg2;
        this._vX_ = _arg4;
        this._U_j = Math.ceil((this.width_ / _hW_));
        this._0C_u = Math.ceil((this.height_ / _hW_));
        this._G_o = new Vector.<BitmapData>((this._U_j * this._0C_u), true);
        var _local5:int;
        while (_local5 < this._U_j) {
            _local6 = 0;
            while (_local6 < this._0C_u) {
                _local7 = Math.min(_hW_, (this.width_ - (_local5 * _hW_)));
                _local8 = Math.min(_hW_, (this.height_ - (_local6 * _hW_)));
                this._G_o[(_local5 + (_local6 * this._U_j))] = new BitmapData(_local7, _local8, _arg3, this._vX_);
                _local6++;
            }
            _local5++;
        }
    }
    public var width_:int;
    public var height_:int;
    public var _vX_:uint;
    private var _U_j:int;
    private var _0C_u:int;
    private var _G_o:Vector.<BitmapData>;

    public function copyTo(_arg1:BitmapData, _arg2:Rectangle, _arg3:Rectangle):void {
        var _local12:int;
        var _local13:BitmapData;
        var _local14:Rectangle;
        var _local4:Number = (_arg3.width / _arg2.width);
        var _local5:Number = (_arg3.height / _arg2.height);
        var _local6:int = int((_arg3.x / _hW_));
        var _local7:int = int((_arg3.y / _hW_));
        var _local8:int = Math.ceil((_arg3.right / _hW_));
        var _local9:int = Math.ceil((_arg3.bottom / _hW_));
        var _local10:Matrix = new Matrix();
        var _local11:int = _local6;
        while (_local11 < _local8) {
            _local12 = _local7;
            while (_local12 < _local9) {
                _local13 = this._G_o[(_local11 + (_local12 * this._U_j))];
                _local10.identity();
                _local10.scale(_local4, _local5);
                _local10.translate(((_arg3.x - (_local11 * _hW_)) - (_arg2.x * _local4)), ((_arg3.y - (_local12 * _hW_)) - (_arg2.x * _local5)));
                _local14 = new Rectangle((_arg3.x - (_local11 * _hW_)), (_arg3.y - (_local12 * _hW_)), _arg3.width, _arg3.height);
                _local13.draw(_arg1, _local10, null, null, _local14, false);
                _local12++;
            }
            _local11++;
        }
    }

    public function _T_P_(_arg1:Rectangle, _arg2:BitmapData, _arg3:Rectangle):void {
        var _local13:int;
        var _local14:BitmapData;
        var _local4:Number = (_arg3.width / _arg1.width);
        var _local5:Number = (_arg3.height / _arg1.height);
        var _local6:int = Math.max(0, int((_arg1.x / _hW_)));
        var _local7:int = Math.max(0, int((_arg1.y / _hW_)));
        var _local8:int = Math.min((this._U_j - 1), int((_arg1.right / _hW_)));
        var _local9:int = Math.min((this._0C_u - 1), int((_arg1.bottom / _hW_)));
        var _local10:Rectangle = new Rectangle();
        var _local11:Matrix = new Matrix();
        var _local12:int = _local6;
        while (_local12 <= _local8) {
            _local13 = _local7;
            while (_local13 <= _local9) {
                _local14 = this._G_o[(_local12 + (_local13 * this._U_j))];
                _local11.identity();
                _local11.translate((((_arg3.x / _local4) - _arg1.x) + (_local12 * _hW_)), (((_arg3.y / _local5) - _arg1.y) + (_local13 * _hW_)));
                _local11.scale(_local4, _local5);
                _arg2.draw(_local14, _local11, null, null, _arg3, false);
                _local13++;
            }
            _local12++;
        }
    }

    public function _V_h(_arg1:Rectangle):void {
        var _local8:int;
        var _local9:BitmapData;
        var _local2:int = int((_arg1.x / _hW_));
        var _local3:int = int((_arg1.y / _hW_));
        var _local4:int = Math.ceil((_arg1.right / _hW_));
        var _local5:int = Math.ceil((_arg1.bottom / _hW_));
        var _local6:Rectangle = new Rectangle();
        var _local7:int = _local2;
        while (_local7 < _local4) {
            _local8 = _local3;
            while (_local8 < _local5) {
                _local9 = this._G_o[(_local7 + (_local8 * this._U_j))];
                _local6.x = (_arg1.x - (_local7 * _hW_));
                _local6.y = (_arg1.y - (_local8 * _hW_));
                _local6.right = (_arg1.right - (_local7 * _hW_));
                _local6.bottom = (_arg1.bottom - (_local8 * _hW_));
                _local9.fillRect(_local6, this._vX_);
                _local8++;
            }
            _local7++;
        }
    }

    public function _0J_Y_():Sprite {
        var _local3:int;
        var _local4:BitmapData;
        var _local5:Bitmap;
        var _local1:Sprite = new Sprite();
        var _local2:int;
        while (_local2 < this._U_j) {
            _local3 = 0;
            while (_local3 < this._0C_u) {
                _local4 = this._G_o[(_local2 + (_local3 * this._U_j))];
                _local5 = new Bitmap(_local4);
                _local5.x = (_local2 * _hW_);
                _local5.y = (_local3 * _hW_);
                _local1.addChild(_local5);
                _local3++;
            }
            _local2++;
        }
        return (_local1);
    }

}
}//package _D_d

