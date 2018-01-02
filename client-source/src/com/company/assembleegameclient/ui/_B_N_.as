// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._B_N_

package com.company.assembleegameclient.ui {
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.events.Event;
import flash.display.BitmapData;
import flash.events.MouseEvent;
import flash.net.FileReference;

import _q8._9l;

public class _B_N_ extends Sprite {

    public function _B_N_(_arg1:BitmapData) {
        this.bitmap_ = new Bitmap(_arg1);
        addChild(this.bitmap_);
        this._B_k = new _7f(16, "Save");
        addChild(this._B_k);
        this._zF_ = new _7f(16, "Close");
        addChild(this._zF_);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var bitmap_:Bitmap;
    private var _B_k:_7f;
    private var _zF_:_7f;

    private function onAddedToStage(_arg1:Event):void {
        this._B_k.addEventListener(MouseEvent.CLICK, this._na);
        this._zF_.addEventListener(MouseEvent.CLICK, this._of);
        stage;
        this.bitmap_.x = ((600 / 2) - (this.bitmap_.width / 2));
        stage;
        this.bitmap_.y = ((600 / 2) - (this.bitmap_.height / 2));
        this._zF_.x = ((this.bitmap_.x + this.bitmap_.width) - this._zF_.width);
        this._zF_.y = ((this.bitmap_.y + this.bitmap_.height) + 10);
        this._B_k.x = ((this._zF_.x - this._B_k.width) - 10);
        this._B_k.y = ((this.bitmap_.y + this.bitmap_.height) + 10);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this._B_k.removeEventListener(MouseEvent.CLICK, this._na);
        this._zF_.removeEventListener(MouseEvent.CLICK, this._of);
    }

    private function _na(_arg1:Event):void {
        new FileReference().save(_9l.encode(this.bitmap_.bitmapData), "map.png");
    }

    private function _of(_arg1:Event):void {
        if (parent != null) {
            parent.removeChild(this);
        }
    }

}
}//package com.company.assembleegameclient.ui

