﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._N_h

package _0K_m {
import com.company.assembleegameclient.objects.GameObject;

import flash.geom.Vector3D;

public class _N_h extends Particle {

    public function _N_h(_arg1:uint, _arg2:Number, _arg3:int, _arg4:int, _arg5:Number, _arg6:GameObject, _arg7:Number, _arg8:Number) {
        this.moveVec_ = new Vector3D();
        super(_arg1, _arg2, _arg3);
        this.moveVec_.z = _arg5;
        this.timeLeft_ = _arg4;
        this.go_ = _arg6;
        this.angle_ = _arg7;
        this._j0 = _arg8;
    }
    public var timeLeft_:int;
    public var go_:GameObject;
    public var angle_:Number;
    public var _j0:Number;
    protected var moveVec_:Vector3D;

    override public function update(_arg1:int, _arg2:int):Boolean {
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0) {
            return (false);
        }
        x_ = (this.go_.x_ + (this._j0 * Math.cos(this.angle_)));
        y_ = (this.go_.y_ + (this._j0 * Math.sin(this.angle_)));
        z_ = (z_ + ((this.moveVec_.z * _arg2) * 0.008));
        return (true);
    }

}
}//package _0K_m

