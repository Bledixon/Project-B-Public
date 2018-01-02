// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_lW_._C_T_

package _lW_ {
import _0_p._D_v;

import _03T_._078;

import _0_p._L_y;

import flash.display.DisplayObjectContainer;

import _0_p._Q_5;

import _g3.instanceOf;

import flash.events.Event;

public class _C_T_ implements _D_v {

    private const _ul:String = _078.create(_C_T_);

    private var _rA_:_L_y;
    private var _sz:DisplayObjectContainer;
    private var _eo:_Q_5;

    public function extend(_arg1:_L_y):void {
        this._rA_ = _arg1;
        this._eo = _arg1._0H_4(this);
        this._rA_._ty(instanceOf(DisplayObjectContainer), this._uI_);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _uI_(_arg1:DisplayObjectContainer):void {
        if (this._sz) {
            this._eo._0E_Q_("A contextView has already been set, ignoring {0}", [_arg1]);
            return;
        }
        this._sz = _arg1;
        if (this._sz.stage) {
            this._sA_();
        } else {
            this._eo.debug("Context view is not yet on stage. Waiting...");
            this._sz.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }
    }

    private function _sA_():void {
        this._eo.debug("Context view is now on stage. Initializing context...");
        this._rA_._iL_.initialize();
        this._sz.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function onAddedToStage(_arg1:Event):void {
        this._sz.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this._sA_();
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this._eo.debug("Context view has left the stage. Destroying context...");
        this._sz.removeEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        this._rA_._iL_.destroy();
    }

}
}//package _lW_

