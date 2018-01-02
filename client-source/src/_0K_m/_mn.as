// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._mn

package _0K_m {

  import com.company.assembleegameclient.parameters.Parameters;

  import flash.geom.Point;

import com.company.assembleegameclient.net.messages.data._Q_0;
import com.company.assembleegameclient.objects.GameObject;

public class _mn extends _I_b {

    public function _mn(_arg1:GameObject, _arg2:_Q_0, _arg3:Number, _arg4:int) {
        this.start_ = new Point(_arg1.x_, _arg1.y_);
        this._0A_2 = _arg2;
        this._0K_e = _arg3;
        this.color_ = _arg4;
    }
    public var start_:Point;
    public var _0A_2:_Q_0;
    public var _0K_e:Number;
    public var color_:int;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local9:Number;
        var _local10:Point;
        var _local11:Particle;
        x_ = this.start_.x;
        y_ = this.start_.y;
        var _local3 = 200;
        var _local4:int = 100;
        var _local5:Number = (Math.PI / 3);
        var _local6:int = 7;
        var _local7:Number = Math.atan2((this._0A_2.y_ - this.start_.y), (this._0A_2.x_ - this.start_.x));
        var _local8:int;
        while (_local8 < _local6) {
            _local9 = ((_local7 - (_local5 / 2)) + ((_local8 * _local5) / _local6));
            _local10 = new Point((this.start_.x + (this._0K_e * Math.cos(_local9))), (this.start_.y + (this._0K_e * Math.sin(_local9))));
            _local11 = new _7c(_local3, this.color_, _local4, this.start_, _local10);
            if (!Parameters.data_["disableParticles"]) {
              map_.addObj(_local11, x_, y_);
            }
            _local8++;
        }
        return (false);
    }

}
}//package _0K_m

