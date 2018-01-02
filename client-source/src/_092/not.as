// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_092.not

package _092 {
import _qj._pn;

import _g3.equalTo;

public function not(_arg1:Object):_pn {
    if ((_arg1 is _pn)) {
        return (new _L_((_arg1 as _pn)));
    }
    return (not(equalTo(_arg1)));
}
}//package _092

