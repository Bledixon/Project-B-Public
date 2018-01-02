// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util._wW_

package com.company.assembleegameclient.util {
import flash.utils.Dictionary;


public class _wW_ {

    private static var _aI_:Dictionary = new Dictionary();

    public static function _B_1(_arg1:Class):Object {
        var _local2:Vector.<Object> = _aI_[_arg1];
        if (_local2 == null) {
            _local2 = new Vector.<Object>();
            _aI_[_arg1] = _local2;
        } else {
            if (_local2.length > 0) {
                return (_local2.pop());
            }
        }
        return (new (_arg1)());
    }

    public static function _7L_(_arg1:*, _arg2:Object):void {
        var _local3:Vector.<Object> = _aI_[_arg1];
        if (_local3 == null) {
            _local3 = new Vector.<Object>();
            _aI_[_arg1] = _local3;
        }
        _local3.push(_arg2);
    }

    public static function getObject(_arg1:*):Object {
        var _local2:Vector.<Object> = _aI_[_arg1];
        if (((!((_local2 == null))) && ((_local2.length > 0)))) {
            return (_local2.pop());
        }
        return (null);
    }

    public static function dump(_arg1:*):void {
        delete _aI_[_arg1];
    }

    public static function _ay(_arg1:Object):void {
        var _local2:Class = Object(_arg1).constructor;
        var _local3:Vector.<Object> = _aI_[_local2];
        if (_local3 == null) {
            _local3 = new Vector.<Object>();
            _aI_[_local2] = _local3;
        }
        _local3.push(_arg1);
    }

}
}//package com.company.assembleegameclient.util

