// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._en

package _0K_m {

import com.company.assembleegameclient.objects.GameObject;

import flash.display.BitmapData;

import com.company.util.AssetLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;


public class OrbitEffect extends _I_b {

    public static function _rU_(_arg1:_D_J_, _arg2:GameObject):OrbitEffect {
        return (new OrbitEffect(_arg1, _arg2));
    }

    public function OrbitEffect(_arg1:_D_J_, _arg2:GameObject) {
        this._J_7 = _arg2;
        this._0G_x = _arg1;
        this.angle_ = this._0G_x.angleOffset;
        if (this._0G_x.bitmapFile) {
            this.bitmapData = AssetLibrary._xK_(this._0G_x.bitmapFile, this._0G_x.bitmapIndex);
            this.bitmapData = TextureRedrawer.redraw(this.bitmapData, this._0G_x.size, true, 0, 0);
        } else {
            this.bitmapData = TextureRedrawer.redrawSolidSquare(this._0G_x.color, this._0G_x.size);
        }
    }
    private var particle_:_7M_;
    private var _J_7:GameObject;
    private var angle_:Number = 0;
    private var _ge:Number = 0;
    private var _0G_x:_D_J_;
    private var bitmapData:BitmapData;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Number = (_arg1 / 1000);
        var _local4:Number = (_arg2 / 1000);
        if (this._J_7.map_ == null) {
            return (false);
        }
        x_ = this._J_7.x_;
        y_ = this._J_7.y_;
        z_ = (this._J_7.z_ + this._0G_x.zOffset);
        this._ge = (this._ge + _local4);
        if(this.particle_ == null) {
            this.particle_ = new _7M_(this.bitmapData);
            this.particle_.lX_ = 0;
            this.particle_.lY_ = 0;
            map_.addObj(this.particle_, x_, y_);
            this.particle_.z_ = this._0G_x.zOffset;
        }
        this.angle_ += this._0G_x.speed * _local4;
        this.angle_ = this.angle_ % 360;
        this.particle_.lX_ = this._0G_x.radius * Math.cos(this.angle_ * Math.PI / 180);
        this.particle_.lY_ = -this._0G_x.radius * Math.sin(this.angle_ * Math.PI / 180);
        this.particle_.x_ = this.x_ + this.particle_.lX_;
        this.particle_.y_ = this.y_ + this.particle_.lY_;
        this.particle_._0H_B_ = map_.getSquare(this.particle_.x_, this.particle_.y_);
        return (true);
    }

    override public function removeFromMap():void {
        if(this.particle_ != null) {
            map_.removeObj(this.particle_.objectId_);
        }
        super.removeFromMap();
    }

}
}//package _0K_m

