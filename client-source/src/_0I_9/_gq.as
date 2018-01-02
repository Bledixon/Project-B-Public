// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_9._gq

package _0I_9 {
import _C__._cM_;

import _U_5._dd;
import _U_5._6J_;

import flash.display.Sprite;

public class _gq extends _cM_ {

    [Inject]
    public var view:_C_6;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var _S_a:_6J_;

    override public function initialize():void {
        this._T__.add(this._1q);
        this._S_a.add(this._0_q);
    }

    override public function destroy():void {
        this._T__.remove(this._1q);
        this._S_a.add(this._0_q);
    }

    private function _1q(_arg1:Sprite):void {
        this.view._T__(_arg1);
    }

    private function _0_q():void {
        this.view._T__(this.view._bM_());
    }

}
}//package _0I_9

