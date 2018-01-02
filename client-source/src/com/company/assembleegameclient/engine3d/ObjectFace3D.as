// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.engine3d.ObjectFace3D

package com.company.assembleegameclient.engine3d {


import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.util.GraphicHelper;
import com.company.util.MoreColorUtil;

import flash.display.BitmapData;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;
import flash.display.GraphicsPathCommand;
import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Vector3D;

public class ObjectFace3D {

    public const bitmapFill_:GraphicsBitmapFill = new GraphicsBitmapFill();

    public function ObjectFace3D(_arg1:_uZ_, _arg2:Vector.<int>, _arg3:Boolean = true) {
        this._N_e = new GraphicsSolidFill(0xFFFFFF, 1);
        this.tToS_ = new Matrix();
        this.tempMatrix_ = new Matrix();
        super();
        this.obj_ = _arg1;
        this._to = _arg2;
        this._hg = _arg3;
        var _local4:Vector.<int> = new Vector.<int>();
        var _local5:int;
        while (_local5 < this._to.length) {
            _local4.push((((_local5 == 0)) ? GraphicsPathCommand.MOVE_TO : GraphicsPathCommand.LINE_TO));
            _local5++;
        }
        var _local6:Vector.<Number> = new Vector.<Number>();
        _local6.length = (this._to.length * 2);
        this.path_ = new GraphicsPath(_local4, _local6);
    }
    public var obj_:_uZ_;
    public var _to:Vector.<int>;
    public var _hg:Boolean;
    public var texture_:BitmapData = null;
    public var normalL_:Vector3D = null;
    public var _0F_3:Vector3D;
    public var _H_J_:Number = 1;
    private var path_:GraphicsPath;
    private var _N_e:GraphicsSolidFill;
    private var tToS_:Matrix;
    private var tempMatrix_:Matrix;

    public function dispose():void {
        this._to = null;
        this.path_.commands = null;
        this.path_.data = null;
        this.path_ = null;
    }

    public function _J_d():void {
        this._0F_3 = new Vector3D();
        _9L_._02B_(this.obj_._iv(this._to[0]), this.obj_._iv(this._to[1]), this.obj_._iv(this._to[(this._to.length - 1)]), this._0F_3);
        this._H_J_ = _fS_._sq(this._0F_3, 0.75);
        if (this.normalL_ != null) {
            this._0F_3 = this.obj_._kZ_.deltaTransformVector(this.normalL_);
        }
    }

    public function draw(_arg1:Vector.<IGraphicsData>, _arg2:uint, _arg3:BitmapData):void {
        var _local13:int;
        var _local4:int = (this._to[0] * 2);
        var _local5:int = (this._to[1] * 2);
        var _local6:int = (this._to[(this._to.length - 1)] * 2);
        var _local7:Vector.<Number> = this.obj_.vS_;
        var _local8:Number = (_local7[_local5] - _local7[_local4]);
        var _local9:Number = (_local7[(_local5 + 1)] - _local7[(_local4 + 1)]);
        var _local10:Number = (_local7[_local6] - _local7[_local4]);
        var _local11:Number = (_local7[(_local6 + 1)] - _local7[(_local4 + 1)]);
        if (((_local8 * _local11) - (_local9 * _local10)) < 0) {
            return;
        }
        if (!(this._hg) || _arg3 == null) {
            this._N_e.color = MoreColorUtil._kz(new ColorTransform(this._H_J_, this._H_J_, this._H_J_), _arg2);
            _arg1.push(this._N_e);
        } else {
            _arg3 = TextureRedrawer._uB_(_arg3, this._H_J_);
            this.bitmapFill_.bitmapData = _arg3;
            this.bitmapFill_.matrix = this._B_Z_(_arg3);
            _arg1.push(this.bitmapFill_);
        }
        var _local12:int;
        while (_local12 < this._to.length) {
            _local13 = this._to[_local12];
            this.path_.data[(_local12 * 2)] = _local7[(_local13 * 2)];
            this.path_.data[((_local12 * 2) + 1)] = _local7[((_local13 * 2) + 1)];
            _local12++;
        }
        _arg1.push(this.path_);
        _arg1.push(GraphicHelper.END_FILL);
    }

    private function _B_Z_(_arg1:BitmapData):Matrix {
        var _local2:Vector.<Number> = this.obj_.uvts_;
        var _local3:int = (this._to[0] * 3);
        var _local4:int = (this._to[1] * 3);
        var _local5:int = (this._to[(this._to.length - 1)] * 3);
        var _local6:Number = (_local2[_local3] * _arg1.width);
        var _local7:Number = (_local2[(_local3 + 1)] * _arg1.height);
        this.tToS_.a = ((_local2[_local4] * _arg1.width) - _local6);
        this.tToS_.b = ((_local2[(_local4 + 1)] * _arg1.height) - _local7);
        this.tToS_.c = ((_local2[_local5] * _arg1.width) - _local6);
        this.tToS_.d = ((_local2[(_local5 + 1)] * _arg1.height) - _local7);
        this.tToS_.tx = _local6;
        this.tToS_.ty = _local7;
        this.tToS_.invert();
        _local3 = (this._to[0] * 2);
        _local4 = (this._to[1] * 2);
        _local5 = (this._to[(this._to.length - 1)] * 2);
        var _local8:Vector.<Number> = this.obj_.vS_;
        this.tempMatrix_.a = (_local8[_local4] - _local8[_local3]);
        this.tempMatrix_.b = (_local8[(_local4 + 1)] - _local8[(_local3 + 1)]);
        this.tempMatrix_.c = (_local8[_local5] - _local8[_local3]);
        this.tempMatrix_.d = (_local8[(_local5 + 1)] - _local8[(_local3 + 1)]);
        this.tempMatrix_.tx = _local8[_local3];
        this.tempMatrix_.ty = _local8[(_local3 + 1)];
        this.tToS_.concat(this.tempMatrix_);
        return (this.tToS_);
    }

}
}//package com.company.assembleegameclient.engine3d

