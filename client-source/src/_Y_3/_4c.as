// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Y_3._4c

package _Y_3 {
import _eZ_._08b;

import flash.utils.Dictionary;

public class _4c extends _d5 {

    public function _4c(_arg1:_08b, _arg2:_5d) {
        super(_arg2);
        this._O_R_ = _arg1;
    }
    public var _O_R_:_08b;

    override public function apply(_arg1:Class, _arg2:_08b, _arg3:Dictionary):Object {
        return (provider.apply(_arg1, this._O_R_, _arg3));
    }

}
}//package _Y_3

