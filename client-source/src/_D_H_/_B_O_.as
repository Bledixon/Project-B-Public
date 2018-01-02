// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_H_._B_O_

package _D_H_ {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import _0_j._D_Z_;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;

public class _B_O_ extends Sprite {

    public static const WIDTH:int = 260;
    public static const HEIGHT:int = 44;

    public function _B_O_(_arg1:int) {
        this.type_ = _arg1;
        this.nameText_ = new SimpleText(16, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.text = (((_arg1) == _D_Z_.INVALID) ? "Select Type" : _D_Z_._E_M_[_arg1].name_);
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.nameText_.x = ((WIDTH / 2) - (this.nameText_.width / 2));
        this.nameText_.y = 2;
        addChild(this.nameText_);
        var _local2:String = (((_arg1) == _D_Z_.INVALID) ? null : _D_Z_._E_M_[_arg1].name_);
        if (_local2 != null) {
            this._L_q = new SimpleText(14, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._L_q.text = _D_Z_._E_M_[_arg1].examples_;
            this._L_q.updateMetrics();
            this._L_q.filters = [new DropShadowFilter(0, 0, 0)];
            this._L_q.x = ((WIDTH / 2) - (this._L_q.width / 2));
            this._L_q.y = 20;
            addChild(this._L_q);
        } else {
            this.nameText_.y = ((HEIGHT / 2) - (this.nameText_.height / 2));
        }
        this._rC_(0x363636);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
    }
    public var type_:int = -1;
    private var nameText_:SimpleText;
    private var _L_q:SimpleText;

    private function _rC_(_arg1:uint):void {
        graphics.clear();
        graphics.lineStyle(1, 0xB3B3B3);
        graphics.beginFill(_arg1, 1);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();
        graphics.lineStyle();
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this._rC_(0x565656);
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        this._rC_(0x363636);
    }

}
}//package _D_H_

