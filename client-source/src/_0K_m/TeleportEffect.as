﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m.TeleportEffect

package _0K_m {

  import com.company.assembleegameclient.parameters.Parameters;

  public class TeleportEffect extends _I_b {

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local5:Number;
        var _local6:Number;
        var _local7:int;
        var _local8:TeleportParticle;
        var _local3:int = 20;
        var _local4:int;
        while (_local4 < _local3) {
            _local5 = ((2 * Math.PI) * Math.random());
            _local6 = (0.7 * Math.random());
            _local7 = (500 + (1000 * Math.random()));
            _local8 = new TeleportParticle(0xFF, 50, 0.1, _local7);
            if (!Parameters.data_["disableParticles"]) {
              map_.addObj(_local8, (x_ + (_local6 * Math.cos(_local5))), (y_ + (_local6 * Math.sin(_local5))));
            }
            _local4++;
        }
        return (false);
    }

}
}//package _0K_m

import _0K_m.Particle;

import flash.geom.Vector3D;

class TeleportParticle extends Particle {

    public var timeLeft_:int;
    protected var moveVec_:Vector3D;

    public function TeleportParticle(_arg1:uint, _arg2:int, _arg3:Number, _arg4:int) {
        this.moveVec_ = new Vector3D();
        super(_arg1, 0, _arg2);
        this.moveVec_.z = _arg3;
        this.timeLeft_ = _arg4;
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0) {
            return (false);
        }
        z_ = (z_ + ((this.moveVec_.z * _arg2) * 0.008));
        return (true);
    }

}

