// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_015._O_P_

package _015 {
import flash.display.Sprite;

import com.company.assembleegameclient.objects.GameObject;

import flash.geom.Point;

import com.company.ui.SimpleText;

import flash.filters.GlowFilter;

import com.company.assembleegameclient.map._0D_v;

public class _O_P_ extends Sprite implements _0J_p {

    public const _07O_:int = 40;

    public function _O_P_(_arg1:GameObject, _arg2:String, _arg3:uint, _arg4:int, _arg5:int = 0) {
        this.go_ = _arg1;
        this._9U_ = new Point(0, (((-(_arg1.texture_.height) * (_arg1.size_ / 100)) * 5) - 20));
        this.color_ = _arg3;
        this.lifetime_ = _arg4;
        this._Y_Q_ = _arg5;
        var _local6:SimpleText = new SimpleText(24, _arg3, false, 0, 0, "Myriad Pro");
        _local6.setBold(true);
        _local6.text = _arg2;
        _local6.updateMetrics();
        _local6.filters = [new GlowFilter(0, 1, 4, 4, 2, 1)];
        _local6.x = (-(_local6.width) / 2);
        _local6.y = (-(_local6.height) / 2);
        addChild(_local6);
        visible = false;
    }
    public var go_:GameObject;
    public var _9U_:Point;
    public var color_:uint;
    public var lifetime_:int;
    public var _Y_Q_:int;
    private var startTime_:int = 0;

    public function draw(_arg1:_0D_v, _arg2:int):Boolean {
        var _local3:int;
        if (this.startTime_ == 0) {
            this.startTime_ = (_arg2 + this._Y_Q_);
        }
        if (_arg2 < this.startTime_) {
            visible = false;
            return (true);
        }
        _local3 = (_arg2 - this.startTime_);
        if ((((_local3 > this.lifetime_)) || (((!((this.go_ == null))) && ((this.go_.map_ == null)))))) {
            return (false);
        }
        if ((((this.go_ == null)) || (!(this.go_._1D_)))) {
            visible = false;
            return (true);
        }
        visible = true;
        x = ((((this.go_) != null) ? this.go_._bY_[0] : 0) + (((this._9U_) != null) ? this._9U_.x : 0));
        var _local4:Number = ((_local3 / this.lifetime_) * this._07O_);
        y = (((((this.go_) != null) ? this.go_._bY_[1] : 0) + (((this._9U_) != null) ? this._9U_.y : 0)) - _local4);
        return (true);
    }

}
}//package _015

