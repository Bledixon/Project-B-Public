// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_6e._4L_

package _6e {
import flash.display.Sprite;
import flash.display.Shape;

import com.company.assembleegameclient.appengine._0B_u;

import _0L_C_._qO_;

import flash.display.Graphics;

import com.company.assembleegameclient.parameters.Parameters;

import _zo._8C_;
import _zo._mS_;

import _qN_.Account;

import flash.events.Event;

import com.company.util._H_U_;

public class _4L_ extends Sprite {

    public function _4L_(_arg1:Boolean) {
        this._97 = _arg1;
        this._T_y = new Shape();
        var _local2:Graphics = this._T_y.graphics;
        _local2.clear();
        _local2.beginFill(0, 0.8);
        _local2.drawRect(0, 0, 800, 600);
        _local2.endFill();
        addChild(this._T_y);
        this.load();
    }
    private var _97:Boolean;
    private var _T_y:Shape;
    private var _08w:_0B_u;
    private var _I_4:_qO_;
    private var text_:String;
    private var _0_0:_03v;
    private var _X_A_:_0E_D_;

    private function load():void {
        this._08w = new _0B_u(Parameters._fK_(), "/guild", true);
        this._08w.addEventListener(_8C_.GENERIC_DATA, this._02E_);
        this._08w.addEventListener(_mS_.TEXT_ERROR, this._D_N_);
        this._08w.sendRequest("getBoard", Account._get().credentials());
        this._I_4 = new _qO_("Loading...", null, null, null, null);
        addChild(this._I_4);
        this._T_y.visible = false;
    }

    private function show():void {
        this._0_0 = new _03v(this.text_, this._97);
        this._0_0.x = ((800 / 2) - (this._0_0.w_ / 2));
        this._0_0.y = ((600 / 2) - (this._0_0.h_ / 2));
        this._0_0.addEventListener(Event.COMPLETE, this._N_q);
        this._0_0.addEventListener(Event.CHANGE, this._0D_0);
        addChild(this._0_0);
    }

    private function _02E_(_arg1:_8C_):void {
        this._T_y.visible = true;
        removeChild(this._I_4);
        this._I_4 = null;
        this.text_ = String(_arg1.data_);
        this.show();
    }

    private function _D_N_(_arg1:_mS_):void {
    }

    private function _N_q(_arg1:Event):void {
        parent.removeChild(this);
    }

    private function _0D_0(_arg1:Event):void {
        removeChild(this._0_0);
        this._0_0 = null;
        this._X_A_ = new _0E_D_(this.text_);
        this._X_A_.x = ((800 / 2) - (this._X_A_.w_ / 2));
        this._X_A_.y = ((600 / 2) - (this._X_A_.h_ / 2));
        this._X_A_.addEventListener(Event.CANCEL, this._aj);
        this._X_A_.addEventListener(Event.COMPLETE, this._P_c);
        addChild(this._X_A_);
    }

    private function _aj(_arg1:Event):void {
        removeChild(this._X_A_);
        this._X_A_ = null;
        this.show();
    }

    private function _P_c(_arg1:Event):void {
        this._08w = new _0B_u(Parameters._fK_(), "/guild", true);
        this._08w.addEventListener(_8C_.GENERIC_DATA, this._sk);
        this._08w.addEventListener(_mS_.TEXT_ERROR, this._da);
        var _local2:Object = {"board": this._X_A_._03h()};
        _H_U_._t2(_local2, Account._get().credentials());
        this._08w.sendRequest("setBoard", _local2);
        removeChild(this._X_A_);
        this._X_A_ = null;
        this._I_4 = new _qO_("Saving...", null, null, null, null);
        addChild(this._I_4);
        this._T_y.visible = false;
    }

    private function _sk(_arg1:_8C_):void {
        this._T_y.visible = true;
        removeChild(this._I_4);
        this._I_4 = null;
        this.text_ = String(_arg1.data_);
        this.show();
    }

    private function _da(_arg1:_mS_):void {
    }

}
}//package _6e

