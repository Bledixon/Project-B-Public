// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_eZ_._08b

package _eZ_ {
import flash.events.EventDispatcher;
import flash.utils.Dictionary;

import _4u.SsInternal;

import flash.system.ApplicationDomain;

import _4u._T_O_;

import _0B_K_._0I_q;

import avmplus.DescribeTypeJSON;

import _0B_K_._00o;
import _0B_K_._0D_C_;

import flash.utils.getQualifiedClassName;

import _Z_4._nZ_;
import _Z_4._09D_;

import _M_Q_._B_h;

import _0J_k._N_D_;

import _Y_3._5d;

import _0J_k._Q_m;
import _0J_k._tv;

import _M_Q_._B_i;

import _Y_3._yi;
import _Y_3._Q_4;

import flash.utils.getDefinitionByName;

import _Y_3._6_;

import _0J_k._5W_;

use namespace SsInternal;

public class _08b extends EventDispatcher {

    SsInternal const _vg:Dictionary = new Dictionary();
    private static var _wn:Dictionary = new Dictionary(true);

    public function _08b() {
        super();
        this._0K_E_ = new Dictionary();
        this._3w = new Dictionary();
        this._g6 = new Dictionary();
        this._06A_ = new Dictionary();
        try {
            this._07e = ((DescribeTypeJSON.available) ? new _00o() : new _0D_C_());
        } catch (e:Error) {
            _07e = new _0D_C_();
        }
        this._9T_ = new _T_O_(this._07e, _wn);
        this._X_F_ = ApplicationDomain.currentDomain;
    }
    private var _5t:_08b;
    private var _X_F_:ApplicationDomain;
    private var _9T_:_T_O_;
    private var _0K_E_:Dictionary;
    private var _3w:Dictionary;
    private var _g6:Dictionary;
    private var _06A_:Dictionary;
    private var _07e:_0I_q;

    public function get _k():_08b {
        return (this._5t);
    }

    public function set _k(_arg1:_08b):void {
        this._5t = _arg1;
    }

    public function get applicationDomain():ApplicationDomain {
        return (this._X_F_);
    }

    public function set applicationDomain(_arg1:ApplicationDomain):void {
        this._X_F_ = ((_arg1) || (ApplicationDomain.currentDomain));
    }

    public function map(_arg1:Class, _arg2:String = ""):_nZ_ {
        var _local3:String = ((getQualifiedClassName(_arg1) + "|") + _arg2);
        return (((this._0K_E_[_local3]) || (this._21(_arg1, _arg2, _local3))));
    }

    public function _1Y_(_arg1:Class, _arg2:String = ""):void {
        var _local3:String = ((getQualifiedClassName(_arg1) + "|") + _arg2);
        var _local4:_nZ_ = this._0K_E_[_local3];
        if (((_local4) && (_local4._an))) {
            throw (new _N_p("Can't unmap a sealed mapping"));
        }
        if (!_local4) {
            throw (new _N_p((("Error while removing an injector mapping: " + "No mapping defined for dependency ") + _local3)));
        }
        _local4._L_E_().destroy();
        delete this._0K_E_[_local3];
        delete this._vg[_local3];
        ((hasEventListener(_09D_._K_e)) && (dispatchEvent(new _09D_(_09D_._K_e, _arg1, _arg2, null))));
    }

    public function _0E_j(_arg1:Class, _arg2:String = ""):Boolean {
        return (!((this._L_E_(((getQualifiedClassName(_arg1) + "|") + _arg2)) == null)));
    }

    public function _d6(_arg1:Class, _arg2:String = ""):Boolean {
        return (!((this._vg[((getQualifiedClassName(_arg1) + "|") + _arg2)] == null)));
    }

    public function _0_w(_arg1:Class, _arg2:String = ""):_nZ_ {
        var _local3:String = ((getQualifiedClassName(_arg1) + "|") + _arg2);
        var _local4:_nZ_ = this._0K_E_[_local3];
        if (!_local4) {
            throw (new _B_h((("Error while retrieving an injector mapping: " + "No mapping defined for dependency ") + _local3)));
        }
        return (_local4);
    }

    public function _0B_B_(_arg1:Object):void {
        var _local2:Class = this._07e.getClass(_arg1);
        this._I_F_(_arg1, _local2, this._9T_._0K_k(_local2));
    }

    public function getInstance(_arg1:Class, _arg2:String = "", _arg3:Class = null) {
        var _local4:String;
        var _local6:_N_D_;
        _local4 = ((getQualifiedClassName(_arg1) + "|") + _arg2);
        var _local5:_5d = this._L_E_(_local4, false);
        if (_local5) {
            _local6 = this._9T_._0K_k(_arg1).ctor;
            return (_local5.apply(_arg3, this, ((_local6) ? _local6.injectParameters : null)));
        }
        if (_arg2) {
            throw (new _B_h((("No mapping found for request " + _local4) + ". getInstance only creates an unmapped instance if no name is given.")));
        }
        return (this._0I_F_(_arg1));
    }

    public function _by(_arg1:Object):void {
        var _local2:Class;
        if (!_arg1) {
            return;
        }
        _local2 = this._07e.getClass(_arg1);
        var _local3:_Q_m = this._0E_N_(_local2);
        var _local4:_tv = _local3.__case;
        while (_local4) {
            _local4.applyInjection(_arg1, _local2, this);
            _local4 = _tv(_local4.next);
        }
    }

    public function _D_i():void {
        var _local1:_nZ_;
        var _local2:Object;
        for each (_local1 in this._0K_E_) {
            _local1._L_E_().destroy();
        }
        for each (_local2 in this._06A_) {
            this._by(_local2);
        }
        this._0K_E_ = new Dictionary();
        this._3w = new Dictionary();
        this._g6 = new Dictionary();
        this._06A_ = new Dictionary();
    }

    public function _E_1(_arg1:ApplicationDomain = null):_08b {
        var _local2:_08b = new _08b();
        _local2.applicationDomain = ((_arg1) || (this.applicationDomain));
        _local2._k = this;
        return (_local2);
    }

    public function _L_a(_arg1:Class, _arg2:_Q_m):void {
        this._9T_._xl(_arg1, _arg2);
    }

    public function _0E_N_(_arg1:Class):_Q_m {
        return (this._07e._s4(_arg1));
    }

    private function _21(_arg1:Class, _arg2:String, _arg3:String):_nZ_ {
        var _local4:_nZ_;
        if (this._3w[_arg3]) {
            throw (new _N_p("Can't change a mapping from inside a listener to it's creation event"));
        }
        this._3w[_arg3] = true;
        ((hasEventListener(_09D_._dZ_)) && (dispatchEvent(new _09D_(_09D_._dZ_, _arg1, _arg2, null))));
        _local4 = new _nZ_(this, _arg1, _arg2, _arg3);
        this._0K_E_[_arg3] = _local4;
        var _local5:Object = _local4._za();
        ((hasEventListener(_09D_._S_u)) && (dispatchEvent(new _09D_(_09D_._S_u, _arg1, _arg2, _local4))));
        delete this._3w[_arg3];
        _local4._yF_(_local5);
        return (_local4);
    }

    private function _I_F_(_arg1:Object, _arg2:Class, _arg3:_Q_m):void {
        var _local4:_5W_ = _arg3.injectionPoints;
        ((hasEventListener(_zC_._9H_)) && (dispatchEvent(new _zC_(_zC_._9H_, _arg1, _arg2))));
        while (_local4) {
            _local4.applyInjection(_arg1, _arg2, this);
            _local4 = _local4.next;
        }
        if (_arg3.__case) {
            this._06A_[_arg1] = _arg1;
        }
        ((hasEventListener(_zC_._7O_)) && (dispatchEvent(new _zC_(_zC_._7O_, _arg1, _arg2))));
    }

    SsInternal static function _0G_G_():void {
        _wn = new Dictionary(true);
    }

    SsInternal function _0I_F_(_arg1:Class):Object {
        var _local2:_Q_m = this._9T_._0K_k(_arg1);
        if (!_local2.ctor) {
            throw (new _B_i(("Can't instantiate interface " + getQualifiedClassName(_arg1))));
        }
        var _local3:* = _local2.ctor.createInstance(_arg1, this);
        ((hasEventListener(_zC_._jD_)) && (dispatchEvent(new _zC_(_zC_._jD_, _local3, _arg1))));
        this._I_F_(_local3, _arg1, _local2);
        return (_local3);
    }

    SsInternal function _L_E_(_arg1:String, _arg2:Boolean = true):_5d {
        var _local3:_5d;
        var _local5:_5d;
        var _local4:_08b = this;
        while (_local4) {
            _local5 = _local4._vg[_arg1];
            if (_local5) {
                if ((_local5 is _yi)) {
                    _local3 = _local5;
                    _local4 = _local4._k;
                    continue;
                }
                if ((((_local5 is _Q_4)) && (!((_local4 === this))))) {
                    _local4 = _local4._k;
                    continue;
                }
                return (_local5);
            }
            _local4 = _local4._k;
        }
        if (_local3) {
            return (_local3);
        }
        return (((_arg2) ? this._a8(_arg1) : null));
    }

    SsInternal function _a8(mappingId:String):_5d {
        var parts:Array;
        var definition:Object;
        if (mappingId === "String|") {
            return (null);
        }
        parts = mappingId.split("|");
        var name:String = parts.pop();
        if (name.length !== 0) {
            return (null);
        }
        var typeName:String = parts.pop();
        try {
            definition = ((this._X_F_.hasDefinition(typeName)) ? this._X_F_.getDefinition(typeName) : getDefinitionByName(typeName));
        } catch (e:Error) {
            return (null);
        }
        if (((!(definition)) || (!((definition is Class))))) {
            return (null);
        }
        var class__:Class = Class(definition);
        var description:_Q_m = this._9T_._0K_k(class__);
        if (!description.ctor) {
            return (null);
        }
        return ((this._g6[class__] = ((this._g6[class__]) || (new _6_(class__)))));
    }

}
}//package _eZ_

