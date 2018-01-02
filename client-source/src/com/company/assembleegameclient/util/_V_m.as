﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util._V_m

package com.company.assembleegameclient.util {
import flash.geom.Rectangle;
import flash.geom.Point;

import com.company.util._kp;

import flash.utils.ByteArray;
import flash.display.BitmapData;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.map._pf;
import com.company.assembleegameclient.map.Square;
import com.company.assembleegameclient.map._X_l;
import com.company.util.AssetLibrary;
import com.company.util.BitmapUtil;
import com.company.assembleegameclient.map._C_O_;
import com.company.util.PointUtil;


public class _V_m {

    private static const rect0:Rectangle = new Rectangle(0, 0, 4, 4);
    private static const p0:Point = new Point(0, 0);
    private static const rect1:Rectangle = new Rectangle(4, 0, 4, 4);
    private static const p1:Point = new Point(4, 0);
    private static const rect2:Rectangle = new Rectangle(0, 4, 4, 4);
    private static const p2:Point = new Point(0, 4);
    private static const rect3:Rectangle = new Rectangle(4, 4, 4, 4);
    private static const p3:Point = new Point(4, 4);
    private static const __in:int = 0;
    private static const SIDE0:int = 1;
    private static const SIDE1:int = 2;
    private static const _pR_:int = 3;
    private static const INNERP1:int = 4;
    private static const INNERP2:int = 5;
    private static const _7P_:Vector.<Vector.<_kp>> = _sE_();
    private static const RECT01:Rectangle = new Rectangle(0, 0, 8, 4);
    private static const RECT13:Rectangle = new Rectangle(4, 0, 4, 8);
    private static const RECT23:Rectangle = new Rectangle(0, 4, 8, 4);
    private static const RECT02:Rectangle = new Rectangle(0, 0, 4, 8);
    private static const RECT0:Rectangle = new Rectangle(0, 0, 4, 4);
    private static const RECT1:Rectangle = new Rectangle(4, 0, 4, 4);
    private static const RECT2:Rectangle = new Rectangle(0, 4, 4, 4);
    private static const RECT3:Rectangle = new Rectangle(4, 4, 4, 4);
    private static const POINT0:Point = new Point(0, 0);
    private static const POINT1:Point = new Point(4, 0);
    private static const POINT2:Point = new Point(0, 4);
    private static const POINT3:Point = new Point(4, 4);

    private static var cache_:Vector.<Object> = new <Object>[null, {}];

    public static function redraw(_arg1:Square, _arg2:Boolean):BitmapData {
        var _local3:ByteArray;
        var _local5:BitmapData;
        if (Parameters._R_P_ == 0) {
            return (null);
        }
        if (_arg1.tileType_ == 253) {
            _local3 = _nP_(_arg1);
        } else {
            if (_arg1.props_._0H_U_) {
                _local3 = _y0(_arg1);
            } else {
                _local3 = _00P_(_arg1);
            }
        }
        if (_local3 == null) {
            return (null);
        }
        var _local4:Object = cache_[Parameters._R_P_];
        if (_local4.hasOwnProperty(String(_local3))) {
            return (_local4[_local3]);
        }
        if (_arg1.tileType_ == 253) {
            _local5 = _0J_j(_local3);
            _local4[_local3] = _local5;
            return (_local5);
        }
        if (_arg1.props_._0H_U_) {
            _local5 = _0D_A_(_local3);
            _local4[_local3] = _local5;
            return (_local5);
        }
        var _local6:Boolean;
        var _local7:Boolean;
        var _local8:Boolean;
        var _local9:Boolean;
        if (_local3[1] != _local3[4]) {
            _local6 = true;
            _local7 = true;
        }
        if (_local3[3] != _local3[4]) {
            _local6 = true;
            _local8 = true;
        }
        if (_local3[5] != _local3[4]) {
            _local7 = true;
            _local9 = true;
        }
        if (_local3[7] != _local3[4]) {
            _local8 = true;
            _local9 = true;
        }
        if (((!(_local6)) && (!((_local3[0] == _local3[4]))))) {
            _local6 = true;
        }
        if (((!(_local7)) && (!((_local3[2] == _local3[4]))))) {
            _local7 = true;
        }
        if (((!(_local8)) && (!((_local3[6] == _local3[4]))))) {
            _local8 = true;
        }
        if (((!(_local9)) && (!((_local3[8] == _local3[4]))))) {
            _local9 = true;
        }
        if (((((((!(_local6)) && (!(_local7)))) && (!(_local8)))) && (!(_local9)))) {
            _local4[_local3] = null;
            return (null);
        }
        var _local10:BitmapData = _pf.getBitmapData(_arg1.tileType_);
        if (_arg2) {
            _local5 = _local10.clone();
        } else {
            _local5 = new BitmapData(_local10.width, _local10.height, true, 0);
        }
        if (_local6) {
            _072(_local5, rect0, p0, _7P_[0], _local3[4], _local3[3], _local3[0], _local3[1]);
        }
        if (_local7) {
            _072(_local5, rect1, p1, _7P_[1], _local3[4], _local3[1], _local3[2], _local3[5]);
        }
        if (_local8) {
            _072(_local5, rect2, p2, _7P_[2], _local3[4], _local3[7], _local3[6], _local3[3]);
        }
        if (_local9) {
            _072(_local5, rect3, p3, _7P_[3], _local3[4], _local3[5], _local3[8], _local3[7]);
        }
        _local4[_local3] = _local5;
        return (_local5);
    }

    private static function _072(_arg1:BitmapData, _arg2:Rectangle, _arg3:Point, _arg4:Vector.<_kp>, _arg5:uint, _arg6:uint, _arg7:uint, _arg8:uint):void {
        var _local9:BitmapData;
        var _local10:BitmapData;
        if ((((_arg5 == _arg6)) && ((_arg5 == _arg8)))) {
            _local10 = _arg4[_pR_].random();
            _local9 = _pf.getBitmapData(_arg7);
        } else {
            if (((!((_arg5 == _arg6))) && (!((_arg5 == _arg8))))) {
                if (_arg6 != _arg8) {
                    _arg1.copyPixels(_pf.getBitmapData(_arg6), _arg2, _arg3, _arg4[INNERP1].random(), p0, true);
                    _arg1.copyPixels(_pf.getBitmapData(_arg8), _arg2, _arg3, _arg4[INNERP2].random(), p0, true);
                    return;
                }
                _local10 = _arg4[__in].random();
                _local9 = _pf.getBitmapData(_arg6);
            } else {
                if (_arg5 != _arg6) {
                    _local10 = _arg4[SIDE0].random();
                    _local9 = _pf.getBitmapData(_arg6);
                } else {
                    _local10 = _arg4[SIDE1].random();
                    _local9 = _pf.getBitmapData(_arg8);
                }
            }
        }
        _arg1.copyPixels(_local9, _arg2, _arg3, _local10, p0, true);
    }

    private static function _00P_(_arg1:Square):ByteArray {
        var _local6:int;
        var _local7:Square;
        var _local2:ByteArray = new ByteArray();
        var _local3:_X_l = _arg1.map_;
        var _local4:uint = _arg1.tileType_;
        var _local5:int = (_arg1.y_ - 1);
        while (_local5 <= (_arg1.y_ + 1)) {
            _local6 = (_arg1.x_ - 1);
            while (_local6 <= (_arg1.x_ + 1)) {
                if ((((((((((_local6 < 0)) || ((_local6 >= _local3.width_)))) || ((_local5 < 0)))) || ((_local5 >= _local3.height_)))) || ((((_local6 == _arg1.x_)) && ((_local5 == _arg1.y_)))))) {
                    _local2.writeByte(_local4);
                } else {
                    _local7 = _local3.squares_[(_local6 + (_local5 * _local3.width_))];
                    if ((((_local7 == null)) || ((_local7.props_._9r <= _arg1.props_._9r)))) {
                        _local2.writeByte(_local4);
                    } else {
                        _local2.writeByte(_local7.tileType_);
                    }
                }
                _local6++;
            }
            _local5++;
        }
        return (_local2);
    }

    private static function _sE_():Vector.<Vector.<_kp>> {
        var _local1:Vector.<Vector.<_kp>> = new Vector.<Vector.<_kp>>();
        _0E_E_(_local1, AssetLibrary._18("inner_mask"), AssetLibrary._18("sides_mask"), AssetLibrary._18("outer_mask"), AssetLibrary._18("innerP1_mask"), AssetLibrary._18("innerP2_mask"));
        return (_local1);
    }

    private static function _0E_E_(_arg1:Vector.<Vector.<_kp>>, _arg2:_kp, _arg3:_kp, _arg4:_kp, _arg5:_kp, _arg6:_kp):void {
        var _local7:int;
        for each (_local7 in [-1, 0, 2, 1]) {
            _arg1.push(new <_kp>[_0G_q(_arg2, _local7), _0G_q(_arg3, (_local7 - 1)), _0G_q(_arg3, _local7), _0G_q(_arg4, _local7), _0G_q(_arg5, _local7), _0G_q(_arg6, _local7)]);
        }
    }

    private static function _0G_q(_arg1:_kp, _arg2:int):_kp {
        var _local4:BitmapData;
        var _local3:_kp = new _kp();
        for each (_local4 in _arg1._W_u) {
            _local3.add(BitmapUtil._c(_local4, _arg2));
        }
        return (_local3);
    }

    private static function _nP_(_arg1:Square):ByteArray {
        var _local14:Square;
        var _local15:Square;
        var _local16:Square;
        var _local17:Square;
        var _local2:ByteArray = new ByteArray();
        _local2.length = 4;
        var _local3:_X_l = _arg1.map_;
        var _local4:int = _arg1.x_;
        var _local5:int = _arg1.y_;
        var _local6:Square = _local3.lookupSquare(_local4, (_local5 - 1));
        var _local7:Square = _local3.lookupSquare((_local4 - 1), _local5);
        var _local8:Square = _local3.lookupSquare((_local4 + 1), _local5);
        var _local9:Square = _local3.lookupSquare(_local4, (_local5 + 1));
        var _local10:int = (((_local6) != null) ? _local6.props_._O_q : -1);
        var _local11:int = (((_local7) != null) ? _local7.props_._O_q : -1);
        var _local12:int = (((_local8) != null) ? _local8.props_._O_q : -1);
        var _local13:int = (((_local9) != null) ? _local9.props_._O_q : -1);
        if ((((_local10 < 0)) && ((_local11 < 0)))) {
            _local14 = _local3.lookupSquare((_local4 - 1), (_local5 - 1));
            _local2[0] = (((((_local14 == null)) || ((_local14.props_._O_q < 0)))) ? 0xFF : _local14.tileType_);
        } else {
            if (_local10 < _local11) {
                _local2[0] = _local7.tileType_;
            } else {
                _local2[0] = _local6.tileType_;
            }
        }
        if ((((_local10 < 0)) && ((_local12 < 0)))) {
            _local15 = _local3.lookupSquare((_local4 + 1), (_local5 - 1));
            _local2[1] = (((((_local15 == null)) || ((_local15.props_._O_q < 0)))) ? 0xFF : _local15.tileType_);
        } else {
            if (_local10 < _local12) {
                _local2[1] = _local8.tileType_;
            } else {
                _local2[1] = _local6.tileType_;
            }
        }
        if ((((_local11 < 0)) && ((_local13 < 0)))) {
            _local16 = _local3.lookupSquare((_local4 - 1), (_local5 + 1));
            _local2[2] = (((((_local16 == null)) || ((_local16.props_._O_q < 0)))) ? 0xFF : _local16.tileType_);
        } else {
            if (_local11 < _local13) {
                _local2[2] = _local9.tileType_;
            } else {
                _local2[2] = _local7.tileType_;
            }
        }
        if ((((_local12 < 0)) && ((_local13 < 0)))) {
            _local17 = _local3.lookupSquare((_local4 + 1), (_local5 + 1));
            _local2[3] = (((((_local17 == null)) || ((_local17.props_._O_q < 0)))) ? 0xFF : _local17.tileType_);
        } else {
            if (_local12 < _local13) {
                _local2[3] = _local9.tileType_;
            } else {
                _local2[3] = _local8.tileType_;
            }
        }
        return (_local2);
    }

    private static function _0J_j(_arg1:ByteArray):BitmapData {
        var _local3:BitmapData;
        var _local2:BitmapData = new BitmapData(8, 8, false, 0);
        if (_arg1[0] != 0xFF) {
            _local3 = _pf.getBitmapData(_arg1[0]);
            _local2.copyPixels(_local3, RECT0, POINT0);
        }
        if (_arg1[1] != 0xFF) {
            _local3 = _pf.getBitmapData(_arg1[1]);
            _local2.copyPixels(_local3, RECT1, POINT1);
        }
        if (_arg1[2] != 0xFF) {
            _local3 = _pf.getBitmapData(_arg1[2]);
            _local2.copyPixels(_local3, RECT2, POINT2);
        }
        if (_arg1[3] != 0xFF) {
            _local3 = _pf.getBitmapData(_arg1[3]);
            _local2.copyPixels(_local3, RECT3, POINT3);
        }
        return (_local2);
    }

    private static function _y0(_arg1:Square):ByteArray {
        var _local7:int;
        var _local8:Square;
        var _local9:Boolean;
        var _local2:ByteArray = new ByteArray();
        var _local3:_X_l = _arg1.map_;
        var _local4:Boolean;
        var _local5:Boolean = _arg1.props_._M_e;
        var _local6:int = (_arg1.y_ - 1);
        while (_local6 <= (_arg1.y_ + 1)) {
            _local7 = (_arg1.x_ - 1);
            while (_local7 <= (_arg1.x_ + 1)) {
                _local8 = _local3.lookupSquare(_local7, _local6);
                if ((((_local7 == _arg1.x_)) && ((_local6 == _arg1.y_)))) {
                    _local2.writeByte(_local8.tileType_);
                } else {
                    if (_local5) {
                        _local9 = (((_local8 == null)) || ((_local8.tileType_ == _arg1.tileType_)));
                    } else {
                        _local9 = (((_local8 == null)) || (!((_local8.tileType_ == 0xFF))));
                    }
                    _local2.writeBoolean(_local9);
                    _local4 = ((_local4) || (!(_local9)));
                }
                _local7++;
            }
            _local6++;
        }
        return (((_local4) ? _local2 : null));
    }

    private static function _0D_A_(_arg1:ByteArray):BitmapData {
        var _local2:BitmapData = _pf.getBitmapData(_arg1[4]);
        var _local3:BitmapData = _local2.clone();
        var _local4:_C_O_ = _pf._020[_arg1[4]];
        var _local5:Vector.<BitmapData> = _local4._yf();
        var _local6:Vector.<BitmapData> = _local4._05n();
        var _local7:int = 1;
        while (_local7 < 8) {
            if (!_arg1[_local7]) {
                _local3.copyPixels(_local5[_local7], _local5[_local7].rect, PointUtil._P_5, null, null, true);
            }
            _local7 = (_local7 + 2);
        }
        if (_local5[0] != null) {
            if (((((_arg1[3]) && (_arg1[1]))) && (!(_arg1[0])))) {
                _local3.copyPixels(_local5[0], _local5[0].rect, PointUtil._P_5, null, null, true);
            }
            if (((((_arg1[1]) && (_arg1[5]))) && (!(_arg1[2])))) {
                _local3.copyPixels(_local5[2], _local5[2].rect, PointUtil._P_5, null, null, true);
            }
            if (((((_arg1[5]) && (_arg1[7]))) && (!(_arg1[8])))) {
                _local3.copyPixels(_local5[8], _local5[8].rect, PointUtil._P_5, null, null, true);
            }
            if (((((_arg1[3]) && (_arg1[7]))) && (!(_arg1[6])))) {
                _local3.copyPixels(_local5[6], _local5[6].rect, PointUtil._P_5, null, null, true);
            }
        }
        if (_local6 != null) {
            if (((!(_arg1[3])) && (!(_arg1[1])))) {
                _local3.copyPixels(_local6[0], _local6[0].rect, PointUtil._P_5, null, null, true);
            }
            if (((!(_arg1[1])) && (!(_arg1[5])))) {
                _local3.copyPixels(_local6[2], _local6[2].rect, PointUtil._P_5, null, null, true);
            }
            if (((!(_arg1[5])) && (!(_arg1[7])))) {
                _local3.copyPixels(_local6[8], _local6[8].rect, PointUtil._P_5, null, null, true);
            }
            if (((!(_arg1[3])) && (!(_arg1[7])))) {
                _local3.copyPixels(_local6[6], _local6[6].rect, PointUtil._P_5, null, null, true);
            }
        }
        return (_local3);
    }

}
}//package com.company.assembleegameclient.util

