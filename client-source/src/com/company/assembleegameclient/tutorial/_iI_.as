// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.tutorial._iI_

package com.company.assembleegameclient.tutorial {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.geom.Rectangle;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._7f;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.utils.getTimer;


public class _iI_ extends Sprite {

    public static const BORDER:int = 8;

    public function _iI_(_arg1:Tutorial, _arg2:String, _arg3:Boolean, _arg4:Rectangle) {
        this._04c = new GraphicsSolidFill(0x2A2A2A, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, new GraphicsSolidFill(0xFFFFFF));
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _04c, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.tutorial_ = _arg1;
        this.rect_ = _arg4.clone();
        x = this.rect_.x;
        y = this.rect_.y;
        this.rect_.x = 0;
        this.rect_.y = 0;
        this._x4 = new SimpleText(15, 0xFFFFFF, false, (this.rect_.width - (4 * BORDER)), 0, "Myriad Pro");
        this._x4.text = ("\t" + _arg2);
        this._x4.wordWrap = true;
        this._x4.multiline = true;
        this._x4.x = (2 * BORDER);
        this._x4.y = (2 * BORDER);
        if (_arg3) {
            this._07v = new _7f(18, "Next");
            this._07v.addEventListener(MouseEvent.CLICK, this._B_x);
            this._07v.x = ((this.rect_.width - this._07v.width) - 20);
            this._07v.y = ((this.rect_.height - this._07v.height) - 10);
        }
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var graphicsData_:Vector.<IGraphicsData>;
    private var tutorial_:Tutorial;
    private var rect_:Rectangle;
    private var _x4:SimpleText;
    private var _07v:_7f = null;
    private var startTime_:int;
    private var _04c:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path_:GraphicsPath;

    private function drawRect():void {
        var _local1:Number = Math.min(1, (0.1 + ((0.9 * (getTimer() - this.startTime_)) / 200)));
        if (_local1 == 1) {
            addChild(this._x4);
            if (this._07v != null) {
                addChild(this._07v);
            }
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        var _local2:Rectangle = this.rect_.clone();
        _local2.inflate(((-((1 - _local1)) * this.rect_.width) / 2), ((-((1 - _local1)) * this.rect_.height) / 2));
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(_local2.x, _local2.y, _local2.width, _local2.height, 4, [1, 1, 1, 1], this.path_);
        graphics.clear();
        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function onAddedToStage(_arg1:Event):void {
        this.startTime_ = getTimer();
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(_arg1:Event):void {
        this.drawRect();
    }

    private function _B_x(_arg1:MouseEvent):void {
        this.tutorial_.doneAction(Tutorial._K_O_);
    }

}
}//package com.company.assembleegameclient.tutorial

