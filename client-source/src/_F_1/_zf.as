// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._zf

package _F_1 {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import _02t._R_f;

import com.company.rotmg.graphics.ScreenGraphic;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;

public class _zf extends Sprite {

    public function _zf() {
        addChild(new _R_f());
        //addChild(new ScreenGraphic());
        this.text = new SimpleText(35, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text.y = 300;
        this.text.setBold(true);
        this.text.htmlText = '<p align="center">Loading...</p>';
        this.text.autoSize = TextFieldAutoSize.CENTER;
        this.text.updateMetrics();
        this.text.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
        addChild(this.text);
    }
    private var text:SimpleText;

    public function _02C_(_arg1:String):void {
        this.text.htmlText = _arg1;
        stage;
        this.text.x = ((800 - this.text.width) * 0.5);
    }

}
}//package _F_1

