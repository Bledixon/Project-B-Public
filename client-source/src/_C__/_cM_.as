// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_C__._cM_

package _C__ {
import _A_G_._U_Y_;

import _0H_p._0F_H_;

import flash.events.IEventDispatcher;
import flash.events.Event;

public class _cM_ implements _U_Y_ {

    [Inject]
    public var _N_d:_0F_H_;
    [Inject]
    public var _09G_:IEventDispatcher;
    private var _0_J_:Object;

    public function set viewComponent(_arg1:Object):void {
        this._0_J_ = _arg1;
    }

    public function initialize():void {
    }

    public function destroy():void {
        this._N_d._0I_p();
    }

    protected function _b6(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this._N_d._08r(IEventDispatcher(this._0_J_), _arg1, _arg2, _arg3);
    }

    protected function _nU_(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this._N_d._08r(this._09G_, _arg1, _arg2, _arg3);
    }

    protected function _0E_K_(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this._N_d._0M_v(IEventDispatcher(this._0_J_), _arg1, _arg2, _arg3);
    }

    protected function _uU_(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this._N_d._0M_v(this._09G_, _arg1, _arg2, _arg3);
    }

    protected function dispatch(_arg1:Event):void {
        if (this._09G_.hasEventListener(_arg1.type)) {
            this._09G_.dispatchEvent(_arg1);
        }
    }

}
}//package _C__

