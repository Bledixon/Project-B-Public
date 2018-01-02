// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net._17

package com.company.assembleegameclient.net {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.events.Event;
import flash.utils.getTimer;


public class _17 extends Sprite {

    public function _17() {
        this._U_3 = new Vector.<int>();
        super();
        this.text_ = new SimpleText(14, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.text_);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var text_:SimpleText = null;
    private var _0A_5:int = -1;
    private var _U_3:Vector.<int>;
    private var _vY_:int;

    public function _06m():void {
        var _local3:int;
        var _local1:int = getTimer();
        if (this._0A_5 == -1) {
            this._0A_5 = _local1;
            return;
        }
        var _local2:int = (_local1 - this._0A_5);
        this._U_3.push(_local2);
        this._vY_ = (this._vY_ + _local2);
        if (this._U_3.length > 50) {
            _local3 = this._U_3.shift();
            this._vY_ = (this._vY_ - _local3);
        }
        this._0A_5 = _local1;
    }

    private function _aB_():Number {
        var _local4:int;
        var _local1:int = this._U_3.length;
        if (_local1 == 0) {
            return (0);
        }
        var _local2:Number = (this._vY_ / _local1);
        var _local3:Number = 0;
        for each (_local4 in this._U_3) {
            _local3 = (_local3 + ((_local4 - _local2) * (_local4 - _local2)));
        }
        return (Math.sqrt((_local3 / _local1)));
    }

    private function onAddedToStage(_arg1:Event):void {
        stage.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(_arg1:Event):void {
        this.text_.text = ("net jitter: " + int(this._aB_()));
        this.text_._08S_();
    }

}
}//package com.company.assembleegameclient.net

