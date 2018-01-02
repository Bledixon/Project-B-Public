// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_.applyHooks

package _03T_ {
import _eZ_._08b;

public function applyHooks(_arg1:Array, _arg2:_08b = null):void {
    var _local3:Object;
    for each (_local3 in _arg1) {
        if ((_local3 is Function)) {
            ((_local3 as Function)());
        } else {
            if ((_local3 is Class)) {
                _local3 = ((_arg2) ? _arg2.getInstance((_local3 as Class)) : new ((_local3 as Class))());
            }
            _local3.hook();
        }
    }
}
}//package _03T_

