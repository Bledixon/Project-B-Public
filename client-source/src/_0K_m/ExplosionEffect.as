// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m.ExplosionEffect

package _0K_m {


public class ExplosionEffect extends _I_b {

    public function ExplosionEffect(_arg1:Vector.<uint>, _arg2:int, _arg3:int) {
        this._I_X_ = _arg1;
        size_ = _arg2;
        this._td = _arg3;
    }
    public var _I_X_:Vector.<uint>;
    public var _td:int;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local4:uint;
        var _local5:Particle;
        if (this._I_X_.length == 0) {
            return (false);
        }
        var _local3:int;
        while (_local3 < this._td) {
            _local4 = this._I_X_[int((this._I_X_.length * Math.random()))];
            _local5 = new ExplosionParticle(_local4, 0.5, size_, (200 + (Math.random() * 100)), (Math.random() - 0.5), (Math.random() - 0.5), 0);
            map_.addObj(_local5, x_, y_);
            _local3++;
        }
        return (false);
    }

}
}//package _0K_m

import _0K_m.Particle;

import flash.geom.Vector3D;

class ExplosionParticle extends Particle {

    public var lifetime_:int;
    public var timeLeft_:int;
    protected var moveVec_:Vector3D;

    public function ExplosionParticle(_arg1:uint, _arg2:Number, _arg3:int, _arg4:int, _arg5:Number, _arg6:Number, _arg7:Number) {
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

