// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Y_3._uS_

package _Y_3 {
import _eZ_._08b;

import flash.utils.Dictionary;

import _eZ_._N_p;

import flash.utils.getQualifiedClassName;

import _4u.SsInternal;

import _0J_k._Q_m;
import _0J_k._tv;

public class _uS_ implements _5d {

    public function _uS_(_arg1:Class, _arg2:_08b) {
        this._2h = _arg1;
        this._00_ = _arg2;
    }
    private var _2h:Class;
    private var _00_:_08b;
    private var _H_w:Object;
    private var _0M_:Boolean;

    public function apply(_arg1:Class, _arg2:_08b, _arg3:Dictionary):Object {
        return ((this._H_w = ((this._H_w) || (this._hw(this._00_)))));
    }

    public function destroy():void {
        this._0M_ = true;
        if (!this._H_w) {
            return;
        }
        var _local1:_Q_m = this._00_._0E_N_(this._2h);
        var _local2:_tv = _local1.__case;
        while (_local2) {
            _local2.applyInjection(this._H_w, this._2h, this._00_);
            _local2 = _tv(_local2.next);
        }
        this._H_w = null;
    }

    private function _hw(_arg1:_08b):Object {
        if (this._0M_) {
            throw (new _N_p(("Forbidden usage of unmapped singleton provider for type " + getQualifiedClassName(this._2h))));
        }
        return (_arg1.SsInternal::_0I_F_(this._2h));
    }

}
}//package _Y_3

