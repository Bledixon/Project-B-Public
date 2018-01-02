// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_d._T_I_

package _0D_d {
import flash.display.Sprite;

import _5H_._xY_;

import com.company.ui.SimpleText;

import _5H_._ii;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class _T_I_ extends Sprite implements _xY_ {

    public static const HEIGHT:int = 28;

    public function _T_I_(_arg1:String) {
        this._9g = _arg1;
        this._w0();
        this._013();
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }
    private var _9g:String;
    private var text:SimpleText;
    private var _E_:_ii;

    public function getValue():String {
        return (this._9g);
    }

    public function setSelected(_arg1:Boolean):void {
        this._E_.setSelected(_arg1);
    }

    private function _w0():void {
        this._E_ = new _ii();
        addChild(this._E_);
    }

    private function _013():void {
        this.text = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text.setBold(true);
        this.text.text = this._9g;
        this.text.updateMetrics();
        this.text.filters = [new DropShadowFilter(0, 0, 0)];
        this.text.x = (HEIGHT + 8);
        addChild(this.text);
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.text.setColor(16768133);
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.text.setColor(0xFFFFFF);
    }

}
}//package _0D_d

