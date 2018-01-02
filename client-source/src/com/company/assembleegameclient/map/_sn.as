// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._sn

package com.company.assembleegameclient.map {
import flash.utils.Dictionary;

public class _sn {

    public static const _Q_F_:Dictionary = new Dictionary();

    public static var _pb:Dictionary = new Dictionary();

    public static function _nY_(_arg1:XML):void {
        var _local2:XML;
        var _local3:int;
        for each (_local2 in _arg1.Region) {
            _local3 = int(_local2.@type);
            _Q_F_[_local3] = _local2;
            _pb[String(_local2.@id)] = _local3;
        }
    }

    public static function _6H_(_arg1:int):String {
        var _local2:XML = _Q_F_[_arg1];
        if (_local2 == null) {
            return (null);
        }
        return (String(_local2.@id));
    }

    public static function getColor(_arg1:int):uint {
        var _local2:XML = _Q_F_[_arg1];
        if (_local2 == null) {
            return (0);
        }
        return (uint(_local2.Color));
    }

}
}//package com.company.assembleegameclient.map

