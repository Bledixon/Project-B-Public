// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._uj

package _0K_m {
import com.company.assembleegameclient.objects.BasicObject;

import flash.display.BitmapData;

import _0_P_.Animations;

import flash.geom.Vector3D;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;

import flash.geom.Matrix;

import com.company.util.GraphicHelper;
import com.company.assembleegameclient.map.Square;
import com.company.assembleegameclient.util.TextureRedrawer;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;


public class _uj extends BasicObject {

    public function _uj(_arg1:_7g) {
        this.bitmapFill_ = new GraphicsBitmapFill(null, null, false, false);
        this.path_ = new GraphicsPath(GraphicHelper._H_2, null);
        this.vS_ = new Vector.<Number>();
        this._0C_q = new Vector.<Number>();
        this._01i = new Matrix();
        super();
        objectId_ = _7y();
        this.size_ = _arg1.size_;
        z_ = _arg1.z_;
        this._fl = _arg1.duration_;
        this.texture_ = _arg1._Y_D_.getTexture(objectId_);
        if (_arg1._fe != null) {
            this._09e = new Animations(_arg1._fe);
        }
        this.moveVec_ = new Vector3D();
        var _local2:Number = ((Math.PI * 2) * Math.random());
        this.moveVec_.x = ((Math.cos(_local2) * 0.1) * 5);
        this.moveVec_.y = ((Math.sin(_local2) * 0.1) * 5);
    }
    public var texture_:BitmapData = null;
    public var _09e:Animations = null;
    public var size_:int;
    public var _fl:Number;
    public var moveVec_:Vector3D;
    protected var bitmapFill_:GraphicsBitmapFill;
    protected var path_:GraphicsPath;
    protected var vS_:Vector.<Number>;
    protected var _0C_q:Vector.<Number>;
    protected var _01i:Matrix;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Number = (_arg2 / 1000);
        this._fl = (this._fl - _local3);
        if (this._fl <= 0) {
            return (false);
        }
        x_ = (x_ + (this.moveVec_.x * _local3));
        y_ = (y_ + (this.moveVec_.y * _local3));
        return (true);
    }

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local7:BitmapData;
        var _local4:BitmapData = this.texture_;
        if (this._09e != null) {
            _local7 = this._09e.getTexture(_arg3);
            if (_local7 != null) {
                _local4 = _local7;
            }
        }
        _local4 = TextureRedrawer.redraw(_local4, this.size_, true, 0, 0);
        var _local5:int = _local4.width;
        var _local6:int = _local4.height;
        this.vS_.length = 0;
        this.vS_.push((_bY_[3] - (_local5 / 2)), (_bY_[4] - _local6), (_bY_[3] + (_local5 / 2)), (_bY_[4] - _local6), (_bY_[3] + (_local5 / 2)), _bY_[4], (_bY_[3] - (_local5 / 2)), _bY_[4]);
        this.path_.data = this.vS_;
        this.bitmapFill_.bitmapData = _local4;
        this._01i.identity();
        this._01i.translate(this.vS_[0], this.vS_[1]);
        this.bitmapFill_.matrix = this._01i;
        _arg1.push(this.bitmapFill_);
        _arg1.push(this.path_);
        _arg1.push(GraphicHelper.END_FILL);
    }

    public function moveTo(_arg1:Number, _arg2:Number):Boolean {
        var _local3:Square;
        _local3 = map_.getSquare(_arg1, _arg2);
        if (_local3 == null) {
            return (false);
        }
        x_ = _arg1;
        y_ = _arg2;
        _0H_B_ = _local3;
        return (true);
    }

}
}//package _0K_m

