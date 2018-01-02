// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_g3._0I_6

package _g3 {
import _qj._8y;
import _qj.Description;

public class _0I_6 extends _8y {

    public function _0I_6(_arg1:Object) {
        this._value = _arg1;
    }
    private var _value:Object;

    override public function matches(_arg1:Object):Boolean {
        return (this._W_I_(_arg1, this._value));
    }

    override public function describeTo(_arg1:Description):void {
        _arg1._B_U_(this._value);
    }

    private function _W_I_(_arg1:Object, _arg2:Object):Boolean {
        if (isNaN((_arg1 as Number))) {
            return (isNaN((_arg2 as Number)));
        }
        if (_arg1 == null) {
            return ((_arg2 == null));
        }
        if ((_arg1 is Array)) {
            return ((((_arg2 is Array)) && (this._2C_((_arg1 as Array), (_arg2 as Array)))));
        }
        return ((_arg1 == _arg2));
    }

    private function _2C_(_arg1:Array, _arg2:Array):Boolean {
        return (((this._dk(_arg1, _arg2)) && (this._wB_(_arg1, _arg2))));
    }

    private function _dk(_arg1:Array, _arg2:Array):Boolean {
        return ((_arg1.length == _arg2.length));
    }

    private function _wB_(_arg1:Array, _arg2:Array):Boolean {
        var _local3:int;
        var _local4:int = _arg1.length;
        while (_local3 < _local4) {
            if (!this._W_I_(_arg1[_local3], _arg2[_local3])) {
                return (false);
            }
            _local3++;
        }
        return (true);
    }

}
}//package _g3

