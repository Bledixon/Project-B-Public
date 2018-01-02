// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_P_._0F_7

package _0_P_ {


public class _0F_7 {

    public function _0F_7(_arg1:XML) {
        var _local2:XML;
        this._20 = new Vector.<_3Y_>();
        super();
        for each (_local2 in _arg1.Animation) {
            this._20.push(new _3Y_(_local2));
        }
    }
    public var _20:Vector.<_3Y_>;
}
}//package _0_P_

