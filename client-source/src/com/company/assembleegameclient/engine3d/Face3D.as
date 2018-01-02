// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.engine3d.Face3D

package com.company.assembleegameclient.engine3d {
import flash.display.GraphicsSolidFill;
import flash.display.BitmapData;

import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;
import flash.geom.Vector3D;
import flash.display.GraphicsPathCommand;
import flash.geom.Utils3D;

import com.company.util.GraphicHelper;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;
import com.company.util._09Q_;
import com.company.assembleegameclient.util.TextureRedrawer;


public class Face3D {

    private static const _yR_:GraphicsSolidFill = new GraphicsSolidFill(0, 1);

    public function Face3D(_arg1:BitmapData, _arg2:Vector.<Number>, _arg3:Vector.<Number>, _arg4:Boolean = false, _arg5:Boolean = false) {
        var _local7:Vector3D;
        this.vout_ = new Vector.<Number>();
        this.bitmapFill_ = new GraphicsBitmapFill(null, null, false, false);
        this.path_ = new GraphicsPath(new Vector.<int>(), null);
        super();
        this._rj = _arg1;
        this._02I_ = _arg2;
        this._0C_q = _arg3;
        this._kl = _arg4;
        if (_arg5) {
            _local7 = new Vector3D();
            _9L_._O_s(_arg2, _local7);
            this._H_J_ = _fS_._sq(_local7, 0.75);
        }
        this.path_.commands.push(GraphicsPathCommand.MOVE_TO);
        var _local6:int = 3;
        while (_local6 < this._02I_.length) {
            this.path_.commands.push(GraphicsPathCommand.LINE_TO);
            _local6 = (_local6 + 3);
        }
        this.path_.data = this.vout_;
    }
    public var _rj:BitmapData;
    public var _02I_:Vector.<Number>;
    public var _0C_q:Vector.<Number>;
    public var vout_:Vector.<Number>;
    public var _kl:Boolean;
    public var _H_J_:Number = 1;
    public var _0z:Boolean = false;
    public var bitmapFill_:GraphicsBitmapFill;
    private var _lX_:Boolean = true;
    private var _n6:TextureMatrix = null;
    private var path_:GraphicsPath;

    public function dispose():void {
        this._rj = null;
        this._02I_ = null;
        this._0C_q = null;
        this.vout_ = null;
        this._n6 = null;
        this.bitmapFill_ = null;
        this.path_.commands = null;
        this.path_.data = null;
        this.path_ = null;
    }

    public function _E_O_(_arg1:BitmapData):void {
        if (this._rj == _arg1) {
            return;
        }
        this._rj = _arg1;
        this._lX_ = true;
    }

    public function _B_A_(_arg1:Vector.<Number>):void {
        this._0C_q = _arg1;
        this._lX_ = true;
    }

    public function _8h():Number {
        var _local1:Number = -(Number.MAX_VALUE);
        var _local2:int = this.vout_.length;
        var _local3:int;
        while (_local3 < _local2) {
            if (this.vout_[(_local3 + 1)] > _local1) {
                _local1 = this.vout_[(_local3 + 1)];
            }
            _local3 = (_local3 + 2);
        }
        return (_local1);
    }

    public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v):Boolean {
        var _local10:Vector.<Number>;
        var _local11:Number;
        var _local12:Number;
        var _local13:Number;
        var _local14:Number;
        var _local15:int;
        Utils3D.projectVectors(_arg2.wToS_, this._02I_, this.vout_, this._0C_q);
        if (this._kl) {
            _local10 = this.vout_;
            _local11 = (_local10[2] - _local10[0]);
            _local12 = (_local10[3] - _local10[1]);
            _local13 = (_local10[4] - _local10[0]);
            _local14 = (_local10[5] - _local10[1]);
            if (((_local11 * _local14) - (_local12 * _local13)) > 0) {
                return (false);
            }
        }
        var _local3:Number = (_arg2._F_L_.x - 10);
        var _local4:Number = (_arg2._F_L_.y - 10);
        var _local5:Number = (_arg2._F_L_.right + 10);
        var _local6:Number = (_arg2._F_L_.bottom + 10);
        var _local7:Boolean = false;
        var _local8:int = this.vout_.length;
        var _local9:int;
        while (_local9 < _local8) {
            _local15 = (_local9 + 1);
            if ((((((((this.vout_[_local9] >= _local3)) && ((this.vout_[_local9] <= _local5)))) && ((this.vout_[_local15] >= _local4)))) && ((this.vout_[_local15] <= _local6)))) {
                _local7 = false;
                break;
            }
            _local9 = (_local9 + 2);
        }
        if (_local7) {
            return (false);
        }
        if (this._0z) {
            _arg1.push(_yR_);
            _arg1.push(this.path_);
            _arg1.push(GraphicHelper.END_FILL);
            return (true);
        }
        if (this._lX_) {
            this._sD_();
        }
        this._n6.calculateTextureMatrix(this.vout_);
        this.bitmapFill_.bitmapData = this._n6.texture_;
        this.bitmapFill_.matrix = this._n6.tToS_;
        _arg1.push(this.bitmapFill_);
        _arg1.push(this.path_);
        _arg1.push(GraphicHelper.END_FILL);
        return (true);
    }

    public function contains(_arg1:Number, _arg2:Number):Boolean {
        if (_09Q_._094(this.vout_[0], this.vout_[1], this.vout_[2], this.vout_[3], this.vout_[4], this.vout_[5], _arg1, _arg2)) {
            return (true);
        }
        if ((((this.vout_.length == 8)) && (_09Q_._094(this.vout_[0], this.vout_[1], this.vout_[4], this.vout_[5], this.vout_[6], this.vout_[7], _arg1, _arg2)))) {
            return (true);
        }
        return (false);
    }

    private function _sD_():void {
        var _local1:BitmapData = TextureRedrawer._uB_(this._rj, this._H_J_);
        if (this._n6 == null) {
            this._n6 = new TextureMatrix(_local1, this._0C_q);
        } else {
            this._n6.texture_ = _local1;
            this._n6._Z_Z_(this._0C_q);
        }
        this._lX_ = false;
    }

}
}//package com.company.assembleegameclient.engine3d

