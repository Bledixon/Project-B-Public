// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util.GUID

package com.company.assembleegameclient.util {
import flash.system.Capabilities;

public class GUID {

    private static var counter:Number = 0;

    public static function create():String {
        var _local1:Date = new Date();
        var _local2:Number = _local1.time;
        var _local3:Number = (Math.random() * Number.MAX_VALUE);
        var _local4:String = Capabilities.serverString;
        return (_0D_4((((_local2 + _local4) + _local3) + counter++)).toUpperCase());
    }

    private static function _0D_4(_arg1:String):String {
        return (_042(_arg1));
    }

    private static function _042(_arg1:String):String {
        return (_rD_(_08X_(_K_G_(_arg1), (_arg1.length * 8))));
    }

    private static function _08X_(_arg1:Array, _arg2:Number):Array {
        var _local10:Number;
        var _local11:Number;
        var _local12:Number;
        var _local13:Number;
        var _local14:Number;
        var _local15:Number;
        var _local16:Number;
        _arg1[(_arg2 >> 5)] = (_arg1[(_arg2 >> 5)] | (128 << (24 - (_arg2 % 32))));
        _arg1[((((_arg2 + 64) >> 9) << 4) + 15)] = _arg2;
        var _local3:Array = new Array(80);
        var _local4:Number = 1732584193;
        var _local5:Number = -271733879;
        var _local6:Number = -1732584194;
        var _local7:Number = 271733878;
        var _local8:Number = -1009589776;
        var _local9:Number = 0;
        while (_local9 < _arg1.length) {
            _local10 = _local4;
            _local11 = _local5;
            _local12 = _local6;
            _local13 = _local7;
            _local14 = _local8;
            _local15 = 0;
            while (_local15 < 80) {
                if (_local15 < 16) {
                    _local3[_local15] = _arg1[(_local9 + _local15)];
                } else {
                    _local3[_local15] = rol((((_local3[(_local15 - 3)] ^ _local3[(_local15 - 8)]) ^ _local3[(_local15 - 14)]) ^ _local3[(_local15 - 16)]), 1);
                }
                _local16 = _ea(_ea(rol(_local4, 5), sha1_ft(_local15, _local5, _local6, _local7)), _ea(_ea(_local8, _local3[_local15]), sha1_kt(_local15)));
                _local8 = _local7;
                _local7 = _local6;
                _local6 = rol(_local5, 30);
                _local5 = _local4;
                _local4 = _local16;
                _local15++;
            }
            _local4 = _ea(_local4, _local10);
            _local5 = _ea(_local5, _local11);
            _local6 = _ea(_local6, _local12);
            _local7 = _ea(_local7, _local13);
            _local8 = _ea(_local8, _local14);
            _local9 = (_local9 + 16);
        }
        return ([_local4, _local5, _local6, _local7, _local8]);
    }

    private static function sha1_ft(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number):Number {
        if (_arg1 < 20) {
            return (((_arg2 & _arg3) | (~(_arg2) & _arg4)));
        }
        if (_arg1 < 40) {
            return (((_arg2 ^ _arg3) ^ _arg4));
        }
        if (_arg1 < 60) {
            return ((((_arg2 & _arg3) | (_arg2 & _arg4)) | (_arg3 & _arg4)));
        }
        return (((_arg2 ^ _arg3) ^ _arg4));
    }

    private static function sha1_kt(_arg1:Number):Number {
        return ((((_arg1) < 20) ? 1518500249 : (((_arg1) < 40) ? 1859775393 : (((_arg1) < 60) ? -1894007588 : -899497514))));
    }

    private static function _ea(_arg1:Number, _arg2:Number):Number {
        var _local3:Number = ((_arg1 & 0xFFFF) + (_arg2 & 0xFFFF));
        var _local4:Number = (((_arg1 >> 16) + (_arg2 >> 16)) + (_local3 >> 16));
        return (((_local4 << 16) | (_local3 & 0xFFFF)));
    }

    private static function rol(_arg1:Number, _arg2:Number):Number {
        return (((_arg1 << _arg2) | (_arg1 >>> (32 - _arg2))));
    }

    private static function _K_G_(_arg1:String):Array {
        var _local2:Array = [];
        var _local3:Number = ((1 << 8) - 1);
        var _local4:Number = 0;
        while (_local4 < (_arg1.length * 8)) {
            _local2[(_local4 >> 5)] = (_local2[(_local4 >> 5)] | ((_arg1.charCodeAt((_local4 / 8)) & _local3) << (24 - (_local4 % 32))));
            _local4 = (_local4 + 8);
        }
        return (_local2);
    }

    private static function _rD_(_arg1:Array):String {
        var _local2:String = String("");
        var _local3:String = String("0123456789abcdef");
        var _local4:Number = 0;
        while (_local4 < (_arg1.length * 4)) {
            _local2 = (_local2 + (_local3.charAt(((_arg1[(_local4 >> 2)] >> (((3 - (_local4 % 4)) * 8) + 4)) & 15)) + _local3.charAt(((_arg1[(_local4 >> 2)] >> ((3 - (_local4 % 4)) * 8)) & 15))));
            _local4++;
        }
        return (_local2);
    }

}
}//package com.company.assembleegameclient.util

