// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._0A_P_

package _03T_ {
import flash.events.EventDispatcher;

import _0_p._0E_9;

import flash.utils.Dictionary;

import _0_p._yy;
import _0_p._I_Y_;

import flash.events.IEventDispatcher;

public class _0A_P_ extends EventDispatcher implements _0E_9 {

    private const _0B_j:Dictionary = new Dictionary();

    public function _0A_P_(_arg1:Object) {
        this._R_d = _arg1;
        this._L_U_();
    }
    private var _R_d:Object;
    private var _U_4:int;
    private var _jt:_D_w;
    private var _m8:_D_w;
    private var _3X_:_D_w;
    private var _A_N_:_D_w;

    private var _state:String = "uninitialized";

    public function get state():String {
        return (this._state);
    }

    public function get target():Object {
        return (this._R_d);
    }

    public function get initialized():Boolean {
        return (((!((this._state == _yy._Z_j))) && (!((this._state == _yy._lO_)))));
    }

    public function get active():Boolean {
        return ((this._state == _yy._Q_t));
    }

    public function get suspended():Boolean {
        return ((this._state == _yy._0F_6));
    }

    public function get destroyed():Boolean {
        return ((this._state == _yy._xC_));
    }

    override public function addEventListener(_arg1:String, _arg2:Function, _arg3:Boolean = false, _arg4:int = 0, _arg5:Boolean = false):void {
        _arg4 = this._0K_l(_arg1, _arg4);
        super.addEventListener(_arg1, _arg2, _arg3, _arg4, _arg5);
    }

    public function initialize(_arg1:Function = null):void {
        this._jt.enter(_arg1);
    }

    public function suspend(_arg1:Function = null):void {
        this._m8.enter(_arg1);
    }

    public function resume(_arg1:Function = null):void {
        this._3X_.enter(_arg1);
    }

    public function destroy(_arg1:Function = null):void {
        this._A_N_.enter(_arg1);
    }

    public function _8u(_arg1:Function):_0E_9 {
        this._jt._W_5(_arg1);
        return (this);
    }

    public function _0L_T_(_arg1:Function):_0E_9 {
        this._m8._W_5(_arg1);
        return (this);
    }

    public function _8S_(_arg1:Function):_0E_9 {
        this._3X_._W_5(_arg1);
        return (this);
    }

    public function _zi(_arg1:Function):_0E_9 {
        this._A_N_._W_5(_arg1);
        return (this);
    }

    public function _0C_t(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_.INITIALIZE, this._aU_(_arg1, true));
        return (this);
    }

    public function _G_p(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_._05j, this._aU_(_arg1));
        return (this);
    }

    public function _N_Z_(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_._x8, this._aU_(_arg1));
        return (this);
    }

    public function _kf(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_._8Z_, this._aU_(_arg1, true));
        return (this);
    }

    public function _3a(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_._wv, this._aU_(_arg1, true));
        return (this);
    }

    public function _ks(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_._mx, this._aU_(_arg1));
        return (this);
    }

    public function _dI_(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_._Y_6, this._aU_(_arg1));
        return (this);
    }

    public function _0L_c(_arg1:Function):_0E_9 {
        this.addEventListener(_I_Y_._0K_I_, this._aU_(_arg1, true));
        return (this);
    }

    internal function _T_4(_arg1:String):void {
        if (this._state == _arg1) {
            return;
        }
        this._state = _arg1;
    }

    internal function _J_Q_(..._args):void {
        var _local2:String;
        for each (_local2 in _args) {
            this._0B_j[_local2] = true;
        }
    }

    private function _L_U_():void {
        this._jt = new _D_w(_I_Y_._W_i, this).fromStates(_yy._Z_j).toStates(_yy._lO_, _yy._Q_t).withEvents(_I_Y_._W_i, _I_Y_.INITIALIZE, _I_Y_._wv);
        this._m8 = new _D_w(_I_Y_._7J_, this).fromStates(_yy._Q_t).toStates(_yy._Y_q, _yy._0F_6).withEvents(_I_Y_._7J_, _I_Y_._05j, _I_Y_._mx).inReverse();
        this._3X_ = new _D_w(_I_Y_._ob, this).fromStates(_yy._0F_6).toStates(_yy._L_w, _yy._Q_t).withEvents(_I_Y_._ob, _I_Y_._x8, _I_Y_._Y_6);
        this._A_N_ = new _D_w(_I_Y_._0G_Z_, this).fromStates(_yy._0F_6, _yy._Q_t).toStates(_yy._A_Q_, _yy._xC_).withEvents(_I_Y_._0G_Z_, _I_Y_._8Z_, _I_Y_._0K_I_).inReverse();
    }

    private function _0K_l(_arg1:String, _arg2:int):int {
        return ((((((_arg2 == 0)) && (this._0B_j[_arg1]))) ? this._U_4++ : _arg2));
    }

    private function _aU_(handler:Function, once:Boolean = false):Function {
        if (handler.length > 1) {
            throw (new Error("When and After handlers must accept 0-1 arguments"));
        }
        if (handler.length == 1) {
            return (function (_arg1:_I_Y_):void {
                ((once) && (IEventDispatcher(_arg1.target).removeEventListener(_arg1.type, arguments.callee)));
                handler(_arg1.type);
            });
        }
        return (function (_arg1:_I_Y_):void {
            ((once) && (IEventDispatcher(_arg1.target).removeEventListener(_arg1.type, arguments.callee)));
            handler();
        });
    }

}
}//package _03T_

