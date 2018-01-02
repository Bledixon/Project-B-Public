// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Q_A_._0A_c

package _Q_A_ {
import flash.display.Sprite;
import flash.display.Shape;
import flash.display.Graphics;
import flash.events.Event;

public class _0A_c extends Sprite {

    public function _0A_c() {
        this._T_y = new Shape();
        var _local1:Graphics = this._T_y.graphics;
        _local1.clear();
        _local1.beginFill(0, 0.8);
        _local1.drawRect(0, 0, 800, 600);
        _local1.endFill();
        addChild(this._T_y);
        var _local2:_0L_h = new _0L_h(false);
        _local2.addEventListener(_nJ_.DONE, this._0E_C_);
        _local2.addEventListener(_nJ_._tp, this._0E_C_);
        addChild(_local2);
    }
    private var _T_y:Shape;

    private function _0E_C_(_arg1:Event):void {
        parent.removeChild(this);
    }

}
}//package _Q_A_

