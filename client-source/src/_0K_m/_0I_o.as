// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._0I_o

package _0K_m {

  import com.company.assembleegameclient.parameters.Parameters;

  import flash.geom.Point;

import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.net.messages.data._Q_0;
import com.company.assembleegameclient.util._04d;

public class _0I_o extends _I_b {

    public function _0I_o(_arg1:GameObject, _arg2:_Q_0, _arg3:int) {
        this.start_ = new Point(_arg1.x_, _arg1.y_);
        this.end_ = new Point(_arg2.x_, _arg2.y_);
        this.color_ = _arg3;
    }
    public var start_:Point;
    public var end_:Point;
    public var color_:int;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local5:Point;
        var _local6:Particle;
        x_ = this.start_.x;
        y_ = this.start_.y;
        var _local3:int = 30;
        var _local4:int;
        while (_local4 < _local3) {
            _local5 = Point.interpolate(this.start_, this.end_, (_local4 / _local3));
            _local6 = new _06s(100, this.color_, 700, 0.5, _04d._F_e(1), _04d._F_e(1));
            if (!Parameters.data_["disableParticles"]) {
              map_.addObj(_local6, _local5.x, _local5.y);
            }
            _local4++;
        }
        return (false);
    }

}
}//package _0K_m

