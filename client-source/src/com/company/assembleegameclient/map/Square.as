// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map.Square

package com.company.assembleegameclient.map {

import flash.geom.Vector3D;

import com.company.assembleegameclient.objects.GameObject;

import flash.display.BitmapData;

import com.company.assembleegameclient.engine3d.TextureMatrix;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.util._V_m;


public class Square {

    public static const _cr:Vector.<Number> = new <Number>[0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0];
    private static const _Z_3:Vector.<int> = new <int>[26171, 44789, 20333, 70429, 98257, 59393, 33961];

    private static function hash(_arg1:int, _arg2:int):int {
        var _local3:int = _Z_3[((_arg1 + _arg2) % 7)];
        var _local4 = (((_arg1 << 16) | _arg2) ^ 81397550);
        _local4 = ((_local4 * _local3) % 0xFFFF);
        return (_local4);
    }

    public function Square(_arg1:_X_l, _arg2:int, _arg3:int) {
        this.props_ = _pf._w8;
        this.faces_ = new Vector.<_ik>();
        super();
        this.map_ = _arg1;
        this.x_ = _arg2;
        this.y_ = _arg3;
        this.center_ = new Vector3D((this.x_ + 0.5), (this.y_ + 0.5), 0);
        this._02I_ = new <Number>[this.x_, this.y_, 0, (this.x_ + 1), this.y_, 0, (this.x_ + 1), (this.y_ + 1), 0, this.x_, (this.y_ + 1), 0];
    }
    public var map_:_X_l;
    public var x_:int;
    public var y_:int;
    public var tileType_:uint = 0xFF;
    public var center_:Vector3D;
    public var _02I_:Vector.<Number>;
    public var obj_:GameObject = null;
    public var props_:_C_O_;
    public var texture_:BitmapData = null;
    public var sink_:int = 0;
    public var lastDamage_:int = 0;
    public var faces_:Vector.<_ik>;
    public var _0_C_:_ik = null;
    public var baseTexMatrix_:TextureMatrix = null;
    public var _P_k:int;

    public function dispose():void {
        var _local1:_ik;
        this.map_ = null;
        this.center_ = null;
        this._02I_ = null;
        this.obj_ = null;
        this.texture_ = null;
        for each (_local1 in this.faces_) {
            _local1.dispose();
        }
        this.faces_.length = 0;
        if (this._0_C_ != null) {
            this._0_C_.dispose();
            this._0_C_ = null;
        }
        this.faces_ = null;
        this.baseTexMatrix_ = null;
    }

    public function _bQ_(_arg1:uint):void {
        this.tileType_ = _arg1;
        this.props_ = _pf._020[this.tileType_];
        this.texture_ = _pf.getBitmapData(this.tileType_, hash(this.x_, this.y_));
        this.baseTexMatrix_ = new TextureMatrix(this.texture_, _cr);
        this.faces_.length = 0;
    }

    public function _0C_D_():Boolean {
        return (((!(this.props_._b5)) && ((((this.obj_ == null)) || (!(this.obj_.props_.occupySquare_))))));
    }

    public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local4:_ik;
        if (this.texture_ == null) {
            return;
        }
        if (this.faces_.length == 0) {
            this._08U_();
        }
        for each (_local4 in this.faces_) {
            if (!_local4.draw(_arg1, _arg2, _arg3)) {
                if (_local4.face_.vout_[1] < _arg2._F_L_.bottom) {
                    this._P_k = 0;
                }
                return;
            }
        }
    }

    public function _D_r(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        this._0_C_.draw(_arg1, _arg2, _arg3);
    }

    private function _08U_():void {
        var _local2:Number;
        var _local3:Number;
        var _local4:BitmapData;
        var _local5:Vector.<Number>;
        var _local6:uint;
        this.faces_.length = 0;
        this._0_C_ = null;
        var _local1:BitmapData;
        if (this.props_.animate_.type_ != _M_X_._0I_7) {
            this.faces_.push(new _ik(this.texture_, this._02I_, this.props_._zT_, this.props_._zT_, this.props_.animate_.type_, this.props_.animate_.dx_, this.props_.animate_.dy_));
            _local1 = _V_m.redraw(this, false);
            if (_local1 != null) {
                this.faces_.push(new _ik(_local1, this._02I_, 0, 0, _M_X_._0I_7, 0, 0));
            }
        } else {
            _local1 = _V_m.redraw(this, true);
            _local2 = 0;
            _local3 = 0;
            if (_local1 == null) {
                if (this.props_._wX_) {
                    _local2 = (int((this.texture_.width * Math.random())) / this.texture_.width);
                    _local3 = (int((this.texture_.height * Math.random())) / this.texture_.height);
                } else {
                    _local2 = this.props_._zT_;
                    _local3 = this.props_._P_U_;
                }
            }
            this.faces_.push(new _ik((((_local1) != null) ? _local1 : this.texture_), this._02I_, _local2, _local3, _M_X_._0I_7, 0, 0));
        }
        if (this.props_.sink_) {
            this.sink_ = (((_local1) == null) ? 12 : 6);
        } else {
            this.sink_ = 0;
        }
        if (this.props_._S_7) {
            _local4 = this.props_._S_7.getTexture();
            _local5 = this._02I_.concat();
            _local6 = 2;
            while (_local6 < _local5.length) {
                _local5[_local6] = 1;
                _local6 = (_local6 + 3);
            }
            this._0_C_ = new _ik(_local4, _local5, 0, 0, this.props_._003.type_, this.props_._003.dx_, this.props_._003.dy_);
        }
    }

}
}//package com.company.assembleegameclient.map

