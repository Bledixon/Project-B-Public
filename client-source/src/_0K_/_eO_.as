// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_._eO_

package _0K_ {
import _E_x._00J_;

import _E_x._K_T_;

import _T_G_._9P_;

import flash.events.IEventDispatcher;

import _eZ_._08b;

import flash.utils.describeType;


public class _eO_ implements _00J_ {

    private const _0K_E_:Vector.<_K_T_> = new Vector.<_K_T_>();
    private const _H__:_9P_ = new _9P_();

    public function _eO_(_arg1:_08b, _arg2:IEventDispatcher, _arg3:String, _arg4:Class = null) {
        this._0L_4 = _arg2;
        this._0E_h = _arg3;
        this._S_r = new _gW_(this, this._H__, _arg1, _arg4);
    }
    private var _0L_4:IEventDispatcher;
    private var _0E_h:String;
    private var _S_r:_gW_;

    public function _J_w(_arg1:_K_T_):void {
        this._b4(_arg1);
        if (this._H__._U_H_) {
            this._H__._U_H_.next = _arg1;
        } else {
            this._H__._G_W_ = _arg1;
            this._uA_();
        }
    }

    public function _0A_W_(_arg1:_K_T_):void {
        this._H__.remove(_arg1);
        if (!this._H__._G_W_) {
            this._pD_();
        }
    }

    private function _b4(mapping:_K_T_):void {
        if (describeType(mapping.commandClass).factory.method.(@name == "execute").length() == 0) {
            throw (new Error("Command Class must expose an execute method"));
        }
    }

    private function _uA_():void {
        this._0L_4.addEventListener(this._0E_h, this._S_r.execute);
    }

    private function _pD_():void {
        this._0L_4.removeEventListener(this._0E_h, this._S_r.execute);
    }

}
}//package _0K_

