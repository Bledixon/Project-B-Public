// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._eQ_

package _03T_ {
import _qj._pn;

import _092.allOf;

import _g3.instanceOf;

import _092.not;

import flash.display.DisplayObject;
import flash.utils.Dictionary;

import _eZ_._08b;

import _0_p._Q_5;
import _0_p._I_Y_;
import _0_p._L_y;
import _0_p._v;

public class _eQ_ {

    private static const _Z_9:_pn = allOf(instanceOf(Object), not(instanceOf(Class)), not(instanceOf(DisplayObject)));

    private const _ul:String = _078.create(_eQ_);
    private const _0g:ObjectProcessor = new ObjectProcessor();
    private const _01u:Dictionary = new Dictionary();
    private const _lL_:Array = [];

    public function _eQ_(_arg1:_L_y) {
        this._vz = _arg1._O_R_;
        this._eo = _arg1._0H_4(this);
        this._ty(instanceOf(Class), this._0L_I_);
        this._ty(_Z_9, this._0F_m);
        _arg1._iL_.addEventListener(_I_Y_.INITIALIZE, this.initialize, false, -100);
    }
    private var _vz:_08b;
    private var _eo:_Q_5;
    private var _X_P_:Boolean;

    public function _0F_k(_arg1:Object):void {
        if (!this._01u[_arg1]) {
            this._01u[_arg1] = true;
            this._0g._049(_arg1);
        }
    }

    public function _ty(_arg1:_pn, _arg2:Function):void {
        this._0g._K_j(_arg1, _arg2);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _0L_I_(_arg1:Class):void {
        if (this._X_P_) {
            this._eo.debug("Already initialized. Instantiating config class {0}", [_arg1]);
            this._6V_(_arg1);
        } else {
            this._eo.debug("Not yet initialized. Queuing config class {0}", [_arg1]);
            this._lL_.push(_arg1);
        }
    }

    private function _0F_m(_arg1:Object):void {
        if (this._X_P_) {
            this._eo.debug("Already initialized. Injecting into config object {0}", [_arg1]);
            this._049(_arg1);
        } else {
            this._eo.debug("Not yet initialized. Queuing config object {0}", [_arg1]);
            this._lL_.push(_arg1);
        }
    }

    private function _rW_():void {
        var _local1:Object;
        for each (_local1 in this._lL_) {
            if ((_local1 is Class)) {
                this._eo.debug("Now initializing. Instantiating config class {0}", [_local1]);
                this._6V_((_local1 as Class));
            } else {
                this._eo.debug("Now initializing. Injecting into config object {0}", [_local1]);
                this._049(_local1);
            }
        }
        this._lL_.length = 0;
    }

    private function _6V_(_arg1:Class):void {
        var _local2:_v = (this._vz.getInstance(_arg1) as _v);
        ((_local2) && (_local2.configure()));
    }

    private function _049(_arg1:Object):void {
        this._vz._0B_B_(_arg1);
        var _local2:_v = (_arg1 as _v);
        ((_local2) && (_local2.configure()));
    }

    private function initialize(_arg1:_I_Y_):void {
        if (!this._X_P_) {
            this._X_P_ = true;
            this._rW_();
        }
    }

}
}//package _03T_

