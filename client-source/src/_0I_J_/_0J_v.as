// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_J_._0J_v

package _0I_J_ {
import _sp._aJ_;

import flash.utils.Dictionary;
import flash.events.IEventDispatcher;
import flash.events.Event;

public class _0J_v extends _aJ_ {

    public function _0J_v(_arg1:String, ..._args) {
        this._S_b = _arg1;
        this._1S_ = new Dictionary(true);
        super(_args);
    }
    private var _S_b:String;
    private var _1S_:Dictionary;

    public function map(_arg1:IEventDispatcher, _arg2:*):void {
        this._1S_[_arg1] = _arg2;
        _arg1.addEventListener(this._S_b, this._F_4, false, 0, true);
    }

    private function _F_4(_arg1:Event):void {
        dispatch(this._1S_[_arg1.target]);
    }

}
}//package _0I_J_

