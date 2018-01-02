// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.engine3d.Line3D

package com.company.assembleegameclient.engine3d {
import flash.geom.Vector3D;

public class Line3D {

    public static function _4H_():Boolean {
        return (UnitTest.run());
    }

    public function Line3D(_arg1:Vector3D, _arg2:Vector3D) {
        this.v0_ = _arg1;
        this.v1_ = _arg2;
    }
    public var v0_:Vector3D;
    public var v1_:Vector3D;

    public function _ed(_arg1:Line3D):int {
        var _local2:Number = (((_arg1.v1_.y - _arg1.v0_.y) * (this.v1_.x - this.v0_.x)) - ((_arg1.v1_.x - _arg1.v0_.x) * (this.v1_.y - this.v0_.y)));
        if ((((_local2 < 0.001)) && ((_local2 > -0.001)))) {
            return (Order._hD_);
        }
        var _local3:Number = (((_arg1.v1_.x - _arg1.v0_.x) * (this.v0_.y - _arg1.v0_.y)) - ((_arg1.v1_.y - _arg1.v0_.y) * (this.v0_.x - _arg1.v0_.x)));
        var _local4:Number = (((this.v1_.x - this.v0_.x) * (this.v0_.y - _arg1.v0_.y)) - ((this.v1_.y - this.v0_.y) * (this.v0_.x - _arg1.v0_.x)));
        if ((((((((_local3 < 0.001)) && ((_local3 > -0.001)))) && ((_local4 < 0.001)))) && ((_local4 > -0.001)))) {
            return (Order._hD_);
        }
        var _local5:Number = (_local3 / _local2);
        var _local6:Number = (_local4 / _local2);
        if ((((((((_local5 > 1)) || ((_local5 < 0)))) || ((_local6 > 1)))) || ((_local6 < 0)))) {
            return (Order._hD_);
        }
        var _local7:Number = ((this.v0_.z + (_local5 * (this.v1_.z - this.v0_.z))) - (_arg1.v0_.z + (_local6 * (_arg1.v1_.z - _arg1.v0_.z))));
        if ((((_local7 < 0.001)) && ((_local7 > -0.001)))) {
            return (Order._hD_);
        }
        if (_local7 > 0) {
            return (Order._D_n);
        }
        return (Order._0f);
    }

    public function _eB_(_arg1:Number):Vector3D {
        return (new Vector3D((this.v0_.x + ((this.v1_.x - this.v0_.x) * _arg1)), (this.v0_.y + ((this.v1_.y - this.v0_.y) * _arg1)), (this.v0_.z + ((this.v1_.z - this.v0_.z) * _arg1))));
    }

    public function toString():String {
        return ((((("(" + this.v0_) + ", ") + this.v1_) + ")"));
    }

}
}//package com.company.assembleegameclient.engine3d

import com.company.assembleegameclient.engine3d.Line3D;

import flash.geom.Vector3D;

import com.company.assembleegameclient.engine3d.Order;

class UnitTest {

    /*private*/
    internal static function testCrossZ():Boolean {
        var _local1:Line3D = new Line3D(new Vector3D(0, 0, 0), new Vector3D(0, 100, 0));
        var _local2:Line3D = new Line3D(new Vector3D(10, 0, 10), new Vector3D(-10, 100, -100));
        if (_local1._ed(_local2) != Order._D_n) {
            return (false);
        }
        if (_local2._ed(_local1) != Order._0f) {
            return (false);
        }
        _local1 = new Line3D(new Vector3D(1, 1, 200), new Vector3D(6, 6, 200));
        _local2 = new Line3D(new Vector3D(3, 1, -100), new Vector3D(1, 3, -100));
        if (_local1._ed(_local2) != Order._D_n) {
            return (false);
        }
        if (_local2._ed(_local1) != Order._0f) {
            return (false);
        }
        return (true);
    }

    public static function run():Boolean {
        if (!testCrossZ()) {
            return (false);
        }
        return (true);
    }

}

