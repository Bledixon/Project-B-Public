// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._02i

package _D_d {
import _D_d._M_u;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.util._L_2;

import _D_d.*;

internal class _02i extends _E_m {

    public function _02i() {
        var _local1:String;
        var _local3:int;
        var _local4:XML;
        var _local5:_Q_H_;
        super(_M_u._S_E_);
        var _local2:Vector.<String> = new Vector.<String>();
        for (_local1 in ObjectLibrary._pb) {
            _local2.push(_local1);
        }
        _local2.sort(_L_2._L_O_);
        for each (_local1 in _local2) {
            _local3 = ObjectLibrary._pb[_local1];
            _local4 = ObjectLibrary._Q_F_[_local3];
            if (!((((_local4.hasOwnProperty("Item")) || (_local4.hasOwnProperty("Player")))) || ((_local4.Class == "Projectile")))) {
                _local5 = new _Q_H_(_local4);
                _08M_(_local5);
            }
        }
    }
}
}//package _D_d

