// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._03Y_

package _qD_ {
import flash.display.BitmapData;

import flash.display.Shape;
import flash.events.MouseEvent;
import flash.display.Graphics;

import _4x._0I_y;
import _4x._0K_P_;

import flash.events.Event;


public class _03Y_ extends _E_b {

    private static var _E_2:Class = _0I_l;
    private static var _v2:BitmapData = new _E_2().bitmapData;

    public function _03Y_(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Boolean) {
        var _local6:int;
        var _local7:int;
        var _local8:_s_;
        var _local9:int;
        this._s6 = new Vector.<Vector.<_s_>>();
        super();
        this.w_ = _arg1;
        this.h_ = _arg2;
        this._4O_ = _arg3;
        this._P_y = _arg4;
        this._M_b = _arg5;
        _local9 = Math.min((this.w_ / this._4O_), (this.h_ / this._P_y));
        var _local10:int = ((this.w_ / 2) - ((_local9 * this._4O_) / 2));
        var _local11:int = ((this.h_ / 2) - ((_local9 * this._P_y) / 2));
        this._s6.length = this._4O_;
        _local6 = 0;
        while (_local6 < this._4O_) {
            if (this._s6[_local6] == null) {
                this._s6[_local6] = new Vector.<_s_>();
            }
            this._s6[_local6].length = this._P_y;
            _local7 = 0;
            while (_local7 < this._P_y) {
                _local8 = new _s_(_local9, this._M_b);
                this._s6[_local6][_local7] = _local8;
                _local8.x = (_local10 + (_local6 * _local9));
                _local8.y = (_local11 + (_local7 * _local9));
                _local8.addEventListener(MouseEvent.MOUSE_DOWN, this._01J_);
                _local8.addEventListener(MouseEvent.MOUSE_OVER, this._E_8);
                _local8.addEventListener(MouseEvent.MOUSE_OUT, this._F__);
                addChild(_local8);
                _local7++;
            }
            _local6++;
        }
        graphics.clear();
        graphics.beginBitmapFill(_v2, null);
        graphics.drawRect(_local10, _local11, (_local9 * _arg3), (_local9 * _arg4));
        graphics.endFill();
        this._0G_7 = new Shape();
        var _local12:Graphics = this._0G_7.graphics;
        _local12.lineStyle(1, 0xFFFFFF, 0.5);
        _local6 = 0;
        while (_local6 <= this._4O_) {
            _local12.moveTo((_local10 + (_local6 * _local9)), _local11);
            _local12.lineTo((_local10 + (_local6 * _local9)), (_local11 + (this._P_y * _local9)));
            _local6++;
        }
        _local7 = 0;
        while (_local7 <= this._P_y) {
            _local12.moveTo(_local10, (_local11 + (_local7 * _local9)));
            _local12.lineTo((_local10 + (this._4O_ * _local9)), (_local11 + (_local7 * _local9)));
            _local7++;
        }
        _local12.lineStyle();
        addChild(this._0G_7);
    }
    private var w_:int;
    private var h_:int;
    private var _4O_:int;
    private var _P_y:int;
    private var _M_b:Boolean;
    private var _s6:Vector.<Vector.<_s_>>;
    private var _0G_7:Shape;

    override public function getBitmapData():BitmapData {
        var _local3:int;
        var _local4:_s_;
        var _local1:BitmapData = new BitmapData(this._4O_, this._P_y, true, 0);
        var _local2:int;
        while (_local2 < this._s6.length) {
            _local3 = 0;
            while (_local3 < this._s6[_local2].length) {
                _local4 = this._s6[_local2][_local3];
                if (((!((_local4._U_d == null))) || (!(this._M_b)))) {
                    _local1.setPixel32(_local2, _local3, (0xFF000000 | _local4.getColor()));
                }
                _local3++;
            }
            _local2++;
        }
        return (_local1);
    }

    override public function loadBitmapData(_arg1:BitmapData):void {
        var _local3:int;
        var _local4:_s_;
        var _local5:uint;
        var _local6:_0I_y;
        var _local2:int;
        while (_local2 < _arg1.width) {
            _local3 = 0;
            while (_local3 < _arg1.height) {
                _local4 = this._s6[_local2][_local3];
                _local5 = _arg1.getPixel32(_local2, _local3);
                _local6 = null;
                if ((_local5 & 0xFF000000) != 0) {
                    _local6 = _0K_P_._am((_local5 & 0xFFFFFF))._025();
                }
                _local4._L_V_(_local6);
                _local3++;
            }
            _local2++;
        }
        dispatchEvent(new Event(Event.CHANGE));
    }

    override public function clear():void {
        var _local2:Vector.<_s_>;
        var _local3:_s_;
        var _local1:Vector.<_L_e> = new Vector.<_L_e>();
        for each (_local2 in this._s6) {
            for each (_local3 in _local2) {
                if (_local3._U_d != null) {
                    _local1.push(new _L_e(_local3, null));
                }
            }
        }
        dispatchEvent(new _eF_(_local1));
    }

    public function _0D_J_():Boolean {
        var _local1:Vector.<_s_>;
        var _local2:_s_;
        for each (_local1 in this._s6) {
            for each (_local2 in _local1) {
                if (_local2._U_d != null) {
                    return (false);
                }
            }
        }
        return (true);
    }

    private function _01J_(_arg1:MouseEvent):void {
        var _local2:_s_ = (_arg1.target as _s_);
        dispatchEvent(new _Q_8(_Q_8.UNDO_TEMP_EVENT, _local2));
        dispatchEvent(new _Q_8(_Q_8.PIXEL_EVENT, _local2));
    }

    private function _E_8(_arg1:MouseEvent):void {
        var _local2:_s_ = (_arg1.target as _s_);
        if (_arg1.buttonDown) {
            dispatchEvent(new _Q_8(_Q_8.PIXEL_EVENT, _local2));
        } else {
            dispatchEvent(new _Q_8(_Q_8.TEMP_PIXEL_EVENT, _local2));
        }
    }

    private function _F__(_arg1:MouseEvent):void {
        var _local2:_s_ = (_arg1.target as _s_);
        dispatchEvent(new _Q_8(_Q_8.UNDO_TEMP_EVENT, _local2));
    }

}
}//package _qD_

