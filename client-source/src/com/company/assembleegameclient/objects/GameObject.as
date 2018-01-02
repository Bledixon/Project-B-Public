// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GameObject

package com.company.assembleegameclient.objects {
import com.company.assembleegameclient.engine3d._B_5;
import com.company.assembleegameclient.engine3d._uZ_;
import com.company.assembleegameclient.map.Square;
import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.map._X_l;
import com.company.assembleegameclient.net.messages.data._Q_0;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.ConditionEffect;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.util._7t;
import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.util._lJ_;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;
import com.company.util.BitmapUtil;
import com.company.util.ConversionUtil;
import com.company.util.GraphicHelper;
import com.company.util.MoreColorUtil;
import com.company.util.PointUtil;
import com.company.util._G_;

import flash.display.BitmapData;
import flash.display.GradientType;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsGradientFill;
import flash.display.GraphicsPath;
import flash.display.IGraphicsData;
import flash.filters.ColorMatrixFilter;
import flash.filters.GlowFilter;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Vector3D;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

import _015._O_P_;

import _0K_m.ExplosionEffect;
import _0K_m.HitEffect;
import _0K_m._I_b;

import _0_P_.Animations;
import _0_P_._0F_7;


import _vf._5T_;

public class GameObject extends BasicObject {

    private static const _8p:Number = 1E-5;
    private static const _cI_:Number = -(_8p);
    protected static const _oj:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._0M_l);
    public static const _mD_:int = 300;

    public static function _C_f(_arg1:int, _arg2:int, _arg3:Boolean, _arg4:int):int {
        var _local5:int = _arg2;
        if (((_arg3) || (!(((_arg4 & ConditionEffect._if_) == 0))))) {
            _local5 = 0;
        } else {
            if ((_arg4 & ConditionEffect._3M_) != 0) {
                _local5 = (_local5 * 2);
            }
        }
        var _local6:int = ((_arg1 * 3) / 20);
        var _local7:int = Math.max(_local6, (_arg1 - _local5));
        if ((_arg4 & ConditionEffect._cV_) != 0) {
            _local7 = 0;
        }
        return (_local7);
    }

    public function GameObject(_arg1:XML) {
        var _local4:int;
        this.props_ = ObjectLibrary._w8;
        this._Z_M_ = new Point();
        this._52 = new Point();
        this.moveVec_ = new Vector3D();
        this.bitmapFill_ = new GraphicsBitmapFill(null, null, false, false);
        this.path_ = new GraphicsPath(GraphicHelper._H_2, null);
        this.vS_ = new Vector.<Number>();
        this._0C_q = new Vector.<Number>();
        this._01i = new Matrix();
        super();
        if (_arg1 == null) {
            return;
        }
        this.objectType_ = int(_arg1.@type);
        this.props_ = ObjectLibrary._020[this.objectType_];
        _P_m = (this.props_._0_Z_ > 0);
        var _local2:_Z_H_ = ObjectLibrary._V_a[this.objectType_];
        this.texture_ = _local2.texture_;
        this.mask_ = _local2.mask_;
        this._yN_ = _local2._yN_;
        this._07_ = _local2._07_;
        if (_local2._0L_G_ != null) {
            this.effect_ = _I_b._Y_B_(_local2._0L_G_, this);
        }
        if (this.texture_ != null) {
            this._dE_ = (this.texture_.height / 8);
        }
        if (_arg1.hasOwnProperty("Model")) {
            this._8J_ = _B_5._um(String(_arg1.Model));
        }
        var _local3:_0F_7 = ObjectLibrary._Q_z[this.objectType_];
        if (_local3 != null) {
            this._09e = new Animations(_local3);
        }
        z_ = this.props_.z_;
        this.flying_ = this.props_.flying_;
        if (_arg1.hasOwnProperty("MaxHitPoints")) {
            this.HP_ = (this.maxHP_ = int(_arg1.MaxHitPoints));
        }
        if (_arg1.hasOwnProperty("Defense")) {
            this.defense_ = int(_arg1.Defense);
        }
        if (_arg1.hasOwnProperty("SlotTypes")) {
            this._9A_ = ConversionUtil._04n(_arg1.SlotTypes);
            this.equipment_ = new Vector.<int>(this._9A_.length);
            this.equipData_ = new Vector.<Object>(this._9A_.length);
            _local4 = 0;
            while (_local4 < this.equipment_.length) {
                this.equipment_[_local4] = -1;
                this.equipData_[_local4] = null;
                _local4++;
            }
        }
        if (_arg1.hasOwnProperty("Tex1")) {
            this.tex1Id_ = int(_arg1.Tex1);
        }
        if (_arg1.hasOwnProperty("Tex2")) {
            this.tex2Id_ = int(_arg1.Tex2);
        }
        if (_arg1.hasOwnProperty("Skin")) {
            this.setSkin(int(_arg1.SkinId));
        }
        this.props_._M_N_();
    }
    public var props_:ObjectProperties;
    public var name_:String;
    public var radius_:Number = 0.5;
    public var _N_V_:Number = 0;
    public var flying_:Boolean = false;
    public var _M_r:Number = 0;
    public var _W_J_:int = 0;
    public var _yN_:_lJ_ = null;
    public var texture_:BitmapData = null;
    public var mask_:BitmapData = null;
    public var _07_:Vector.<_Z_H_> = null;
    public var _8J_:_uZ_ = null;
    public var effect_:_I_b = null;
    public var _09e:Animations = null;
    public var _aE_:Boolean = false;
    public var maxHP_:int = 200;
    public var HP_:int = 200;
    public var size_:int = 100;
    public var level_:int = -1;
    public var defense_:int = 0;
    public var _9A_:Vector.<int> = null;
    public var equipment_:Vector.<int> = null;
   /* public var backpack1:Vector.<int> = null;
    public var backpack2:Vector.<int> = null; */
    public var equipData_:Vector.<Object> = null;
    public var _9B_:uint = 0;
    public var _064:Boolean = false;
    public var objectType_:int;
    public var _0F_:int = 0;
    public var _07u:BitmapData = null;
    public var _B_t:_T_f = null;
    public var _O_l:int = -1;
    public var nameText_:SimpleText = null;
    public var _U_g:BitmapData = null;
    public var skinId_:int = -1;
    public var tempSkinId_:int = -1;
    public var pvp_:Boolean = false;
    public var team_:int = 0;
    protected var _tm:BitmapData = null;
    protected var _qm:Dictionary = null;
    protected var tex1Id_:int = 0;
    protected var tex2Id_:int = 0;
    protected var _S_9:int = 0;
    protected var _ad:int = -1;
    protected var _Z_M_:Point;
    protected var _52:Point;
    protected var moveVec_:Vector3D;
    protected var bitmapFill_:GraphicsBitmapFill;
    protected var path_:GraphicsPath;
    protected var vS_:Vector.<Number>;
    protected var _0C_q:Vector.<Number>;
    protected var _01i:Matrix;
    protected var _J_4:GraphicsGradientFill = null;
    protected var _P_C_:GraphicsPath = null;
    private var _og:uint = 1;
    private var _dE_:Number = 1;
    private var _0_r:GraphicsBitmapFill = null;
    private var _033:GraphicsPath = null;
    private var _bH_:Vector.<BitmapData> = null;
    private var _0G_X_:Vector.<GraphicsBitmapFill> = null;
    private var _V_L_:Vector.<GraphicsPath> = null;

    override public function dispose():void {
        var _local1:Object;
        var _local2:BitmapData;
        var _local3:Dictionary;
        var _local4:Object;
        var _local5:BitmapData;
        super.dispose();
        this.texture_ = null;
        if (this._tm != null) {
            this._tm.dispose();
            this._tm = null;
        }
        if (this._qm != null) {
            for each (_local1 in this._qm) {
                _local2 = (_local1 as BitmapData);
                if (_local2 != null) {
                    _local2.dispose();
                } else {
                    _local3 = (_local1 as Dictionary);
                    for each (_local4 in _local3) {
                        _local5 = (_local4 as BitmapData);
                        if (_local5 != null) {
                            _local5.dispose();
                        }
                    }
                }
            }
            this._qm = null;
        }
        if (this._8J_ != null) {
            this._8J_.dispose();
            this._8J_ = null;
        }
        this._9A_ = null;
        this.equipment_ = null;
        this.equipData_ = null;
        this.nameText_ = null;
        if (this._U_g != null) {
            this._U_g.dispose();
            this._U_g = null;
        }
        this._0_r = null;
        this._033 = null;
        this.bitmapFill_ = null;
        this.path_.commands = null;
        this.path_.data = null;
        this.vS_ = null;
        this._0C_q = null;
        this._01i = null;
        this._bH_ = null;
        this._0G_X_ = null;
        this._V_L_ = null;
        this._J_4 = null;
        if (this._P_C_ != null) {
            this._P_C_.commands = null;
            this._P_C_.data = null;
            this._P_C_ = null;
        }
    }

    override public function addTo(_arg1:_X_l, _arg2:Number, _arg3:Number):Boolean {
        map_ = _arg1;
        this._Z_M_.x = (this._52.x = _arg2);
        this._Z_M_.y = (this._52.y = _arg3);
        if (!this.moveTo(_arg2, _arg3)) {
            map_ = null;
            return (false);
        }
        if (this.effect_ != null) {
            map_.addObj(this.effect_, _arg2, _arg3);
        }
        return (true);
    }

    override public function removeFromMap():void {
        if (((this.props_.static_) && (!((_0H_B_ == null))))) {
            if (_0H_B_.obj_ == this) {
                _0H_B_.obj_ = null;
            }
            _0H_B_ = null;
        }
        if (this.effect_ != null) {
            map_.removeObj(this.effect_.objectId_);
        }
        super.removeFromMap();
        this.dispose();
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local4:int;
        var _local5:Number;
        var _local6:Number;
        var _local3:Boolean;
        if (!(((this.moveVec_.x == 0)) && ((this.moveVec_.y == 0)))) {
            if (this._ad < map_.gs_.gsc_.lastTickId_) {
                this.moveVec_.x = 0;
                this.moveVec_.y = 0;
                this.moveTo(this._52.x, this._52.y);
            } else {
                _local4 = (_arg1 - this._S_9);
                _local5 = (this._Z_M_.x + (_local4 * this.moveVec_.x));
                _local6 = (this._Z_M_.y + (_local4 * this.moveVec_.y));
                this.moveTo(_local5, _local6);
                _local3 = true;
            }
        }
        if (this.props_._G_R_ != null) {
            if (!_local3) {
                z_ = this.props_.z_;
                this.flying_ = this.props_.flying_;
            } else {
                z_ = this.props_._G_R_.z_;
                this.flying_ = this.props_._G_R_.flying_;
            }
        }
        return (true);
    }

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local4:BitmapData = this.getTexture(_arg2, _arg3);
        if (this.props_._Z_L_) {
            if (_0H_B_.faces_.length == 0) {
                return;
            }
            this.path_.data = _0H_B_.faces_[0].face_.vout_;
            this.bitmapFill_.bitmapData = _local4;
            _0H_B_.baseTexMatrix_.calculateTextureMatrix(this.path_.data);
            this.bitmapFill_.matrix = _0H_B_.baseTexMatrix_.tToS_;
            _arg1.push(this.bitmapFill_);
            _arg1.push(this.path_);
            _arg1.push(GraphicHelper.END_FILL);
            return;
        }
        if (this._8J_ != null) {
            this._8J_.draw(_arg1, _arg2, this.props_.color_, _local4);
            return;
        }
        var _local5:int = _local4.width;
        var _local6:int = _local4.height;
        var _local7:int = (_0H_B_.sink_ + this._0F_);
        if ((((_local7 > 0)) && (((this.flying_) || (((!((_0H_B_.obj_ == null))) && (_0H_B_.obj_.props_.protectFromSink_))))))) {
            _local7 = 0;
        }
        this.vS_.length = 0;
        this.vS_.push((_bY_[3] - (_local5 / 2)), ((_bY_[4] - _local6) + _local7), (_bY_[3] + (_local5 / 2)), ((_bY_[4] - _local6) + _local7), (_bY_[3] + (_local5 / 2)), _bY_[4], (_bY_[3] - (_local5 / 2)), _bY_[4]);
        this.path_.data = this.vS_;
        this.bitmapFill_.bitmapData = _local4;
        this._01i.identity();
        this._01i.translate(this.vS_[0], this.vS_[1]);
        this.bitmapFill_.matrix = this._01i;
        _arg1.push(this.bitmapFill_);
        _arg1.push(this.path_);
        _arg1.push(GraphicHelper.END_FILL);
        if (((((!(this.isPaused())) && (!(((this._9B_ & ConditionEffect._06j) == 0))))) && (!(Parameters._0F_o)))) {
            this._wz(_arg1, _arg2, _arg3);
        }
        if (((((this.props_._xg) && (!((this.name_ == null))))) && (!((this.name_.length == 0))))) {
            this._oL_(_arg1, _arg2);
        }
    }

    override public function drawShadow(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        if (this._J_4 == null) {
            this._J_4 = new GraphicsGradientFill(GradientType.RADIAL, [this.props_._G_c, this.props_._G_c], [0.5, 0], null, new Matrix());
            this._P_C_ = new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>());
        }
        var _local4:Number = (((this.size_ / 100) * (this.props_._0_Z_ / 100)) * this._dE_);
        var _local5:Number = (30 * _local4);
        var _local6:Number = (15 * _local4);
        this._J_4.matrix.createGradientBox((_local5 * 2), (_local6 * 2), 0, (_bY_[0] - _local5), (_bY_[1] - _local6));
        _arg1.push(this._J_4);
        this._P_C_.data.length = 0;
        this._P_C_.data.push((_bY_[0] - _local5), (_bY_[1] - _local6), (_bY_[0] + _local5), (_bY_[1] - _local6), (_bY_[0] + _local5), (_bY_[1] + _local6), (_bY_[0] - _local5), (_bY_[1] + _local6)); //unresolved function??
        _arg1.push(this._P_C_);
        _arg1.push(GraphicHelper.END_FILL);
    }

    public function setObjectId(_arg1:int):void {
        var _local2:_Z_H_;
        objectId_ = _arg1;
        if (this._07_ != null) {
            _local2 = this._07_[(objectId_ % this._07_.length)];
            this.texture_ = _local2.texture_;
            this.mask_ = _local2.mask_;
            this._yN_ = _local2._yN_;
        }
    }

    public function _5w(_arg1:int):void {
        var _local3:_Z_H_;
        var _local2:_Z_H_ = ObjectLibrary._V_a[this.objectType_];
        if (_arg1 == 0) {
            _local3 = _local2;
        } else {
            _local3 = _local2._0K_J_(_arg1);
            if (_local3 == null) {
                return;
            }
        }
        this.texture_ = _local3.texture_;
        this.mask_ = _local3.mask_;
        this._yN_ = _local3._yN_;
        if (this.effect_ != null) {
            map_.removeObj(this.effect_.objectId_);
            this.effect_ = null;
        }
        if (_local3._0L_G_ != null) {
            this.effect_ = _I_b._Y_B_(_local3._0L_G_, this);
            if (map_ != null) {
                map_.addObj(this.effect_, x_, y_);
            }
        }
    }

    public function setTex1(_arg1:int):void {
        if (_arg1 == this.tex1Id_) {
            return;
        }
        this.tex1Id_ = _arg1;
        this._qm = new Dictionary();
        this._tm = null;
    }

    public function setTex2(_arg1:int):void {
        if (_arg1 == this.tex2Id_) {
            return;
        }
        this.tex2Id_ = _arg1;
        this._qm = new Dictionary();
        this._tm = null;
    }

    public function setSkin(_arg1:int, preview:Boolean = false):void {
        if (_arg1 == this.skinId_ && !preview) return;
        if (!preview)
            this.skinId_ = _arg1;
        if (_arg1 == -1 || ObjectLibrary._V_a[_arg1] == null) {
            var _local2:_Z_H_ = ObjectLibrary._V_a[this.objectType_];
            this.texture_ = _local2.texture_;
            this.mask_ = _local2.mask_;
            this._yN_ = _local2._yN_;
            this._07_ = _local2._07_;
        } else {
            var _local2:_Z_H_ = ObjectLibrary._V_a[_arg1];
            this.texture_ = _local2.texture_;
            this.mask_ = _local2.mask_;
            this._yN_ = _local2._yN_;
            this._07_ = _local2._07_;
        }
    }

    public function previewSkin(_arg1:int):void {
        if (_arg1 == this.tempSkinId_) return;
        if (_arg1 == -1)
            this.setSkin(this.skinId_, true);
        else
            this.setSkin(_arg1, true);
        this.tempSkinId_ = _arg1;
    }

    public function _05M_(_arg1:int):void {
        _5T_.play(this.props_._6x[_arg1]);
    }

    public function _L_S_():Boolean {
        return (!(((this._9B_ & ConditionEffect._I_T_) == 0)));
    }

    public function _hQ_():Boolean {
        return (!(((this._9B_ & ConditionEffect._0F_g) == 0)));
    }

    public function _051():Boolean {
        return (!(((this._9B_ & ConditionEffect._sm) == 0)));
    }

    public function _014():Boolean {
        return (!(((this._9B_ & ConditionEffect._q_) == 0)));
    }

    public function _0I_0():Boolean {
        return (!(((this._9B_ & ConditionEffect._02V_) == 0)));
    }

    public function _0I_e():Boolean {
        return (!(((this._9B_ & ConditionEffect._0G_k) == 0)));
    }

    public function _rL_():Boolean {
        return (!(((this._9B_ & ConditionEffect._E_t) == 0)));
    }

    public function _N_b():Boolean {
        return (!(((this._9B_ & ConditionEffect._0E_l) == 0)));
    }

    public function _N_c():Boolean {
    return (!(((this._9B_ & ConditionEffect._0E_2) == 0)));
    }

    public function _8a():Boolean {
        return (!(((this._9B_ & ConditionEffect._pE_) == 0)));
    }

    public function _z1():Boolean {
        return (!(((this._9B_ & ConditionEffect._tY_) == 0)));
    }

    public function _di():Boolean {
        return (!(((this._9B_ & ConditionEffect._X_9) == 0)));
    }

    public function _R_7():Boolean {
        return (!(((this._9B_ & ConditionEffect._O_3) == 0)));
    }

    public function _N_4():Boolean {
        return (!(((this._9B_ & ConditionEffect._c_) == 0)));
    }

    public function _G_D_():Boolean {
        return (!(((this._9B_ & ConditionEffect._N_6) == 0)));
    }

    public function _00c():Boolean {
        return (!(((this._9B_ & ConditionEffect._4_) == 0)));
    }

    public function _07I_():Boolean {
        return (!(((this._9B_ & ConditionEffect._00L_) == 0)));
    }

    public function _L_8():Boolean {
        return (!(((this._9B_ & ConditionEffect._X_D_) == 0)));
    }

    public function isPaused():Boolean {
        return (!(((this._9B_ & ConditionEffect._Z_i) == 0)));
    }

    public function _C_H_():Boolean {
        return (!(((this._9B_ & ConditionEffect._O_Y_) == 0)));
    }

    public function _0C_4():Boolean {
        return (!(((this._9B_ & ConditionEffect._0K__) == 0)));
    }

    public function _c8():Boolean {
        return (!(((this._9B_ & ConditionEffect._cV_) == 0)));
    }

    public function _E_T_():Boolean {
        return (!(((this._9B_ & ConditionEffect._3M_) == 0)));
    }

    public function _093():Boolean {
        return (!(((this._9B_ & ConditionEffect._if_) == 0)));
    }

    public function _0I_b():Boolean {
        var _local1:GameObject;
        var _local2:int;
        var _local3:int;
        for each (_local1 in map_.goDict_) {
            if (!(_local1 is Player)) {
                if ((_local1 is Character)) {
                    _local2 = (((x_ > _local1.x_)) ? (x_ - _local1.x_) : (_local1.x_ - x_));
                    _local3 = (((y_ > _local1.y_)) ? (y_ - _local1.y_) : (_local1.y_ - y_));
                    if ((((_local2 < 20)) && ((_local3 < 20)))) {
                        return (false);
                    }
                }
            }
        }
        return (true);
    }
    public function canBeHitBy(_arg1:GameObject) {
        return (this.pvp_ && _arg1.pvp_ && (this.team_ == 0 || this.team_ != _arg1.team_));
    }
    public function _include():String {
        return ((((((this.name_ == null)) || ((this.name_ == "")))) ? ObjectLibrary._0D_N_[this.objectType_] : this.name_));
    }

    public function getColor():uint {
        return (BitmapUtil._B_n(this.texture_));
    }

    public function _true():uint {
        var _local1:uint = this._og;
        this._og = ((this._og + 1) % 128);
        return (_local1);
    }

    public function _F_Y_(_arg1:_Q_0):Number {
        var _local2:Number = (_arg1.x_ - x_);
        var _local3:Number = (_arg1.y_ - y_);
        return (Math.sqrt(((_local2 * _local2) + (_local3 * _local3))));
    }

    public function moveTo(_arg1:Number, _arg2:Number):Boolean {
        var _local3:Square = map_.getSquare(_arg1, _arg2);
        if (_local3 == null) {
            return (false);
        }
        x_ = _arg1;
        y_ = _arg2;
        if (this.props_.static_) {
            if (_0H_B_ != null) {
                _0H_B_.obj_ = null;
            }
            _local3.obj_ = this;
        }
        _0H_B_ = _local3;
        if (this._8J_ != null) {
            this._8J_.setPosition(x_, y_, 0, this.props_.rotation_);
        }
        return (true);
    }

    public function _gk(_arg1:Number, _arg2:Number, _arg3:int):void {
        this.moveTo(_arg1, _arg2);
        this._S_9 = _arg3;
        this._52.x = _arg1;
        this._52.y = _arg2;
        this._Z_M_.x = _arg1;
        this._Z_M_.y = _arg2;
        this.moveVec_.x = 0;
        this.moveVec_.y = 0;
    }

    public function _0I_u(_arg1:Number, _arg2:Number, _arg3:int, _arg4:int):void {
        if (this._ad < map_.gs_.gsc_.lastTickId_) {
            this.moveTo(this._52.x, this._52.y);
        }
        this._S_9 = map_.gs_.lastUpdate_;
        this._52.x = _arg1;
        this._52.y = _arg2;
        this._Z_M_.x = x_;
        this._Z_M_.y = y_;
        this.moveVec_.x = ((this._52.x - this._Z_M_.x) / _arg3);
        this.moveVec_.y = ((this._52.y - this._Z_M_.y) / _arg3);
        this._ad = _arg4;
    }

    public function damage(_arg1:int, _arg2:int, _arg3:Vector.<uint>, _arg4:Boolean, _arg5:Projectile):void {
        var _local7:int;
        var _local8:uint;
        var _local9:ConditionEffect;
        var _local10:Boolean;
        if (_arg4) {
            this._aE_ = true;
        } else {
            if (_arg3 != null) {
                _local7 = 0;
                for each (_local8 in _arg3) {
                    _local9 = null;
                    switch (_local8) {
                        case ConditionEffect._0I_2:
                            break;
                        case ConditionEffect._xc:
                        case ConditionEffect._V_H_:
                        case ConditionEffect._0D_Z_:
                        case ConditionEffect._vJ_:
                        case ConditionEffect._030:
                        case ConditionEffect._2p:
                        case ConditionEffect._01n:
                        case ConditionEffect._02w:
                        case ConditionEffect._o9:
                        case ConditionEffect._xn:
                        case ConditionEffect._vH_:
                        case ConditionEffect._T_q:
                        case ConditionEffect._K_J_:
                        case ConditionEffect._iM_:
                        case ConditionEffect._l0:
                        case ConditionEffect._Z_A_:
                        case ConditionEffect._qn:
                        case ConditionEffect._03w:
                            _local9 = ConditionEffect.effects_[_local8];
                            break;
                        case ConditionEffect._V_Z_:
                            if (this._z1()) {
                                map_.mapOverlay_.addChild(new _O_P_(this, "Immune", 0xFF0000, 3000));
                            } else {
                                _local9 = ConditionEffect.effects_[_local8];
                            }
                            break;
                    }
                    if (_local9 != null) {
                        if ((this._9B_ | _local9.bit_) != this._9B_) {
                            this._9B_ = (this._9B_ | _local9.bit_);
                            map_.mapOverlay_.addChild(new _O_P_(this, _local9.name_, 0xFF0000, 3000, _local7));
                            _local7 = (_local7 + 500);
                        }
                    }
                }
            }
        }
        var _local6:Vector.<uint> = _7t._8W_(this.objectType_, this.texture_, this.props_._U_Q_, this.props_._U_C_);
        if (this._aE_) {
            map_.addObj(new ExplosionEffect(_local6, this.size_, 30), x_, y_);
        } else {
            if (_arg5 != null) {
                map_.addObj(new HitEffect(_local6, this.size_, 10, _arg5.angle_, _arg5._ko.speed_), x_, y_);
            } else {
                map_.addObj(new ExplosionEffect(_local6, this.size_, 10), x_, y_);
            }
        }
        if (_arg5 != null && this.pvp_ && map_.player_ == this)
            if (map_.goDict_[_arg5.ownerId_] is Player) {
                _arg2 = Math.max(1, _arg2 / 5);
            }
        _local10 = this._093() || (_arg5 != null && _arg5._ko._N_J_);
        if (_arg2 > 0) {
          if (!Parameters.data_["disableDamageText"]) {
            map_.mapOverlay_.addChild(new _O_P_(this, ("-" + (Parameters.data_["damageInfo"] ? (_arg2 + " [" + HP_ + "]") : _arg2)), ((_local10) ? 0x9000FF : 0xFF0000), 1000));
          }
        }
        if (map_.player_ == this && _arg5 != null) {
            map_.gs_.gsc_.sendVisibullet(_arg5.damage_, _arg5.ownerId_, _arg5.bulletId_, _local10);
        }
    }

    public function _oL_(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v):void {
        if (this._U_g == null) {
            this.nameText_ = this._T_L_(this.name_);
            this._U_g = this.generateNameBitmapData(this.nameText_);
            this._0_r = new GraphicsBitmapFill(null, new Matrix(), false, false);
            this._033 = new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>());
        }
        var _local3:int = ((this._U_g.width / 2) + 1);
        var _local4:int = 30;
        var _local5:Vector.<Number> = this._033.data;
        _local5.length = 0;
        _local5.push((_bY_[0] - _local3), _bY_[1], (_bY_[0] + _local3), _bY_[1], (_bY_[0] + _local3), (_bY_[1] + _local4), (_bY_[0] - _local3), (_bY_[1] + _local4));
        this._0_r.bitmapData = this._U_g;
        var _local6:Matrix = this._0_r.matrix;
        _local6.identity();
        _local6.translate(_local5[0], _local5[1]);
        _arg1.push(this._0_r);
        _arg1.push(this._033);
        _arg1.push(GraphicHelper.END_FILL);
    }

    public function _I_a(_arg1:String, _arg2:int):void {
        this.texture_ = AssetLibrary._xK_(_arg1, _arg2);
        this._dE_ = (this.texture_.height / 8);
    }

    public function getPortrait():BitmapData {
        var _local1:BitmapData;
        var _local2:int;
        if (this._tm == null) {
            _local1 = (this.props_._tm != null) ? this.props_._tm.getTexture() : this.texture_;
            _local2 = (4 / _local1.width) * 100;
            this._tm = TextureRedrawer.resize(_local1, this.mask_, _local2, true, this.tex1Id_, this.tex2Id_);
            this._tm = TextureRedrawer.outlineGlow(this._tm, 0, 0);
        }
        return (this._tm);
    }

    public function setAttack(_arg1:int, _arg2:Number):void {
        this._M_r = _arg2;
        this._W_J_ = getTimer();
    }

    public function _wz(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local9:BitmapData;
        var _local10:GraphicsBitmapFill;
        var _local11:GraphicsPath;
        var _local12:Number;
        var _local13:Number;
        var _local14:Matrix;
        if (this._bH_ == null) {
            this._bH_ = new Vector.<BitmapData>();
            this._0G_X_ = new Vector.<GraphicsBitmapFill>();
            this._V_L_ = new Vector.<GraphicsPath>();
        }
        this._bH_.length = 0;
        var _local4:int = (_arg3 / 500);
        ConditionEffect._a4(this._9B_, this._bH_, _local4);
        var _local5:Number = _bY_[3];
        var _local6:Number = this.vS_[1];
        var _local7:int = this._bH_.length;
        var _local8:int;
        while (_local8 < _local7) {
            _local9 = this._bH_[_local8];
            if (_local8 >= this._0G_X_.length) {
                this._0G_X_.push(new GraphicsBitmapFill(null, new Matrix(), false, false));
                this._V_L_.push(new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>()));
            }
            _local10 = this._0G_X_[_local8];
            _local11 = this._V_L_[_local8];
            _local10.bitmapData = _local9;
            _local12 = ((_local5 - ((_local9.width * _local7) / 2)) + (_local8 * _local9.width));
            _local13 = (_local6 - (_local9.height / 2));
            _local11.data.length = 0;
            _local11.data.push(_local12, _local13, (_local12 + _local9.width), _local13, (_local12 + _local9.width), (_local13 + _local9.height), _local12, (_local13 + _local9.height));
            _local14 = _local10.matrix;
            _local14.identity();
            _local14.translate(_local12, _local13);
            _arg1.push(_local10);
            _arg1.push(_local11);
            _arg1.push(GraphicHelper.END_FILL);
            _local8++;
        }
    }

    public function toString():String {
        return ("[" + getQualifiedClassName(this) + " id: " + objectId_ + " type: " + ObjectLibrary._0D_N_[this.objectType_] + " pos: " + x_ + ", " + y_ + "]");
    }

    protected function _T_L_(_arg1:String):SimpleText {
        var _local2:SimpleText = new SimpleText(16, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        _local2.setBold(true);
        _local2.text = _arg1;
        _local2.updateMetrics();
        return (_local2);
    }

    protected function generateNameBitmapData(_arg1:SimpleText):BitmapData {
        var _local2:BitmapData = new BitmapData(_arg1.width, 64, true, 0);
        _local2.draw(_arg1, null);
        _local2.applyFilter(_local2, _local2.rect, PointUtil._P_5, new GlowFilter(0, 1, 3, 3, 2, 1));
        return (_local2);
    }

    protected function _1g():BitmapData {
        if (this._07u == null) {
            this._07u = AssetLibrary._xK_("lofiChar8x8", int((Math.random() * 239)));
        }
        return (this._07u);
    }

    protected function getTexture(_arg1:_0D_v, _arg2:int):BitmapData {
        var _local6:Number;
        var _local7:int;
        var _local8:_J_H_;
        var _local9:int;
        var _local10:BitmapData;
        var _local11:int;
        var _local12:BitmapData;
        var _local3:BitmapData = this.texture_;
        var _local4:int = this.size_;
        var _local5:BitmapData;
        if (this._yN_ != null) {
            _local6 = 0;
            _local7 = _lJ_._sS_;
            if (_arg2 < (this._W_J_ + _mD_)) {
                if (!this.props_._D_9) {
                    this._N_V_ = this._M_r;
                }
                _local6 = (((_arg2 - this._W_J_) % _mD_) / _mD_);
                _local7 = _lJ_._E_w;
            } else {
                if (((!((this.moveVec_.x == 0))) || (!((this.moveVec_.y == 0))))) {
                    _local9 = (0.5 / this.moveVec_.length);
                    _local9 = (_local9 + (400 - (_local9 % 400)));
                    if ((((((((this.moveVec_.x > _8p)) || ((this.moveVec_.x < _cI_)))) || ((this.moveVec_.y > _8p)))) || ((this.moveVec_.y < _cI_)))) {
                        this._N_V_ = Math.atan2(this.moveVec_.y, this.moveVec_.x);
                        _local7 = _lJ_._m1;
                    } else {
                        _local7 = _lJ_._sS_;
                    }
                    _local6 = ((_arg2 % _local9) / _local9);
                }
            }
            _local8 = this._yN_.imageFromFacing(this._N_V_, _arg1, _local7, _local6);
            _local3 = _local8.image_;
            _local5 = _local8.mask_;
        } else {
            if (this._09e != null) {
                _local10 = this._09e.getTexture(_arg2);
                if (_local10 != null) {
                    _local3 = _local10;
                }
            }
        }
        if (((this.props_._Z_L_) || (!((this._8J_ == null))))) {
            return (_local3);
        }
        if (_arg1._kN_) {
            _local11 = (((_local3 == null)) ? 8 : _local3.width);
            _local3 = this._1g();
            _local5 = null;
            _local4 = (this.size_ * Math.min(1.5, (_local11 / _local3.width)));
        }
        if (this._C_H_()) {
            _local3 = _G_._R_9(_local3, _oj);
        }
        if (this._B_t != null) {
            if (!this._B_t._jQ_(_arg2)) {
                _local3 = this._B_t.apply(_local3, _arg2);
            } else {
                this._B_t = null;
            }
        }
        if ((((this.tex1Id_ == 0)) && ((this.tex2Id_ == 0)))) {
            _local3 = TextureRedrawer.redraw(_local3, _local4, false, 0, 0);
        } else {
            _local12 = null;
            if (this._qm == null) {
                this._qm = new Dictionary();
            } else {
                _local12 = this._qm[_local3];
            }
            if (_local12 == null) {
                _local12 = TextureRedrawer.resize(_local3, _local5, _local4, false, this.tex1Id_, this.tex2Id_);
                _local12 = TextureRedrawer.outlineGlow(_local12, 0, 0);
                this._qm[_local3] = _local12;
            }
            _local3 = _local12;
        }
        return (_local3);
    }

}
}//package com.company.assembleegameclient.objects

