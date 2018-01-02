// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Y_3._d5

package _Y_3 {
import _eZ_._08b;

import flash.utils.Dictionary;

public class _d5 implements _5d {

    public function _d5(_arg1:_5d) {
        this.provider = _arg1;
    }
    public var provider:_5d;

    public function apply(_arg1:Class, _arg2:_08b, _arg3:Dictionary):Object {
        return (this.provider.apply(_arg1, _arg2, _arg3));
    }

    public function destroy():void {
        this.provider.destroy();
    }

}
}//package _Y_3

