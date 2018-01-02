// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Q_A_._0G_d

package _Q_A_ {
import _0D_d.Frame;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui.TextButton;

import flash.events.Event;
import flash.events.KeyboardEvent;

import flash.filters.DropShadowFilter;

import _qN_.Account;

import flash.events.MouseEvent;

import com.company.assembleegameclient.appengine._0B_u;
import com.company.assembleegameclient.parameters.Parameters;

import _zo._8C_;
import _zo._mS_;

import com.company.googleanalytics.GA;

import _Q_A_.*;

internal class _0G_d extends Frame {

    public function _0G_d(_arg1:XML) {
        super("Current account", "", "Continue", "/currentLogin");
        var _local2:Boolean = _arg1.hasOwnProperty("VerifiedEmail");
        this._lv = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._lv.setBold(true);
        this._lv.text = "Currently logged in as:";
        this._lv.updateMetrics();
        this._lv.filters = [new DropShadowFilter(0, 0, 0)];
        this._lv.y = (h_ - 60);
        this._lv.x = 17;
        addChild(this._lv);
        this._ba = new SimpleText(16, 0xB3B3B3, false, 238, 30, "Myriad Pro");
        this._ba.text = Account._get().guid();
        this._ba.updateMetrics();
        this._ba.y = (h_ - 30);
        this._ba.x = 17;
        addChild(this._ba);
        h_ = (h_ + 88);
        if (!_local2) {
            this._N_3 = new TextButton(12, false, ("Email not verified.  " + "Click here to resend email."));
            __true(this._N_3);
            this._N_3.addEventListener(MouseEvent.CLICK, this._W_0);
        }
        this._H_ = new TextButton(12, false, "Click here to change password");
        __true(this._H_);
        this._0J_7 = new TextButton(12, false, "Not you?  Click here");
        __true(this._0J_7);
        Button2.addEventListener(MouseEvent.CLICK, this._03t);
        this._H_.addEventListener(MouseEvent.CLICK, this._bR_);
        this._0J_7.addEventListener(MouseEvent.CLICK, this._I_G_);
    }
    public var _lv:SimpleText;
    public var _ba:SimpleText;
    public var _N_3:TextButton;
    public var _H_:TextButton;
    public var _0J_7:TextButton;

    public function _bR_(_arg1:MouseEvent):void {
        dispatchEvent(new _nJ_(_nJ_.CHANGE));
    }

    public function _I_G_(_arg1:MouseEvent):void {
        //GA.global().trackEvent("account", "loggedOut");
        Account._get().clear();
        dispatchEvent(new _nJ_(_nJ_._2K_));
    }

    private function _W_0(_arg1:MouseEvent):void {
        var _local2:_0B_u = new _0B_u(Parameters._fK_(), "/account", true);
        _local2.addEventListener(_8C_.GENERIC_DATA, this._Z_e);
        _local2.addEventListener(_mS_.TEXT_ERROR, this._0F_0);
        _local2.sendRequest("sendVerifyEmail", Account._get().credentials());
        this._N_3._bu("Sent...");
    }

    private function _Z_e(_arg1:_8C_):void {
        //GA.global().trackEvent("account", "verifyEmailSent");
    }

    private function _0F_0(_arg1:_mS_):void {
        Account._get().clear();
        dispatchEvent(new _nJ_(_nJ_._2K_));
    }

    private function _03t(_arg1:MouseEvent):void {
        dispatchEvent(new _nJ_(_nJ_.DONE));
    }

}
}//package _Q_A_

