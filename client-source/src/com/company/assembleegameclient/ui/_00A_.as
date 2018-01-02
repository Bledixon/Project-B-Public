// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._00A_

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.events.MouseEvent;

public class _00A_ extends Sprite {

    public function _00A_(_arg1:String) {
        this.label_ = _arg1;
        this.text_ = new SimpleText(20, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text_.setBold(true);
        this.text_.text = _arg1;
        this.text_.updateMetrics();
        this.text_.x = 2;
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

    private function redraw():void {
        if (this.over_) {
            this.text_.setColor(16567065);
        } else {
            if (((this.selected_) || (this._fc))) {
                this.text_.setColor(0xFFFFFF);
            } else {
                this.text_.setColor(0xB2B2B2);
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
}//package com.company.assembleegameclient.ui

