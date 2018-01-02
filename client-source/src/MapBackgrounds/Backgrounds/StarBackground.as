﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//MapBackgrounds.StarBackground

package MapBackgrounds.Backgrounds {

  import MapBackgrounds.*;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;
import com.company.util.AssetLibrary;
import com.company.util._kp;
import com.company.util.PointUtil;


public class StarBackground extends Background {

    public function StarBackground() {
        this._P_j = new Vector.<Star>();
        this.graphicsData_ = new Vector.<IGraphicsData>();
        super();
        var _local1:int;
        while (_local1 < 100) {
            this._lh();
            _local1++;
        }
    }
    public var _P_j:Vector.<Star>;
    protected var graphicsData_:Vector.<IGraphicsData>;

    override public function draw(_arg1:_0D_v, _arg2:int):void {
        var _local3:Star;
        this.graphicsData_.length = 0;
        for each (_local3 in this._P_j) {
            _local3.draw(this.graphicsData_, _arg1, _arg2);
        }
        graphics.clear();
        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function _lh():void {
        var _local3:Star;
        var _local1:_kp = AssetLibrary._18("stars");
        var _local2:Star = new Star(((Math.random() * 1000) - 500), ((Math.random() * 1000) - 500), (4 * (0.5 + (0.5 * Math.random()))), _local1._W_u[int((_local1._W_u.length * Math.random()))]);
        for each (_local3 in this._P_j) {
            if (PointUtil._R_O_(_local2.x_, _local2.y_, _local3.x_, _local3.y_) < 3) {
                return;
            }
        }
        this._P_j.push(_local2);
    }

}
}//package MapBackgrounds

import flash.display.GraphicsPathCommand;
import flash.display.GraphicsEndFill;
import flash.display.BitmapData;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;
import flash.geom.Matrix;
import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;


class Star {

    protected static const sqCommands:Vector.<int> = new <int>[GraphicsPathCommand.MOVE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO];
    protected static const END_FILL:GraphicsEndFill = new GraphicsEndFill();

    public var x_:Number;
    public var y_:Number;
    public var scale_:Number;
    public var bitmap_:BitmapData;
    /*private*/
    internal var w_:Number;
    /*private*/
    internal var h_:Number;
    protected var bitmapFill_:GraphicsBitmapFill;
    protected var path_:GraphicsPath;

    public function Star(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:BitmapData):void {
        this.bitmapFill_ = new GraphicsBitmapFill(null, new Matrix(), false, false);
        this.path_ = new GraphicsPath(sqCommands, new Vector.<Number>());
        super();
        this.x_ = _arg1;
        this.y_ = _arg2;
        this.scale_ = _arg3;
        this.bitmap_ = _arg4;
        this.w_ = (this.bitmap_.width * this.scale_);
        this.h_ = (this.bitmap_.height * this.scale_);
    }

    public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local4:Number = ((this.x_ * Math.cos(-(_arg2.angleRad_))) - (this.y_ * Math.sin(-(_arg2.angleRad_))));
        var _local5:Number = ((this.x_ * Math.sin(-(_arg2.angleRad_))) + (this.y_ * Math.cos(-(_arg2.angleRad_))));
        var _local6:Matrix = this.bitmapFill_.matrix;
        _local6.identity();
        _local6.translate((-(this.bitmap_.width) / 2), (-(this.bitmap_.height) / 2));
        _local6.scale(this.scale_, this.scale_);
        _local6.translate(_local4, _local5);
        this.bitmapFill_.bitmapData = this.bitmap_;
        this.path_.data.length = 0;
        var _local7:Number = (_local4 - (this.w_ / 2));
        var _local8:Number = (_local5 - (this.h_ / 2));
        this.path_.data.push(_local7, _local8, (_local7 + this.w_), _local8, (_local7 + this.w_), (_local8 + this.h_), _local7, (_local8 + this.h_));
        _arg1.push(this.bitmapFill_);
        _arg1.push(this.path_);
        _arg1.push(END_FILL);
    }

}

