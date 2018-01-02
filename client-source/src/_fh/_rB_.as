// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_fh._rB_

package _fh {
import flash.display.Sprite;

import _0D_B_.Menu;

import com.company.assembleegameclient.objects.GameObject;

import flash.display.Shape;

import _E_7._for_;

import flash.geom.Point;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;

import com.company.util._E_I_;
import com.company.util.Trig;
import com.company.assembleegameclient.map._0D_v;

import flash.display.Graphics;


public class _rB_ extends Sprite {

    public static const _H_R_:int = 8;
    public static const _C_9:int = 11;
    public static const _K_c:int = 3;

    private static var _0G_Y_:Menu = null;

    public static function _7C_():void {
        if (_0G_Y_ != null) {
            if (_0G_Y_.parent != null) {
                _0G_Y_.parent.removeChild(_0G_Y_);
            }
            _0G_Y_ = null;
        }
    }

    public function _rB_(_arg1:uint, _arg2:uint, _arg3:Boolean) {
        this._rM_ = new Vector.<GameObject>();
        this._7Q_ = new Shape();
        this._0B_ = new Point();
        super();
        this._nS_ = _arg1;
        this._vX_ = _arg2;
        this._0H_M_ = _arg3;
        addChild(this._7Q_);
        this._G_k();
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        visible = false;
    }
    public var _nS_:uint;
    public var _vX_:uint;
    public var go_:GameObject = null;
    public var _rM_:Vector.<GameObject>;
    public var _68:Boolean = false;
    protected var _fO_:_for_ = null;
    private var _0H_M_:Boolean;
    private var _7Q_:Shape;
    private var _0B_:Point;

    public function _bz(_arg1:GameObject):void {
        if (this.go_ != _arg1) {
            this.go_ = _arg1;
        }
        this._rM_.length = 0;
        if (this.go_ == null) {
            visible = false;
        }
    }

    public function _dB_(_arg1:GameObject):void {
        this._rM_.push(_arg1);
    }

    public function draw(_arg1:int, _arg2:_0D_v):void {
        if (this.go_ == null) {
            visible = false;
            return;
        }
        this.go_._0E_T_(_arg2);
        var _local3:Rectangle = _arg2._F_L_;
        var _local4:Number = this.go_._bY_[0];
        var _local5:Number = this.go_._bY_[1];
        if (!_E_I_._S_1(_arg2._F_L_, 0, 0, _local4, _local5, this._0B_)) {
            this.go_ = null;
            visible = false;
            return;
        }
        x = this._0B_.x;
        y = this._0B_.y;
        var _local6:Number = Trig._S_C_((270 - (Trig._G_Q_ * Math.atan2(_local4, _local5))));
        if (this._0B_.x < (_local3.left + 5)) {
            if (_local6 > 45) {
                _local6 = 45;
            }
            if (_local6 < -45) {
                _local6 = -45;
            }
        } else {
            if (this._0B_.x > (_local3.right - 5)) {
                if (_local6 > 0) {
                    if (_local6 < 135) {
                        _local6 = 135;
                    }
                } else {
                    if (_local6 > -135) {
                        _local6 = -135;
                    }
                }
            }
        }
        if (this._0B_.y < (_local3.top + 5)) {
            if (_local6 < 45) {
                _local6 = 45;
            }
            if (_local6 > 135) {
                _local6 = 135;
            }
        } else {
            if (this._0B_.y > (_local3.bottom - 5)) {
                if (_local6 > -45) {
                    _local6 = -45;
                }
                if (_local6 < -135) {
                    _local6 = -135;
                }
            }
        }
        this._7Q_.rotation = _local6;
        if (this._fO_ != null) {
            this._mM_(this._fO_);
        }
        visible = true;
    }

    protected function _V_B_(_arg1:_for_):void {
        this._X_S_();
        this._fO_ = _arg1;
        if (this._fO_ != null) {
            addChild(this._fO_);
            this._mM_(this._fO_);
        }
    }

    protected function _X_S_():void {
        if (this._fO_ != null) {
            if (this._fO_.parent != null) {
                this._fO_.parent.removeChild(this._fO_);
            }
            this._fO_ = null;
        }
    }

    protected function _06R_(_arg1:Menu):void {
        this._X_S_();
        _0G_Y_ = _arg1;
        stage.addChild(_0G_Y_);
    }

    private function _mM_(_arg1:_for_):void {
        var _local8:Number;
        var _local9:Number;
        var _local2:Number = this._7Q_.rotation;
        var _local3:int = ((_K_c + _C_9) + 12);
        var _local4:Number = (_local3 * Math.cos((_local2 * Trig._km)));
        var _local5:Number = (_local3 * Math.sin((_local2 * Trig._km)));
        var _local6:Number = _arg1._R_A_;
        var _local7:Number = _arg1._D_f;
        if ((((_local2 >= 45)) && ((_local2 <= 135)))) {
            _local8 = (_local4 + (_local6 / Math.tan((_local2 * Trig._km))));
            _arg1.x = (((_local4 + _local8) / 2) - (_local6 / 2));
            _arg1.y = _local5;
        } else {
            if ((((_local2 <= -45)) && ((_local2 >= -135)))) {
                _local8 = (_local4 - (_local6 / Math.tan((_local2 * Trig._km))));
                _arg1.x = (((_local4 + _local8) / 2) - (_local6 / 2));
                _arg1.y = (_local5 - _local7);
            } else {
                if ((((_local2 < 45)) && ((_local2 > -45)))) {
                    _arg1.x = _local4;
                    _local9 = (_local5 + (_local7 * Math.tan((_local2 * Trig._km))));
                    _arg1.y = (((_local5 + _local9) / 2) - (_local7 / 2));
                } else {
                    _arg1.x = (_local4 - _local6);
                    _local9 = (_local5 - (_local7 * Math.tan((_local2 * Trig._km))));
                    _arg1.y = (((_local5 + _local9) / 2) - (_local7 / 2));
                }
            }
        }
    }

    private function _G_k():void {
        var _local1:Graphics = this._7Q_.graphics;
        _local1.clear();
        var _local2:int = ((((this._0H_M_) || (this._68))) ? _C_9 : _H_R_);
        _local1.lineStyle(1, this._nS_);
        _local1.beginFill(this._vX_);
        _local1.moveTo(_K_c, 0);
        _local1.lineTo((_local2 + _K_c), _local2);
        _local1.lineTo((_local2 + _K_c), -(_local2));
        _local1.lineTo(_K_c, 0);
        _local1.endFill();
        _local1.lineStyle();
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this._68 = true;
        this._G_k();
    }

    protected function onMouseOut(_arg1:MouseEvent):void {
        this._68 = false;
        this._G_k();
    }

    protected function onMouseDown(_arg1:MouseEvent):void {
        _arg1.stopImmediatePropagation();
    }

}
}//package _fh

