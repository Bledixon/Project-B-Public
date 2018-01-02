// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_R_e._L_Z_

package _R_e {
import _C__._cM_;

import com.company.assembleegameclient.game.GameSprite;

import _05Z_._D_m;

import _U_5._M_d;
import _U_5._01W_;
import _U_5._dd;

import _05Z_._08i;

import _W_D_._0I_H_;
import _W_D_._G_J_;

import flash.events.Event;

import _9R_._j_;
import _9R_._D_X_;

import _F_1.CurrentCharacterScreen;

import _04w._07V_;

public class _L_Z_ extends _cM_ {

    [Inject]
    public var view:GameSprite;
    [Inject]
    public var _0H_j:_D_m;
    [Inject]
    public var _0D_p:_M_d;
    [Inject]
    public var _0_b:_01W_;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var _D_u:_08i;
    [Inject]
    public var _0I_s:_0I_H_;
    [Inject]
    public var _8X_:_G_J_;

    override public function initialize():void {
        this._0H_j.add(this._n4);
        _b6(Event.COMPLETE, this.onComplete);
        _b6(_j_.RECONNECT, this._X_3);
        _b6(_D_X_.CLIENT_UPDATE, this._Y_z);
    }

    override public function destroy():void {
        this._0H_j.remove(this._n4);
        _0E_K_(Event.COMPLETE, this.onComplete);
        _0E_K_(_D_X_.CLIENT_UPDATE, this._Y_z);
        _0E_K_(_j_.RECONNECT, this._X_3);
        this.view.dispose();
    }

    public function _n4(_arg1:Boolean):void {
        this.view.mui_._vB_(_arg1);
    }

    private function onComplete(_arg1:Event):void {
        this._0D_p.dispatch();
        this._0_b.dispatch(new CurrentCharacterScreen());
    }

    private function _Y_z(_arg1:_D_X_):void {
        this._0D_p.dispatch();
        this._0_b.dispatch(new CurrentCharacterScreen());
    }

    private function _X_3(_arg1:_j_):void {
        if (this.view.isEditor) {
            return;
        }
        var _local2:_07V_ = new _07V_();
        _local2._0L_9 = _arg1.server_;
        _local2._0A_6 = _arg1.gameId_;
        _local2._0_E_ = _arg1._96;
        _local2.charId = _arg1.charId_;
        _local2._f2 = _arg1.keyTime_;
        _local2.key = _arg1.key_;
        this._D_u.dispatch(_local2);
    }

}
}//package _R_e

