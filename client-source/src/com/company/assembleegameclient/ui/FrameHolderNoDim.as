// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._y3

package com.company.assembleegameclient.ui {
import flash.display.Sprite;
import flash.display.Shape;

import _0D_d.Frame;

import flash.display.Graphics;
import flash.events.Event;

public class FrameHolderNoDim extends Sprite {

    public function FrameHolderNoDim(frame:Frame) {
        this.frame = frame;
        this.frame.addEventListener(Event.COMPLETE, this.onComplete);
        addChild(this.frame);
    }
    private var dimScreen:Shape;
    private var frame:Frame;

    private function onComplete(_arg1:Event):void {
        parent.removeChild(this);
    }

}
}//package com.company.assembleegameclient.ui

