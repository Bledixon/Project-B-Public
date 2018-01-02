// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._pf

package com.company.assembleegameclient.map {
import flash.utils.Dictionary;

import com.company.assembleegameclient.objects._Z_H_;

import flash.display.BitmapData;

import com.company.util.BitmapUtil;

public class _pf {

    public static const _020:Dictionary = new Dictionary();
    public static const _Q_F_:Dictionary = new Dictionary();
    public static const _V_a:Dictionary = new Dictionary();
    public static var _pb:Dictionary = new Dictionary();
    public static var _w8:_C_O_;
    private static var _G_x:Dictionary = new Dictionary();

    public static function _nY_(_arg1:XML):void {
        var _local2:XML;
        var _local3:int;
        for each (_local2 in _arg1.Ground) {
            _local3 = int(_local2.@type);
            _020[_local3] = new _C_O_(_local2);
            _Q_F_[_local3] = _local2;
            _V_a[_local3] = new _Z_H_(_local2);
            _pb[String(_local2.@id)] = _local3;
        }
        _w8 = _020[0xFF];
    }

    public static function _6H_(_arg1:int):String {
        var _local2:_C_O_ = _020[_arg1];
        if (_local2 == null) {
            return (null);
        }
        return (_local2.id_);
    }

    public static function getBitmapData(_arg1:int, _arg2:int = 0):BitmapData {
        return (_V_a[_arg1].getTexture(_arg2));
    }

    public static function getColor(_arg1:int):uint {
        var _local2:XML;
        var _local3:uint;
        var _local4:BitmapData;
        if (!_G_x.hasOwnProperty(String(_arg1))) {
            _local2 = _Q_F_[_arg1];
            if (_local2.hasOwnProperty("Color")) {
                _local3 = uint(_local2.Color);
            } else {
                _local4 = getBitmapData(_arg1);
                _local3 = BitmapUtil._B_n(_local4);
            }
            _G_x[_arg1] = _local3;
        }
        return (_G_x[_arg1]);
    }

}
}//package com.company.assembleegameclient.map

