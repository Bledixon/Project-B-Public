// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.ObjectProperties

package com.company.assembleegameclient.objects {
import flash.utils.Dictionary;

import _vf._5T_;

public class ObjectProperties {

    public function ObjectProperties(_arg1:XML) {
        var _local2:XML;
        var _local3:XML;
        var _local4:int;
        this._I_e = new Dictionary();
        super();
        if (_arg1 == null) {
            return;
        }
        this.type_ = int(_arg1.@type);
        this.id_ = String(_arg1.@id);
        this._wE_ = this.id_;
        if (_arg1.hasOwnProperty("DisplayId")) {
            this._wE_ = _arg1.DisplayId;
        }
        this._0_Z_ = ((_arg1.hasOwnProperty("ShadowSize")) ? _arg1.ShadowSize : 100);
        this._0E_4 = _arg1.hasOwnProperty("Player");
        this.isEnemy_ = _arg1.hasOwnProperty("Enemy");
        this._Z_L_ = _arg1.hasOwnProperty("DrawOnGround");
        if (((this._Z_L_) || (_arg1.hasOwnProperty("DrawUnder")))) {
            this._06D_ = true;
        }
        this.occupySquare_ = _arg1.hasOwnProperty("OccupySquare");
        this._4V_ = _arg1.hasOwnProperty("FullOccupy");
        this.enemyOccupySquare_ = _arg1.hasOwnProperty("EnemyOccupySquare");
        this.static_ = _arg1.hasOwnProperty("Static");
        this._ia = _arg1.hasOwnProperty("NoMiniMap");
        this.protectFromGroundDamage_ = _arg1.hasOwnProperty("ProtectFromGroundDamage");
        this.protectFromSink_ = _arg1.hasOwnProperty("ProtectFromSink");
        this.flying_ = _arg1.hasOwnProperty("Flying");
        this._xg = _arg1.hasOwnProperty("ShowName");
        this._D_9 = _arg1.hasOwnProperty("DontFaceAttacks");
        if (_arg1.hasOwnProperty("Z")) {
            this.z_ = Number(_arg1.Z);
        }
        if (_arg1.hasOwnProperty("Color")) {
            this.color_ = uint(_arg1.Color);
        }
        if (_arg1.hasOwnProperty("Size")) {
            this._mF_ = (this._P_6 = _arg1.Size);
        } else {
            if (_arg1.hasOwnProperty("MinSize")) {
                this._mF_ = _arg1.MinSize;
            }
            if (_arg1.hasOwnProperty("MaxSize")) {
                this._P_6 = _arg1.MaxSize;
            }
            if (_arg1.hasOwnProperty("SizeStep")) {
                this._0_Y_ = _arg1.SizeStep;
            }
        }
        if (this._0E_4 != "Player") {
            this._0E_4 == "Player"
        }
        this._rw = ((_arg1.hasOwnProperty("OldSound")) ? String(_arg1.OldSound) : null);
        for each (_local2 in _arg1.Projectile) {
            _local4 = int(_local2.@id);
            this._I_e[_local4] = new _O_d(_local2);
        }
        this._g_ = ((_arg1.hasOwnProperty("AngleCorrection")) ? ((Number(_arg1.AngleCorrection) * Math.PI) / 4) : 0);
        this.rotation_ = ((_arg1.hasOwnProperty("Rotation")) ? _arg1.Rotation : 0);
        if (_arg1.hasOwnProperty("BloodProb")) {
            this._U_Q_ = Number(_arg1.BloodProb);
        }
        if (_arg1.hasOwnProperty("BloodColor")) {
            this._U_C_ = uint(_arg1.BloodColor);
        }
        if (_arg1.hasOwnProperty("ShadowColor")) {
            this._G_c = uint(_arg1.ShadowColor);
        }
        for each (_local3 in _arg1.Sound) {
            if (this._6x == null) {
                this._6x = {};
            }
            this._6x[int(_local3.@id)] = _local3.toString();
        }
        if (_arg1.hasOwnProperty("Portrait")) {
            this._tm = new _Z_H_(XML(_arg1.Portrait));
        }
        if (_arg1.hasOwnProperty("WhileMoving")) {
            this._G_R_ = new WhileMovingProperties(XML(_arg1.WhileMoving));
        }
    }
    public var type_:int;
    public var id_:String;
    public var _wE_:String;
    public var _0_Z_:int;
    public var _0E_4:Boolean = false;
    public var isEnemy_:Boolean = false;
    public var _Z_L_:Boolean = false;
    public var _06D_:Boolean = false;
    public var occupySquare_:Boolean = false;
    public var _4V_:Boolean = false;
    public var enemyOccupySquare_:Boolean = false;
    public var static_:Boolean = false;
    public var _ia:Boolean = false;
    public var protectFromGroundDamage_:Boolean = false;
    public var protectFromSink_:Boolean = false;
    public var z_:Number = 0;
    public var flying_:Boolean = false;
    public var color_:uint = 0xFFFFFF;
    public var _xg:Boolean = false;
    public var _D_9:Boolean = false;
    public var _U_Q_:Number = 0;
    public var _U_C_:uint = 0xFF0000;
    public var _G_c:uint = 0;
    public var _6x:Object = null;
    public var _tm:_Z_H_ = null;
    public var _mF_:int = 100;
    public var _P_6:int = 100;
    public var _0_Y_:int = 5;
    public var _G_R_:WhileMovingProperties = null;
    public var _rw:String = null;
    public var _I_e:Dictionary;
    public var _g_:Number = 0;
    public var rotation_:Number = 0;

    public function _M_N_():void {
        var _local1:String;
        if (this._6x == null) {
            return;
        }
        for each (_local1 in this._6x) {
            _5T_.load(_local1);
        }
    }

    public function _0M_t():int {
        if (this._mF_ == this._P_6) {
            return (this._mF_);
        }
        var _local1:int = ((this._P_6 - this._mF_) / this._0_Y_);
        return ((this._mF_ + (int((Math.random() * _local1)) * this._0_Y_)));
    }

}
}//package com.company.assembleegameclient.objects

class WhileMovingProperties {

    public var z_:Number = 0;
    public var flying_:Boolean = false;

    public function WhileMovingProperties(_arg1:XML) {
        if (_arg1.hasOwnProperty("Z")) {
            this.z_ = Number(_arg1.Z);
        }
        this.flying_ = _arg1.hasOwnProperty("Flying");
    }
}

