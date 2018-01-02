// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_060._H_G_

package _060 {
import flash.display.Sprite;
import flash.utils.Dictionary;
import flash.events.Event;
import flash.events.KeyboardEvent;

public class _H_G_ extends Sprite {

    public function _H_G_() {
        this._r9 = new Dictionary();
        super();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var _r9:Dictionary;
    private var _P_U_:int = 0;
    private var selected_:_0F_z = null;

    public function _P_b():int {
        return (this.selected_._0D_f);
    }

    public function _0G_A_(_arg1:int):void {
        var _local3:_0F_z;
        var _local2:int;
        while (_local2 < numChildren) {
            _local3 = (getChildAt(_local2) as _0F_z);
            if (_local3 != null) {
                if (_local3._0D_f == _arg1) {
                    this.setSelected(_local3);
                    return;
                }
            }
            _local2++;
        }
    }

    protected function setSelected(_arg1:_0F_z):void {
        if (this.selected_ != null) {
            this.selected_.setSelected(false);
        }
        this.selected_ = _arg1;
        this.selected_.setSelected(true);
    }

    protected function _6B_(_arg1:String, _arg2:int, _arg3:Function, _arg4:int):void {
        var _local5:_0F_z = new _0F_z(_arg1, _arg3, _arg4);
        _local5.y = this._P_U_;
        addChild(_local5);
        this._r9[_arg2] = _local5;
        if (this.selected_ == null) {
            this.setSelected(_local5);
        }
        this._P_U_ = (this._P_U_ + 30);
    }

    protected function _034():void {
        this._P_U_ = (this._P_U_ + 30);
    }

    private function onAddedToStage(_arg1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        if (stage.focus != null) {
            return;
        }
        var _local2:_0F_z = this._r9[_arg1.keyCode];
        if (_local2 == null) {
            return;
        }
        _local2.callback_(_local2);
    }

}
}//package _060

