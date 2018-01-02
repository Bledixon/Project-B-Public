// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_lo._L_W_

package _lo {
import flash.events.Event;
import flash.display.DisplayObjectContainer;
import flash.display.DisplayObject;
import flash.utils.getQualifiedClassName;

public class _L_W_ {

    private const _filter:RegExp = /^mx\.|^spark\.|^flash\./;

    public function _L_W_(_arg1:_t5) {
        var _local2:_02f;
        super();
        this._055 = _arg1;
        this._055.addEventListener(_or._Y_N_, this._S_g);
        this._055.addEventListener(_or._O_U_, this._0G_6);
        for each (_local2 in this._055._0C_W_) {
            this._5_(_local2.container);
        }
    }
    private var _055:_t5;

    public function destroy():void {
        var _local1:_02f;
        this._055.removeEventListener(_or._Y_N_, this._S_g);
        this._055.removeEventListener(_or._O_U_, this._0G_6);
        for each (_local1 in this._055._0C_W_) {
            this._04Q_(_local1.container);
        }
    }

    private function _5_(_arg1:DisplayObjectContainer):void {
        _arg1.addEventListener(Event.ADDED_TO_STAGE, this._74, true);
        _arg1.addEventListener(Event.ADDED_TO_STAGE, this._U_K_);
    }

    private function _04Q_(_arg1:DisplayObjectContainer):void {
        _arg1.removeEventListener(Event.ADDED_TO_STAGE, this._74, true);
        _arg1.removeEventListener(Event.ADDED_TO_STAGE, this._U_K_);
    }

    private function _S_g(_arg1:_or):void {
        this._5_(_arg1.container);
    }

    private function _0G_6(_arg1:_or):void {
        this._04Q_(_arg1.container);
    }

    private function _74(_arg1:Event):void {
        var _local2:DisplayObject;
        var _local3:String;
        _local2 = (_arg1.target as DisplayObject);
        _local3 = getQualifiedClassName(_local2);
        var _local4:Boolean = this._filter.test(_local3);
        if (_local4) {
            return;
        }
        var _local5:Class = _local2["constructor"];
        var _local6:_02f = this._055._0C_H_(_local2);
        while (_local6) {
            _local6._H_3(_local2, _local5);
            _local6 = _local6.parent;
        }
    }

    private function _U_K_(_arg1:Event):void {
        var _local2:DisplayObjectContainer;
        _local2 = (_arg1.target as DisplayObjectContainer);
        _local2.removeEventListener(Event.ADDED_TO_STAGE, this._U_K_);
        var _local3:Class = _local2["constructor"];
        var _local4:_02f = this._055._3N_(_local2);
        _local4._H_3(_local2, _local3);
    }

}
}//package _lo

