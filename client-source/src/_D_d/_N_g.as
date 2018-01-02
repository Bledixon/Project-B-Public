// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._N_g

package _D_d {''
import flash.display.Sprite;

import _D_d._zy;

import flash.display.BitmapData;
import flash.utils.Dictionary;

import _D_d._L_X_;

import flash.display.Shape;

import com.company.util.IntPoint;

import flash.display.Bitmap;

import com.company.util.AssetLibrary;

import flash.events.Event;

import _D_d._11;

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import com.company.util._H_V_;

import _D_d._M_u;

import com.company.assembleegameclient.map._pf;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.map._sn;

import flash.display.Graphics;
import flash.geom.Matrix;

import com.company.util.PointUtil;

import _D_d.*;

internal class _N_g extends Sprite {

    public static const _kM_:int = 0x0200;
    public static const _09c:int = 16;
    public static const _0K_6:int = 0x0200;
    public static const _09f:Number = 0.0625;
    public static const _pF_:Number = 16;

    private static var _E_2:Class = _zy;
    private static var _v2:BitmapData = new _E_2().bitmapData;

    public function _N_g() {
        this._lt = new Dictionary();
        this._ym = new _L_X_((_kM_ * _09c), (_kM_ * _09c), true, 0);
        this._0s = new BitmapData(_kM_, _kM_, true, 0);
        this.map_ = new BitmapData(_0K_6, _0K_6, true, 0);
        this._k5 = new Shape();
        super();
        graphics.beginBitmapFill(_v2, null, true);
        graphics.drawRect(0, 0, _0K_6, _0K_6);
        addChild(new Bitmap(this.map_));
        addChild(this._k5);
        this._0b = new IntPoint(((_kM_ / 2) - (this._0C_A_() / 2)), ((_kM_ / 2) - (this._0C_A_() / 2)));
        this._F_l = AssetLibrary._xK_("invisible", 0);
        this._bd = AssetLibrary._xK_("lofiObj3", 0xFF);
        this.draw();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _lt:Dictionary;
    public var _ym:_L_X_;
    public var _0s:BitmapData;
    public var map_:BitmapData;
    public var _k5:Shape;
    public var _0b:IntPoint;
    public var _0W_:Number = 1;
    private var _sF_:IntPoint = null;
    private var _4I_:IntPoint = null;
    private var _F_l:BitmapData;
    private var _bd:BitmapData;

    public function getType(_arg1:int, _arg2:int, _arg3:int):int {
        var _local4:_11 = this._p_(_arg1, _arg2);
        if (_local4 == null) {
            return (-1);
        }
        return (_local4._5F_[_arg3]);
    }

    public function _p_(_arg1:int, _arg2:int):_11 {
        return (this._lt[(_arg1 + (_arg2 * _kM_))]);
    }

    public function _2F_(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void {
        var _local5:_11 = this._42(_arg1, _arg2);
        if (_local5._5F_[_arg3] == _arg4) {
            return;
        }
        _local5._5F_[_arg3] = _arg4;
        this._S_k(_arg1, _arg2, _local5);
    }

    public function _wa(_arg1:int, _arg2:int):String {
        var _local3:_11 = this._p_(_arg1, _arg2);
        if (_local3 == null) {
            return (null);
        }
        return (_local3._fi);
    }

    public function _N_F_(_arg1:int, _arg2:int, _arg3:String):void {
        var _local4:_11 = this._42(_arg1, _arg2);
        _local4._fi = _arg3;
    }

    public function _09x():Vector.<IntPoint> {
        var _local2:String;
        var _local3:int;
        var _local1:Vector.<IntPoint> = new Vector.<IntPoint>();
        for (_local2 in this._lt) {
            _local3 = int(_local2);
            _local1.push(new IntPoint((_local3 % _kM_), (_local3 / _kM_)));
        }
        return (_local1);
    }

    public function _y5(_arg1:int, _arg2:int, _arg3:_11):void {
        _arg3 = _arg3.clone();
        this._lt[(_arg1 + (_arg2 * _kM_))] = _arg3;
        this._S_k(_arg1, _arg2, _arg3);
    }

    public function _cg(_arg1:int, _arg2:int):void {
        this._0L_2(_arg1, _arg2);
        this._S_k(_arg1, _arg2, null);
    }

    public function clear():void {
        var _local1:String;
        var _local2:int;
        for (_local1 in this._lt) {
            _local2 = int(_local1);
            this._cg((_local2 % _kM_), (_local2 / _kM_));
        }
    }

    public function _0J_S_():Rectangle {
        var _local5:String;
        var _local6:_11;
        var _local7:int;
        var _local8:int;
        var _local9:int;
        var _local1:int = _kM_;
        var _local2:int = _kM_;
        var _local3:int;
        var _local4:int;
        for (_local5 in this._lt) {
            _local6 = this._lt[_local5];
            if (!_local6.isEmpty()) {
                _local7 = int(_local5);
                _local8 = (_local7 % _kM_);
                _local9 = (_local7 / _kM_);
                if (_local8 < _local1) {
                    _local1 = _local8;
                }
                if (_local9 < _local2) {
                    _local2 = _local9;
                }
                if ((_local8 + 1) > _local3) {
                    _local3 = (_local8 + 1);
                }
                if ((_local9 + 1) > _local4) {
                    _local4 = (_local9 + 1);
                }
            }
        }
        if (_local1 > _local3) {
            return (null);
        }
        return (new Rectangle(_local1, _local2, (_local3 - _local1), (_local4 - _local2)));
    }

    public function _bO_():Rectangle {
        var _local1:IntPoint = this._01F_();
        if (this._sF_ == null) {
            return (new Rectangle(_local1.x_, _local1.y_, 1, 1));
        }
        return (new Rectangle(Math.min(_local1.x_, this._sF_.x_), Math.min(_local1.y_, this._sF_.y_), (Math.abs((_local1.x_ - this._sF_.x_)) + 1), (Math.abs((_local1.y_ - this._sF_.y_)) + 1)));
    }

    public function draw():void {
        var _local2:Matrix;
        var _local3:int;
        var _local4:BitmapData;
        var _local1:int = (_0K_6 / this._0W_);
        this.map_.fillRect(this.map_.rect, 0);
        this._ym._T_P_(new Rectangle((this._0b.x_ * _09c), (this._0b.y_ * _09c), _local1, _local1), this.map_, this.map_.rect);
        _local2 = new Matrix();
        _local2.identity();
        _local3 = (_09c * this._0W_);
        if (this._0W_ > 2) {
            _local4 = new BitmapData((_0K_6 / _local3), (_0K_6 / _local3));
            _local4.copyPixels(this._0s, new Rectangle(this._0b.x_, this._0b.y_, _local1, _local1), PointUtil._P_5);
            _local2.scale(_local3, _local3);
            this.map_.draw(_local4, _local2);
        } else {
            _local2.translate(-(this._0b.x_), -(this._0b.y_));
            _local2.scale(_local3, _local3);
            this.map_.draw(this._0s, _local2, null, null, this.map_.rect);
        }
        this._V_s();
    }

    private function _0C_A_():int {
        return ((_0K_6 / (_09c * this._0W_)));
    }

    private function _D_q(_arg1:Number):void {
        if ((((((_arg1 > 1)) && ((this._0W_ >= _pF_)))) || ((((_arg1 < 1)) && ((this._0W_ <= _09f)))))) {
            return;
        }
        var _local2:IntPoint = this._01F_();
        this._0W_ = (this._0W_ * _arg1);
        var _local3:IntPoint = this._01F_();
        this._nX_((_local2.x_ - _local3.x_), (_local2.y_ - _local3.y_));
    }

    private function _M_A_():Boolean {
        return ((((this._sF_ == null)) && ((this._4I_ == null))));
    }

    private function _cm():void {
        if (!this._M_A_()) {
            return;
        }
        this._D_q(2);
        this.draw();
    }

    private function _Z_b():void {
        if (!this._M_A_()) {
            return;
        }
        this._D_q(0.5);
        this.draw();
    }

    private function moveLeft():void {
        if (!this._M_A_()) {
            return;
        }
        this._nX_(-1, 0);
        this.draw();
    }

    private function moveRight():void {
        if (!this._M_A_()) {
            return;
        }
        this._nX_(1, 0);
        this.draw();
    }

    private function moveUp():void {
        if (!this._M_A_()) {
            return;
        }
        this._nX_(0, -1);
        this.draw();
    }

    private function moveDown():void {
        if (!this._M_A_()) {
            return;
        }
        this._nX_(0, 1);
        this.draw();
    }

    private function _nX_(_arg1:int, _arg2:int):void {
        var _local3:int;
        var _local4:int = (_kM_ - this._0C_A_());
        this._0b.x_ = Math.max(_local3, Math.min(_local4, (this._0b.x_ + _arg1)));
        this._0b.y_ = Math.max(_local3, Math.min(_local4, (this._0b.y_ + _arg2)));
    }

    private function _01F_():IntPoint {
        var _local1:int = Math.max(0, Math.min((_0K_6 - 1), mouseX));
        var _local2:int = Math.max(0, Math.min((_0K_6 - 1), mouseY));
        return (new IntPoint((this._0b.x_ + (_local1 / (_09c * this._0W_))), (this._0b.y_ + (_local2 / (_09c * this._0W_)))));
    }

    private function _3u(_arg1:IntPoint):IntPoint {
        return (new IntPoint((((_arg1.x_ - this._0b.x_) * _09c) * this._0W_), (((_arg1.y_ - this._0b.y_) * _09c) * this._0W_)));
    }

    private function _02e(_arg1:int):Number {
        return (((_arg1 * this._0W_) * _09c));
    }

    private function _3h():Rectangle {
        var _local1:Rectangle = this._bO_();
        var _local2:IntPoint = this._3u(new IntPoint(_local1.x, _local1.y));
        _local1.x = _local2.x_;
        _local1.y = _local2.y_;
        _local1.width = (this._02e(_local1.width) - 1);
        _local1.height = (this._02e(_local1.height) - 1);
        return (_local1);
    }

    private function _42(_arg1:int, _arg2:int):_11 {
        var _local3:int = (_arg1 + (_arg2 * _kM_));
        var _local4:_11 = this._lt[_local3];
        if (_local4 != null) {
            return (_local4);
        }
        _local4 = new _11();
        this._lt[_local3] = _local4;
        return (_local4);
    }

    private function _0L_2(_arg1:int, _arg2:int):void {
        delete this._lt[(_arg1 + (_arg2 * _kM_))];
    }

    private function _S_k(_arg1:int, _arg2:int, _arg3:_11):void {
        var _local5:BitmapData;
        var _local6:BitmapData;
        var _local7:uint;
        var _local4:Rectangle = new Rectangle((_arg1 * _09c), (_arg2 * _09c), _09c, _09c);
        this._ym._V_h(_local4);
        this._0s.setPixel32(_arg1, _arg2, 0);
        if (_arg3 == null) {
            return;
        }
        if (_arg3._5F_[_M_u._6h] != -1) {
            _local5 = _pf.getBitmapData(_arg3._5F_[_M_u._6h]);
            this._ym.copyTo(_local5, _local5.rect, _local4);
        }
        if (_arg3._5F_[_M_u._S_E_] != -1) {
            _local6 = ObjectLibrary.getTextureFromType(_arg3._5F_[_M_u._S_E_]);
            if ((((_local6 == null)) || ((_local6 == this._F_l)))) {
                this._ym.copyTo(this._bd, this._bd.rect, _local4);
            } else {
                this._ym.copyTo(_local6, _local6.rect, _local4);
            }
        }
        if (_arg3._5F_[_M_u._0G_m] != -1) {
            _local7 = _sn.getColor(_arg3._5F_[_M_u._0G_m]);
            this._0s.setPixel32(_arg1, _arg2, (0x5F000000 | _local7));
        }
    }

    private function _V_s():void {
        var _local1:Rectangle = this._3h();
        var _local2:Graphics = this._k5.graphics;
        _local2.clear();
        _local2.lineStyle(1, 0xFFFFFF);
        _local2.beginFill(0xFFFFFF, 0.1);
        _local2.drawRect(_local1.x, _local1.y, _local1.width, _local1.height);
        _local2.endFill();
        _local2.lineStyle();
    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(MouseEvent.MOUSE_WHEEL, this._lb);
        addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        addEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMove);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
        stage.addEventListener(KeyboardEvent.KEY_UP, this._H_H_);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(MouseEvent.MOUSE_WHEEL, this._lb);
        removeEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        removeEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMove);
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
        stage.removeEventListener(KeyboardEvent.KEY_UP, this._H_H_);
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        switch (_arg1.keyCode) {
            case Keyboard.SHIFT:
                if (this._sF_ != null) break;
                this._sF_ = this._01F_();
                break;
            case Keyboard.CONTROL:
                if (this._4I_ != null) break;
                this._4I_ = this._01F_();
                break;
            case Keyboard.LEFT:
                this.moveLeft();
                break;
            case Keyboard.RIGHT:
                this.moveRight();
                break;
            case Keyboard.UP:
                this.moveUp();
                break;
            case Keyboard.DOWN:
                this.moveDown();
                break;
            case _H_V_._0F_K_:
                this._Z_b();
                break;
            case _H_V_._0E_f:
                this._cm();
                break;
        }
        this.draw();
    }

    private function _H_H_(_arg1:KeyboardEvent):void {
        switch (_arg1.keyCode) {
            case Keyboard.SHIFT:
                this._sF_ = null;
                break;
            case Keyboard.CONTROL:
                this._4I_ = null;
                break;
        }
        this.draw();
    }

    private function _lb(_arg1:MouseEvent):void {
        if (_arg1.delta > 0) {
            this._cm();
        } else {
            if (_arg1.delta < 0) {
                this._Z_b();
            }
        }
    }

    private function onMouseDown(_arg1:MouseEvent):void {
        var _local5:int;
        var _local2:Rectangle = this._bO_();
        var _local3:Vector.<IntPoint> = new Vector.<IntPoint>();
        var _local4:int = _local2.x;
        while (_local4 < _local2.right) {
            _local5 = _local2.y;
            while (_local5 < _local2.bottom) {
                _local3.push(new IntPoint(_local4, _local5));
                _local5++;
            }
            _local4++;
        }
        dispatchEvent(new _xQ_(_local3));
    }

    private function onMouseMove(_arg1:MouseEvent):void {
        var _local2:IntPoint;
        if (!_arg1.shiftKey) {
            this._sF_ = null;
        } else {
            if (this._sF_ == null) {
                this._sF_ = this._01F_();
            }
        }
        if (!_arg1.ctrlKey) {
            this._4I_ = null;
        } else {
            if (this._4I_ == null) {
                this._4I_ = this._01F_();
            }
        }
        if (_arg1.buttonDown) {
            dispatchEvent(new _xQ_(new <IntPoint>[this._01F_()]));
        }
        if (this._4I_ != null) {
            _local2 = this._01F_();
            this._nX_((this._4I_.x_ - _local2.x_), (this._4I_.y_ - _local2.y_));
            this.draw();
        } else {
            this._V_s();
        }
    }

}
}//package _D_d

