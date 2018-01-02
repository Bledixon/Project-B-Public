// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_d._T_K_

package _0D_d {
import flash.display.Sprite;
import flash.display.Shape;
import flash.display.Graphics;
import flash.events.Event;

public class _T_K_ extends Sprite {

    public function _T_K_() {
        this._T_y = new Shape();
        var _local1:Graphics = this._T_y.graphics;
        _local1.clear();
        _local1.beginFill(0, 0.8);
        _local1.drawRect(0, 0, 800, 600);
        _local1.endFill();
        addChild(this._T_y);
        this._U_S_ = new _A_t();
        this._U_S_.addEventListener(Event.CANCEL, this.onCancel);
        this._U_S_.addEventListener(Event.COMPLETE, this.onComplete);
        addChild(this._U_S_);
    }
    private var _T_y:Shape;
    private var _U_S_:_A_t;

    private function onCancel(_arg1:Event):void {
        stage.focus = null;
        parent.removeChild(this);
    }

    private function onComplete(_arg1:Event):void {
        parent.removeChild(this);
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}//package _0D_d

