// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util.ConditionEffect

package com.company.assembleegameclient.util {
import flash.filters.GlowFilter;
import flash.filters.BitmapFilterQuality;

import flash.display.BitmapData;
import flash.geom.Matrix;

import com.company.util.AssetLibrary;
import com.company.util.PointUtil;


public class ConditionEffect {

    public static const _0I_2:uint = 0;
    public static const _em:uint = 1;
    public static const _xc:uint = 2;
    public static const _V_H_:uint = 3;
    public static const _0D_Z_:uint = 4;
    public static const _vJ_:uint = 5;
    public static const _030:uint = 6;
    public static const _V_Z_:uint = 7;
    public static const _2p:uint = 8;
    public static const _01n:uint = 9;
    public static const _02w:uint = 10;
    public static const _o9:uint = 11;
    public static const _xn:uint = 12;
    public static const _vH_:uint = 13;
    public static const _T_q:uint = 14;
    public static const _K_J_:uint = 15;
    public static const _iM_:uint = 16;
    public static const _zx:uint = 17;
    public static const _K_H_:uint = 18;
    public static const _wl:uint = 19;
    public static const _08Q_:uint = 20;
    public static const _q0:uint = 21;
    public static const _l0:uint = 22;
    public static const _Z_A_:uint = 23;
    public static const _0_x:uint = 24;
    public static const _0_H_:uint = 25;
    public static const _0H_7:uint = 26;
    public static const _qn:uint = 27;
    public static const _tq:uint = 28;
    public static const _03w:uint = 29;
    public static const _r3:uint = (1 << (_em - 1));
    public static const _I_T_:uint = (1 << (_xc - 1));
    public static const _0F_g:uint = (1 << (_V_H_ - 1));
    public static const _sm:uint = (1 << (_0D_Z_ - 1));
    public static const _q_:uint = (1 << (_vJ_ - 1));
    public static const _02V_:uint = (1 << (_030 - 1));
    public static const _0G_k:uint = (1 << (_V_Z_ - 1));
    public static const _E_t:uint = (1 << (_2p - 1));
    public static const _N_6:uint = (1 << (_01n - 1));
    public static const _gY_:uint = (1 << (_tq - 1));
    public static const _0E_l:uint = (1 << (_02w - 1));
    public static const _0E_2:uint = (1 << (_03w - 1));
    public static const _pE_:uint = (1 << (_o9 - 1));
    public static const _tY_:uint = (1 << (_xn - 1));
    public static const _X_9:uint = (1 << (_vH_ - 1));
    public static const _O_3:uint = (1 << (_T_q - 1));
    public static const _c_:uint = (1 << (_K_J_ - 1));
    public static const _U_M_:uint = (1 << (_iM_ - 1));
    public static const _Q_v:uint = (1 << (_zx - 1));
    public static const _4_:uint = (1 << (_K_H_ - 1));
    public static const _00L_:uint = (1 << (_wl - 1));
    public static const _X_D_:uint = (1 << (_08Q_ - 1));
    public static const _Z_i:uint = (1 << (_q0 - 1));
    public static const _O_Y_:uint = (1 << (_l0 - 1));
    public static const _uK_:uint = (1 << (_Z_A_ - 1));
    public static const _0K__:uint = (1 << (_0_x - 1));
    public static const _cV_:uint = (1 << (_0_H_ - 1));
    public static const _3M_:uint = (1 << (_0H_7 - 1));
    public static const _if_:uint = (1 << (_qn - 1));
    public static const _06j:uint = (_I_T_ | _0F_g | _sm | _q_ | _02V_ | _0G_k | _E_t | _N_6 | _0E_l | _0E_2 | _pE_ | _O_3 | _c_ | _U_M_ | _4_ | _00L_ | _X_D_ | _cV_ | _3M_ | _if_);
    public static const _T_D_:uint = ((_0E_l |_0E_2 | _E_t) | _Z_i);
    private static const GLOW_FILTER:GlowFilter = new GlowFilter(0, 0.3, 6, 6, 2, BitmapFilterQuality.LOW, false, false);

    public static var effects_:Vector.<ConditionEffect> = new <ConditionEffect>[new ConditionEffect("Nothing", 0, null), new ConditionEffect("Dead", _r3, null), new ConditionEffect("Quiet", _I_T_, [32]), new ConditionEffect("Weak", _0F_g, [34, 35, 36, 37]), new ConditionEffect("Slowed", _sm, [1]), new ConditionEffect("Sick", _q_, [39]), new ConditionEffect("Dazed", _02V_, [44]), new ConditionEffect("Stunned", _0G_k, [45]), new ConditionEffect("Blind", _E_t, [41]), new ConditionEffect("Hallucinating", _N_6, [42]), new ConditionEffect("Drunk", _0E_l, [43]), new ConditionEffect("Confused", _pE_, [2]), new ConditionEffect("Stun Immume", _tY_, null), new ConditionEffect("Invisible", _X_9, null), new ConditionEffect("Paralyzed", _O_3, [53, 54]), new ConditionEffect("Speedy", _c_, [0]), new ConditionEffect("Bleeding", _U_M_, [46]), new ConditionEffect("Not Used", _Q_v, null), new ConditionEffect("Healing", _4_, [47]), new ConditionEffect("Damaging", _00L_, [49]), new ConditionEffect("Berserk", _X_D_, [50]), new ConditionEffect("Paused", _Z_i, null), new ConditionEffect("Stasis", _O_Y_, null), new ConditionEffect("Stasis Immune", _uK_, null), new ConditionEffect("Invincible", _0K__, null), new ConditionEffect("Invulnerable", _cV_, [17]), new ConditionEffect("Armored", _3M_, [16]), new ConditionEffect("Armor Broken", _if_, [55]), new ConditionEffect("blureffect", _0E_2, [56]), new ConditionEffect("Hexed", _gY_, [42])];
    private static var _K_3:Object = null;
    private static var _ua:Object = null;

    public static function _0I_W_(_arg1:String):uint {
        var _local2:uint;
        if (_K_3 == null) {
            _K_3 = {};
            _local2 = 0;
            while (_local2 < effects_.length) {
                _K_3[effects_[_local2].name_] = _local2;
                _local2++;
            }
        }
        return (_K_3[_arg1]);
    }

    public static function _a4(_arg1:uint, _arg2:Vector.<BitmapData>, _arg3:int):void {
        var _local4:uint;
        var _local5:uint;
        var _local6:Vector.<BitmapData>;
        while (_arg1 != 0) {
            _local4 = (_arg1 & (_arg1 - 1));
            _local5 = (_arg1 ^ _local4);
            _local6 = _xt(_local5);
            if (_local6 != null) {
                _arg2.push(_local6[(_arg3 % _local6.length)]);
            }
            _arg1 = _local4;
        }
    }

    private static function _xt(_arg1:uint):Vector.<BitmapData> {
        var _local2:Matrix;
        var _local3:uint;
        var _local4:Vector.<BitmapData>;
        var _local5:int;
        var _local6:BitmapData;
        if (_ua == null) {
            _ua = {};
            _local2 = new Matrix();
            _local2.translate(4, 4);
            _local3 = 0;
            while (_local3 < effects_.length) {
                _local4 = null;
                if (effects_[_local3].iconOffsets_ != null) {
                    _local4 = new Vector.<BitmapData>();
                    _local5 = 0;
                    while (_local5 < effects_[_local3].iconOffsets_.length) {
                        _local6 = new BitmapData(16, 16, true, 0);
                        _local6.draw(AssetLibrary._xK_("lofiInterface2", effects_[_local3].iconOffsets_[_local5]), _local2);
                        _local6 = TextureRedrawer.outlineGlow(_local6, 0, 0xFFFFFFFF);
                        _local6.applyFilter(_local6, _local6.rect, PointUtil._P_5, GLOW_FILTER);
                        _local4.push(_local6);
                        _local5++;
                    }
                }
                _ua[effects_[_local3].bit_] = _local4;
                _local3++;
            }
        }
        return (_ua[_arg1]);
    }

    public function ConditionEffect(_arg1:String, _arg2:uint, _arg3:Array) {
        this.name_ = _arg1;
        this.bit_ = _arg2;
        this.iconOffsets_ = _arg3;
    }
    public var name_:String;
    public var bit_:uint;
    public var iconOffsets_:Array;

}
}//package com.company.assembleegameclient.util

