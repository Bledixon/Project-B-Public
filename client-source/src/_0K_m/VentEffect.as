// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m.VentEffect

package _0K_m {
import com.company.assembleegameclient.objects.GameObject;
  import com.company.assembleegameclient.parameters.Parameters;
  import com.company.assembleegameclient.util._wW_;

public class VentEffect extends _I_b {

    private static const _03n:int = 50;

    public function VentEffect(_arg1:GameObject) {
        this.go_ = _arg1;
    }
    public var go_:GameObject;
    public var lastUpdate_:int = -1;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local4:int;
        var _local5:VentParticle;
        var _local6:Number;
        var _local7:Number;
        var _local8:Number;
        var _local9:Number;
        if (this.go_.map_ == null) {
            return (false);
        }
        if (this.lastUpdate_ < 0) {
            this.lastUpdate_ = Math.max(0, (_arg1 - 400));
        }
        x_ = this.go_.x_;
        y_ = this.go_.y_;
        var _local3:int = int((this.lastUpdate_ / _03n));
        while (_local3 < int((_arg1 / _03n))) {
            _local4 = (_local3 * _03n);
            _local5 = (_wW_._B_1(VentParticle) as VentParticle);
            _local5.restart(_local4, _arg1);
            _local6 = (Math.random() * Math.PI);
            _local7 = (Math.random() * 0.4);
            _local8 = (this.go_.x_ + (_local7 * Math.cos(_local6)));
            _local9 = (this.go_.y_ + (_local7 * Math.sin(_local6)));
            if (!Parameters.data_["disableParticles"]) {
              map_.addObj(_local5, _local8, _local9);
            }
            _local3++;
        }
        this.lastUpdate_ = _arg1;
        return (true);
    }

}
}//package _0K_m

import _0K_m.Particle;

import com.company.assembleegameclient.util._wW_;

class VentParticle extends Particle {

    public var startTime_:int;
    public var speed_:int;

    public function VentParticle() {
        var _local1:Number = Math.random();
        super(2542335, 0, (75 + (_local1 * 50)));
        this.speed_ = (2.5 - (_local1 * 1.5));
    }

    public function restart(_arg1:int, _arg2:int):void {
        this.startTime_ = _arg1;
        var _local3:Number = ((_arg2 - this.startTime_) / 1000);
        z_ = (0 + (this.speed_ * _local3));
    }

    override public function removeFromMap():void {
        super.removeFromMap();
        _wW_._ay(this);
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Number = ((_arg1 - this.startTime_) / 1000);
        z_ = (0 + (this.speed_ * _local3));
        return ((z_ < 1));
    }

}

