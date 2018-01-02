// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_H_._2V_

package _D_H_ {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;


public class _2V_ extends Sprite {

    public static const HEIGHT:int = 88;

    public function _2V_(_arg1:Vector.<int>, _arg2:int) {
        this.__var = new _09W_(_arg1);
        this.__var._ta(_arg2);
        this.__var.x = 80;
        addChild(this.__var);
        this.nameText_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.text = "Type: ";
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.nameText_.y = ((this.__var.height / 2) - (this.nameText_.height / 2));
        addChild(this.nameText_);
    }
    public var nameText_:SimpleText;
    public var __var:_09W_;

    public function getType():int {
        return (this.__var.getType());
    }

}
}//package _D_H_

