// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m.FlowEffect

package _0K_m {

  import com.company.assembleegameclient.parameters.Parameters;

  import flash.geom.Point;

import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.net.messages.data._Q_0;

public class FlowEffect extends _I_b {

    public function FlowEffect(_arg1:_Q_0, _arg2:GameObject, _arg3:int) {
        this.start_ = new Point(_arg1.x_, _arg1.y_);
        this.go_ = _arg2;
        this.color_ = _arg3;
    }
    public var start_:Point;
    public var go_:GameObject;
    public var color_:int;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local5:int;
        var _local6:Particle;
        x_ = this.start_.x;
        y_ = this.start_.y;
        var _local3:int = 5;
        var _local4:int;
        while (_local4 < _local3) {
            _local5 = ((3 + int((Math.random() * 5))) * 20);
            _local6 = new FlowParticle(0.5, _local5, this.color_, this.start_, this.go_);
            if (!Parameters.data_["disableParticles"]) {
              map_.addObj(_local6, x_, y_);
            }
            _local4++;
        }
        return (false);
    }

}
}//package _0K_m

import _0K_m.Particle;

import flash.geom.Point;

import com.company.assembleegameclient.objects.GameObject;

class FlowParticle extends Particle {

    public var start_:Point;
    public var go_:GameObject;
    public var maxDist_:Number;
    public var flowSpeed_:Number;

    public function FlowParticle(_arg1:Number, _arg2:int, _arg3:int, _arg4:Point, _arg5:GameObject) {
        super(_arg3, _arg1, _arg2);
        this.start_ = _arg4;
        this.go_ = _arg5;
        var _local6:Point = new Point(x_, y_);
        var _local7:Point = new Point(this.go_.x_, this.go_.y_);
        this.maxDist_ = Point.distance(_local6, _local7);
        this.flowSpeed_ = (Math.random() * 5);
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Number = 8;
        var _local4:Point = new Point(x_, y_);
        var _local5:Point = new Point(this.go_.x_, this.go_.y_);
        var _local6:Number = Point.distance(_local4, _local5);
        if (_local6 < 0.5) {
            return (false);
        }
        this.flowSpeed_ = (this.flowSpeed_ + ((_local3 * _arg2) / 1000));
        this.maxDist_ = (this.maxDist_ - ((this.flowSpeed_ * _arg2) / 1000));
        var _local7:Number = (_local6 - ((this.flowSpeed_ * _arg2) / 1000));
        if (_local7 > this.maxDist_) {
            _local7 = this.maxDist_;
        }
        var _local8:Number = (this.go_.x_ - x_);
        var _local9:Number = (this.go_.y_ - y_);
        _local8 = (_local8 * (_local7 / _local6));
        _local9 = (_local9 * (_local7 / _local6));
        moveTo((this.go_.x_ - _local8), (this.go_.y_ - _local9));
        return (true);
    }

}
class FlowParticle2 extends Particle {

    public var start_:Point;
    public var go_:GameObject;
    public var accel_:Number;
    public var dx_:Number;
    public var dy_:Number;

    public function FlowParticle2(_arg1:Number, _arg2:int, _arg3:int, _arg4:Number, _arg5:Point, _arg6:GameObject) {
        super(_arg3, _arg1, _arg2);
        this.start_ = _arg5;
        this.go_ = _arg6;
        this.accel_ = _arg4;
        this.dx_ = (Math.random() - 0.5);
        this.dy_ = (Math.random() - 0.5);
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Point = new Point(x_, y_);
        var _local4:Point = new Point(this.go_.x_, this.go_.y_);
        var _local5:Number = Point.distance(_local3, _local4);
        if (_local5 < 0.5) {
            return (false);
        }
        var _local6:Number = Math.atan2((this.go_.y_ - y_), (this.go_.x_ - x_));
        this.dx_ = (this.dx_ + (((this.accel_ * Math.cos(_local6)) * _arg2) / 1000));
        this.dy_ = (this.dy_ + (((this.accel_ * Math.sin(_local6)) * _arg2) / 1000));
        var _local7:Number = (x_ + ((this.dx_ * _arg2) / 1000));
        var _local8:Number = (y_ + ((this.dy_ * _arg2) / 1000));
        moveTo(_local7, _local8);
        return (true);
    }

}

