// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._0K_B_

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.geom.Rectangle;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsPath;
import flash.events.MouseEvent;
import flash.display.Graphics;
import flash.geom.ColorTransform;
import flash.events.Event;
import flash.utils.getTimer;


public class _0K_B_ extends Sprite {

    private static function _G_k(_arg1:int, _arg2:int, _arg3:Graphics):void {
        _arg3.clear();
        _arg3.beginFill(0x353535, 0.01);
        _arg3.drawRect((-(_arg1) / 2), (-(_arg2) / 2), _arg1, _arg2);
        _arg3.endFill();
        _arg3.beginFill(0x4C4C4C, 1);
        _arg3.moveTo((-(_arg1) / 2), (-(_arg2) / 2));
        _arg3.lineTo((_arg1 / 2), 0);
        _arg3.lineTo((-(_arg1) / 2), (_arg2 / 2));
        _arg3.lineTo((-(_arg1) / 2), (-(_arg2) / 2));
        _arg3.endFill();
    }

    public function _0K_B_(_arg1:int, _arg2:int, _arg3:Number = 1) {
        this._vV_ = new GraphicsSolidFill(0x4C4C4C, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_vV_, path_, GraphicHelper.END_FILL];
        super();
        this.background_ = new Sprite();
        this.background_.addEventListener(MouseEvent.MOUSE_DOWN, this._06t);
        addChild(this.background_);
        this._mQ_ = this._y9(this._0C_S_);
        addChild(this._mQ_);
        this._pr = this._y9(this._bX_);
        addChild(this._pr);
        this._0C_R_ = this._y9(this._0N_3);
        addChild(this._0C_R_);
        this.resize(_arg1, _arg2, _arg3);
    }
    private var graphicsData_:Vector.<IGraphicsData>;
    private var width_:int;
    private var height_:int;
    private var speed_:Number;
    private var _gC_:Rectangle;
    private var _oI_:Number;
    private var background_:Sprite;
    private var _mQ_:Sprite;
    private var _pr:Sprite;
    private var _0C_R_:Sprite;
    private var _I_n:int;
    private var _H_:Number;
    private var _vV_:GraphicsSolidFill;
    private var path_:GraphicsPath;

    public function _Q_D_():Number {
        return (((this._0C_R_.y - this._gC_.y) / (this._gC_.height - this._0C_R_.height)));
    }

    public function _fA_(_arg1:Number, _arg2:Number, _arg3:Boolean = true):void {
        var _local4:int = (((_arg2 == 0)) ? this._gC_.height : ((_arg1 / _arg2) * this._gC_.height));
        _local4 = Math.min(this._gC_.height, Math.max(this.width_, _local4));
        this._5s(this.width_, _local4, this._0C_R_.graphics);
        this._oI_ = (_arg1 / (_arg2 - _arg1));
        if (_arg3) {
            this._0D__(0);
        }
    }

    public function _0D__(_arg1:Number):void {
        _arg1 = Math.max(0, Math.min(1, _arg1));
        this._0C_R_.y = ((_arg1 * (this._gC_.height - this._0C_R_.height)) + this._gC_.y);
        this._bf();
    }

    public function _d9():void {
        this._0D__((this._Q_D_() - this._oI_));
    }

    public function _tE_():void {
        this._0D__((this._Q_D_() + this._oI_));
    }

    public function resize(_arg1:int, _arg2:int, _arg3:Number = 1):void {
        this.width_ = _arg1;
        this.height_ = _arg2;
        this.speed_ = _arg3;
        var _local4:int = (this.width_ * 0.75);
        this._gC_ = new Rectangle(0, (_local4 + 5), this.width_, ((this.height_ - (_local4 * 2)) - 10));
        var _local5:Graphics = this.background_.graphics;
        _local5.clear();
        _local5.beginFill(0x2A2A2A, 1);
        _local5.drawRect(this._gC_.x, this._gC_.y, this._gC_.width, this._gC_.height);
        _local5.endFill();
        _G_k(_local4, this.width_, this._mQ_.graphics);
        this._mQ_.rotation = -90;
        this._mQ_.x = (this.width_ / 2);
        this._mQ_.y = (_local4 / 2);
        _G_k(_local4, this.width_, this._pr.graphics);
        this._pr.x = (this.width_ / 2);
        this._pr.y = (this.height_ - (_local4 / 2));
        this._pr.rotation = 90;
        this._5s(this.width_, this.height_, this._0C_R_.graphics);
        this._0C_R_.x = 0;
        this._0C_R_.y = this._gC_.y;
    }

    private function _y9(_arg1:Function):Sprite {
        var _local2:Sprite = new Sprite();
        _local2.addEventListener(MouseEvent.MOUSE_DOWN, _arg1);
        _local2.addEventListener(MouseEvent.ROLL_OVER, this._0G_t);
        _local2.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        return (_local2);
    }

    private function _bf():void {
        dispatchEvent(new Event(Event.CHANGE));
    }

    private function _5s(_arg1:int, _arg2:int, _arg3:Graphics):void {
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, _arg1, _arg2, 4, [1, 1, 1, 1], this.path_);
        _arg3.clear();
        _arg3.drawGraphicsData(this.graphicsData_);
    }

    private function _0G_t(_arg1:MouseEvent):void {
        var _local2:Sprite = (_arg1.target as Sprite);
        _local2.transform.colorTransform = new ColorTransform(1.6513, 1.8627, -0.5216);
    }

    private function onRollOut(_arg1:MouseEvent):void {
        var _local2:Sprite = (_arg1.target as Sprite);
        _local2.transform.colorTransform = new ColorTransform(1, 1, 1);
    }

    private function _06t(_arg1:MouseEvent):void {
        if (_arg1.localY < this._0C_R_.y) {
            this._d9();
        } else {
            this._tE_();
        }
    }

    private function _0C_S_(_arg1:MouseEvent):void {
        addEventListener(Event.ENTER_FRAME, this._0N_);
        addEventListener(MouseEvent.MOUSE_UP, this._04J_);
        this._I_n = getTimer();
        this._H_ = -(this.speed_);
    }

    private function _bX_(_arg1:MouseEvent):void {
        addEventListener(Event.ENTER_FRAME, this._0N_);
        addEventListener(MouseEvent.MOUSE_UP, this._04J_);
        this._I_n = getTimer();
        this._H_ = this.speed_;
    }

    private function _0N_(_arg1:Event):void {
        var _local2:int = getTimer();
        var _local3:Number = ((_local2 - this._I_n) / 1000);
        var _local4:int = (((this.height_ - (this.width_ * 3)) * _local3) * this._H_);
        this._0D__((((this._0C_R_.y + _local4) - this._gC_.y) / (this._gC_.height - this._0C_R_.height)));
        this._I_n = _local2;
    }

    private function _04J_(_arg1:Event):void {
        removeEventListener(Event.ENTER_FRAME, this._0N_);
        removeEventListener(MouseEvent.MOUSE_UP, this._04J_);
    }

    private function _0N_3(_arg1:MouseEvent):void {
        this._0C_R_.startDrag(false, new Rectangle(0, this._gC_.y, 0, (this._gC_.height - this._0C_R_.height)));
        stage.addEventListener(MouseEvent.MOUSE_UP, this._J_J_);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, this._ma);
        this._bf();
    }

    private function _J_J_(_arg1:MouseEvent):void {
        stage.removeEventListener(MouseEvent.MOUSE_UP, this._J_J_);
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._ma);
        this._0C_R_.stopDrag();
        this._bf();
    }

    private function _ma(_arg1:MouseEvent):void {
        this._bf();
    }

}
}//package com.company.assembleegameclient.ui

