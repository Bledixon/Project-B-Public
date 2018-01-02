// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_H_._09W_

package _D_H_ {
import flash.display.Sprite;

import flash.events.MouseEvent;
import flash.events.Event;


public class _09W_ extends Sprite {

    public function _09W_(_arg1:Vector.<int>) {
        var _local2:int;
        this._C_j = new Vector.<_B_O_>();
        super();
        for each (_local2 in _arg1) {
            this.addItem(new _B_O_(_local2));
        }
        this.setSelected(this._C_j[0]);
    }
    public var _C_j:Vector.<_B_O_>;
    public var selected_:_B_O_;

    public function _ta(_arg1:int):void {
        var _local2:_B_O_;
        for each (_local2 in this._C_j) {
            if (_local2.type_ == _arg1) {
                this.setSelected(_local2);
            }
        }
    }

    public function getType():int {
        return (this.selected_.type_);
    }

    private function addItem(_arg1:_B_O_):void {
        this._C_j.push(_arg1);
    }

    private function _X_L_():void {
        if (this.selected_ != null) {
            if (contains(this.selected_)) {
                removeChild(this.selected_);
            }
            this.selected_.removeEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        }
    }

    private function setSelected(_arg1:_B_O_):void {
        this._X_L_();
        this.selected_ = _arg1;
        this.selected_.y = 0;
        addChild(this.selected_);
        this.selected_.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
    }

    private function _022():void {
        var _local3:_B_O_;
        var _local1:int;
        var _local2:int;
        while (_local2 < this._C_j.length) {
            _local3 = this._C_j[_local2];
            _local3.addEventListener(MouseEvent.MOUSE_DOWN, this._cj);
            _local3.y = _local1;
            addChild(_local3);
            _local1 = (_local1 + _B_O_.HEIGHT);
            _local2++;
        }
    }

    private function _1c():void {
        var _local2:_B_O_;
        var _local1:int;
        while (_local1 < this._C_j.length) {
            _local2 = this._C_j[_local1];
            _local2.removeEventListener(MouseEvent.MOUSE_DOWN, this._cj);
            removeChild(_local2);
            _local1++;
        }
    }

    private function onMouseDown(_arg1:MouseEvent):void {
        if (this._C_j.length == 1) {
            return;
        }
        this._X_L_();
        this._022();
    }

    private function _cj(_arg1:MouseEvent):void {
        this._1c();
        this.setSelected((_arg1.target as _B_O_));
        dispatchEvent(new Event(Event.CHANGE));
    }

}
}//package _D_H_

