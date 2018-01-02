// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//MapBackgrounds.NexusBackground

package MapBackgrounds.Backgrounds {

  import MapBackgrounds.*;

  import flash.geom.Point;
import flash.display.BitmapData;

import flash.display.IGraphicsData;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;
import flash.geom.Matrix;

import com.company.util.GraphicHelper;

import flash.display.BitmapDataChannel;
import flash.geom.Rectangle;

import com.company.assembleegameclient.map._0D_v;


public class NexusBackground extends Background {

    public static const _cP_:Point = new Point(0.01, 0.01);

    public function NexusBackground() {
        this._co = new Vector.<Island>();
        this.graphicsData_ = new Vector.<IGraphicsData>();
        this.bitmapFill_ = new GraphicsBitmapFill(null, new Matrix(), true, false);
        this.path_ = new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>());
        super();
        this._T_k = new BitmapData(0x0400, 0x0400, false, 0);
        this._T_k.perlinNoise(0x0400, 0x0400, 8, Math.random(), true, true, BitmapDataChannel.BLUE, false, null);
    }
    protected var graphicsData_:Vector.<IGraphicsData>;
    private var _T_k:BitmapData;
    private var _co:Vector.<Island>;
    private var bitmapFill_:GraphicsBitmapFill;
    private var path_:GraphicsPath;

    override public function draw(_arg1:_0D_v, _arg2:int):void {
//        this.graphicsData_.length = 0;
//        var _local3:Matrix = this.bitmapFill_.matrix;
//        _local3.identity();
//        _local3.translate((_arg2 * _cP_.x), (_arg2 * _cP_.y));
//        _local3****tate(-(_arg1.angleRad_));
//        this.bitmapFill_.bitmapData = this._T_k;
//        this.graphicsData_.push(this.bitmapFill_);
//        this.path_.data.length = 0;
//        var _local4:Rectangle = _arg1._F_L_;
//        this.path_.data.push(_local4.left, _local4.top, _local4.right, _local4.top, _local4.right, _local4.bottom, _local4.left, _local4.bottom);
//        this.graphicsData_.push(this.path_);
//        this.graphicsData_.push(GraphicHelper.END_FILL);
//        this._0E_O_(_arg1, _arg2);
//        graphics.clear();
//        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function _0E_O_(_arg1:_0D_v, _arg2:int):void {
        var _local4:Island;
        var _local3:int;
        while (_local3 < this._co.length) {
            _local4 = this._co[_local3];
            _local4.draw(_arg1, _arg2, this.graphicsData_);
            _local3++;
        }
    }

}
}//package MapBackgrounds

import flash.geom.Point;
import flash.display.BitmapData;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;
import flash.geom.Matrix;

import com.company.util.GraphicHelper;
import com.company.util.AssetLibrary;

import MapBackgrounds.Backgrounds.NexusBackground;

import com.company.assembleegameclient.map._0D_v;

import flash.display.IGraphicsData;


class Island {

    public var center_:Point;
    public var startTime_:int;
    public var bitmapData_:BitmapData;
    /*private*/
    internal var bitmapFill_:GraphicsBitmapFill;
    /*private*/
    internal var path_:GraphicsPath;

    public function Island(_arg1:Number, _arg2:Number, _arg3:int):void {
        this.bitmapFill_ = new GraphicsBitmapFill(null, new Matrix(), true, false);
        this.path_ = new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>());
        super();
        this.center_ = new Point(_arg1, _arg2);
        this.startTime_ = _arg3;
        this.bitmapData_ = AssetLibrary.getImage("stars");
    }

    public function draw(_arg1:_0D_v, _arg2:int, _arg3:Vector.<IGraphicsData>):void {
        var _local4:int = (_arg2 - this.startTime_);
        var _local5:Number = (this.center_.x + (_local4 * NexusBackground._cP_.x));
        var _local6:Number = (this.center_.y + (_local4 * NexusBackground._cP_.y));
        var _local7:Matrix = this.bitmapFill_.matrix;
        _local7.identity();
        _local7.translate(_local5, _local6);
        _local7.rotate(-(_arg1.angleRad_));
        this.bitmapFill_.bitmapData = this.bitmapData_;
        _arg3.push(this.bitmapFill_);
        this.path_.data.length = 0;
        var _local8:Point = _local7.transformPoint(new Point(_local5, _local6));
        var _local9:Point = _local7.transformPoint(new Point((_local5 + this.bitmapData_.width), (_local6 + this.bitmapData_.height)));
        this.path_.data.push(_local8.x, _local8.y, _local9.x, _local8.y, _local9.x, _local9.y, _local8.x, _local9.y);
        _arg3.push(this.path_);
        _arg3.push(GraphicHelper.END_FILL);
    }

}

