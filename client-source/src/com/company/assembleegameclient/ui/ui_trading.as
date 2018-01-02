// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui.ui_trading

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.display.Shape;

import com.company.ui.SimpleText;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsPath;
import flash.display.GraphicsStroke;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.utils.getTimer;
import flash.events.Event;
import flash.events.MouseEvent;


public class ui_trading extends Sprite {

    private static const _5f:int = 2999;
    private static const _C_Y_:int = 0;
    private static const _01I_:int = 1;
    private static const _wt:int = 2;
    private static const _4Z_:int = 3;

    public function ui_trading(_arg1:int, _arg2:int = 0) {
        this._pL_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._f1 = new GraphicsSolidFill(0x7F7F7F, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this._0J_i = new GraphicsSolidFill(0xBFBFBF, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.graphicsData_ = new <IGraphicsData>[_pL_, path_, GraphicHelper.END_FILL];
        this._jN_ = new <IGraphicsData>[_0J_i, path_, GraphicHelper.END_FILL];
        this.outlineGraphicsData_ = new <IGraphicsData>[_0y, path_, GraphicHelper._H_B_];
        super();
        this._L_v = getTimer();
        this.text_ = new SimpleText(_arg1, 0x363636, false, 0, 0, "Myriad Pro");
        this.text_.setBold(true);
        this.text_.text = "Trade";
        this.text_.updateMetrics();
        this.w_ = (((_arg2) != 0) ? _arg2 : (this.text_.width + 12));
        this.h_ = (this.text_.textHeight + 8);
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, this.w_, (this.text_.textHeight + 8), 4, [1, 1, 1, 1], this.path_);
        this.text_.x = (((this.w_ / 2) - (this.text_.textWidth / 2)) - 2);
        this.text_.y = 1;
        this._9C_ = this._e4();
        addChild(this._9C_);
        addChild(this.text_);
        this.draw();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        addEventListener(MouseEvent.CLICK, this._021);
    }
    public var _9C_:Sprite;
    public var _05l:Shape;
    public var text_:SimpleText;
    public var w_:int;
    public var h_:int;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var _jN_:Vector.<IGraphicsData>;
    private var outlineGraphicsData_:Vector.<IGraphicsData>;
    private var _0B_s:int;
    private var _L_v:int;
    private var _pL_:GraphicsSolidFill;
    private var _f1:GraphicsSolidFill;
    private var path_:GraphicsPath;
    private var _0J_i:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;

    public function reset():void {
        this._L_v = getTimer();
        this._0B_s = _C_Y_;
        this._A_w(false);
        this._02C_("Trade");
    }

    public function _pW_():void {
        this._0B_s = _4Z_;
        this._A_w(false);
        this._02C_("Trade");
    }

    private function _02C_(_arg1:String):void {
        this.text_.text = _arg1;
        this.text_.updateMetrics();
        this.text_.x = (((this.w_ / 2) - (this.text_.textWidth / 2)) - 2);
        this.text_.y = 1;
    }

    private function _A_w(_arg1:Boolean):void {
        if (_arg1 == mouseEnabled) {
            return;
        }
        mouseEnabled = _arg1;
        mouseChildren = _arg1;
        this.graphicsData_[0] = ((_arg1) ? this._pL_ : this._f1);
        this.draw();
    }

    private function _e4():Sprite {
        var _local1:Sprite = new Sprite();
        var _local2:Sprite = new Sprite();
        var _local3:Shape = new Shape();
        _local3.graphics.clear();
        _local3.graphics.drawGraphicsData(this._jN_);
        _local2.addChild(_local3);
        this._05l = new Shape();
        _local2.addChild(this._05l);
        _local2.mask = this._05l;
        _local1.addChild(_local2);
        var _local4:Shape = new Shape();
        _local4.graphics.clear();
        _local4.graphics.drawGraphicsData(this.outlineGraphicsData_);
        _local1.addChild(_local4);
        return (_local1);
    }

    private function _qr(_arg1:Number):void {
        this._05l.graphics.clear();
        this._05l.graphics.beginFill(0xBFBFBF);
        this._05l.graphics.drawRect(0, 0, (this.w_ * _arg1), this.h_);
        this._05l.graphics.endFill();
    }

    private function draw():void {
        var _local1:int;
        var _local2:Number;
        _local1 = getTimer();
        if (this._0B_s == _C_Y_) {
            if ((_local1 - this._L_v) >= _5f) {
                this._0B_s = _01I_;
                this._A_w(true);
            }
        }
        switch (this._0B_s) {
            case _C_Y_:
                this._9C_.visible = true;
                _local2 = ((_local1 - this._L_v) / _5f);
                this._qr(_local2);
                break;
            case _4Z_:
            case _01I_:
            case _wt:
                this._9C_.visible = false;
                break;
        }
        graphics.clear();
        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this.reset();
        this.draw();
    }

    private function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(_arg1:Event):void {
        this.draw();
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this._pL_.color = 16768133;
        this.draw();
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this._pL_.color = 0xFFFFFF;
        this.draw();
    }

    private function _021(_arg1:MouseEvent):void {
        this._0B_s = _wt;
        this._A_w(false);
        this._02C_("Waiting");
    }

}
}//package com.company.assembleegameclient.ui

