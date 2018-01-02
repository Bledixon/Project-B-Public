// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._0E_S_

package _03T_ {
import flash.utils.Dictionary;

public class _0E_S_ {

    private const _fY_:Dictionary = new Dictionary(false);

    public function _W_b(_arg1:Object):void {
        this._fY_[_arg1] = true;
    }

    public function release(_arg1:Object):void {
        delete this._fY_[_arg1];
    }

    public function flush():void {
        var _local1:Object;
        for (_local1 in this._fY_) {
            delete this._fY_[_local1];
        }
    }

}
}//package _03T_

