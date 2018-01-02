// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._H_o

package _F_1 {
import flash.display.Sprite;
import flash.geom.ColorTransform;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.utils.getTimer;

import com.company.util.MoreColorUtil;

import _vf._5T_;

public class _H_o extends Sprite {

    protected static const _0A_8:ColorTransform = new ColorTransform(1, (220 / 0xFF), (133 / 0xFF));
    private static const _0AA:DropShadowFilter = new DropShadowFilter(0, 0, 0, 0.5, 12, 12);

    protected var _4p:ColorTransform = null;
    protected var text_:SimpleText;
    protected var _U_r:Boolean;
    private var _0H_X_:Number;
    private var _N_a:Number;
    private var active:Boolean;

    public function _H_o(_arg1:String, _arg2:int, _arg3:Boolean) {
        name = _arg1;
        this.text_ = new SimpleText(_arg2, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text_.setBold(true);
        this.text_.text = _arg1.toLowerCase();
        this.text_.updateMetrics();
        this.text_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        addChild(this.text_);
        this._U_r = _arg3;
        this._0H_X_ = width;
        this._N_a = height;
        this.activate();
    }
    public function activate():void{
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        addEventListener(MouseEvent.CLICK, this._09t);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        this.active = true;
    }
    public function deactivate():void{
        var _local1:ColorTransform = new ColorTransform();
        _local1.color = 0x363636;
        this._037(_local1);
        removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        removeEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        removeEventListener(MouseEvent.CLICK, this._09t);
        removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        removeEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        this.active = false;
    }

    public function _037(_arg1:ColorTransform):void {
        if (_arg1 == this._4p) {
            return;
        }
        this._4p = _arg1;
        if (this._4p == null) {
            this.text_.transform.colorTransform = MoreColorUtil.identity;
        } else {
            this.text_.transform.colorTransform = this._4p;
        }
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this._037(_0A_8);
    }

    protected function onMouseOut(_arg1:MouseEvent):void {
        this._037(null);
    }

    protected function _09t(_arg1:MouseEvent):void {
        _5T_.play("button_click");
    }

    public function setText(_arg1:String) {
        this.text_.text = _arg1.toLowerCase();
        this.text_.updateMetrics();
    }

    private function onAddedToStage(_arg1:Event):void {
        if (this._U_r) {
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        if (this._U_r) {
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onEnterFrame(_arg1:Event):void {
        var _local2:Number = (1.05 + (0.05 * Math.sin((getTimer() / 200))));
        this.text_.scaleX = _local2;
        this.text_.scaleY = _local2;
        this.text_.x = ((this._0H_X_ / 2) - (this.text_.width / 2));
        this.text_.y = ((this._N_a / 2) - (this.text_.height / 2));
    }

}
}//package _F_1

