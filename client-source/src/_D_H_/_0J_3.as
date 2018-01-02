// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_H_._0J_3

package _D_H_ {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.events.FocusEvent;

public class _0J_3 extends Sprite {

    public static const HEIGHT:int = 88;

    public function _0J_3(_arg1:String) {
        this.nameText_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.text = "Tags: ";
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this.inputText_ = new SimpleText(16, 0xB3B3B3, true, 260, 100, "Myriad Pro");
        this.inputText_.x = 80;
        this.inputText_.border = false;
        this.inputText_.maxChars = 0x0100;
        this.inputText_.multiline = true;
        this.inputText_.wordWrap = true;
        this.inputText_.restrict = "a-z0-9 ,";
        this.inputText_.updateMetrics();
        this.inputText_.text = _arg1;
        addChild(this.inputText_);
        graphics.lineStyle(2, 0x454545, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND);
        graphics.beginFill(0x333333, 1);
        graphics.drawRect(78, -2, 260, 100);
        graphics.endFill();
        graphics.lineStyle();
        this.inputText_.addEventListener(FocusEvent.FOCUS_IN, this._0_L_);
        this.inputText_.addEventListener(FocusEvent.FOCUS_OUT, this._I_W_);
        this._tr = new SimpleText(14, 0x939393, false, 260, 0, "Myriad Pro");
        this._tr.htmlText = (('<p align="center">comma-separated list of tags\n' + '(e.g. "elf, wizard, abyss of demons, \ncrunchy")') + "</p>");
        this._tr.updateMetrics();
        this._tr.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8, 1)];
        this._tr.x = 80;
        this._tr.y = (50 - (this._tr.height / 2));
        if (this.inputText_.text == "") {
            addChild(this._tr);
        }
    }
    public var nameText_:SimpleText;
    public var inputText_:SimpleText;
    public var _tr:SimpleText;

    public function text():String {
        return (this.inputText_.text);
    }

    private function _0_L_(_arg1:FocusEvent):void {
        if (contains(this._tr)) {
            removeChild(this._tr);
        }
    }

    private function _I_W_(_arg1:FocusEvent):void {
        if (((!(contains(this._tr))) && ((this.inputText_.text == "")))) {
            addChild(this._tr);
        }
    }

}
}//package _D_H_

