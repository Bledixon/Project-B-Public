// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_._C_v

package _0K_ {
import _j1._X_y;

import flash.utils.Dictionary;

import _eZ_._08b;

import flash.events.IEventDispatcher;

import _E_x._F_B_;
import _E_x._00J_;

import _g2._00d;
import _g2._06n;

public class _C_v implements _X_y {

    private const _Z_s:Dictionary = new Dictionary();

    public function _C_v(_arg1:_08b, _arg2:IEventDispatcher, _arg3:_F_B_) {
        this._vz = _arg1;
        this._0L_4 = _arg2;
        this._iS_ = _arg3;
    }
    private var _vz:_08b;
    private var _0L_4:IEventDispatcher;
    private var _iS_:_F_B_;

    public function map(_arg1:String, _arg2:Class = null):_00d {
        var _local3:_00J_ = (this._Z_s[(_arg1 + _arg2)] = ((this._Z_s[(_arg1 + _arg2)]) || (this._F_0(_arg1, _arg2))));
        return (this._iS_.map(_local3));
    }

    public function _1Y_(_arg1:String, _arg2:Class = null):_06n {
        return (this._iS_._1Y_(this._71(_arg1, _arg2)));
    }

    private function _F_0(_arg1:String, _arg2:Class = null):_00J_ {
        return (new _eO_(this._vz, this._0L_4, _arg1, _arg2));
    }

    private function _71(_arg1:String, _arg2:Class = null):_00J_ {
        return (this._Z_s[(_arg1 + _arg2)]);
    }

}
}//package _0K_

