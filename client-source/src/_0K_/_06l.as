// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_._06l

package _0K_ {
import _eZ_._08b;

import _03T_.guardsApprove;
import _03T_.applyHooks;

import _E_x._K_T_;

public class _06l {

    public function _06l(_arg1:_08b) {
        this._vz = _arg1;
    }
    private var _vz:_08b;

    public function create(_arg1:_K_T_):Object {
        var _local2:Class;
        var _local3:Object;
        if (guardsApprove(_arg1._0_R_, this._vz)) {
            _local2 = _arg1.commandClass;
            this._vz.map(_local2)._hZ_();
            _local3 = this._vz.getInstance(_local2);
            applyHooks(_arg1._7w, this._vz);
            this._vz._1Y_(_local2);
            return (_local3);
        }
        return (null);
    }

}
}//package _0K_

