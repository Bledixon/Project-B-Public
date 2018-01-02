// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.Player

package com.company.assembleegameclient.objects {
import _015._O_P_;

import _0K_m.LevelUpEffect;
import _0K_m._0H_T_;
import _0K_m._4m;
    import _0K_m._D_J_;
    import _0K_m._I_b;

    import _qN_.Account;


import _vf._5T_;

import com.company.assembleegameclient.appengine.Server_list;

import com.company.assembleegameclient.map.Square;
import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.tutorial.Tutorial;
import com.company.assembleegameclient.tutorial.doneAction;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.util.ConditionEffect;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.util._Z_B_;
import com.company.assembleegameclient.util._lJ_;
import com.company.assembleegameclient.util._wW_;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;
import com.company.util.ConversionUtil;
import com.company.util.GraphicHelper;
import com.company.util.IntPoint;
import com.company.util.MoreColorUtil;
import com.company.util.PointUtil;
import com.company.util.Trig;
import com.company.util._G_;

import flash.display.BitmapData;
import flash.display.GraphicsPath;
import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;
import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.filters.GlowFilter;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.utils.Dictionary;
import flash.utils.getTimer;

    import zerorealms.rotmg.assets._items;

    public class Player extends Character {

    public static const _0G_S_:int = 10000;

    public static var _atk;
    public static var _def;
    public static var _spd;
    public static var _dex;
    public static var _vit;
    public static var _wis;

    public static var _mindmg;
    public static var _maxdmg;

    public var _x_:int = 75;

    public static var _e_D:Boolean = false;
    private static const _A_u:Vector.<Point> = new <Point>[new Point(0, 0), new Point(1, 0), new Point(0, 1), new Point(1, 1)];
    private static const _Q_a:Number = 0.4;
    private static const _I_5:Matrix = new Matrix(1, 0, 0, 1, 2, 4);
    private static const _0G_b:Matrix = new Matrix(1, 0, 0, 1, 20, 0);
    private static const _dK_:Number = 0.004;
    private static const _T_v:Number = 0.0096;
    private static const _lU_:Number = 0.0015;
    private static const _Z_:Number = 0.008;
    private static const _01b:Number = 0.5;
    private static const _0J_Q_:Number = 2;

    private static var _06g:Point = new Point();

    public static function _D_U_(_arg1:String, _arg2:XML):Player {
        var _local3:int = int(_arg2.ObjectType);
        var _local4:XML = ObjectLibrary._Q_F_[_local3];
        var _local5:Player = new Player(_local4);
        _local5.name_ = _arg1;
        _local5.level_ = int(_arg2.Level);
        _local5.exp_ = int(_arg2.Exp);
        _local5.equipment_ = ConversionUtil._04n(_arg2._Equipment);
        _local5.maxHP_ = int(_arg2.MaxHitPoints);
        _local5.HP_ = int(_arg2.HitPoints);
        _local5.maxMP_ = int(_arg2.MaxMagicPoints);
        _local5.MP_ = int(_arg2.MagicPoints);
        _local5.attack_ = int(_arg2.Attack);
        _local5.defense_ = int(_arg2.Defense);
        _local5.speed_ = int(_arg2.Speed);
        _local5.dexterity_ = int(_arg2.Dexterity);
        _local5.vitality_ = int(_arg2.HpRegen);
        _local5.wisdom_ = int(_arg2.MpRegen);
        _local5.luck_ = int(_arg2.Luck);
        _local5.crit_ = int(_arg2.Crit);
        _local5.tex1Id_ = int(_arg2.Tex1);
        _local5.tex2Id_ = int(_arg2.Tex2);
        _local5.setSkin(int(_arg2.Skin));
        return (_local5);
    }

    private static function _091(_arg1:Number, _arg2:_0D_v):int {
        var _local4:int;
        var _local3:Number = Trig._V_r((_arg1 - _arg2.angleRad_));
        if ((((_local3 > (Math.PI / 4))) && ((_local3 < ((3 * Math.PI) / 4))))) {
            _local4 = _lJ_.DOWN;
        } else {
            if ((((_local3 <= (Math.PI / 4))) && ((_local3 >= (-(Math.PI) / 4))))) {
                _local4 = _lJ_.RIGHT;
            } else {
                if ((((_local3 < (-(Math.PI) / 4))) && ((_local3 > ((-3 * Math.PI) / 4))))) {
                    _local4 = _lJ_.UP;
                } else {
                    _local4 = _lJ_.LEFT;
                }
            }
        }
        return (_local4);
    }

    public function Player(_arg1:XML) {
        this._06x = new IntPoint();
        super(_arg1);
        this._X_2 = int(_arg1.Attack.@max);
        this._0B_S_ = int(_arg1.Defense.@max);
        this._b8 = int(_arg1.Speed.@max);
        this._07C_ = int(_arg1.Dexterity.@max);
        this._N_s = int(_arg1.HpRegen.@max);
        this._05Q_ = int(_arg1.MpRegen.@max);
        this.stat_luckI = int(_arg1.Luck.@max);
        this.stat_critI = int(_arg1.Crit.@max);
        this._uR_ = int(_arg1.MaxHitPoints.@max);
        this._dt = int(_arg1.MaxMagicPoints.@max);
        _qm = new Dictionary();
        unusualEffects_ = new Vector.<_I_b>();
    }
    public var accountId_:int = -1;
    public var credits_:int = 0;
    public var numStars_:int = 0;
    public var fame_:int = 0;
    public var keys_:int = 0;
    public var _hv:Boolean = false;
    public var _Hh:Boolean = false;
    public var _0L_o:int = 0;
    public var _n8:int = -1;
    public var _2v:int = -1;
    public var guildName_:String = null;
    public var guildRank_:int = -1;
    public var partyID_:int = -1;
    public var partyLeader:Boolean = false;
    public var _N_n:Boolean = false;
    public var inParty:Boolean = false;
    public var _R_4:int = -1;
    public var maxMP_:int = 200;
    public var MP_:Number = 0;
    public var _7V_:int = 1000;
    public var exp_:int = 0;
    public var attack_:int = 0;
    public var speed_:int = 0;
    public var dexterity_:int = 0;
    public var vitality_:int = 0;
    public var wisdom_:int = 0;
    public var _P_7:int = 0;
    public var _0D_G_:int = 0;
    public var _05s:int = 0;
    public var _07f:int = 0;
    public var _065:int = 0;
    public var _pP_:int = 0;
    public var _B_e:int = 0;
      public var luck_:int = 0;
      public var crit_:int = 0;
      public var stat_luck:int = 0;
      public var stat_crit:int = 0;
      public var stat_luckI:int = 0;
      public var stat_critI:int = 0;
    public var _cu:int = 0;
    public var _gz:int = 0;
    public var _X_2:int = 0;
    public var _0B_S_:int = 0;
    public var _b8:int = 0;
    public var _07C_:int = 0;
    public var _N_s:int = 0;
    public var _05Q_:int = 0;
    public var _uR_:int = 0;
    public var _dt:int = 0;
    public var starred_:Boolean = false;
    public var _0M_w:Boolean = false;
    public var distSqFromThisPlayer_:Number = 0;
    public var _y4:int = 0;
    public var _0m:int = 0;
    public var nextTeleportAt_:int = 0;
    public var inventory:Inventory;
    public var _K_X_:BitmapData = null;
    public var usiShukAbil:Boolean = false;
    public var canNexus:Boolean = true;
    protected var _ky:Number = 0;
    protected var _D_k:Point = null;
    protected var _W_V_:Number = 1;
    protected var _nE_:_4m = null;
    protected var _0D_8:Merchant = null;
    private var _sd:BitmapData = null;
    private var _7U_:Boolean = true;
    private var _06x:IntPoint;
    private var _F_k:GraphicsSolidFill = null;
    private var _03i:GraphicsPath = null;
    private var _Y_e:GraphicsSolidFill = null;
    private var _K_Y_:GraphicsPath = null;
    private var prevEffect_:String = "";
    private var effString_:String = "";
    private var unusualEffects_:Vector.<_I_b> = null;

    override public function moveTo(_arg1:Number, _arg2:Number):Boolean {
        var _local3:Boolean = super.moveTo(_arg1, _arg2);
        this._0D_8 = this._0I_U_();
        return (_local3);
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Number;
        var _local4:Number;
        var _local5:Number;
        var _local6:int;
        if(prevEffect_ != effString_) {
            prevEffect_ = effString_;
            for each(var _effect:_I_b in unusualEffects_) {
                map_.removeObj(_effect.objectId_);
            }
            this.unusualEffects_ = new Vector.<_I_b>();
            var _effXML:XML = XML(this.effString_);
            if(_effXML.name() == "Effects") {
                for each(var _childEff:XML in _effXML.children()) {
                    var _newEff:_I_b = _I_b._Y_B_(new _D_J_(_childEff), this);
                    if(_newEff != null) {
                        this.unusualEffects_.push(_newEff);
                    }
                }
            } else {
                var _newEff:_I_b = _I_b._Y_B_(new _D_J_(XML(this.effString_)), this);
                if(_newEff != null) {
                    this.unusualEffects_.push(_newEff);
                }
            }
            for each(var _effect:_I_b in unusualEffects_) {
                map_.addObj(_effect, x_, y_);
            }
        }
        if (((_00c()) && (!(isPaused())))) {
            if (this._nE_ == null) {
                this._nE_ = new _4m(this);
                map_.addObj(this._nE_, x_, y_);
            }
        } else {
            if (this._nE_ != null) {
                map_.removeObj(this._nE_.objectId_);
                this._nE_ = null;
            }
        }
        if ((((map_.player_ == this)) && (isPaused()))) {
            return (true);
        }
        if (this._D_k != null) {
            _local3 = Parameters.data_.cameraAngle;
            if (this._ky != 0) {
                _local3 = (_local3 + ((_arg2 * Parameters.data_.rotationSpeed) * this._ky));
                Parameters.data_.cameraAngle = _local3;
            }
            if (((!((this._D_k.x == 0))) || (!((this._D_k.y == 0))))) {
                _local4 = this._J_N_();
                _local5 = Math.atan2(this._D_k.y, this._D_k.x);
                moveVec_.x = (_local4 * Math.cos((_local3 + _local5)));
                moveVec_.y = (_local4 * Math.sin((_local3 + _local5)));
            } else {
                moveVec_.x = 0;
                moveVec_.y = 0;
            }
            if (((!((_0H_B_ == null))) && (_0H_B_.props_.push_))) {
                moveVec_.x = (moveVec_.x - (_0H_B_.props_.animate_.dx_ / 1000));
                moveVec_.y = (moveVec_.y - (_0H_B_.props_.animate_.dy_ / 1000));
            }
            this._2((x_ + (_arg2 * moveVec_.x)), (y_ + (_arg2 * moveVec_.y)));
        } else {
            if (!super.update(_arg1, _arg2)) {
                return (false);
            }
        }
        if ((((((((((map_.player_ == this)) && ((_0H_B_.props_.maxDamage_ > 0)))) && (((_0H_B_.lastDamage_ + 500) < _arg1)))) && (!(_0C_4())))) && ((((_0H_B_.obj_ == null)) || (!(_0H_B_.obj_.props_.protectFromGroundDamage_)))))) {
            _local6 = map_.gs_.gsc_.getNextDamage(_0H_B_.props_.minDamage_, _0H_B_.props_.maxDamage_);
            damage(-1, _local6, null, (HP_ <= _local6), null);
            map_.gs_.gsc_.groundDamage(_arg1, x_, y_);
            _0H_B_.lastDamage_ = _arg1;
        }
        return (true);
    }

    public function setEffect(_arg1:String) {
        this.effString_ = _arg1;
    }

    override protected function generateNameBitmapData(_arg1:SimpleText):BitmapData {
        if (this.inParty) {
            _arg1.setColor(Parameters.partyColor);
        } else if (this._N_n) {
            _arg1.setColor(Parameters._mg);
        } else if (this.name_ == "$Bledixon$") {
            _arg1.setColor(Parameters._colorBled);
        } else if (this.name_ == "Quest") {
            _arg1.setColor(Parameters._colorArc);
        } else if (this.name_ == "Antidote") {
            _arg1.setColor(Parameters._colorSec);
        } else if (this.name_ == "Crisp") {
            _arg1.setColor(Parameters._colorSec);
        } else if (this._hv) {
            _arg1.setColor(Parameters._8T_);
        }
        var _local2:BitmapData = new BitmapData((_arg1.width + 20), 64, true, 0);
        _local2.draw(_arg1, _0G_b);
        _local2.applyFilter(_local2, _local2.rect, PointUtil._P_5, new GlowFilter(0, 1, 3, 3, 2, 1));
        var _local3:Sprite = _Z_B_._0M_r(this.numStars_);
        _local2.draw(_local3, _I_5);
        return (_local2);
    }

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        if(Parameters.data_.HideOtherPlayers) {
          if(this != map_.player_) {
            return;
          }
        }
        super.draw(_arg1, _arg2, _arg3);
        if (this != map_.player_) {
            if (!Parameters._0F_o) {
                if (this != this.map_.player_ && this.map_.player_.canBeHitBy(this)) {
                    if (!this._di()) {
                        _oL_(_arg1, _arg2);
                    }
                } else {
                    _oL_(_arg1, _arg2);
                }
            }
        } else {
            if (this._R_4 >= 0) {
                this._071(_arg1, _arg2, _arg3);
            }
        }
    }

    override protected function getTexture(_arg1:_0D_v, _arg2:int):BitmapData {
        var _local10:int;
        var _local11:Dictionary;
        var _local12:Number;
        var _local13:int;
        var _local14:ColorTransform;
        var _local3:Number = 0;
        var _local4:int = _lJ_._sS_;
        if (_arg2 < (_W_J_ + this._y4)) {
            _N_V_ = _M_r;
            _local3 = (((_arg2 - _W_J_) % this._y4) / this._y4);
            _local4 = _lJ_._E_w;
        } else {
            if (((!((moveVec_.x == 0))) || (!((moveVec_.y == 0))))) {
                _local10 = (3.5 / this._J_N_());
                if (((!((moveVec_.y == 0))) || (!((moveVec_.x == 0))))) {
                    _N_V_ = Math.atan2(moveVec_.y, moveVec_.x);
                }
                _local3 = ((_arg2 % _local10) / _local10);
                _local4 = _lJ_._m1;
            }
        }
        if (((this._o4()) && (this._7U_))) {
            this._Q_K_();
        }
        if (((!(this._o4())) && (!(this._7U_)))) {
            this._ur();
        }
        var _local5:_J_H_ = _yN_.imageFromFacing(_N_V_, _arg1, _local4, _local3);
        if (_arg1._kN_) {
            _local5 = new _J_H_(_1g(), null);
        }
        var _local6:int = tex1Id_;
        var _local7:int = tex2Id_;
        var _local8:BitmapData;
        if (this._0D_8 != null) {
            _local11 = _qm[this._0D_8];
            if (_local11 == null) {
                _qm[this._0D_8] = new Dictionary();
            } else {
                _local8 = _local11[_local5];
            }
            _local6 = this._0D_8.getTex1Id(tex1Id_);
            _local7 = this._0D_8.getTex2Id(tex2Id_);
            this.previewSkin(this._0D_8.getSkinId(skinId_, this));
        } else {
            _local8 = _qm[_local5];
            this.previewSkin(-1);
        }
        if (_local8 == null) {
            _local8 = TextureRedrawer.resize(_local5.image_, _local5.mask_, size_, false, _local6, _local7);
            if (this._0D_8 != null) {
                _qm[this._0D_8][_local5] = _local8;
            } else {
                _qm[_local5] = _local8;
            }
        }
        if (HP_ < (maxHP_ * 0.2)) {
            _local12 = (int((Math.abs(Math.sin((_arg2 / 200))) * 10)) / 10);
            _local13 = 128;
            _local14 = new ColorTransform(1, 1, 1, 1, (_local12 * _local13), (-(_local12) * _local13), (-(_local12) * _local13));
            _local8 = _G_._B_2(_local8, _local14);
        }
        var _local9:BitmapData = _qm[_local8];
        if (_local9 == null) {
            _local9 = TextureRedrawer.outlineGlow(_local8, 0, this._2v == -1 ? 0 : this._2v);
            _qm[_local8] = _local9;
        }
        if (((isPaused()) || (_C_H_()))) {
            _local9 = _G_._R_9(_local9, _oj);
        } else {
            if (_di()) {
                if (this != this.map_.player_ && this.map_.player_.canBeHitBy(this)) {
                    _local9 = _G_._0C_m(_local9, 0);
                } else {
                    _local9 = _G_._0C_m(_local9, 0.4);
                }
            }
        }
        return (_local9);
    }

    override public function getPortrait():BitmapData {
        var _local1:_J_H_;
        var _local2:int;
        if (_tm == null) {
            _local1 = _yN_.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
            _local2 = ((4 / _local1.image_.width) * 100);
            _tm = TextureRedrawer.resize(_local1.image_, _local1.mask_, _local2, true, tex1Id_, tex2Id_);
            _tm = TextureRedrawer.outlineGlow(_tm, 0, 0);
        }
        return (_tm);
    }

    override public function setAttack(_arg1:int, _arg2:Number):void {
        var _local3:XML = ObjectLibrary._Q_F_[_arg1];
        if (_local3 == null || !_local3.hasOwnProperty("RateOfFire")) {
            return;
        }
        var _local4:Number = Number(_local3.RateOfFire);
        this._y4 = ((1 / this._F_W_()) * (1 / _local4));
        super.setAttack(_arg1, _arg2);
    }

    override public function toString():String {
        return ("<Char>" + "<Name>" + name_ + "</Name>" + "<ObjectType>" + objectType_ + "</ObjectType>" + "<Level>" + level_ + "</Level>" + "<Exp>" + this.exp_ + "</Exp>" + "<Equipment>" + equipment_ + "</Equipment>" + "<MaxHitPoints>" + maxHP_ + "</MaxHitPoints>" + "<HitPoints>" + HP_ + "</HitPoints>" + "<MaxMagicPoints>" + this.maxMP_ + "</MaxMagicPoints>" + "<MagicPoints>" + this.MP_ + "</MagicPoints>" + "<Attack>" + this.attack_ + "</Attack>" + "<Defense>" + defense_ + "</Defense>" + "<Speed>" + this.speed_ + "</Speed>" + "<HpRegen>" + this.vitality_ + "</HpRegen>" + "<MpRegen>" + this.wisdom_ + "</MpRegen>" + "<Dexterity>" + this.dexterity_ + "</Dexterity>" + "</Char>");
    }

    public function _vr(_arg1:Number, _arg2:Number, _arg3:Number):void {
        var _local4:Number;
        if (this._D_k == null) {
            this._D_k = new Point();
        }
        this._ky = _arg1;
        this._D_k.x = _arg2;
        this._D_k.y = _arg3;
        if (_8a()) {
            _local4 = this._D_k.x;
            this._D_k.x = -(this._D_k.y);
            this._D_k.y = -(_local4);
            this._ky = -(this._ky);
        }
    }

    public function _F_S_(_arg1:int):void {
        this.credits_ = _arg1;
    }

    public function setKeys(_arg1:int):void {
        this.keys_ = _arg1;
    }

    public function _Y_C_(_arg1:String):void {
        var _local3:GameObject;
        var _local4:Player;
        var _local5:Boolean;
        this.guildName_ = _arg1;
        var _local2:Player = map_.player_;
        if (_local2 == this) {
            for each (_local3 in map_.goDict_) {
                _local4 = (_local3 as Player);
                if (((!((_local4 == null))) && (!((_local4 == this))))) {
                    _local4._Y_C_(_local4.guildName_);
                }
            }
        } else {
            _local5 = ((((((!((_local2 == null))) && (!((_local2.guildName_ == null))))) && (!((_local2.guildName_ == ""))))) && ((_local2.guildName_ == this.guildName_)));
            if (_local5 != this._N_n) {
                this._N_n = _local5;
                _U_g = null;
            }
        }
    }

    public function UpdateParty(_arg1:int):void {
        var _local3:GameObject;
        var _local4:Player;
        var _local5:Boolean;
        this.partyID_ = _arg1;
        var _local2:Player = map_.player_;
        if (_local2 == this) {
            for each (_local3 in map_.goDict_) {
                _local4 = (_local3 as Player);
                if (((!((_local4 == null))) && (!((_local4 == this))))) {
                    _local4.UpdateParty(_local4.partyID_);
                }
            }
        } else {
            _local5 = _local2 != null && _local2.partyID_ != -1 && _local2.partyID_ == this.partyID_;
            if (_local5 != this.inParty) {
                this.inParty = _local5;
                _U_g = null;
            }
        }
    }

    public function _0D_X_(_arg1:Player):Boolean {
        if (((_arg1.isPaused()) || (_arg1._di()))) {
            return (false);
        }
        return (true);
    }

    public function _Z_C_():int {
        var _local1:int = getTimer();
        return (Math.max(0, (this.nextTeleportAt_ - _local1)));
    }

    public function teleportTo(_arg1:Player):Boolean {
        if (isPaused()) {
            map_.gs_.textBox_.addText(Parameters.SendError, "Can not teleport while paused.");
            return (false);
        }
        var _local2:int = this._Z_C_();
        if (_local2 > 0) {
            map_.gs_.textBox_.addText(Parameters.SendError, (("You can not teleport for another " + int(((_local2 / 1000) + 1))) + " seconds."));
            return (false);
        }
        if (!this._0D_X_(_arg1)) {
            if (_arg1._di()) {
                map_.gs_.textBox_.addText(Parameters.SendError, (("Can not teleport to " + _arg1.name_) + " while they are invisible."));
            }
            map_.gs_.textBox_.addText(Parameters.SendError, ("Can not teleport to " + _arg1.name_));
            return (false);
        }
        map_.gs_.gsc_.teleport(_arg1.objectId_);
        this.nextTeleportAt_ = (getTimer() + _0G_S_);
        return (true);
    }

    public function _x1(_arg1:String):void {
        this._p7();
        map_.mapOverlay_.addChild(new _O_P_(this, _arg1, 0xFF00, 2000));
    }

    public function _ut(_arg1:Boolean):void {
        _5T_.play("level_up");
        if (_arg1) {
            this._x1("New Class Unlocked!");
        } else {
            this._x1("Level Up!");
        }
    }

    public function _p7():void {
        map_.addObj(new LevelUpEffect(this, 0xFF00FF00, 20), x_, y_);
    }

    public function _oK_():void {
        map_.addObj(new _0H_T_(this, 0xFFFFFF), x_, y_);
    }

    public function _0I_I_(_arg1:int):void {
        if (level_ == 120) {
            return;
        }
        map_.mapOverlay_.addChild(new _O_P_(this, (("+" + _arg1) + "XP"), 0xFF00, 1000));
    }

    public function _2(_arg1:Number, _arg2:Number):Boolean {
        this._u0(_arg1, _arg2, _06g);
        return (this.moveTo(_06g.x, _06g.y));
    }

    public function _u0(_arg1:Number, _arg2:Number, _arg3:Point):void {
        if (_R_7()) {
            _arg3.x = x_;
            _arg3.y = y_;
            return;
        }
        var _local4:Number = (_arg1 - x_);
        var _local5:Number = (_arg2 - y_);
        if ((((((((_local4 < _Q_a)) && ((_local4 > -(_Q_a))))) && ((_local5 < _Q_a)))) && ((_local5 > -(_Q_a))))) {
            this._A_y(_arg1, _arg2, _arg3);
            return;
        }
        var _local6:Number = Math.atan2(_local4, _local5);
        var _local7:Number = (_Q_a / Math.max(Math.abs(_local4), Math.abs(_local5)));
        var _local8:Number = 0;
        _arg3.x = x_;
        _arg3.y = y_;
        var _local9:Boolean;
        while (!(_local9)) {
            if ((_local8 + _local7) >= 1) {
                _local7 = (1 - _local8);
                _local9 = true;
            }
            this._A_y((_arg3.x + (_local4 * _local7)), (_arg3.y + (_local5 * _local7)), _arg3);
            _local8 = (_local8 + _local7);
        }
    }

    public function _A_y(_arg1:Number, _arg2:Number, _arg3:Point):void {
        var _local6:Number;
        var _local7:Number;
        var _local4:Boolean = ((((((x_ % 0.5) == 0)) && (!((_arg1 == x_))))) || (!((int((x_ / 0.5)) == int((_arg1 / 0.5))))));
        var _local5:Boolean = ((((((y_ % 0.5) == 0)) && (!((_arg2 == y_))))) || (!((int((y_ / 0.5)) == int((_arg2 / 0.5))))));
        if (((((!(_local4)) && (!(_local5)))) || (this._M_S_(_arg1, _arg2)))) {
            _arg3.x = _arg1;
            _arg3.y = _arg2;
            return;
        }
        if (_local4) {
            _local6 = (((_arg1) > x_) ? (int((_arg1 * 2)) / 2) : (int((x_ * 2)) / 2));
            if (int(_local6) > int(x_)) {
                _local6 = (_local6 - 0.01);
            }
        }
        if (_local5) {
            _local7 = (((_arg2) > y_) ? (int((_arg2 * 2)) / 2) : (int((y_ * 2)) / 2));
            if (int(_local7) > int(y_)) {
                _local7 = (_local7 - 0.01);
            }
        }
        if (!_local4) {
            _arg3.x = _arg1;
            _arg3.y = _local7;
            return;
        }
        if (!_local5) {
            _arg3.x = _local6;
            _arg3.y = _arg2;
            return;
        }
        var _local8:Number = (((_arg1) > x_) ? (_arg1 - _local6) : (_local6 - _arg1));
        var _local9:Number = (((_arg2) > y_) ? (_arg2 - _local7) : (_local7 - _arg2));
        if (_local8 > _local9) {
            if (this._M_S_(_arg1, _local7)) {
                _arg3.x = _arg1;
                _arg3.y = _local7;
                return;
            }
            if (this._M_S_(_local6, _arg2)) {
                _arg3.x = _local6;
                _arg3.y = _arg2;
                return;
            }
        } else {
            if (this._M_S_(_local6, _arg2)) {
                _arg3.x = _local6;
                _arg3.y = _arg2;
                return;
            }
            if (this._M_S_(_arg1, _local7)) {
                _arg3.x = _arg1;
                _arg3.y = _local7;
                return;
            }
        }
        _arg3.x = _local6;
        _arg3.y = _local7;
    }

    public function _M_S_(_arg1:Number, _arg2:Number):Boolean {
        var _local3:Square = map_.getSquare(_arg1, _arg2);
        if (((!((_0H_B_ == _local3))) && ((((_local3 == null)) || (!(_local3._0C_D_())))))) {
            return (false);
        }
        var _local4:Number = (_arg1 - int(_arg1));
        var _local5:Number = (_arg2 - int(_arg2));
        if (_local4 < 0.5) {
            if (this._g7((_arg1 - 1), _arg2)) {
                return (false);
            }
            if (_local5 < 0.5) {
                if (((this._g7(_arg1, (_arg2 - 1))) || (this._g7((_arg1 - 1), (_arg2 - 1))))) {
                    return (false);
                }
            } else {
                if (_local5 > 0.5) {
                    if (((this._g7(_arg1, (_arg2 + 1))) || (this._g7((_arg1 - 1), (_arg2 + 1))))) {
                        return (false);
                    }
                }
            }
        } else {
            if (_local4 > 0.5) {
                if (this._g7((_arg1 + 1), _arg2)) {
                    return (false);
                }
                if (_local5 < 0.5) {
                    if (((this._g7(_arg1, (_arg2 - 1))) || (this._g7((_arg1 + 1), (_arg2 - 1))))) {
                        return (false);
                    }
                } else {
                    if (_local5 > 0.5) {
                        if (((this._g7(_arg1, (_arg2 + 1))) || (this._g7((_arg1 + 1), (_arg2 + 1))))) {
                            return (false);
                        }
                    }
                }
            } else {
                if (_local5 < 0.5) {
                    if (this._g7(_arg1, (_arg2 - 1))) {
                        return (false);
                    }
                } else {
                    if (_local5 > 0.5) {
                        if (this._g7(_arg1, (_arg2 + 1))) {
                            return (false);
                        }
                    }
                }
            }
        }
        return (true);
    }

    public function _g7(_arg1:Number, _arg2:Number):Boolean {
        var _local3:Square = map_.lookupSquare(_arg1, _arg2);
        return ((((((_local3 == null)) || ((_local3.tileType_ == 0xFF)))) || (((!((_local3.obj_ == null))) && (_local3.obj_.props_._4V_)))));
    }

    public function _01w():void {
        var _local1:Square = map_.getSquare(x_, y_);
        if (_local1.props_._rr) {
            _0F_ = Math.min((_0F_ + 1), Parameters._K_5);
            this._W_V_ = (0.1 + ((1 - (_0F_ / Parameters._K_5)) * (_local1.props_.speed_ - 0.1)));
        } else {
            _0F_ = 0;
            this._W_V_ = _local1.props_.speed_;
        }
    }

    public function _F_W_():Number {
        if (_0I_0()) {
            return (_lU_);
        }

        _atk = this.attack_;
        _def = this.defense_;
        _spd = this.speed_;
        _vit = this.vitality_;
        _wis = this.wisdom_;
        _dex = this.dexterity_;

        var _local1:Number = (_lU_ + ((this.dexterity_ / _x_) * (_Z_ - _lU_)));
        if (_L_8()) {
            _local1 = (_local1 * 1.5);
        }
        if (_x_ != 75) {
            _x_ = 75
        }
        return (_local1);
    }

    public function useAltWeapon(_arg1:Number, _arg2:Number):void {
        var _local7:XML;
        var _local8:int;
        var _local10:Number;
        if (map_ == null || isPaused()) {
            return;
        }
        var _local3:int = equipment_[1];
        if (_local3 == -1) {
            return;
        }
        var _local4:XML = ObjectLibrary._Q_F_[_local3];
        if (_local4 == null || !_local4.hasOwnProperty("Usable")) {
            return;
        }
        var _local5:int = int(_local4.MpCost);
        if (_local5 > this.MP_) {
            _5T_.play("no_mana");
            return;
        }
        var _local6:Point = map_.pSTopW(_arg1, _arg2);
        if (_local6 == null) {
            _5T_.play("error");
            return;
        }
        for each (_local7 in _local4.Activate) {
            if (_local7.toString() == "Teleport") {
                if (!this._M_S_(_local6.x, _local6.y)) {
                    _5T_.play("error");
                    return;
                }
            }
        }
        if (usiShukAbil) {
            return;
        }
        _local8 = getTimer();
        var _local19:XML = ObjectLibrary._Q_F_[equipment_[3]];
        if (_local8 < this._0m) {
            _5T_.play("error");
            return;
        }
        var _local9 = 500;
        if (_local4.hasOwnProperty("Cooldown")) {
            _local9 = (Number(_local4.Cooldown) * 1000);
        }
        if (_local19 != null && _local19.hasOwnProperty("BypassCool")) {
            _local9 = 0;
        }
        this._0m = (_local8 + _local9);
        map_.gs_.gsc_.useItem(_local8, objectId_, 1, _local3, _local6.x, _local6.y);
        if (_local4.Activate == "Shoot") {
            _local10 = Math.atan2(_arg2, _arg1);
            this._G_Y_(_local8, _local3, _local4, (Parameters.data_.cameraAngle + _local10), false, 1);
        }
        if (_local4.Activate == "ShurikenAbility") {
            this.usiShukAbil = true;
        }
    }

    public function shukAbil(_arg1:Number, _arg2:Number):void {

        if (!usiShukAbil)
            return;

        var _local3:int = equipment_[1];
        var _local4:XML = ObjectLibrary._Q_F_[_local3];
        var _local6:Point = map_.pSTopW(_arg1, _arg2);
        var _local8:int;

        if (_local3 == -1) {
            return;
        }
        if (_local6 == null) {
            return;
        }
        _local8 = getTimer();

        this.usiShukAbil = false;

        map_.gs_.gsc_.useItem(_local8, objectId_, 1, _local3, _local6.x, _local6.y);

        var _local5:int = int(_local4.MpEndCost);
        var _local10:Number = Math.atan2(_arg2, _arg1);
        if (_local5 > this.MP_) {
            _5T_.play("error");
        } else {
            this._G_Y_(_local8, _local3, _local4, (Parameters.data_.cameraAngle + _local10), false, 1);
        }
    }

    public function _O_7(_arg1:Number):void {
        this.shoot(Parameters.data_.cameraAngle + _arg1);
    }

    public function _7b():String {
        return (ObjectLibrary._0D_N_[objectType_]);
    }

    public function _o4():Boolean {
        return (!(((_9B_ & ConditionEffect._gY_) == 0)));
    }

    override public function drawShadow(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        if(this != this.map_.player_ && this.map_.player_.canBeHitBy(this) && this._di()) {
            return;
        }
        super.drawShadow(_arg1, _arg2, _arg3);
    }

    protected function _071(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local8:Number;
        var _local9:Number;
        if (this._K_Y_ == null) {
            this._F_k = new GraphicsSolidFill();
            this._03i = new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>());
            this._Y_e = new GraphicsSolidFill(2542335);
            this._K_Y_ = new GraphicsPath(GraphicHelper._H_2, new Vector.<Number>());
        }
        if (this._R_4 <= Parameters._E_S_) {
            _local8 = ((Parameters._E_S_ - this._R_4) / Parameters._E_S_);
            this._F_k.color = MoreColorUtil._oH_(0x545454, 0xFF0000, (Math.abs(Math.sin((_arg3 / 300))) * _local8));
        } else {
            this._F_k.color = 0x545454;
        }
        var _local4:int = 20;
        var _local5:int = 4;
        var _local6:int = 6;
        var _local7:Vector.<Number> = this._03i.data;
        _local7.length = 0;
        _local7.push((_bY_[0] - _local4), (_bY_[1] + _local5), (_bY_[0] + _local4), (_bY_[1] + _local5), (_bY_[0] + _local4), ((_bY_[1] + _local5) + _local6), (_bY_[0] - _local4), ((_bY_[1] + _local5) + _local6));
        _arg1.push(this._F_k);
        _arg1.push(this._03i);
        _arg1.push(GraphicHelper.END_FILL);
        if (this._R_4 > 0) {
            _local7 = this._K_Y_.data;
            _local9 = (((this._R_4 / 100) * 2) * _local4);
            _local7.length = 0;
            _local7.push((_bY_[0] - _local4), (_bY_[1] + _local5), ((_bY_[0] - _local4) + _local9), (_bY_[1] + _local5), ((_bY_[0] - _local4) + _local9), ((_bY_[1] + _local5) + _local6), (_bY_[0] - _local4), ((_bY_[1] + _local5) + _local6));
            _arg1.push(this._Y_e);
            _arg1.push(this._K_Y_);
            _arg1.push(GraphicHelper.END_FILL);
        }
    }

    protected function _ei():BitmapData {
        if (this._sd == null) {
            this._sd = AssetLibrary._xK_("lofiChar8x8", int((Math.random() * 239)));
        }
        return (this._sd);
    }

    private function _0I_U_():Merchant {
        var _local3:Point;
        var _local4:Merchant;
        var _local1:int = ((((x_ - int(x_))) > 0.5) ? 1 : -1);
        var _local2:int = ((((y_ - int(y_))) > 0.5) ? 1 : -1);
        for each (_local3 in _A_u) {
            this._06x.x_ = (x_ + (_local1 * _local3.x));
            this._06x.y_ = (y_ + (_local2 * _local3.y));
            _local4 = map_.merchLookup_[this._06x];
            if (_local4 != null) {
                return ((((PointUtil._bm(_local4.x_, _local4.y_, x_, y_) < 1)) ? _local4 : null));
            }
        }
        return (null);
    }

    private function _J_N_():Number {
        if (_051()) {
            return ((_dK_ * this._W_V_));
        }
        var _local1:Number = (_dK_ + ((this.speed_ / _x_) * (_T_v - _dK_)));
        if (_N_4()) {
            _local1 = (_local1 * 1.5);
        }
        if (_x_ != 75) {
            _x_ = 75
        }
        return ((_local1 * this._W_V_));
    }

    private function _6D_():Number {
        if (_hQ_()) {
            return (_01b);
        }

        var _local1:Number = (_01b + ((this.attack_ / _x_) * (_0J_Q_ - _01b)));
        if (_07I_()) {
            _local1 = (_local1 * 1.5);
        }
        if (_x_ != 75) {
            _x_ = 75
        }
        return (_local1);
    }

    private function _ur():void {
        var _local1:_Z_H_ = ObjectLibrary._V_a[objectType_];
        texture_ = _local1.texture_;
        mask_ = _local1.mask_;
        _yN_ = _local1._yN_;
        this._7U_ = true;
    }

    private function _Q_K_():void {
        var _local1:Vector.<XML> = ObjectLibrary._J_G_;
        var _local2:uint = Math.floor((Math.random() * _local1.length));
        var _local3:int = _local1[_local2].@type;
        var _local4:_Z_H_ = ObjectLibrary._V_a[_local3];
        texture_ = _local4.texture_;
        mask_ = _local4.mask_;
        _yN_ = _local4._yN_;
        this._7U_ = false;
    }

    private function shoot(_arg1:Number):void {
        if (map_ == null || _0I_e() || isPaused()) {
            return;
        }
        var _local2:int = equipment_[0];
        if (_local2 == -1) {
            map_.gs_.textBox_.addText(Parameters.SendError, "You do not have a weapon equipped!");
            return;
        }
        var _local3:XML = ObjectLibrary._Q_F_[_local2];
        var _local4:int = getTimer();
        var _local5:Number = Number(_local3.RateOfFire);
        this._y4 = ((1 / this._F_W_()) * (1 / _local5));
        if (_local4 < (_W_J_ + this._y4)) {
            return;
        }
        doneAction(map_.gs_, Tutorial._9Z_);
        map_.gs_.gsc_.playerCheatCheck();
        _M_r = _arg1;
        _W_J_ = _local4;
        this._G_Y_(_W_J_, _local2, _local3, _M_r, true, 0);
    }

    private function _G_Y_(_arg1:int, _arg2:int, _arg3:XML, _arg4:Number, _arg5:Boolean, _arg6:int):void {
        var _local12:uint;
        var _local13:Projectile;
        var _local14:int;
        var _local15:int;
        var _local16:Number;
        var _local17:int;
        var _local6:int = ((_arg3.hasOwnProperty("NumProjectiles")) ? int(_arg3.NumProjectiles) : 1);
        var _local7:Number = (((_arg3.hasOwnProperty("ArcGap")) ? Number(_arg3.ArcGap) : 11.25) * Trig._km);
        var _local8:Vector.<Projectile> = new Vector.<Projectile>();
        var _local9:Number = (_local7 * (_local6 - 1));
        var _local10:Number = (_arg4 - (_local9 / 2));
        var _local11:int;
        var itemData_:Object = this.equipData_[_arg6];
        while (_local11 < _local6) {
            _local12 = _true();
            _local13 = (_wW_._B_1(Projectile) as Projectile);
            _local13.reset(_arg2, 0, objectId_, _local12, _local10, _arg1);
            _local14 = int(_local13._ko.minDamage_);
            _local15 = int(_local13._ko.maxDamage_);
            if(itemData_ != null && itemData_.hasOwnProperty("DmgPercentage") && itemData_.DmgPercentage != 0) {
                var _local18:int = int(itemData_.DmgPercentage);
                _local14 += (_local14 * (_local18 / 100));
                _local15 += (_local15 * (_local18 / 100));
            }
            _local16 = ((_arg5) ? this._6D_() : 1);
            _local17 = (map_.gs_.gsc_.getNextDamage(_local14, _local15) * _local16);
            if (_arg1 > (map_.gs_.moveRecords_.lastClearTime_ + 600)) {
                _local17 = 0;
            }
            _local13._T_j(_local17);
            if ((((_local11 == 0)) && (!((_local13._P_B_ == null))))) {
                _5T_.play(_local13._P_B_, 0.75, false);
            }
            map_.addObj(_local13, (x_ + (Math.cos(_arg4) * 0.3)), (y_ + (Math.sin(_arg4) * 0.3)));
            map_.gs_.gsc_.playerShoot(_arg1, _local13);
            _local10 = (_local10 + _local7);
            _local11++;

          _mindmg = _local14;
          _maxdmg = _local15;
        }
    }

}
}//package com.company.assembleegameclient.objects

