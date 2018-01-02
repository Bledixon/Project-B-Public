// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._0G_P_

package _0K_m {
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.util._wW_;

public class _0G_P_ extends _I_b {

    private static const _F_r:Number = 400;

    public function _0G_P_(_arg1:GameObject, _arg2:_D_J_) {
        this.go_ = _arg1;
        this._25 = _arg2;
        this._un = (((1 - _arg2.rate) * _F_r) + 1);
        this._0A_x = ("BubbleEffect_" + Math.random());
    }
    public var go_:GameObject;
    public var lastUpdate_:int = -1;
    public var _un:Number;
    private var _0A_x:String;
    private var _25:_D_J_;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:int;
        var _local5:int;
        var _local6:Number;
        var _local7:Number;
        var _local11:_jn;
        var _local12:Number;
        var _local13:Number;
        if (this.go_.map_ == null) {
            return (false);
        }
        if (!this.lastUpdate_) {
            this.lastUpdate_ = _arg1;
            return (true);
        }
        _local3 = int((this.lastUpdate_ / this._un));
        var _local4:int = int((_arg1 / this._un));
        var _local8:Number = this.go_.x_;
        var _local9:Number = this.go_.y_;
        if (this.lastUpdate_ < 0) {
            this.lastUpdate_ = Math.max(0, (_arg1 - _F_r));
        }
        x_ = _local8;
        y_ = _local9;
        var _local10:int = _local3;
        while (_local10 < _local4) {
            _local5 = (_local10 * this._un);
            _local11 = _jn.create(this._0A_x, this._25.color, this._25.speed, this._25.life, this._25.lifeVariance, this._25.speedVariance, this._25.spread);
            _local11.restart(_local5, _arg1);
            _local6 = (Math.random() * Math.PI);
            _local7 = (Math.random() * 0.4);
            _local12 = (_local8 + (_local7 * Math.cos(_local6)));
            _local13 = (_local9 + (_local7 * Math.sin(_local6)));
            map_.addObj(_local11, _local12, _local13);
            _local10++;
        }
        this.lastUpdate_ = _arg1;
        return (true);
    }

    override public function removeFromMap():void {
        super.removeFromMap();
        _wW_.dump(this._0A_x);
    }

}
}//package _0K_m

