// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_yY_._0I_R_

package _yY_ {
import flash.geom.Point;
import flash.display.BitmapData;

import com.company.util.AssetLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;

public class _0I_R_ extends _0H_Q_ {

    public function _0I_R_(_arg1:int, _arg2:Point, _arg3:Point) {
        this.bitmapData = AssetLibrary._xK_("lofiObj3", 411);
        this.bitmapData = TextureRedrawer.redraw(this.bitmapData, 80, true, 0, 0, false);
        _A_o = 0.2;
        super(0, this.bitmapData);
        this.lifetime_ = (this.timeLeft_ = _arg1);
        this.start_ = _arg2;
        this.end_ = _arg3;
        this.dx_ = ((this.end_.x - this.start_.x) / this.timeLeft_);
        this.dy_ = ((this.end_.y - this.start_.y) / this.timeLeft_);
        var _local4:Number = (Point.distance(_arg2, _arg3) / this.timeLeft_);
        this.pathX_ = (x_ = this.start_.x);
        this.pathY_ = (y_ = this.start_.y);
    }
    public var lifetime_:int;
    public var timeLeft_:int;
    public var start_:Point;
    public var end_:Point;
    public var dx_:Number;
    public var dy_:Number;
    public var pathX_:Number;
    public var pathY_:Number;
    private var bitmapData:BitmapData;

    override public function update(_arg1:int, _arg2:int):Boolean {
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0) {
            return (false);
        }
        z_ = (Math.sin(((this.timeLeft_ / this.lifetime_) * Math.PI)) * 2);
        _H_9(z_);
        this.pathX_ = (this.pathX_ + (this.dx_ * _arg2));
        this.pathY_ = (this.pathY_ + (this.dy_ * _arg2));
        moveTo(this.pathX_, this.pathY_);
        return (true);
    }

}
}//package _yY_

