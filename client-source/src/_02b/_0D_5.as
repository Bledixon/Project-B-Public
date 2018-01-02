// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_02b._0D_5

package _02b {
import _4X_._zU_;

import _W_D_._0I_H_;

import _U_5._bo;

import flash.utils.Timer;

import com.company.assembleegameclient.appengine._2n;

import _zo._mS_;

import com.company.assembleegameclient.appengine.Server_list;

import _qN_.Account;

import flash.events.TimerEvent;

public class _0D_5 extends _zU_ {

    private static const _W_1:int = 1000;

    [Inject]
    public var _0I_s:_0I_H_;
    [Inject]
    public var _08e:_bo;
    private var _Z_w:Timer;
    private var _0D_b:_2n;

    override protected function startTask():void {
        this._0D_b = new _2n();
        this._0D_b.addEventListener(_mS_.TEXT_ERROR, this._ix);
        this._0D_b.addEventListener(Server_list.SAVED_CHARS_LIST, this._dM_);
        this._J__();
    }

    private function _J__():void {
        this._0D_b._H_Q_();
    }

    private function _wg():void {
        Account._get().clear();
        this._J__();
    }

    private function _5j():void {
        this._Z_w = new Timer(_W_1, 1);
        this._Z_w.addEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w.start();
    }

    private function _qv():void {
        this._Z_w.stop();
        this._Z_w.removeEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w = null;
    }

    private function _ix(_arg1:_mS_):void {
        this._08e.dispatch('<p align="center">Server is currently offline...</p>');
        if (_arg1.text_ == "Account credentials not valid") {
            this._wg();
        } else {
            this._5j();
        }
    }

    private function _F_z(_arg1:TimerEvent):void {
        this._J__();
    }

    private function _dM_(_arg1:Server_list):void {
        this._0I_s._T_1 = new Server_list(_arg1._Q_I_);
        this._0I_s._34 = false;
        _C_t(true);
        if (this._Z_w != null) {
            this._qv();
        }
    }

}
}//package _02b

