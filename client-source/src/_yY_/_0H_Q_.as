// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_yY_._0H_Q_

package _yY_ {
import com.company.assembleegameclient.objects.BasicObject;

import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;

import flash.geom.Matrix;
import flash.display.BitmapData;

import com.company.util.GraphicHelper;
import com.company.assembleegameclient.map.Square;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;


public class _0H_Q_ extends BasicObject {

    public function _0H_Q_(_arg1:Number, _arg2:BitmapData) {
        this.bitmapFill_ = new GraphicsBitmapFill(null, null, false, false);
        this.path_ = new GraphicsPath(GraphicHelper._H_2, null);
        this.vS_ = new Vector.<Number>();
        this._01i = new Matrix();
        super();
        _P_m = false;
        objectId_ = _7y();
        this._01Y_ = _arg2;
        z_ = _arg1;
    }
    public var size_:int;
    protected var bitmapFill_:GraphicsBitmapFill;
    protected var path_:GraphicsPath;
    protected var vS_:Vector.<Number>;
    protected var _01i:Matrix;
    protected var _A_o:Number = 0;
    private var _01Y_:BitmapData;
    private var _in_:Number = 0;

    override public function drawShadow(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
    }

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local4:BitmapData = this._01Y_;
        var _local5:int = _local4.width;
        var _local6:int = _local4.height;
        this.vS_.length = 0;
        this.vS_.push((_bY_[3] - (_local5 / 2)), (_bY_[4] - (_local6 / 2)), (_bY_[3] + (_local5 / 2)), (_bY_[4] - (_local6 / 2)), (_bY_[3] + (_local5 / 2)), (_bY_[4] + (_local6 / 2)), (_bY_[3] - (_local5 / 2)), (_bY_[4] + (_local6 / 2)));
        this.path_.data = this.vS_;
        this.bitmapFill_.bitmapData = _local4;
        this._01i.identity();
        if (this._A_o) {
            this._in_ = (this._in_ + this._A_o);
            this._01i.translate((-(_local5) / 2), (-(_local6) / 2));
            this._01i.rotate(this._in_);
            this._01i.translate((_local5 / 2), (_local6 / 2));
        }
        this._01i.translate(this.vS_[0], this.vS_[1]);
        this.bitmapFill_.matrix = this._01i;
        _arg1.push(this.bitmapFill_);
        _arg1.push(this.bitmapFill_);
        _arg1.push(this.path_);
        _arg1.push(GraphicHelper.END_FILL);
    }

    public function moveTo(_arg1:Number, _arg2:Number):Boolean {
        var _local3:Square = map_.getSquare(_arg1, _arg2);
        if (!_local3) {
            return (false);
        }
        x_ = _arg1;
        y_ = _arg2;
        _0H_B_ = _local3;
        return (true);
    }

    public function _H_9(_arg1:int):void {
        this.size_ = ((_arg1 / 100) * 5);
    }

}
}//package _yY_

