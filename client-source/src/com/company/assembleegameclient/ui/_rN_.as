// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._rN_

package com.company.assembleegameclient.ui {
import flash.display.Sprite;
import flash.geom.ColorTransform;
import flash.display.BitmapData;
import flash.display.Bitmap;

import _E_7._aS_;

import com.company.assembleegameclient.util.TextureRedrawer;

import flash.events.Event;
import flash.events.MouseEvent;

import com.company.util.MoreColorUtil;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.util._H_V_;

public class _rN_ extends Sprite {

    protected static const _0A_8:ColorTransform = new ColorTransform(1, (220 / 0xFF), (133 / 0xFF));

    public function _rN_(_arg1:BitmapData, _arg2:String, _arg3:String) {
        this._01B_ = _arg1;
        this._D_j = TextureRedrawer.redraw(this._01B_, (320 / this._01B_.width), true, 0, 0);
        this._5U_ = new Bitmap(this._D_j);
        this._5U_.x = -12;
        this._5U_.y = -12;
        addChild(this._5U_);
        this._0C_p = _arg3;
        if (_arg2 != "") {
            this.toolTip_ = new _aS_(0x2A2A2A, 0x9B9B9B, _arg2, "", 200);
        }
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
    }
    protected var _01B_:BitmapData;
    protected var _D_j:BitmapData;
    protected var _5U_:Bitmap;
    protected var _0C_p:String;
    protected var _4p:ColorTransform = null;
    protected var toolTip_:_aS_ = null;

    public function _037(_arg1:ColorTransform):void {
        if (_arg1 == this._4p) {
            return;
        }
        this._4p = _arg1;
        if (this._4p == null) {
            transform.colorTransform = MoreColorUtil.identity;
        } else {
            transform.colorTransform = this._4p;
        }
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this._037(_0A_8);
        if (((!((this.toolTip_ == null))) && (!(stage.contains(this.toolTip_))))) {
            this.toolTip_._02C_(("Hotkey: " + _H_V_._in[Parameters.data_[this._0C_p]]));
            stage.addChild(this.toolTip_);
        }
    }

    protected function onMouseOut(_arg1:MouseEvent):void {
        this._037(null);
        if (((!((this.toolTip_ == null))) && (!((this.toolTip_.parent == null))))) {
            this.toolTip_.parent.removeChild(this.toolTip_);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        if (((!((this.toolTip_ == null))) && (!((this.toolTip_.parent == null))))) {
            this.toolTip_.parent.removeChild(this.toolTip_);
        }
    }

}
}//package com.company.assembleegameclient.ui

