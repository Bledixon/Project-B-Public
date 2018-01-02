// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._C_e

package _0K_m {

  import com.company.assembleegameclient.parameters.Parameters;

  import flash.geom.Point;

import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.net.messages.data._Q_0;

public class _C_e extends _I_b {

    public function _C_e(_arg1:GameObject, _arg2:_Q_0, _arg3:_Q_0, _arg4:int) {
        this.center_ = new Point(_arg2.x_, _arg2.y_);
        this._H_S_ = new Point(_arg3.x_, _arg3.y_);
        this.color_ = _arg4;
    }
    public var center_:Point;
    public var _H_S_:Point;
    public var color_:int;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local7:Number;
        var _local8:Point;
        var _local9:Particle;
        x_ = this.center_.x;
        y_ = this.center_.y;
        var _local3:Number = Point.distance(this.center_, this._H_S_);
        var _local4:int = 100;
        var _local5:int = 24;
        var _local6:int;
        while (_local6 < _local5) {
            _local7 = (((_local6 * 2) * Math.PI) / _local5);
            _local8 = new Point((this.center_.x + (_local3 * Math.cos(_local7))), (this.center_.y + (_local3 * Math.sin(_local7))));
            _local9 = new _7c(_local4, this.color_, (100 + (Math.random() * 200)), this.center_, _local8);
            if (!Parameters.data_["disableParticles"]) {
              map_.addObj(_local9, x_, y_);
            }
            _local6++;
        }
        return (false);
    }

}
}//package _0K_m

