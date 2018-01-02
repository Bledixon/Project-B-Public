// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_.guardsApprove

package _03T_ {
import _eZ_._08b;

public function guardsApprove(_arg1:Array, _arg2:_08b = null):Boolean {
    var _local3:Object;
    for each (_local3 in _arg1) {
        if ((_local3 is Function)) {
            if ((_local3 as Function)()) continue;
            return (false);
        }
        if ((_local3 is Class)) {
            _local3 = ((_arg2) ? _arg2.getInstance((_local3 as Class)) : new ((_local3 as Class))());
        }
        if (_local3.approve() == false) {
            return (false);
        }
    }
    return (true);
}
}//package _03T_

