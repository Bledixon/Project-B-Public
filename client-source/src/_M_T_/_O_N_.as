// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_M_T_._O_N_

package _M_T_ {
import _0_p._D_v;

import _03T_._078;

import flash.events.IEventDispatcher;
import flash.events.EventDispatcher;

import _0_p._L_y;

public class _O_N_ implements _D_v {

    private const _ul:String = _078.create(_O_N_);

    public function _O_N_(_arg1:IEventDispatcher = null) {
        this._eventDispatcher = ((_arg1) || (new EventDispatcher()));
    }
    private var _eventDispatcher:IEventDispatcher;

    public function extend(_arg1:_L_y):void {
        _arg1._O_R_.map(IEventDispatcher)._q3(this._eventDispatcher);
    }

    public function toString():String {
        return (this._ul);
    }

}
}//package _M_T_

