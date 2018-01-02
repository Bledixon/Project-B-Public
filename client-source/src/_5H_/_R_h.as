// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_5H_._R_h

package _5H_ {
import flash.display.Shape;

public class _R_h extends Shape {

    private var _W_A_:int;
    private var _height:int;
    private var _color:int;

    public function _H_9(_arg1:int, _arg2:int):void {
        this._W_A_ = _arg1;
        this._height = _arg2;
        this._B__();
    }

    public function _gp(_arg1:int):void {
        this._color = _arg1;
        this._B__();
    }

    private function _B__():void {
        graphics.clear();
        graphics.beginFill(this._color);
        graphics.drawRect(0, 0, this._W_A_, this._height);
        graphics.endFill();
    }

}
}//package _5H_

