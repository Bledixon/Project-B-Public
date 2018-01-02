// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.Merchant

package com.company.assembleegameclient.objects {
import _015._6T_;

import _05R_.GTween;

import _1s._yx;

import _E_7.EquipmentToolTip;
import _E_7._for_;


import _ke._U_c;

import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.map._X_l;
import com.company.ui.SimpleText;
import com.company.util.IntPoint;

import flash.display.BitmapData;
import flash.geom.ColorTransform;
import flash.geom.Matrix;

public class Merchant extends SellableObject implements _G_4 {

    private static const _09I_:int = 0;
    private static const _5x:int = 1;
    private static const _qV_:int = 2;
    private static const _R_s:int = 3;
    private static const _0D_x:int = 4;
    private static const T:Number = 1;
    private static const _1U_:Matrix = function ():Matrix {
        var _local1:* = new Matrix();
        _local1.translate(10, 5);
        return (_local1);
    }();

    public function Merchant(_arg1:XML) {
        this._4p = new ColorTransform(1, 1, 1, 1);
        super(_arg1);
        _064 = true;
    }
    public var _0E_:int = -1;
    public var _1I_:int = -1;
    public var _gt:int = -1;
    public var _S_I_:int = 0;
    public var merchandiseTexture_:BitmapData = null;
    public var _z5:int = 0;
    public var alpha_:Number = 1;
    private var _0H_e:Boolean = true;
    private var _01L_:int = 0;
    private var _4p:ColorTransform;

    override public function setPrice(_arg1:int):void {
        super.setPrice(_arg1);
        this._z5 = 0;
    }

    override public function setRankReq(_arg1:int):void {
        super.setRankReq(_arg1);
        this._z5 = 0;
    }

    override public function addTo(_arg1:_X_l, _arg2:Number, _arg3:Number):Boolean {
        if (!super.addTo(_arg1, _arg2, _arg3)) {
            return (false);
        }
        _arg1.merchLookup_[new IntPoint(x_, y_)] = this;
        return (true);
    }

    override public function removeFromMap():void {
        var _local1:IntPoint = new IntPoint(x_, y_);
        if (map_.merchLookup_[_local1] == this) {
            map_.merchLookup_[_local1] = null;
        }
        super.removeFromMap();
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local5:GTween;
        var _local6:GTween;
        super.update(_arg1, _arg2);
        if (this._0H_e) {
            if (this._gt == 2147483647) {
                this.alpha_ = 0;
                _local5 = new GTween(this, (0.5 * T), {"alpha_": 1});
                _local6 = new GTween(this, (0.5 * T), {"size_": 150}, {"ease": _yx._O_2});
                _local6._0E_A_ = new GTween(this, (0.5 * T), {"size_": 100}, {"ease": _yx._J_D_});
                _local6._0E_A_._04u = true;
            }
            this._0H_e = false;
        }
        this._z5 = (this._z5 - _arg2);
        if (this._z5 > 0) {
            return (true);
        }
        this._z5 = 5000;
        var _local3:Vector.<int> = new Vector.<int>();
        if (this._gt == 2147483647) {
            _local3.push(_5x);
        } else {
            if ((((this._gt >= 0)) && ((this._gt <= 5)))) {
                _local3.push(_qV_);
            }
        }
        if ((((this._1I_ >= 1)) && ((this._1I_ <= 2)))) {
            _local3.push(_R_s);
        }
        if (this._S_I_ > 0) {
            _local3.push(_0D_x);
        }
        if (_local3.length == 0) {
            return (true);
        }
        this._01L_ = (++this._01L_ % _local3.length);
        var _local4:int = _local3[this._01L_];
        map_.mapOverlay_.addSpeechBalloon(this._S_i(_local4));
        return (true);
    }

    override public function soldObjectName():String {
        return (ObjectLibrary._0D_N_[this._0E_]);
    }

    override public function soldObjectInternalName():String {
        var _local1:XML = ObjectLibrary._Q_F_[this._0E_];
        return (_local1.@id.toString());
    }

    override public function getTooltip():_for_ {
        return (new EquipmentToolTip(this._0E_, map_.player_, -1, _U_c.NPC));
    }

    override public function getIcon():BitmapData {
        var _local3:SimpleText;
        var _local1:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this._0E_, 80, true);
        var _local2:XML = ObjectLibrary._Q_F_[this._0E_];
        if (_local2.hasOwnProperty("Doses")) {
            _local1 = _local1.clone();
            _local3 = new SimpleText(12, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            _local3.text = String(_local2.Doses);
            _local3.updateMetrics();
            _local1.draw(_local3, _1U_);
        }
        return (_local1);
    }

    override protected function getTexture(_arg1:_0D_v, _arg2:int):BitmapData {
        if ((((this.alpha_ == 1)) && ((size_ == 100)))) {
            return (this.merchandiseTexture_);
        }
        var _local3:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this._0E_, size_, false, false);
        if (this.alpha_ != 1) {
            this._4p.alphaMultiplier = this.alpha_;
            _local3.colorTransform(_local3.rect, this._4p);
        }
        return (_local3);
    }

    public function _S_i(_arg1:int):_6T_ {
        var _local2:String;
        var _local3:uint;
        var _local4:uint;
        var _local5:uint;
        switch (_arg1) {
            case _5x:
                _local2 = "New!";
                _local3 = 0xE6E6E6;
                _local4 = 0xFFFFFF;
                _local5 = 5931045;
                break;
            case _qV_:
                if (this._gt == 0) {
                    _local2 = "Going soon!";
                } else {
                    if (this._gt == 1) {
                        _local2 = "Going in 1 min!";
                    } else {
                        _local2 = (("Going in " + this._gt) + " mins!");
                    }
                }
                _local3 = 5973542;
                _local4 = 16549442;
                _local5 = 16549442;
                break;
            case _R_s:
                _local2 = (this._1I_ + " left!");
                _local3 = 5973542;
                _local4 = 16549442;
                _local5 = 16549442;
                break;
            case _0D_x:
                _local2 = (this._S_I_ + "% off!");
                _local3 = 6324275;
                _local4 = 16777103;
                _local5 = 16777103;
                break;
            default:
                return (null);
        }
        return (new _6T_(this, _local2, _local3, 1, _local4, 1, _local5, 6, true, false));
    }

    public function getTex1Id(_arg1:int):int {
        var _local2:XML = ObjectLibrary._Q_F_[this._0E_];
        if (_local2 == null) {
            return (_arg1);
        }
        if ((((_local2.Activate == "Dye")) && (_local2.hasOwnProperty("Tex1")))) {
            return (int(_local2.Tex1));
        }
        return (_arg1);
    }

    public function getTex2Id(_arg1:int):int {
        var _local2:XML = ObjectLibrary._Q_F_[this._0E_];
        if (_local2 == null) {
            return (_arg1);
        }
        if ((((_local2.Activate == "Dye")) && (_local2.hasOwnProperty("Tex2")))) {
            return (int(_local2.Tex2));
        }
        return (_arg1);
    }

    public function getSkinId(_arg1:int, player:Player):int {
        var _local2:XML = ObjectLibrary._Q_F_[this._0E_];
        if (_local2 == null) return _arg1;
        if (_local2.Activate == "UnlockSkin" && _local2.Activate.hasOwnProperty("@skinType")) {
            var _skin:XML = ObjectLibrary._Q_F_[int(_local2.Activate.@skinType)];
            if (_skin == null)
                return _arg1;
            if (!_skin.hasOwnProperty("PlayerClassType"))
                return _arg1;
            if (int(_skin.PlayerClassType) != player.objectType_)
                return _arg1;
            return int(_local2.Activate.@skinType);
        }
        return _arg1;
    }

    public function setMerchandiseType(_arg1:int):void {
        this._0E_ = _arg1;
        this.merchandiseTexture_ = ObjectLibrary.getRedrawnTextureFromType(this._0E_, 100, false);
    }

}
}//package com.company.assembleegameclient.objects

