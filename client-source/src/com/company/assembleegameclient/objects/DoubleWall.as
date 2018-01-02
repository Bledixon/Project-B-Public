﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.Wall

package com.company.assembleegameclient.objects {

import com.company.assembleegameclient.engine3d.Face3D;

import flash.display.BitmapData;

import com.company.util.BitmapUtil;
import com.company.assembleegameclient.map.Square;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;


public class DoubleWall extends GameObject {

    private static const _cr:Vector.<Number> = new <Number>[0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0];
    private static const _crr:Vector.<Number> = new <Number>[0, 0, 0, 1, 0, 0, 1, 2, 0, 0, 2, 0];
    private static const _oZ_:Vector.<int> = new <int>[0, 1, 0, -1];
    private static const _a3:Vector.<int> = new <int>[-1, 0, 1, 0];

    public function DoubleWall(_arg1:XML) {
        this.faces_ = new Vector.<Face3D>();
        super(_arg1);
        _P_m = false;
        var _local2:_Z_H_ = ObjectLibrary._5Q_[objectType_];
        this._0A_0 = _local2.getTexture(0);
    }
    public var faces_:Vector.<Face3D>;
    private var _0_C_:Face3D = null;
    private var _0A_0:BitmapData = null;

    override public function setObjectId(_arg1:int):void {
        super.setObjectId(_arg1);
        var _local2:_Z_H_ = ObjectLibrary._5Q_[objectType_];
        this._0A_0 = _local2.getTexture(_arg1);
    }

    override public function getColor():uint {
        return (BitmapUtil._B_n(this._0A_0));
    }

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local6:BitmapData;
        var _local7:Face3D;
        var _local8:Square;
        if (texture_ == null) {
            return;
        }
        if (this.faces_.length == 0) {
            this._08U_();
        }
        var _local4:BitmapData = texture_;
        if (_09e != null) {
            _local6 = _09e.getTexture(_arg3);
            if (_local6 != null) {
                _local4 = _local6;
            }
        }
        var _local5:int;
        while (_local5 < this.faces_.length) {
            _local7 = this.faces_[_local5];
            _local8 = map_.lookupSquare((x_ + _oZ_[_local5]), (y_ + _a3[_local5]));
            if ((((((_local8 == null)) || ((_local8.texture_ == null)))) || (((((!((_local8 == null))) && ((_local8.obj_ is DoubleWall)))) && (!(_local8.obj_._aE_)))))) {
                _local7._0z = true;
            } else {
                _local7._0z = false;
                if (_09e != null) {
                    _local7._E_O_(_local4);
                }
            }
            _local7.draw(_arg1, _arg2);
            _local5++;
        }
        this._0_C_.draw(_arg1, _arg2);
    }

    public function _08U_():void {
        this.faces_.length = 0;
        var _local1:int = x_;
        var _local2:int = y_;
        var _local3:Vector.<Number> = new <Number>[_local1, _local2, 2, (_local1 + 1), _local2, 2, (_local1 + 1), (_local2 + 1), 2, _local1, (_local2 + 1), 2];
        this._0_C_ = new Face3D(this._0A_0, _local3, _cr, false, true);
        this._0_C_.bitmapFill_.repeat = true;
        this._eu(_local1, _local2, 2, (_local1 + 1), _local2, 2);
        this._eu((_local1 + 1), _local2, 2, (_local1 + 1), (_local2 + 1), 2);
        this._eu((_local1 + 1), (_local2 + 1), 2, _local1, (_local2 + 1), 2);
        this._eu(_local1, (_local2 + 1), 2, _local1, _local2, 2);
    }

    private function _eu(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number, _arg6:Number):void {
        var _local7:Vector.<Number> = new <Number>[_arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg4, _arg5, (_arg6 - 2), _arg1, _arg2, (_arg3 - 2)];
        var _local8:Face3D = new Face3D(texture_, _local7, _cr, true, true);
        _local8.bitmapFill_.repeat = true;
        this.faces_.push(_local8);
    }

}
}//package com.company.assembleegameclient.objects

