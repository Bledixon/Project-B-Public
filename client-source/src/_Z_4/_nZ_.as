// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Z_4._nZ_

package _Z_4 {
import _eZ_._08b;

import _Y_3._6_;
import _Y_3._uS_;
import _Y_3._rP_;
import _Y_3._5d;

import _eZ_._N_p;

import _4u.SsInternal;

import _Y_3._d5;
import _Y_3._yi;
import _Y_3._Q_4;
import _Y_3._4c;

public class _nZ_ implements _S_3, _0C_Z_ {

    public function _nZ_(_arg1:_08b, _arg2:Class, _arg3:String, _arg4:String) {
        this._00_ = _arg1;
        this._0E_h = _arg2;
        this._name = _arg3;
        this._08c = _arg4;
        this._9X_ = true;
        this._af(new _6_(_arg2));
    }
    private var _0E_h:Class;
    private var _name:String;
    private var _08c:String;
    private var _00_:_08b;
    private var _9X_:Boolean;
    private var _3W_:_08b;
    private var _G_e:Boolean;
    private var _cy:Boolean;
    private var _05g:Boolean;
    private var _A_8:Object;

    public function get _an():Boolean {
        return (this._05g);
    }

    public function _hZ_():_0C_Z_ {
        this._00S_(this._0E_h);
        return (this);
    }

    public function _02g(_arg1:Class):_0C_Z_ {
        this._0x(new _6_(_arg1));
        return (this);
    }

    public function _00S_(_arg1:Class):_0C_Z_ {
        this._0x(new _uS_(_arg1, this._00_));
        return (this);
    }

    public function _q3(_arg1:Object):_0C_Z_ {
        this._0x(new _rP_(_arg1));
        return (this);
    }

    public function _0x(_arg1:_5d):_0C_Z_ {
        ((this._05g) && (this._D_o()));
        if (((((this._V_F_()) && (!((_arg1 == null))))) && (!(this._9X_)))) {
            trace(((((("Warning: Injector already has a mapping for " + this._08c) + ".\n ") + "If you have overridden this mapping intentionally you can use ") + '"injector.unmap()" prior to your replacement mapping in order to ') + "avoid seeing this message."));
            ((this._00_.hasEventListener(_09D_._P_L_)) && (this._00_.dispatchEvent(new _09D_(_09D_._P_L_, this._0E_h, this._name, this))));
        }
        this._06U_();
        this._9X_ = false;
        this._af(_arg1);
        this._0I_G_();
        return (this);
    }

    public function _vu():_S_3 {
        var _local1:_5d;
        ((this._05g) && (this._D_o()));
        if (!this._G_e) {
            _local1 = this._L_E_();
            this._06U_();
            this._G_e = true;
            this._af(_local1);
            this._0I_G_();
        }
        return (this);
    }

    public function _kE_():_S_3 {
        ((this._05g) && (this._D_o()));
        if (this._cy) {
            return (this);
        }
        var _local1:_5d = this._L_E_();
        this._06U_();
        this._cy = true;
        this._af(_local1);
        this._0I_G_();
        return (this);
    }

    public function _za():Object {
        if (this._05g) {
            throw (new _N_p("Mapping is already sealed."));
        }
        this._05g = true;
        this._A_8 = {};
        return (this._A_8);
    }

    public function _yF_(_arg1:Object):_nZ_ {
        if (!this._05g) {
            throw (new _N_p("Can't unseal a non-sealed mapping."));
        }
        if (_arg1 !== this._A_8) {
            throw (new _N_p("Can't unseal mapping without the correct key."));
        }
        this._05g = false;
        this._A_8 = null;
        return (this);
    }

    public function _V_F_():Boolean {
        return (Boolean(this._00_.SsInternal::_vg[this._08c]));
    }

    public function _L_E_():_5d {
        var _local1:_5d = this._00_.SsInternal::_vg[this._08c];
        while ((_local1 is _d5)) {
            _local1 = _d5(_local1).provider;
        }
        return (_local1);
    }

    public function _0B_6(_arg1:_08b):_nZ_ {
        ((this._05g) && (this._D_o()));
        if (_arg1 == this._3W_) {
            return (this);
        }
        var _local2:_5d = this._L_E_();
        this._3W_ = _arg1;
        this._af(_local2);
        return (this);
    }

    private function _af(_arg1:_5d):void {
        if (this._G_e) {
            _arg1 = new _yi(_arg1);
        }
        if (this._cy) {
            _arg1 = new _Q_4(_arg1);
        }
        if (this._3W_) {
            _arg1 = new _4c(this._3W_, _arg1);
        }
        this._00_.SsInternal::_vg[this._08c] = _arg1;
    }

    private function _D_o():void {
        throw (new _N_p("Can't change a sealed mapping"));
    }

    private function _06U_():void {
        ((this._00_.hasEventListener(_09D_._b_)) && (this._00_.dispatchEvent(new _09D_(_09D_._b_, this._0E_h, this._name, this))));
    }

    private function _0I_G_():void {
        ((this._00_.hasEventListener(_09D_._yL_)) && (this._00_.dispatchEvent(new _09D_(_09D_._yL_, this._0E_h, this._name, this))));
    }

}
}//package _Z_4

