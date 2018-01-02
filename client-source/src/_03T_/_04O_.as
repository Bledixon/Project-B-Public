// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._04O_

package _03T_ {
import _0_p._H_N_;

public class _04O_ {

    private const _M_G_:String = "You can't change the guards and hooks on an existing mapping. Unmap first.";
    private const _Z_K_:String = " The stacktrace for this error was stored at the time when you duplicated the mapping - you may have failed to add guards and hooks that were already present.";

    public function _04O_(_arg1:Array, _arg2:Array, _arg3:*, _arg4:*) {
        this._0B_R_ = _arg1;
        this._K_1 = _arg2;
        this._C_U_ = _arg3;
        this._M_i = _arg4;
        super();
    }
    private var _0B_R_:Array;
    private var _K_1:Array;
    private var _C_U_;
    private var _M_i;
    private var _0A_X_:_H_N_;
    private var _15:Boolean = false;

    public function get valid():Boolean {
        return (this._15);
    }

    public function _0D_p():void {
        this._15 = false;
        this._0A_X_ = new _H_N_((this._M_G_ + this._Z_K_), this._C_U_, this._M_i);
    }

    public function _ok(_arg1:Array, _arg2:Array):void {
        if (((!(this._D_V_(this._0B_R_, _arg1))) || (!(this._D_V_(this._K_1, _arg2))))) {
            ((this._03c()) || (this._9f()));
        }
        this._15 = true;
        this._0A_X_ = null;
    }

    public function _09y(_arg1:Array):void {
        if (this._l4(this._0B_R_, _arg1)) {
            this._9f();
        }
    }

    public function _H_l(_arg1:Array):void {
        if (this._l4(this._K_1, _arg1)) {
            this._9f();
        }
    }

    public function _q2(_arg1:Array):Array {
        var _local3:*;
        var _local2:Array = [];
        for each (_local3 in _arg1) {
            if ((_local3 is Array)) {
                _local2 = _local2.concat(this._q2((_local3 as Array)));
            } else {
                _local2.push(_local3);
            }
        }
        return (_local2);
    }

    private function _l4(_arg1:Array, _arg2:Array):Boolean {
        var _local3:*;
        _arg2 = this._q2(_arg2);
        for each (_local3 in _arg2) {
            if (_arg1.indexOf(_local3) == -1) {
                return (true);
            }
        }
        return (false);
    }

    private function _D_V_(_arg1:Array, _arg2:Array):Boolean {
        var _local3:int;
        _arg1 = _arg1.slice();
        if (_arg1.length != _arg2.length) {
            return (false);
        }
        var _local4:uint = _arg2.length;
        var _local5:uint;
        while (_local5 < _local4) {
            _local3 = _arg1.indexOf(_arg2[_local5]);
            if (_local3 == -1) {
                return (false);
            }
            _arg1.splice(_local3, 1);
            _local5++;
        }
        return (true);
    }

    private function _9f():void {
        throw (new _H_N_(this._M_G_, this._C_U_, this._M_i));
    }

    private function _03c():Boolean {
        if (this._0A_X_) {
            throw (this._0A_X_);
        }
        return (false);
    }

}
}//package _03T_

