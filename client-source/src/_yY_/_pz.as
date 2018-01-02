// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_yY_._pz

package _yY_ {
import _0K_m._I_b;

import flash.geom.Point;

public class _pz extends _I_b {

    public function _pz(_arg1:Point, _arg2:Point) {
        this.start_ = _arg1;
        this.end_ = _arg2;
    }
    public var start_:Point;
    public var end_:Point;

    override public function update(_arg1:int, _arg2:int):Boolean {
        x_ = this.start_.x;
        y_ = this.start_.y;
        var _local3 = 10000;
        var _local4:_0I_R_ = new _0I_R_(1500, this.start_, this.end_);
        map_.addObj(_local4, x_, y_);
        return (false);
    }

}
}//package _yY_

