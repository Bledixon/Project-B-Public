// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_K_D_._mapdetails

package _K_D_ {
import _0D_n._throw;
import _0D_n._P_I_;

import com.company.assembleegameclient.map._X_l;
import com.company.util.IntPoint;
import com.company.assembleegameclient.objects.GameObject;
import com.hurlant.util.Base64;

import flash.utils.ByteArray;

import com.company.assembleegameclient.map._pf;
import com.company.assembleegameclient.objects.BasicObject;
import com.company.assembleegameclient.objects.ObjectLibrary;

public class _mapdetails {

    private static const _N_G_:_throw = _P_I_._dJ_();

    public static function _0L_k(_arg1:String):_X_l {
        var _local2:Object = _N_G_.parse(_arg1);
        var _local3:_X_l = new _X_l(null);
        _local3.setProps(_local2["width"], _local2["height"], _local2["name"], _local2["back"], false, false, "Menu", 0);
        _local3.initialize();
        _4q(_local2, _local3, 0, 0);
        return (_local3);
    }

    public static function _T_6(_arg1:String, _arg2:_X_l, _arg3:int, _arg4:int):void {
        var _local5:Object = _N_G_.parse(_arg1);
        _4q(_local5, _arg2, _arg3, _arg4);
    }

    public static function _0M_t(_arg1:String):IntPoint {
        var _local2:Object = _N_G_.parse(_arg1);
        return (new IntPoint(_local2["width"], _local2["height"]));
    }

    public static function _A_s(_arg1:Object):GameObject {
        var _local2:int = ObjectLibrary._pb[_arg1["id"]];
        var _local3:XML = ObjectLibrary._Q_F_[_local2];
        var _local4:GameObject = ObjectLibrary._075(_local2);
        _local4.size_ = ((_arg1.hasOwnProperty("size")) ? _arg1["size"] : _local4.props_._0M_t());
        return (_local4);
    }

    private static function _4q(_arg1:Object, _arg2:_X_l, _arg3:int, _arg4:int):void {
        var _local7:int;
        var _local8:int;
        var _local9:Object;
        var _local10:Array;
        var _local11:int;
        var _local12:Object;
        var _local13:GameObject;
        var _local5:ByteArray = Base64.decodeToByteArray(_arg1["data"]);
        _local5.uncompress();
        var _local6:Array = _arg1["dict"];
        _local7 = _arg4;
        while (_local7 < (_arg4 + _arg1["height"])) {
            _local8 = _arg3;
            while (_local8 < (_arg3 + _arg1["width"])) {
                _local9 = _local6[_local5.readShort()];
                if (!(((((((_local8 < 0)) || ((_local8 >= _arg2.width_)))) || ((_local7 < 0)))) || ((_local7 >= _arg2.height_)))) {
                    if (_local9.hasOwnProperty("ground")) {
                        _local11 = _pf._pb[_local9["ground"]];
                        _arg2.setGroundTile(_local8, _local7, _local11);
                    }
                    _local10 = _local9["objs"];
                    if (_local10 != null) {
                        for each (_local12 in _local10) {
                            _local13 = _A_s(_local12);
                            _local13.objectId_ = BasicObject._7y();
                            _arg2.addObj(_local13, (_local8 + 0.5), (_local7 + 0.5));
                        }
                    }
                }
                _local8++;
            }
            _local7++;
        }
    }

}
}//package _K_D_

