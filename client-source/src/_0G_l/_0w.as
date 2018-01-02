// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G_l._0w

package _0G_l {
import flash.display.Sprite;

import _E_7._for_;

import flash.display.BitmapData;

import com.company.assembleegameclient.util._lJ_;

import flash.display.Bitmap;

import com.company.ui.SimpleText;
import com.company.rotmg.graphics.DeleteXGraphic;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;

import com.company.assembleegameclient.appengine._0B_u;
import com.company.assembleegameclient.parameters.Parameters;

import flash.net.URLLoaderDataFormat;

import _zo._8C_;

import _tg._32;
import _tg._E_C_;

import flash.system.System;

import _089._W_s;

import flash.utils.ByteArray;

import _0_j._D_Z_;

import com.company.assembleegameclient.util._J_H_;

import flash.events.Event;
import flash.utils.getTimer;

import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.assembleegameclient.util._0B_c;

import _E_7._aS_;

public class _0w extends Sprite {

    public static const WIDTH:int = 100;
    public static const HEIGHT:int = 100;

    private static var _t9:Class = _8E_;
    private static var _4l:Class = _kI_;
    private static var toolTip_:_for_ = null;

    public function _0w(_arg1:XML, _arg2:Boolean) {
        this.id_ = int(_arg1.@id);
        this.name_ = _arg1.PicName;
        this._Y_9 = int(_arg1.DataType);
        this._0D_z = _arg1.Tags;
        this._B_M_ = _arg1.hasOwnProperty("Mine");
        this._0J_9 = _arg2;
        this.bitmap_ = new Bitmap();
        addChild(this.bitmap_);
        this.nameText_ = new SimpleText(12, 0xB3B3B3, false, 98, 20, "Myriad Pro");
        this.nameText_.htmlText = (('<p align="center">' + this.name_) + "</p>");
        this.nameText_.wordWrap = true;
        this.nameText_.multiline = true;
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.nameText_.x = ((WIDTH / 2) - (this.nameText_.width / 2));
        this.nameText_.y = 80;
        addChild(this.nameText_);
        this._qJ_ = new Sprite();
        this._qJ_.addChild(new _t9());
        this._qJ_.x = 5;
        this._qJ_.y = 5;
        this._qJ_.visible = false;
        this._qJ_.addEventListener(MouseEvent.CLICK, this._G_w);
        addChild(this._qJ_);
        this._U_v = new Sprite();
        this._U_v.addChild(new _4l());
        this._U_v.x = (10 + this._qJ_.width);
        this._U_v.y = 5;
        this._U_v.visible = false;
        this._U_v.addEventListener(MouseEvent.CLICK, this._uV_);
        addChild(this._U_v);
        this._0F_J_ = new DeleteXGraphic();
        this._0F_J_.x = ((WIDTH - this._0F_J_.width) - 5);
        this._0F_J_.y = 5;
        this._0F_J_.visible = false;
        this._0F_J_.addEventListener(MouseEvent.CLICK, this.onDeleteClick);
        addChild(this._0F_J_);
        this._rC_(0x363636);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        this.sendRequest();
    }
    public var id_:int;
    public var name_:String;
    public var _Y_9:int = 0;
    public var _0D_z:String;
    public var _B_M_:Boolean;
    public var _0J_9:Boolean;
    public var bitmapData_:BitmapData = null;
    public var _yN_:_lJ_ = null;
    protected var bitmap_:Bitmap;
    protected var nameText_:SimpleText;
    protected var _qJ_:Sprite;
    protected var _U_v:Sprite;
    protected var _0F_J_:DeleteXGraphic;

    private function sendRequest():void {
        var _local1:_0B_u = new _0B_u(Parameters._fK_(), "/picture", false);
        _local1._R_z(URLLoaderDataFormat.BINARY);
        _local1.addEventListener(_8C_.GENERIC_DATA, this.onURLLoadComplete);
        _local1.sendRequest("get", {"id": this.id_.toString()});
    }

    private function _W_k():void {
        var _local1:int = (this.bitmapData_.width / 7);
        var _local2:int = this.bitmapData_.height;
        this._yN_ = new _lJ_(new _J_H_(this.bitmapData_, null), _local1, _local2, _lJ_.RIGHT);
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this._Y_A_();
    }

    private function _Y_A_():void {
        var _local1:int = getTimer();
        var _local2:int = ((_local1 / 400) % _lJ_._0E_Z_);
        var _local3:Number = ((_local1 % 400) / 400);
        var _local4:_J_H_ = this._yN_.imageFromDir(_lJ_.RIGHT, _local2, _local3);
        this.bitmap_.bitmapData = TextureRedrawer.redraw(_local4.image_, 100, true, 0, 0, true);
        this.bitmap_.x = ((WIDTH / 2) - (this.bitmap_.width / 2));
        this.bitmap_.y = (((HEIGHT / 2) - (this.bitmap_.height / 2)) - 10);
    }

    private function _g1():void {
        var _local1:_lJ_ = _0B_c._J_v("players", 0);
        var _local2:_J_H_ = _local1.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
        TextureRedrawer._rn = this.bitmapData_;
        var _local3:BitmapData = TextureRedrawer.resize(_local2.image_, _local2.mask_, 100, true, 0xFFFFFFFF, 0);
        _local3 = TextureRedrawer.outlineGlow(_local3, 0, 0);
        this.bitmap_.bitmapData = _local3;
        this.bitmap_.x = ((WIDTH / 2) - (this.bitmap_.width / 2));
        this.bitmap_.y = (((HEIGHT / 2) - (this.bitmap_.height / 2)) - 10);
    }

    private function _d2():void {
        this.bitmap_.bitmapData = TextureRedrawer.redraw(this.bitmapData_, 100, true, 0, 0, false);
        this.bitmap_.x = ((WIDTH / 2) - (this.bitmap_.width / 2));
        this.bitmap_.y = (((HEIGHT / 2) - (this.bitmap_.height / 2)) - 10);
    }

    private function _B_K_():void {
        this.removeToolTip();
        if (this.bitmapData_ == null) {
            return;
        }
        var _local1:String = this._0D_z.split(",").join(", ");
        var _local2:String = (((((((((((("Type: " + _D_Z_._E_M_[this._Y_9].name_) + "\n") + "Size: ") + this.bitmapData_.width) + " x ") + this.bitmapData_.height) + "\n") + "Tags: ") + _local1) + "\n") + "Id: ") + this.id_);
        toolTip_ = new _aS_(0x2A2A2A, 0x9B9B9B, this.name_, _local2, 200);
        stage.addChild(toolTip_);
    }

    private function removeToolTip():void {
        if (((!((toolTip_ == null))) && (!((toolTip_.parent == null))))) {
            toolTip_.parent.removeChild(toolTip_);
        }
        toolTip_ = null;
    }

    private function _rC_(_arg1:uint):void {
        graphics.clear();
        graphics.beginFill(_arg1, 1);
        graphics.drawRect(1, 1, (WIDTH - 2), (HEIGHT - 2));
        graphics.endFill();
    }

    private function onDeleteClick(_arg1:MouseEvent):void {
        _arg1.stopImmediatePropagation();
        dispatchEvent(new _32(this.name_, this.id_));
    }

    private function _G_w(_arg1:MouseEvent):void {
        _arg1.stopImmediatePropagation();
        dispatchEvent(new _E_C_(this.bitmapData_));
    }

    private function _uV_(_arg1:MouseEvent):void {
        _arg1.stopImmediatePropagation();
        System.setClipboard(String(this.id_));
    }

    private function onURLLoadComplete(_arg1:_8C_):void {
        this.bitmapData_ = _W_s._80((_arg1.data_ as ByteArray));
        switch (this._Y_9) {
            case _D_Z_._04B_:
                if (this.bitmapData_.width > 16) {
                    this._W_k();
                } else {
                    this._d2();
                }
                return;
            case _D_Z_._xU_:
                this._g1();
                return;
            default:
                this._d2();
        }
    }

    private function onEnterFrame(_arg1:Event):void {
        this._Y_A_();
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this._rC_(0x565656);
        this._B_K_();
        if (((this._B_M_) || (this._0J_9))) {
            this._0F_J_.visible = true;
        }
        if (this._0J_9) {
            this._qJ_.visible = true;
            this._U_v.visible = true;
        }
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        this._rC_(0x363636);
        this.removeToolTip();
        this._0F_J_.visible = false;
        this._qJ_.visible = false;
        this._U_v.visible = false;
    }

}
}//package _0G_l

