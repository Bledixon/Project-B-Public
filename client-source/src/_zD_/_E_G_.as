// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._E_G_

package _zD_ {
import _C__._cM_;

import _0L_C_._Z_t;

import _U_5._M_d;
import _U_5._01W_;

import flash.events.Event;

import _F_1.CurrentCharacterScreen;

public class _E_G_ extends _cM_ {

    [Inject]
    public var view:_Z_t;
    [Inject]
    public var _0B_a:_M_d;
    [Inject]
    public var _0_b:_01W_;

    override public function initialize():void {
        _b6(Event.COMPLETE, this.onComplete);
    }

    override public function destroy():void {
        _0E_K_(Event.COMPLETE, this.onComplete);
    }

    private function onComplete(_arg1:Event):void {
        this._0B_a.dispatch();
        this._0_b.dispatch(new CurrentCharacterScreen());
    }

}
}//package _zD_

