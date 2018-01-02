// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_O_6._3C_

package _O_6 {
import _A_G_._08I_;

import _mY_._0D_c;

import _03T_._04O_;

import _W_G_._09a;

public class _3C_ implements _08I_, _0D_c {

    public function _3C_(_arg1:_09a, _arg2:Class) {
        this._0B_R_ = [];
        this._K_1 = [];
        super();
        this._matcher = _arg1;
        this._I_t = _arg2;
    }
    private var _0J_g:Boolean = false;
    private var _3F_:_04O_;
    private var _matcher:_09a;
    private var _I_t:Class;
    private var _0B_R_:Array;
    private var _K_1:Array;

    public function get _01g():_09a {
        return (this._matcher);
    }

    public function get _T_X_():Class {
        return (this._I_t);
    }

    public function get _0_R_():Array {
        return (this._0B_R_);
    }

    public function get _7w():Array {
        return (this._K_1);
    }

    public function _k2(..._args):_0D_c {
        ((this._3F_) && (this._3F_._09y(_args)));
        this._0B_R_ = this._0B_R_.concat.apply(null, _args);
        return (this);
    }

    public function _U_w(..._args):_0D_c {
        ((this._3F_) && (this._3F_._H_l(_args)));
        this._K_1 = this._K_1.concat.apply(null, _args);
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

    private function _X_q():void {
        this._3F_ = new _04O_(this._0B_R_.slice(), this._K_1.slice(), this._matcher, this._I_t);
    }

}
}//package _O_6

