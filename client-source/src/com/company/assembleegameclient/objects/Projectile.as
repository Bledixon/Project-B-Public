// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.Projectile

package com.company.assembleegameclient.objects {
import com.company.assembleegameclient.engine3d._0I_4;
import com.company.assembleegameclient.map.Square;
import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.map._X_l;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.tutorial.Tutorial;
import com.company.assembleegameclient.tutorial.doneAction;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.assembleegameclient.util._04d;
import com.company.assembleegameclient.util._7t;
import com.company.assembleegameclient.util._wW_;
import com.company.util.GraphicHelper;
import com.company.util.Trig;

import flash.display.BitmapData;
import flash.display.GradientType;
import flash.display.GraphicsGradientFill;
import flash.display.GraphicsPath;
import flash.display.IGraphicsData;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import _0K_m.HitEffect;
import _0K_m._06s;


public class Projectile extends BasicObject {

    private static var _02:Dictionary = new Dictionary();

    public static function _61(_arg1:int, _arg2:uint):int {
        return (_02[((_arg2 << 24) | _arg1)]);
    }

    public static function _n1(_arg1:int, _arg2:uint):int {
        var _local3:int = _7y();
        _02[((_arg2 << 24) | _arg1)] = _local3;
        return (_local3);
    }

    public static function _0B_n(_arg1:int, _arg2:uint):void {
        delete _02[((_arg2 << 24) | _arg1)];
    }

    public static function dispose():void {
        _02 = new Dictionary();
    }

    public function Projectile() {
        this._ey = new _0I_4(100);
        this._0L_7 = new Point();
        this._08V_ = new Vector3D();
        this._J_4 = new GraphicsGradientFill(GradientType.RADIAL, [0, 0], [0.5, 0], null, new Matrix());
        this._P_C_ = new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>());
        super();
    }
    public var props_:ObjectProperties;
    public var _P_d:ObjectProperties;
    public var _ko:_O_d;
    public var texture_:BitmapData;
    public var bulletId_:uint;
    public var ownerId_:int;
    public var containerType_:int;
    public var bulletType_:uint;
    public var _jr:Boolean;
    public var _0H_n:Boolean;
    public var damage_:int;
    public var _P_B_:String;
    public var _R_i:Number;
    public var _J_Y_:Number;
    public var startTime_:int;
    public var angle_:Number = 0;
    public var _08H_:Dictionary;
    public var _ey:_0I_4;
    protected var _J_4:GraphicsGradientFill;
    protected var _P_C_:GraphicsPath;
    private var _0L_7:Point;
    private var _08V_:Vector3D;

    override public function addTo(_arg1:_X_l, _arg2:Number, _arg3:Number):Boolean {
        var _local4:Player;
        this._R_i = _arg2;
        this._J_Y_ = _arg3;
        if (!super.addTo(_arg1, _arg2, _arg3)) {
            return (false);
        }
        if (((!(this._P_d.flying_)) && (_0H_B_.sink_))) {
            z_ = 0.1;
        } else {
            _local4 = (_arg1.goDict_[this.ownerId_] as Player);
            if (((!((_local4 == null))) && ((_local4._0F_ > 0)))) {
                z_ = (0.5 - (0.4 * (_local4._0F_ / Parameters._K_5)));
            }
        }
        return (true);
    }

    override public function removeFromMap():void {
        super.removeFromMap();
        _0B_n(this.ownerId_, this.bulletId_);
        this._08H_ = null;
        _wW_._ay(this);
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local5:Vector.<uint>;
        var _local7:Boolean;
        var _local8:int;
        var _local9:Boolean;
        var _local3:int = (_arg1 - this.startTime_);
        if (_local3 > this._ko.lifetime_) {
            return (false);
        }
        var _local4:Point = this._0L_7;
        this._W_d(_local3, _local4);
        if (((!(this.moveTo(_local4.x, _local4.y))) || ((_0H_B_.tileType_ == 0xFF)))) {
            if (this._0H_n) {
                map_.gs_.gsc_.squareHit(_arg1, this.bulletId_, this.ownerId_);
            } else {
                if (_0H_B_.obj_ != null) {
                    _local5 = _7t._tD_(this.texture_);
                    map_.addObj(new HitEffect(_local5, 100, 3, this.angle_, this._ko.speed_), _local4.x, _local4.y);
                }
            }
            return (false);
        }
        if (((((!((_0H_B_.obj_ == null))) && (((!(_0H_B_.obj_.props_.isEnemy_)) || (!(this._jr)))))) && (((_0H_B_.obj_.props_.enemyOccupySquare_) || (((!(this._ko._wN_)) && (_0H_B_.obj_.props_.occupySquare_))))))) {
            if (this._0H_n) {
                map_.gs_.gsc_.otherHit(_arg1, this.bulletId_, this.ownerId_, _0H_B_.obj_.objectId_);
            } else {
                _local5 = _7t._tD_(this.texture_);
                map_.addObj(new HitEffect(_local5, 100, 3, this.angle_, this._ko.speed_), _local4.x, _local4.y);
            }
            return (false);
        }
        var _local6:GameObject = this._eA_(_local4.x, _local4.y);
        if (_local6 != null) {
            _local7 = false;
            if (this._0H_n) {
                _local7 = true;
            } else if (this.ownerId_ == map_.player_.objectId_) {
                _local7 = true;
            } else if (_local6 == map_.player_) {
                _local7 = true;
            }
            if (((_local7) && (!(map_.player_.isPaused())))) {
                _local8 = GameObject._C_f(this.damage_, _local6.defense_, this._ko._N_J_, _local6._9B_);
                _local9 = false;
                if (_local6.HP_ <= _local8) {
                    _local9 = true;
                    if (_local6.props_.isEnemy_) {
                        doneAction(map_.gs_, Tutorial._05O_);
                    }
                }
                if (_local6 == map_.player_) {
                    map_.gs_.gsc_.playerHit(this.bulletId_, this.ownerId_);
                    _local6.damage(this.containerType_, _local8, this._ko.effects_, false, this);
                } else {
                    if (_local6.props_.isEnemy_) {
                        map_.gs_.gsc_.enemyHit(_arg1, this.bulletId_, _local6.objectId_, _local9, _local8);
                        _local6.damage(this.containerType_, _local8, this._ko.effects_, _local9, this);
                    } else {
                        if (!this._ko._0C_c) {
                            map_.gs_.gsc_.otherHit(_arg1, this.bulletId_, this.ownerId_, _local6.objectId_);
                        }
                    }
                }
            }
            if (this._ko._0C_c) {
                this._08H_[_local6] = true;
            } else {
                return (false);
            }
        }
        return (true);
    }

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local6:uint;
        var _local7:uint;
        if (!Parameters._Q_w) {
            return;
        }
        var _local4:BitmapData = this.texture_;
        if (Parameters._Q_b != 0) {
            switch (Parameters._Q_b) {
                case 1:
                    _local6 = 16777100;
                    _local7 = 0xFFFFFF;
                    break;
                case 2:
                    _local6 = 16777100;
                    _local7 = 16777100;
                    break;
                case 3:
                    _local6 = 0xFF0000;
                    _local7 = 0xFF0000;
                    break;
                case 4:
                    _local6 = 0xFF;
                    _local7 = 0xFF;
                    break;
                case 5:
                    _local6 = 0xFFFFFF;
                    _local7 = 0xFFFFFF;
                    break;
                case 6:
                    _local6 = 0;
                    _local7 = 0;
                    break;
            }
            _local4 = TextureRedrawer.redraw(_local4, 120, true, _local6, _local7);
        }
        var _local5:Number = (((this.props_.rotation_ == 0)) ? 0 : (_arg3 / this.props_.rotation_));
        this._08V_.x = x_;
        this._08V_.y = y_;
        this._08V_.z = z_;
        this._ey.draw(_arg1, this._08V_, (((this.angle_ - _arg2.angleRad_) + this.props_._g_) + _local5), _arg2.wToS_, _arg2, _local4);
        if (this._ko._H_i) {
          if (!Parameters.data_["disableParticles"]) {
            map_.addObj(new _06s(100, this._ko.trailColor_, 600, 0.5, _04d._F_e(3), _04d._F_e(3)), x_, y_);
            map_.addObj(new _06s(100, this._ko.trailColor_, 600, 0.5, _04d._F_e(3), _04d._F_e(3)), x_, y_);
            map_.addObj(new _06s(100, this._ko.trailColor_, 600, 0.5, _04d._F_e(3), _04d._F_e(3)), x_, y_);
          }
        }
    }

    override public function drawShadow(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        if (!Parameters._Q_w) {
            return;
        }
        var _local4:Number = (this.props_._0_Z_ / 400);
        var _local5:Number = (30 * _local4);
        var _local6:Number = (15 * _local4);
        this._J_4.matrix.createGradientBox((_local5 * 2), (_local6 * 2), 0, (_bY_[0] - _local5), (_bY_[1] - _local6));
        _arg1.push(this._J_4);
        this._P_C_.data.length = 0;
        this._P_C_.data.push((_bY_[0] - _local5), (_bY_[1] - _local6), (_bY_[0] + _local5), (_bY_[1] - _local6), (_bY_[0] + _local5), (_bY_[1] + _local6), (_bY_[0] - _local5), (_bY_[1] + _local6));
        _arg1.push(this._P_C_);
        _arg1.push(GraphicHelper.END_FILL);
    }

    public function reset(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Number, _arg6:int):void {
        var _local8:Number;
        clear();
        this.containerType_ = _arg1;
        this.bulletType_ = _arg2;
        this.ownerId_ = _arg3;
        this.bulletId_ = _arg4;
        this.angle_ = Trig._V_r(_arg5);
        this.startTime_ = _arg6;
        objectId_ = _n1(this.ownerId_, this.bulletId_);
        z_ = 0.5;
        this._P_d = ObjectLibrary._020[this.containerType_];
        this._ko = this._P_d._I_e[_arg2];
        this.props_ = ObjectLibrary._W_x(this._ko.objectId_);
        _P_m = (this.props_._0_Z_ > 0);
        var _local7:_Z_H_ = ObjectLibrary._V_a[this.props_.type_];
        this.texture_ = _local7.getTexture(objectId_);
        this._0H_n = this._P_d.isEnemy_;
        this._jr = !(this._0H_n);
        this._P_B_ = this._P_d._rw;
        this._08H_ = ((this._ko._0C_c) ? new Dictionary() : null);
        if (this._ko.size_ >= 0) {
            _local8 = this._ko.size_;
        } else {
            _local8 = ObjectLibrary._P_N_(this.containerType_);
        }
        this._ey._H_9((8 * (_local8 / 100)));
        this.damage_ = 0;
    }

    public function _T_j(_arg1:int):void {
        this.damage_ = _arg1;
    }

    public function moveTo(_arg1:Number, _arg2:Number):Boolean {
        var _local3:Square = map_.getSquare(_arg1, _arg2);
        if (_local3 == null) {
            return (false);
        }
        x_ = _arg1;
        y_ = _arg2;
        _0H_B_ = _local3;
        return (true);
    }

    public function _eA_(_arg1:Number, _arg2:Number):GameObject {
        var _local5:GameObject;
        var _local6:Number;
        var _local7:Number;
        var _local8:Number;
        var _local3:Number = Number.MAX_VALUE;
        var _local4:GameObject;
        for each (_local5 in map_.goDict_) {
            if (!_local5._0C_4()) {
                if (!_local5._C_H_()) {
                    if ((this._jr && _local5.objectId_ != this.ownerId_ && ((_local5.pvp_ && _local5.props_._0E_4) || _local5.props_.isEnemy_)) || (this._0H_n && _local5.props_._0E_4)) {
                        if (!((_local5._aE_) || (_local5.isPaused()))) {
                            _local6 = (((_local5.x_ > _arg1)) ? (_local5.x_ - _arg1) : (_arg1 - _local5.x_));
                            _local7 = (((_local5.y_ > _arg2)) ? (_local5.y_ - _arg2) : (_arg2 - _local5.y_));
                            if (!(((_local6 > _local5.radius_)) || ((_local7 > _local5.radius_)))) {
                                if (!((this._ko._0C_c) && (!((this._08H_[_local5] == null))))) {
                                    if (_local5 == map_.player_ || _local5.props_._0E_4) {
                                        var _owner:GameObject = map_.goDict_[this.ownerId_];
                                        if (_owner is Player) {
                                            if (_owner != null) {
                                                if (_local5.canBeHitBy(_owner)) {
                                                    return (_local5);
                                                } else {
                                                    continue;
                                                }
                                            } else {
                                                return (_local5);
                                            }
                                        }
                                    }
                                    _local8 = Math.sqrt(((_local6 * _local6) + (_local7 * _local7)));
                                    if (_local8 < _local3) {
                                        _local3 = _local8;
                                        _local4 = _local5;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return (_local4);
    }

    private function _W_d(_arg1:int, _arg2:Point):void {
        var _local5:Number;
        var _local6:Number;
        var _local7:Number;
        var _local8:Number;
        var _local9:Number;
        var _local10:Number;
        var _local11:Number;
        var _local12:Number;
        var _local13:Number;
        var _local14:Number;
        _arg2.x = this._R_i;
        _arg2.y = this._J_Y_;
        var _local3:Number = (_arg1 * (this._ko.speed_ / 10000));
        var _local4:Number = ((((this.bulletId_ % 2)) == 0) ? 0 : Math.PI);
        if (this._ko._L_f) {
            _local5 = (6 * Math.PI);
            _local6 = (Math.PI / 64);
            _local7 = (this.angle_ + (_local6 * Math.sin((_local4 + ((_local5 * _arg1) / 1000)))));
            _arg2.x = (_arg2.x + (_local3 * Math.cos(_local7)));
            _arg2.y = (_arg2.y + (_local3 * Math.sin(_local7)));
        } else {
            if (this._ko._3Z_) {
                _local8 = (((_arg1 / this._ko.lifetime_) * 2) * Math.PI);
                _local9 = (Math.sin(_local8) * (((this.bulletId_ % 2)) ? 1 : -1));
                _local10 = (Math.sin((2 * _local8)) * ((((this.bulletId_ % 4)) < 2) ? 1 : -1));
                _local11 = Math.sin(this.angle_);
                _local12 = Math.cos(this.angle_);
                _arg2.x = (_arg2.x + (((_local9 * _local12) - (_local10 * _local11)) * this._ko._qP_));
                _arg2.y = (_arg2.y + (((_local9 * _local11) + (_local10 * _local12)) * this._ko._qP_));
            } else {
                if (this._ko._0L_a) {
                    _local13 = ((this._ko.lifetime_ * (this._ko.speed_ / 10000)) / 2);
                    if (_local3 > _local13) {
                        _local3 = (_local13 - (_local3 - _local13));
                    }
                }
                _arg2.x = (_arg2.x + (_local3 * Math.cos(this.angle_)));
                _arg2.y = (_arg2.y + (_local3 * Math.sin(this.angle_)));
                if (this._ko._D_2 != 0) {
                    _local14 = (this._ko._D_2 * Math.sin((_local4 + ((((_arg1 / this._ko.lifetime_) * this._ko._0F_t) * 2) * Math.PI))));
                    _arg2.x = (_arg2.x + (_local14 * Math.cos((this.angle_ + (Math.PI / 2)))));
                    _arg2.y = (_arg2.y + (_local14 * Math.sin((this.angle_ + (Math.PI / 2)))));
                }
            }
        }
    }

}
}//package com.company.assembleegameclient.objects

