// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.messages.data.StatData

package com.company.assembleegameclient.net.messages.data {
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class StatData {

    public static const _0I_1:int = 0;
    public static const _V_A_:int = 1;
    public static const _g0:int = 2;
    public static const _079:int = 3;
    public static const _aC_:int = 4;
    public static const _K_P_:int = 5;
    public static const _0_8:int = 6;
    public static const _70:int = 7;
    public static const _0R_:int = 20;
    public static const _sw:int = 21;
    public static const _00l:int = 22;
    public static const INVENTORY_0_STAT:int = 8;
    public static const INVENTORY_1_STAT:int = 9;
    public static const INVENTORY_2_STAT:int = 10;
    public static const INVENTORY_3_STAT:int = 11;
    public static const INVENTORY_4_STAT:int = 12;
    public static const INVENTORY_5_STAT:int = 13;
    public static const INVENTORY_6_STAT:int = 14;
    public static const INVENTORY_7_STAT:int = 15;
    public static const INVENTORY_8_STAT:int = 16;
    public static const INVENTORY_9_STAT:int = 17;
    public static const INVENTORY_10_STAT:int = 18;
    public static const INVENTORY_11_STAT:int = 19;
    public static const _S_2:int = 26;
    public static const _0G_F_:int = 27;
    public static const _0J_z:int = 28;
    public static const _x_:int = 29;
    public static const _s9:int = 30;
    public static const _hK_:int = 31;
    public static const TEX1_STAT:int = 32;
    public static const TEX2_STAT:int = 33;
    public static const _K_u:int = 34;
    public static const _Q_c:int = 35;
    public static const _h1:int = 36;
    public static const _1m:int = 37;
    public static const _Z_N_:int = 38;
    public static const _0M_V_:int = 39;
    public static const _06_:int = 40;
    public static const _3y:int = 41;
    public static const _e7:int = 42;
    public static const _ud:int = 43;
    public static const _V_c:int = 44;
    public static const _H_I_:int = 45;
    public static const _P_z:int = 46;
    public static const _vc:int = 47;
    public static const _06o:int = 48;
    public static const _07D_:int = 49;
    public static const _7F_:int = 50;
    public static const _rx:int = 51;
    public static const _wT_:int = 52;
    public static const _0M_9:int = 53;
    public static const _0E_c:int = 54;
    public static const _4z:int = 55;
    public static const _m0:int = 56;
    public static const _03k:int = 57;
    public static const _dR_:int = 58;
    public static const _095:int = 59;
    public static const _hi:int = 60;
    public static const _0F_5:int = 61;
    public static const _07q:int = 62;
    public static const _L_i:int = 63;
    public static const _5J_:int = 64;
    public static const _bk:int = 65;
    public static const SKIN_STAT:int = 66;
    public static const PVP_STAT:int = 67;
    public static const TEAM_STAT:int = 68;
    public static const KEYS:int = 69;
    public static const CANNEXUS:int = 70;
    public static const PARTY_STAT:int = 71;
    public static const PARTY_LEADER_STAT:int = 72;
    public static const INVDATA_0_STAT:int = 73;
    public static const INVDATA_1_STAT:int = 74;
    public static const INVDATA_2_STAT:int = 75;
    public static const INVDATA_3_STAT:int = 76;
    public static const INVDATA_4_STAT:int = 77;
    public static const INVDATA_5_STAT:int = 78;
    public static const INVDATA_6_STAT:int = 79;
    public static const INVDATA_7_STAT:int = 80;
    public static const INVDATA_8_STAT:int = 81;
    public static const INVDATA_9_STAT:int = 82;
    public static const INVDATA_10_STAT:int = 83;
    public static const INVDATA_11_STAT:int = 84;
    public static const EFFECT_STAT:int = 85;
    public static const _luckData:int = 120;
    public static const _critData:int = 121;
    public static const _luckBonus:int = 120;
    public static const _critBonus:int = 121;
   /* public static const Backpack1_0:int = 86;
    public static const Backpack1_1:int = 87;
    public static const Backpack1_2:int = 88;
    public static const Backpack1_3:int = 89;
    public static const Backpack1_4:int = 90;
    public static const Backpack1_5:int = 91;
    public static const Backpack1_6:int = 92;
    public static const Backpack1_7:int = 93;
    public static const Backpack2_0:int = 94;
    public static const Backpack2_1:int = 95;
    public static const Backpack2_2:int = 96;
    public static const Backpack2_3:int = 97;
    public static const Backpack2_4:int = 98;
    public static const Backpack2_5:int = 99;
    public static const Backpack2_6:int = 100;
    public static const Backpack2_7:int = 101;
    public static const HasBackpack1:int = 102;
    public static const HasBackpack2:int = 103;
    public static const InvData12:int = 104;
    public static const InvData13:int = 105;
    public static const InvData14:int = 106;
    public static const InvData15:int = 107;
    public static const InvData16:int = 108;
    public static const InvData17:int = 109;
    public static const InvData18:int = 110;
    public static const InvData19:int = 111;
    public static const InvData20:int = 112;
    public static const InvData21:int = 113;
    public static const InvData22:int = 114;
    public static const InvData23:int = 115;
    public static const InvData24:int = 116;
    public static const InvData25:int = 117;
    public static const InvData26:int = 118;
    public static const InvData27:int = 119; */

    public static function _W_H_(_arg1:int):String {
        switch (_arg1) {
            case _0I_1:
                return ("Maximum HP");
            case _V_A_:
                return ("HP");
            case _g0:
                return ("Size");
            case _079:
                return ("Maximum MP");
            case _aC_:
                return ("MP");
            case _0_8:
                return ("XP");
            case _70:
                return ("Level");
            case _0R_:
                return ("Attack");
            case _sw:
                return ("Defense");
            case _00l:
                return ("Speed");
            case _S_2:
                return ("Vitality");
            case _0G_F_:
                return ("Wisdom");
            case _0J_z:
                return ("Dexterity");
            case _luckData:
              return ("Luck");
            case _critData:
              return ("Critical");
        }
        return ("Unknown Stat");
    }
    public var _0F_4:uint = 0;
    public var _h:int;
    public var _3x:String;

    public function _I_3():Boolean {
        switch (this._0F_4) {
            case _hK_:
            case _07q:
            case INVDATA_0_STAT:
            case INVDATA_1_STAT:
            case INVDATA_2_STAT:
            case INVDATA_3_STAT:
            case INVDATA_4_STAT:
            case INVDATA_5_STAT:
            case INVDATA_6_STAT:
            case INVDATA_7_STAT:
            case INVDATA_8_STAT:
            case INVDATA_9_STAT:
            case INVDATA_10_STAT:
            case INVDATA_11_STAT:
         /*   case InvData12:
            case InvData13:
            case InvData14:
            case InvData15:
            case InvData16:
            case InvData17:
            case InvData18:
            case InvData19:
            case InvData20:
            case InvData21:
            case InvData22:
            case InvData23:
            case InvData24:
            case InvData25:
            case InvData26:
            case InvData27: */
            case EFFECT_STAT:
                return (true);
        }
        return (false);
    }

    public function parseFromInput(_arg1:IDataInput):void {
        this._0F_4 = _arg1.readUnsignedByte();
        if (!this._I_3()) {
            this._h = _arg1.readInt();
        } else {
            this._3x = _arg1.readUTF();
        }
    }

    public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeByte(this._0F_4);
        if (!this._I_3()) {
            _arg1.writeInt(this._h);
        } else {
            _arg1.writeUTF(this._3x);
        }
    }

    public function toString():String {
        if (!this._I_3()) {
            return ((((("[" + this._0F_4) + ": ") + this._h) + "]"));
        }
        return ((((("[" + this._0F_4) + ': "') + this._3x) + '"]'));
    }

}
}//package com.company.assembleegameclient.net.messages.data

