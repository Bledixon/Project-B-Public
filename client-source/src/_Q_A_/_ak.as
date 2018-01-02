// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Q_A_._ak

package _Q_A_ {
import flash.display.Sprite;

import _0D_d.Frame;

import com.company.assembleegameclient.appengine._0B_u;

import flash.display.Shape;
import flash.display.Graphics;

import _qN_.Account;

import com.company.assembleegameclient.parameters.Parameters;

import _zo._8C_;
import _zo._mS_;

import flash.events.Event;

public class _ak extends Sprite {

    public function _ak(_arg1:Boolean) {
        this._T_y = new Shape();
        var _local2:Graphics = this._T_y.graphics;
        _local2.clear();
        _local2.beginFill(0, 0.8);
        _local2.drawRect(0, 0, 800, 600);
        _local2.endFill();
        addChild(this._T_y);
        if (_arg1) {
            this._dY_(new _L__());
        } else {
            this.start();
        }
    }
    private var _Z_X_:Frame = null;
    private var _zH_:_0B_u = null;
    private var _T_y:Shape;

    private function start():void {
        if (!Account._get().isRegistered()) {
            this.register();
        } else {
            this._X_d();
        }
    }

    private function _X_d():void {
        this._np();
        this._zH_ = new _0B_u(Parameters._fK_(), "/account", true);
        this._zH_.addEventListener(_8C_.GENERIC_DATA, this._3p);
        this._zH_.addEventListener(_mS_.TEXT_ERROR, this._D_x);
        this._zH_.sendRequest("verify", Account._get().credentials());
    }

    private function register():void {
        this._dY_(new _0L_h());
    }

    private function _dY_(_arg1:Frame):void {
        this._np();
        _arg1.addEventListener(_nJ_.DONE, this._F_H_);
        _arg1.addEventListener(_nJ_._tp, this._L_L_);
        _arg1.addEventListener(_nJ_._G__, this._mO_);
        _arg1.addEventListener(_nJ_._2K_, this._q5);
        _arg1.addEventListener(_nJ_._lS_, this._08Y_);
        _arg1.addEventListener(_nJ_.CHANGE, this._bR_);
        addChild(_arg1);
        this._Z_X_ = _arg1;
    }

    private function _np():void {
        if (((!((this._Z_X_ == null))) && (contains(this._Z_X_)))) {
            removeChild(this._Z_X_);
        }
    }

    private function _3p(_arg1:_8C_):void {
        this._dY_(new _0G_d(XML(_arg1.data_)));
    }

    private function _D_x(_arg1:_mS_):void {
        Account._get().clear();
        this._dY_(new _L__());
    }

    private function _F_H_(_arg1:_nJ_):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _L_L_(_arg1:_nJ_):void {
        this._X_d();
    }

    private function _mO_(_arg1:_nJ_):void {
        this._dY_(new _0L_h());
    }

    private function _q5(_arg1:_nJ_):void {
        this._dY_(new _L__());
    }

    private function _08Y_(_arg1:_nJ_):void {
        this._dY_(new _F_V_());
    }

    private function _bR_(_arg1:_nJ_):void {
        this._dY_(new _ag());
    }

}
}//package _Q_A_

