// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._wo

package _qD_ {
import flash.display.Sprite;

import flash.events.MouseEvent;
import flash.events.Event;


public class _wo extends Sprite {

    public static const _sS_:String = "Stand";
    public static const WALK1:String = "Walk 1";
    public static const WALK2:String = "Walk 2";
    public static const ATTACK1:String = "Attack 1";
    public static const ATTACK2:String = "Attack 2";
    public static const _0E_y:Vector.<String> = new <String>[_sS_, WALK1, WALK2, ATTACK1, ATTACK2];

    public function _wo() {
        var _local2:String;
        var _local3:_J_B_;
        this._kx = new Vector.<_J_B_>();
        super();
        var _local1:int;
        for each (_local2 in _0E_y) {
            _local3 = new _J_B_(_local2);
            _local3.addEventListener(MouseEvent.CLICK, this._021);
            _local3.x = _local1;
            _local1 = (_local1 + (_local3.width + 5));
            addChild(_local3);
            this._kx.push(_local3);
        }
        this.setSelected(this._kx[0]);
    }
    public var _kx:Vector.<_J_B_>;
    public var selected_:_J_B_ = null;

    public function _rq():String {
        return (this.selected_.label_);
    }

    private function setSelected(_arg1:_J_B_):void {
        if (this.selected_ != null) {
            this.selected_.setSelected(false);
        }
        this.selected_ = _arg1;
        this.selected_.setSelected(true);
        dispatchEvent(new Event(Event.CHANGE));
    }

    private function _021(_arg1:MouseEvent):void {
        var _local2:_J_B_ = (_arg1.target as _J_B_);
        this.setSelected(_local2);
    }

}
}//package _qD_

