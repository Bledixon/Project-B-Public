// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._ej

package com.company.assembleegameclient.ui {
import flash.display.Sprite;
import flash.utils.Dictionary;

import com.company.assembleegameclient.map._X_l;

import flash.geom.Rectangle;
import flash.geom.Point;
import flash.display.BitmapData;

import flash.display.Shape;

import _E_7._zY_;

import _0D_B_._06M_;

import flash.geom.Matrix;

import com.company.assembleegameclient.objects.Player;

import flash.display.Bitmap;

import com.company.util.AssetLibrary;

import flash.geom.ColorTransform;
import flash.events.MouseEvent;

import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.map._pf;

import flash.display.Graphics;

import com.company.util.PointUtil;
import com.company.assembleegameclient.objects.Character;
import com.company.assembleegameclient.objects.GuildHallPortal;
import com.company.assembleegameclient.objects.Portal;
import com.company.util._E_I_;
import com.company.assembleegameclient.parameters.Parameters;


public class _ej extends Sprite {

    public static const _A_A_:int = (5 * 5);//25

    private static var _H_L_:Dictionary = new Dictionary();

    public static function _fG_(_arg1:GameObject):uint {
        var _local2:int = _arg1.objectType_;
        if (!_H_L_.hasOwnProperty(String(_local2))) {
            _H_L_[_local2] = _arg1.getColor();
        }
        return (_H_L_[_local2]);
    }

    public function _ej(_arg1:_X_l, _arg2:int, _arg3:int) {
        var _local6:Bitmap;
        this._M_R_ = new Vector.<Number>();
        this._6q = new Matrix();
        this._P_T_ = new Matrix();
        this._nC_ = new Vector.<Player>();
        this._0B_ = new Point();
        super();
        this.map_ = _arg1;
        this.w_ = _arg2;
        this.h_ = _arg3;
        this._eh = new Rectangle((-(this.w_) / 2), (-(this.h_) / 2), this.w_, this.h_);
        this._0M_j = new Point(_arg1.width_, _arg1.height_);
        this._02q = new BitmapData(this._0M_j.x, this._0M_j.y, false, 0);
        var _local4:Number = Math.max((this.w_ / this._0M_j.x), (this.h_ / this._0M_j.y));
        var _local5:Number = 4;
        while (_local5 > _local4) {
            this._M_R_.push(_local5);
            _local5 = (_local5 / 2);
        }
        this._M_R_.push(_local4);
        this._0H_x = AssetLibrary._xK_("lofiInterface", 54);
        this._0H_x = this._0H_x.clone();
        this._0H_x.colorTransform(this._0H_x.rect, new ColorTransform(0, 0, 1));
        graphics.clear();
        graphics.beginFill(0x1B1B1B);
        graphics.drawRect(0, 0, this.w_, this.h_);
        graphics.endFill();
        this._else = new Shape();
        this._else.x = (this.w_ / 2);
        this._else.y = (this.h_ / 2);
        addChild(this._else);
        this._16 = new Shape();
        this._16.x = (this.w_ / 2);
        this._16.y = (this.h_ / 2);
        addChild(this._16);
        this._tk = new Sprite();
        _local6 = new Bitmap(AssetLibrary._xK_("lofiInterface", 54));
        _local6.scaleX = 2;
        _local6.scaleY = 2;
        this._tk.x = (this.w_ - 20);
        this._tk.y = 4;
        this._tk.addChild(_local6);
        this._tk.addEventListener(MouseEvent.CLICK, this._0_7);
        addChild(this._tk);
        this._1_ = new Sprite();
        _local6 = new Bitmap(AssetLibrary._xK_("lofiInterface", 55));
        _local6.scaleX = 2;
        _local6.scaleY = 2;
        this._1_.x = (this.w_ - 20);
        this._1_.y = 14;
        this._1_.addChild(_local6);
        this._1_.addEventListener(MouseEvent.CLICK, this._Q_x);
        addChild(this._1_);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        addEventListener(MouseEvent.CLICK, this._R_B_);
        this._ze();
    }
    public var map_:_X_l;
    public var w_:int;
    public var h_:int;
    public var _Q_B_:Number = 0;
    public var _eh:Rectangle;
    public var _0M_j:Point;
    public var _02q:BitmapData;
    public var _M_R_:Vector.<Number>;
    public var _0H_x:BitmapData;
    public var _else:Shape;
    public var _16:Shape;
    public var _1_:Sprite;
    public var _tk:Sprite;
    private var _68:Boolean = false;
    private var toolTip_:_zY_ = null;
    private var _0G_Y_:_06M_ = null;
    private var _6q:Matrix;
    private var _P_T_:Matrix;
    private var _nC_:Vector.<Player>;
    private var _0B_:Point;

    public function dispose():void {
        this._02q.dispose();
        this._02q = null;
        this._false();
    }

    public function _w_():void {
        if (this._Q_B_ < (this._M_R_.length - 1)) {
            this._Q_B_++;
        }
        this._ze();
    }

    public function _K_r():void {
        if (this._Q_B_ > 0) {
            this._Q_B_--;
        }
        this._ze();
    }

    public function setGroundTile(_arg1:int, _arg2:int, _arg3:uint):void {
        var _local4:uint = _pf.getColor(_arg3);
        this._02q.setPixel(_arg1, _arg2, _local4);
    }

    public function _0A_R_(_arg1:int, _arg2:int, _arg3:GameObject):void {
        var _local4:uint = _fG_(_arg3);
        this._02q.setPixel(_arg1, _arg2, _local4);
    }

    public function draw():void {
        var _local7:Graphics;
        var _local10:GameObject;
        var _local15:uint;
        var _local16:Player;
        var _local17:Number;
        var _local18:Number;
        var _local19:Number;
        var _local20:Number;
        var _local21:Number;
        var _local1:Number = this._M_R_[this._Q_B_];
        this._6q.identity();
        this._6q.translate(-(this.map_.player_.x_), -(this.map_.player_.y_));
        this._6q.scale(_local1, _local1);
        var _local2:Point = this._6q.transformPoint(PointUtil._P_5);
        var _local3:Point = this._6q.transformPoint(this._0M_j);
        var _local4:Number = 0;
        if (_local2.x > this._eh.left) {
            _local4 = (this._eh.left - _local2.x);
        } else {
            if (_local3.x < this._eh.right) {
                _local4 = (this._eh.right - _local3.x);
            }
        }
        var _local5:Number = 0;
        if (_local2.y > this._eh.top) {
            _local5 = (this._eh.top - _local2.y);
        } else {
            if (_local3.y < this._eh.bottom) {
                _local5 = (this._eh.bottom - _local3.y);
            }
        }
        this._6q.translate(_local4, _local5);
        _local2 = this._6q.transformPoint(PointUtil._P_5);
        var _local6:Rectangle = new Rectangle();
        _local6.x = Math.max(this._eh.x, _local2.x);
        _local6.y = Math.max(this._eh.y, _local2.y);
        _local6.right = Math.min(this._eh.right, (_local2.x + (this._0M_j.x * _local1)));
        _local6.bottom = Math.min(this._eh.bottom, (_local2.y + (this._0M_j.y * _local1)));
        _local7 = this._else.graphics;
        _local7.clear();
        _local7.beginBitmapFill(this._02q, this._6q, false);
        _local7.drawRect(_local6.x, _local6.y, _local6.width, _local6.height);
        _local7.endFill();
        _local7 = this._16.graphics;
        _local7.clear();
        var _local8:Number = (mouseX - (this.w_ / 2));
        var _local9:Number = (mouseY - (this.h_ / 2));
        this._nC_.length = 0;
        for each (_local10 in this.map_.goDict_) {
            if (!((_local10.props_._ia) || ((_local10 == this.map_.player_)))) {
                _local16 = (_local10 as Player);
                if (_local16 != null) {
                    if (this.map_.player_.canBeHitBy(_local16) && _local16._di()) {
                        continue;
                    }
                    if (_local16.isPaused()) {
                        _local15 = 0x7F7F7F;
                    } else {
                        if (_local16.inParty) {
                            _local15 = 0xFFFF;
                        } else if (_local16._N_n) {
                            _local15 = 0xFF00;
                        } else {
                            _local15 = 0xFFFF00;
                        }
                    }
                } else {
                    if ((_local10 is Character)) {
                        if (_local10.props_.isEnemy_) {
                            _local15 = 0xFF0000;
                        } else {
                            _local15 = _fG_(_local10);
                        }
                    } else {
                        if ((((_local10 is Portal)) || ((_local10 is GuildHallPortal)))) {
                            _local15 = 0xFF;
                        } else {
                            continue;
                        }
                    }
                }
                _local17 = (((this._6q.a * _local10.x_) + (this._6q.c * _local10.y_)) + this._6q.tx);
                _local18 = (((this._6q.b * _local10.x_) + (this._6q.d * _local10.y_)) + this._6q.ty);
                if ((((((((_local17 <= (-(this.w_) / 2))) || ((_local17 >= (this.w_ / 2))))) || ((_local18 <= (-(this.h_) / 2))))) || ((_local18 >= (this.h_ / 2))))) {
                    _E_I_._S_1(this._eh, 0, 0, _local17, _local18, this._0B_);
                    _local17 = this._0B_.x;
                    _local18 = this._0B_.y;
                }
                if (((((!((_local16 == null))) && (this._68))) && ((((this._0G_Y_ == null)) || ((this._0G_Y_.parent == null)))))) {
                    _local19 = (_local8 - _local17);
                    _local20 = (_local9 - _local18);
                    _local21 = ((_local19 * _local19) + (_local20 * _local20));
                    if (_local21 < _A_A_) {
                        this._nC_.push(_local16);
                    }
                }
                _local7.beginFill(_local15);
                _local7.drawRect((_local17 - 2), (_local18 - 2), 4, 4);
                _local7.endFill();
            }
        }
        if (this._nC_.length != 0) {
            if (this.toolTip_ == null) {
                this.toolTip_ = new _zY_(this._nC_);
                stage.addChild(this.toolTip_);
            } else {
                if (!this._while(this.toolTip_._nC_, this._nC_)) {
                    this.toolTip_._09B_(this._nC_);
                }
            }
        } else {
            if (this.toolTip_ != null) {
                if (this.toolTip_.parent != null) {
                    this.toolTip_.parent.removeChild(this.toolTip_);
                }
                this.toolTip_ = null;
            }
        }
        var _local11:Number = this.map_.player_.x_;
        var _local12:Number = this.map_.player_.y_;
        var _local13:Number = (((this._6q.a * _local11) + (this._6q.c * _local12)) + this._6q.tx);
        var _local14:Number = (((this._6q.b * _local11) + (this._6q.d * _local12)) + this._6q.ty);
        this._P_T_.identity();
        this._P_T_.translate(-4, -5);
        this._P_T_.scale((8 / this._0H_x.width), (32 / this._0H_x.height));
        this._P_T_.rotate(Parameters.data_.cameraAngle);
        this._P_T_.translate(_local13, _local14);
        _local7.beginBitmapFill(this._0H_x, this._P_T_, false);
        _local7.drawRect((_local13 - 16), (_local14 - 16), 32, 32);
        _local7.endFill();
    }

    private function _ze():void {
        if (this._Q_B_ == (this._M_R_.length - 1)) {
            this._tk.transform.colorTransform = new ColorTransform(0.5, 0.5, 0.5);
        } else {
            this._tk.transform.colorTransform = new ColorTransform(1, 1, 1);
        }
        if (this._Q_B_ == 0) {
            this._1_.transform.colorTransform = new ColorTransform(0.5, 0.5, 0.5);
        } else {
            this._1_.transform.colorTransform = new ColorTransform(1, 1, 1);
        }
    }

    private function _false():void {
        if (this.toolTip_ != null) {
            if (this.toolTip_.parent != null) {
                this.toolTip_.parent.removeChild(this.toolTip_);
            }
            this.toolTip_ = null;
        }
        if (this._0G_Y_ != null) {
            if (this._0G_Y_.parent != null) {
                this._0G_Y_.parent.removeChild(this._0G_Y_);
            }
            this._0G_Y_ = null;
        }
    }

    private function _while(_arg1:Vector.<Player>, _arg2:Vector.<Player>):Boolean {
        if (_arg1.length != _arg2.length) {
            return (false);
        }
        var _local3:int;
        while (_local3 < _arg1.length) {
            if (_arg1[_local3] != _arg2[_local3]) {
                return (false);
            }
            _local3++;
        }
        return (true);
    }

    private function _0_7(_arg1:MouseEvent):void {
        _arg1.stopPropagation();
        this._w_();
    }

    private function _Q_x(_arg1:MouseEvent):void {
        _arg1.stopPropagation();
        this._K_r();
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this._68 = true;
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        this._68 = false;
    }

    private function _R_B_(_arg1:MouseEvent):void {
        if ((((((((this.toolTip_ == null)) || ((this.toolTip_.parent == null)))) || ((this.toolTip_._nC_ == null)))) || ((this.toolTip_._nC_.length == 0)))) {
            return;
        }
        var _local2:Vector.<Player> = this.toolTip_._nC_;
        var _local3:int = (this.toolTip_.x + 12);
        var _local4:int = this.toolTip_.y;
        this._false();
        this._0G_Y_ = new _06M_(this.map_, _local2);
        this._0G_Y_.x = _local3;
        this._0G_Y_.y = _local4;
        stage.addChild(this._0G_Y_);
    }

}
}//package com.company.assembleegameclient.ui

