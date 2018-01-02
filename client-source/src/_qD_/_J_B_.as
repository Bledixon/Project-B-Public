﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._J_B_

package _qD_ {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.events.MouseEvent;

public class _J_B_ extends Sprite {

    private static const WIDTH:int = 60;
    private static const HEIGHT:int = 22;

    public function _J_B_(_arg1:String) {
        this.label_ = _arg1;
        this.text_ = new SimpleText(14, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text_.setBold(true);
        this.text_.text = _arg1;
        this.text_.updateMetrics();
        this.text_.x = ((WIDTH / 2) - (this.text_.width / 2));
        addChild(this.text_);
        this.redraw();
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        addEventListener(MouseEvent.MOUSE_UP, this._0_5);
    }
    public var label_:String;
    private var over_:Boolean = false;
    private var _fc:Boolean = false;
    private var selected_:Boolean = false;
    private var text_:SimpleText;

    public function setSelected(_arg1:Boolean):void {
        this.selected_ = _arg1;
        this.redraw();
    }

    public function _R_l(_arg1:String):void {
        this.text_.text = _arg1;
        this.text_.updateMetrics();
    }

    private function redraw():void {
        graphics.clear();
        if (((this.selected_) || (this._fc))) {
            graphics.lineStyle(2, 0xFFFFFF);
            graphics.beginFill(0x7F7F7F, 1);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();
            graphics.lineStyle();
        } else {
            if (this.over_) {
                graphics.lineStyle(2, 0xFFFFFF);
                graphics.beginFill(0, 0);
                graphics.drawRect(0, 0, WIDTH, HEIGHT);
                graphics.endFill();
                graphics.lineStyle();
            } else {
                graphics.lineStyle(1, 0xFFFFFF);
                graphics.beginFill(0, 0);
                graphics.drawRect(0, 0, WIDTH, HEIGHT);
                graphics.endFill();
                graphics.lineStyle();
            }
        }
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.over_ = true;
        this.redraw();
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        this.over_ = false;
        this._fc = false;
        this.redraw();
    }

    private function onMouseDown(_arg1:MouseEvent):void {
        this._fc = true;
        this.redraw();
    }

    private function _0_5(_arg1:MouseEvent):void {
        this._fc = false;
        this.redraw();
    }

}
}//package _qD_

