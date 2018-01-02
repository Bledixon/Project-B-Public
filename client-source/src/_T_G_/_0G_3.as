// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_T_G_._0G_3

package _T_G_ {
import _E_x._K_T_;

import _g2._028;

import _03T_._04O_;

import _E_x._0D_Y_;

public class _0G_3 implements _K_T_, _028 {

    public function _0G_3(_arg1:Class) {
        this._0B_R_ = [];
        this._K_1 = [];
        super();
        this._zw = _arg1;
    }
    private var _zw:Class;
    private var _0B_R_:Array;
    private var _K_1:Array;
    private var _once:Boolean;
    private var _0L_s:_K_T_;
    private var _3F_:_04O_;

    public function get commandClass():Class {
        return (this._zw);
    }

    public function get _0_R_():Array {
        return (this._0B_R_);
    }

    public function get _7w():Array {
        return (this._K_1);
    }

    public function get _Z_V_():Boolean {
        return (this._once);
    }

    public function get next():_K_T_ {
        return (this._0L_s);
    }

    public function set next(_arg1:_K_T_):void {
        this._0L_s = _arg1;
    }

    public function _k2(..._args):_028 {
        ((this._3F_) && (this._3F_._09y(_args)));
        this._0B_R_ = this._0B_R_.concat.apply(null, _args);
        return (this);
    }

    public function _U_w(..._args):_028 {
        ((this._3F_) && (this._3F_._H_l(_args)));
        this._K_1 = this._K_1.concat.apply(null, _args);
        return (this);
    }

    public function once(_arg1:Boolean = true):_028 {
        ((((this._3F_) && (!(this._once)))) && (this._9f((("You attempted to change an existing mapping for " + this._zw) + " by setting once(). Please unmap first."))));
        this._once = _arg1;
        return (this);
    }

    public function _ok():void {
        if (!this._3F_) {
            this._X_q();
        } else {
            if (!this._3F_.valid) {
                this._3F_._ok(this._0B_R_, this._K_1);
            }
        }
    }

    internal function _0D_p():void {
        if (this._3F_) {
            this._3F_._0D_p();
        } else {
            this._X_q();
        }
        this._0B_R_ = [];
        this._K_1 = [];
    }

    private function _9f(_arg1:String):void {
        throw (new _0D_Y_(_arg1));
    }

    private function _X_q():void {
        this._3F_ = new _04O_(this._0B_R_.slice(), this._K_1.slice(), null, this._zw);
    }

}
}//package _T_G_

