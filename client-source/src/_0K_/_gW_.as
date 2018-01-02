// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_._gW_

package _0K_ {
import _E_x._00J_;

import _E_x._K_T_;

import _T_G_._9P_;

import _eZ_._08b;

import flash.events.Event;

public class _gW_ {

    public function _gW_(_arg1:_00J_, _arg2:_9P_, _arg3:_08b, _arg4:Class) {
        this._C_U_ = _arg1;
        this._H__ = _arg2;
        this._vz = _arg3._E_1();
        this._1j = _arg4;
        this._factory = new _06l(this._vz);
    }
    private var _C_U_:_00J_;
    private var _0K_E_:Vector.<_K_T_>;
    private var _H__:_9P_;
    private var _vz:_08b;
    private var _1j:Class;
    private var _factory:_06l;

    private function _0K_g(_arg1:Class):Boolean {
        return (((!(this._1j)) || ((_arg1 == this._1j))));
    }

    private function _0B_W_(_arg1:Class):Boolean {
        return (!((_arg1 == Event)));
    }

    private function _P_g(_arg1:Event, _arg2:Class):void {
        this._vz.map(Event)._q3(_arg1);
        if (this._0B_W_(_arg2)) {
            this._vz.map(((this._1j) || (_arg2)))._q3(_arg1);
        }
    }

    private function _gi(_arg1:Class):void {
        this._vz._1Y_(Event);
        if (this._0B_W_(_arg1)) {
            this._vz._1Y_(((this._1j) || (_arg1)));
        }
    }

    private function _I_A_(_arg1:Event, _arg2:Class):void {
        var _local3:Object;
        var _local4:_K_T_ = this._H__._G_W_;
        while (_local4) {
            _local4._ok();
            this._P_g(_arg1, _arg2);
            _local3 = this._factory.create(_local4);
            this._gi(_arg2);
            if (_local3) {
                this._04f(_local4);
                _local3.execute();
            }
            _local4 = _local4.next;
        }
    }

    private function _04f(_arg1:_K_T_):void {
        if (_arg1._Z_V_) {
            this._C_U_._0A_W_(_arg1);
        }
    }

    public function execute(_arg1:Event):void {
        var _local2:Class = (_arg1["constructor"] as Class);
        if (this._0K_g(_local2)) {
            this._I_A_(_arg1, _local2);
        }
    }

}
}//package _0K_

