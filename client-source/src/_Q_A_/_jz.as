// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Q_A_._jz

package _Q_A_ {
import _qN_._9j;

import com.company.ui.SimpleText;

import _F_1._H_o;

import _qN_.Account;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

import _qN_._F_m;

public class _jz extends _9j {

    private static const _Y_J_:int = 18;

    public function _jz() {
        this.refresh();
    }
    private var _cY_:SimpleText = null;
    private var _0D_P_:_H_o = null;
    private var _0J_C_:SimpleText = null;
    private var _O_b:_H_o = null;

    override public function refresh():void {
        if (this._cY_ != null) {
            removeChild(this._cY_);
            this._cY_ = null;
        }
        if (this._0D_P_ != null) {
            removeChild(this._0D_P_);
            this._0D_P_ = null;
        }
        if (this._0J_C_ != null) {
            removeChild(this._0J_C_);
            this._0J_C_ = null;
        }
        if (this._O_b != null) {
            removeChild(this._O_b);
            this._O_b = null;
        }
        this._cY_ = new SimpleText(_Y_J_, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        if (!Account._get().isRegistered()) {
            this._cY_.text = "guest account - ";
            this._0D_P_ = new _H_o("register", _Y_J_, false);
            this._0D_P_.addEventListener(MouseEvent.CLICK, this._mO_);
            this._O_b = new _H_o("log in", _Y_J_, false);
            this._O_b.addEventListener(MouseEvent.CLICK, this._02G_);
        } else {
            this._cY_.text = (("logged in as " + Account._get().guid()) + " - ");
            this._0D_P_ = new _H_o("log out", _Y_J_, false);
            this._0D_P_.addEventListener(MouseEvent.CLICK, this._5E_);
        }
        this._cY_.updateMetrics();
        this._cY_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
        addChild(this._cY_);
        this._0D_P_.x = width;
        addChild(this._0D_P_);
        if (this._O_b != null) {
            this._0J_C_ = new SimpleText(_Y_J_, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._0J_C_.text = " - ";
            this._0J_C_.x = width;
            this._0J_C_.updateMetrics();
            this._0J_C_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
            addChild(this._0J_C_);
            this._O_b.x = width;
            addChild(this._O_b);
        }
    }

    private function _mO_(_arg1:MouseEvent):void {
        dispatchEvent(new _F_m(new _ak(false)));
    }

    private function _5E_(_arg1:MouseEvent):void {
        Account._get().clear();
        dispatchEvent(new _F_m(null));
    }

    private function _02G_(_arg1:MouseEvent):void {
        dispatchEvent(new _F_m(new _ak(true)));
    }

}
}//package _Q_A_

