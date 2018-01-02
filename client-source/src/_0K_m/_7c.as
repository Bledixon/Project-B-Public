﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._7c

package _0K_m {
import flash.geom.Point;

import com.company.assembleegameclient.util._04d;

public class _7c extends Particle {

    public function _7c(_arg1:int, _arg2:int, _arg3:int, _arg4:Point, _arg5:Point) {
        super(_arg2, 0, _arg1);
        this.lifetime_ = (this.timeLeft_ = _arg3);
        this.initialSize_ = _arg1;
        this.start_ = _arg4;
        this.end_ = _arg5;
        this.dx_ = ((this.end_.x - this.start_.x) / this.timeLeft_);
        this.dy_ = ((this.end_.y - this.start_.y) / this.timeLeft_);
        var _local6:Number = (Point.distance(_arg4, _arg5) / this.timeLeft_);
        this.pathX_ = (x_ = this.start_.x);
        this.pathY_ = (y_ = this.start_.y);
    }
    public var lifetime_:int;
    public var timeLeft_:int;
    public var initialSize_:int;
    public var start_:Point;
    public var end_:Point;
    public var dx_:Number;
    public var dy_:Number;
    public var pathX_:Number;
    public var pathY_:Number;

    override public function update(_arg1:int, _arg2:int):Boolean {
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0) {
            return (false);
        }
        this.pathX_ = (this.pathX_ + (this.dx_ * _arg2));
        this.pathY_ = (this.pathY_ + (this.dy_ * _arg2));
        moveTo(this.pathX_, this.pathY_);
        map_.addObj(new _06s((100 * (z_ + 1)), color_, 600, z_, _04d._F_e(1), _04d._F_e(1)), this.pathX_, this.pathY_);
        return (true);
    }

}
}//package _0K_m

