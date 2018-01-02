// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0C_P_._P_4

package _0C_P_ {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;

public class _P_4 extends Sprite {

    private static const _H_5:int = 16;

    public function _P_4(_arg1:String) {
        this.text_ = _arg1;
        if (_arg1 == "Extras") {
            this._p = new SimpleText(_H_5, 0xFF1493, false, 0, 0, "Myriad Pro");
            this._p.setUnderline(true);
            this._p.setBold(true);
            this._p.text = this.text_;
            this._p.updateMetrics();
            this._p.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        } else {
            this._p = new SimpleText(_H_5, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._p.setBold(true);
            this._p.text = this.text_;
            this._p.updateMetrics();
            this._p.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        }
        addChild(this._p);
        this.selected_ = false;
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }
    public var text_:String;
    protected var _p:SimpleText;
    protected var selected_:Boolean;

    public function setSelected(_arg1:Boolean):void {
        this.selected_ = _arg1;
        this.redraw(false);
    }

    private function redraw(_arg1:Boolean):void {
        var _local2:uint = ((_arg1) ? 0xFFFFFF : 0xB3B3B3);
        if (this.selected_) {
            _local2 = 0xFFC800;
        }
        if (this.text_ == "Extras") {
            _local2 = 0xFF1493;
        }
        this._p._du(_H_5, _local2);
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.redraw(true);
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.redraw(false);
    }

}
}//package _0C_P_

