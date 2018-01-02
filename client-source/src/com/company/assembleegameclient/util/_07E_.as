// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util._07E_

package com.company.assembleegameclient.util {
import flash.display.BitmapData;

import com.company.util.AssetLibrary;

public class _07E_ {

    public static const _P_J_:int = 0;
    public static const _uc:int = 10;
    public static const _f3:int = 20;
    public static const _tS_:int = 30;
    public static const _0C_o:int = 40;
    public static const _27:int = 50;

    public static function _0C_n(_arg1:int):String {
        switch (_arg1) {
            case _P_J_:
                return ("Initiate");
            case _uc:
                return ("Member");
            case _f3:
                return ("Officer");
            case _tS_:
                return ("Leader");
            case _0C_o:
                return ("Founder");
        }
        return ("Unknown");
    }

    public static function _wS_(_arg1:int, _arg2:int):BitmapData {
        var _local3:BitmapData;
        switch (_arg1) {
            case _P_J_:
                _local3 = AssetLibrary._xK_("lofiInterfaceBig", 20);
                break;
            case _uc:
                _local3 = AssetLibrary._xK_("lofiInterfaceBig", 19);
                break;
            case _f3:
                _local3 = AssetLibrary._xK_("lofiInterfaceBig", 18);
                break;
            case _tS_:
                _local3 = AssetLibrary._xK_("lofiInterfaceBig", 17);
                break;
            case _0C_o:
                _local3 = AssetLibrary._xK_("lofiInterfaceBig", 16);
                break;
        }
        return (TextureRedrawer.redraw(_local3, _arg2, true, 0, 0, true));
    }

    public static function _oO_(_arg1:int):BitmapData {
        var _local2:BitmapData = AssetLibrary._xK_("lofiObj3", 226);
        return (TextureRedrawer.redraw(_local2, _arg1, true, 0, 0, true));
    }

    public static function _W__(_arg1:int, _arg2:int, _arg3:int):Boolean {
        if (_arg2 == _arg3) {
            return (false);
        }
        if ((((((_arg1 == _0C_o)) && ((_arg2 < _0C_o)))) && ((_arg3 < _0C_o)))) {
            return (true);
        }
        if ((((((_arg1 == _tS_)) && ((_arg2 < _tS_)))) && ((_arg3 <= _tS_)))) {
            return (true);
        }
        if ((((((_arg1 == _f3)) && ((_arg2 < _f3)))) && ((_arg3 < _f3)))) {
            return (true);
        }
        return (false);
    }

    public static function _0H_q(_arg1:int):int {
        switch (_arg1) {
            case _P_J_:
                return (_uc);
            case _uc:
                return (_f3);
            case _f3:
                return (_tS_);
        }
        return (_0C_o);
    }

    public static function _0D_e(_arg1:int, _arg2:int):Boolean {
        var _local3:int = _0H_q(_arg2);
        return (_W__(_arg1, _arg2, _local3));
    }

    public static function _4J_(_arg1:int):int {
        switch (_arg1) {
            case _f3:
                return (_uc);
            case _tS_:
                return (_f3);
            case _0C_o:
                return (_tS_);
        }
        return (_P_J_);
    }

    public static function _z0(_arg1:int, _arg2:int):Boolean {
        var _local3:int = _4J_(_arg2);
        return (_W__(_arg1, _arg2, _local3));
    }

    public static function _dn(_arg1:int, _arg2:int):Boolean {
        return ((((_arg1 >= _f3)) && ((_arg2 < _arg1))));
    }

}
}//package com.company.assembleegameclient.util

