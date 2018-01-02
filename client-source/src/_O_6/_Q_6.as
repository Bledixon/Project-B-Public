// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_O_6._Q_6

package _O_6 {
import _A_G_._v1;

import _s3._yp;

import flash.utils.Dictionary;

import _mY_._0A_k;

import _A_G_._0A_Z_;
import _A_G_._07A_;

import _W_G_._r6;

import _mY_._07T_;

import _W_G_._024;

import flash.display.DisplayObject;

public class _Q_6 implements _v1, _yp {

    private const _qk:Dictionary = new Dictionary();
    private const _03_:_0A_k = new _xd();

    public function _Q_6(_arg1:_07A_, _arg2:_0A_Z_ = null) {
        this._factory = _arg1;
        this._handler = ((_arg2) || (new _j2(this._factory)));
    }
    private var _handler:_0A_Z_;
    private var _factory:_07A_;

    public function _F_w(_arg1:_r6):_07T_ {
        return ((this._qk[_arg1._oJ_()._0G_1] = ((this._qk[_arg1._oJ_()._0G_1]) || (this._pX_(_arg1)))));
    }

    public function map(_arg1:Class):_07T_ {
        var _local2:_r6 = new _024().allOf(_arg1);
        return (this._F_w(_local2));
    }

    public function _P_G_(_arg1:_r6):_0A_k {
        return (((this._qk[_arg1._oJ_()._0G_1]) || (this._03_)));
    }

    public function _1Y_(_arg1:Class):_0A_k {
        var _local2:_r6 = new _024().allOf(_arg1);
        return (this._P_G_(_local2));
    }

    public function _H_3(_arg1:DisplayObject, _arg2:Class):void {
        this._handler._H_3(_arg1, _arg2);
    }

    public function _jS_(_arg1:Object):void {
        var _local2:Class = (_arg1.constructor as Class);
        this._handler._O_4(_arg1, _local2);
    }

    public function _e_(_arg1:Object):void {
        this._factory._0_Q_(_arg1);
    }

    private function _pX_(_arg1:_r6, _arg2:Class = null):_07T_ {
        return (new _vU_(_arg1._oJ_(), this._handler));
    }

}
}//package _O_6

