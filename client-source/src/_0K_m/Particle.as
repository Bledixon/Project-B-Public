// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m.Particle

package _0K_m {
import com.company.assembleegameclient.objects.BasicObject;

import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;

import flash.geom.Matrix;

import com.company.util.GraphicHelper;
import com.company.assembleegameclient.map.Square;
import com.company.assembleegameclient.util.TextureRedrawer;

import flash.display.BitmapData;
import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;


public class Particle extends BasicObject {

    public function Particle(_arg1:uint, _arg2:Number, _arg3:int) {
        this.bitmapFill_ = new GraphicsBitmapFill(null, null, false, false);
        this.path_ = new GraphicsPath(GraphicHelper._H_2, null);
        this.vS_ = new Vector.<Number>();
        this._01i = new Matrix();
        super();
        objectId_ = _7y();
        this._0C_y(_arg2);
        this._gp(_arg1);
        this._H_9(_arg3);
    }
    public var size_:int;
    public var color_:uint;
    protected var bitmapFill_:GraphicsBitmapFill;
    protected var path_:GraphicsPath;
    protected var vS_:Vector.<Number>;
    protected var _01i:Matrix;

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local4:BitmapData = TextureRedrawer.redrawSolidSquare(this.color_, this.size_);
        var _local5:int = _local4.width;
        var _local6:int = _local4.height;
        this.vS_.length = 0;
        this.vS_.push((_bY_[3] - (_local5 / 2)), (_bY_[4] - (_local6 / 2)), (_bY_[3] + (_local5 / 2)), (_bY_[4] - (_local6 / 2)), (_bY_[3] + (_local5 / 2)), (_bY_[4] + (_local6 / 2)), (_bY_[3] - (_local5 / 2)), (_bY_[4] + (_local6 / 2)));
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

    public function _gp(_arg1:uint):void {
        this.color_ = _arg1;
    }

    public function _0C_y(_arg1:Number):void {
        z_ = _arg1;
    }

    public function _H_9(_arg1:int):void {
        this.size_ = ((_arg1 / 100) * 5);
    }

}
}//package _0K_m

