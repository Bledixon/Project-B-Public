// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._G_9

package _zD_ {
import _C__._cM_;

import _0L_C_._s7;

import com.company.assembleegameclient.appengine.SavedCharacter;

import _02b._0F_A_;

import _U_5._M_d;
import _U_5._01W_;

import _F_1.CurrentCharacterScreen;

import _4X_._zU_;

public class _G_9 extends _cM_ {

    [Inject]
    public var view:_s7;
    [Inject]
    public var character:SavedCharacter;
    [Inject]
    public var _yD_:_0F_A_;
    [Inject]
    public var _0D_p:_M_d;
    [Inject]
    public var _0_b:_01W_;

    override public function initialize():void {
        this._yD_._iu.addOnce(this._S_f);
        this._yD_.start();
    }

    private function _S_f(_arg1:_zU_, _arg2:Boolean, _arg3:String = ""):void {
        this.view.parent.removeChild(this.view);
        this._0D_p.dispatch();
        this._0_b.dispatch(new CurrentCharacterScreen());
    }

}
}//package _zD_

