// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m.HitEffect

package _0K_m {

  import com.company.assembleegameclient.parameters.Parameters;


  public class HitEffect extends _I_b {

    public function HitEffect(_arg1:Vector.<uint>, _arg2:int, _arg3:int, _arg4:Number, _arg5:Number) {
        this._I_X_ = _arg1;
        size_ = _arg2;
        this._td = _arg3;
        this.angle_ = _arg4;
        this.speed_ = _arg5;
    }
    public var _I_X_:Vector.<uint>;
    public var _td:int;
    public var angle_:Number;
    public var speed_:Number;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local6:uint;
        var _local7:Particle;
        if (this._I_X_.length == 0) {
            return (false);
        }
        var _local3:Number = ((this.speed_ / 600) * Math.cos((this.angle_ + Math.PI)));
        var _local4:Number = ((this.speed_ / 600) * Math.sin((this.angle_ + Math.PI)));
        var _local5:int;
        while (_local5 < this._td) {
            _local6 = this._I_X_[int((this._I_X_.length * Math.random()))];
            _local7 = new HitParticle(_local6, 0.5, size_, (200 + (Math.random() * 100)), (_local3 + ((Math.random() - 0.5) * 0.4)), (_local4 + ((Math.random() - 0.5) * 0.4)), 0);
            if (!Parameters.data_["disableParticles"]) {
              map_.addObj(_local7, x_, y_);
            }
            _local5++;
        }
        return (false);
    }

}
}//package _0K_m

import _0K_m.Particle;

import flash.geom.Vector3D;

class HitParticle extends Particle {

    public var lifetime_:int;
    public var timeLeft_:int;
    protected var moveVec_:Vector3D;

    public function HitParticle(_arg1:uint, _arg2:Number, _arg3:int, _arg4:int, _arg5:Number, _arg6:Number, _arg7:Number) {
        this.moveVec_ = new Vector3D();
        super(_arg1, _arg2, _arg3);
        this.timeLeft_ = (this.lifetime_ = _arg4);
        this.moveVec_.x = _arg5;
        this.moveVec_.y = _arg6;
        this.moveVec_.z = _arg7;
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0) {
            return (false);
        }
        x_ = (x_ + ((this.moveVec_.x * _arg2) * 0.008));
        y_ = (y_ + ((this.moveVec_.y * _arg2) * 0.008));
        z_ = (z_ + ((this.moveVec_.z * _arg2) * 0.008));
        return (true);
    }

}

