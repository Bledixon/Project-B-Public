// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.math._03Q_

package com.hurlant.math {
import com.hurlant.crypto.prng.Random;
import com.hurlant.util.Hex;
import com.hurlant.util.Memory;

import flash.utils.ByteArray;

use namespace bi_internal;

public class _03Q_ {

    public static const _o3:int = 30;
    public static const _2R_:int = (1 << _o3);
    public static const _F_i:int = (_2R_ - 1);
    public static const _eM_:int = 52;
    public static const _T_9:Number = Math.pow(2, _eM_);
    public static const F1:int = (_eM_ - _o3);//22
    public static const F2:int = ((2 * _o3) - _eM_);//8
    public static const _lP_:_03Q_ = _U_1(0);
    public static const _override:_03Q_ = _U_1(1);
    public static const _P_e:Array = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 0x0101, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509];
    public static const _0L_w:int = ((1 << 26) / _P_e[(_P_e.length - 1)]);

    public static function _U_1(_arg1:int):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        _local2._et(_arg1);
        return (_local2);
    }

    public function _03Q_(_arg1:* = null, _arg2:int = 0, _arg3:Boolean = false) {
        var _local4:ByteArray;
        var _local5:int;
        super();
        this.a = [];
        if ((_arg1 is String)) {
            if (((_arg2) && (!((_arg2 == 16))))) {
                throw (new Error("BigInteger construction with radix!=16 is not supported."));
            }
            _arg1 = Hex.toArray(_arg1);
            _arg2 = 0;
        }
        if ((_arg1 is ByteArray)) {
            _local4 = (_arg1 as ByteArray);
            _local5 = ((_arg2) || ((_local4.length - _local4.position)));
            this.fromArray(_local4, _local5, _arg3);
        }
    }
    public var t:int;

    public function dispose():void {
        var _local1:Random = new Random();
        var _local2:uint;
        while (_local2 < this.a.length) {
            this.a[_local2] = _local1.nextByte();
            delete this.a[_local2];
            _local2++;
        }
        this.a = null;
        this.t = 0;
        this.s = 0;
        Memory.gc();
    }

    public function toString(_arg1:Number = 16):String {
        var _local2:int;
        if (this.s < 0) {
            return (("-" + this._0C_T_().toString(_arg1)));
        }
        switch (_arg1) {
            case 2:
                _local2 = 1;
                break;
            case 4:
                _local2 = 2;
                break;
            case 8:
                _local2 = 3;
                break;
            case 16:
                _local2 = 4;
                break;
            case 32:
                _local2 = 5;
                break;
        }
        var _local3:int = ((1 << _local2) - 1);
        var _local4:int;
        var _local5:Boolean;
        var _local6 = "";
        var _local7:int = this.t;
        var _local8:int = (_o3 - ((_local7 * _o3) % _local2));
        if (_local7-- > 0) {
            if ((((_local8 < _o3)) && (((_local4 = (this.a[_local7] >> _local8)) > 0)))) {
                _local5 = true;
                _local6 = _local4.toString(36);
            }
            while (_local7 >= 0) {
                if (_local8 < _local2) {
                    _local4 = ((this.a[_local7] & ((1 << _local8) - 1)) << (_local2 - _local8));
                    var _temp1 = _local4;
                    _local8 = (_local8 + (_o3 - _local2));
                    _local4 = (_temp1 | (this.a[--_local7] >> _local8));
                } else {
                    _local8 = (_local8 - _local2);
                    _local4 = ((this.a[_local7] >> _local8) & _local3);
                    if (_local8 <= 0) {
                        _local8 = (_local8 + _o3);
                        _local7--;
                    }
                }
                if (_local4 > 0) {
                    _local5 = true;
                }
                if (_local5) {
                    _local6 = (_local6 + _local4.toString(36));
                }
            }
        }
        return (((_local5) ? _local6 : "0"));
    }

    public function toArray(_arg1:ByteArray):uint {
        var _local2:int = 8;
        var _local3:int = ((1 << 8) - 1);
        var _local4:int;
        var _local5:int = this.t;
        var _local6:int = (_o3 - ((_local5 * _o3) % _local2));
        var _local7:Boolean;
        var _local8:int;
        if (_local5-- > 0) {
            if ((((_local6 < _o3)) && (((_local4 = (this.a[_local5] >> _local6)) > 0)))) {
                _local7 = true;
                _arg1.writeByte(_local4);
                _local8++;
            }
            while (_local5 >= 0) {
                if (_local6 < _local2) {
                    _local4 = ((this.a[_local5] & ((1 << _local6) - 1)) << (_local2 - _local6));
                    var _temp1 = _local4;
                    _local6 = (_local6 + (_o3 - _local2));
                    _local4 = (_temp1 | (this.a[--_local5] >> _local6));
                } else {
                    _local6 = (_local6 - _local2);
                    _local4 = ((this.a[_local5] >> _local6) & _local3);
                    if (_local6 <= 0) {
                        _local6 = (_local6 + _o3);
                        _local5--;
                    }
                }
                if (_local4 > 0) {
                    _local7 = true;
                }
                if (_local7) {
                    _arg1.writeByte(_local4);
                    _local8++;
                }
            }
        }
        return (_local8);
    }

    public function valueOf():Number {
        if (this.s == -1) {
            return (-(this._0C_T_().valueOf()));
        }
        var _local1:Number = 1;
        var _local2:Number = 0;
        var _local3:uint;
        while (_local3 < this.t) {
            _local2 = (_local2 + (this.a[_local3] * _local1));
            _local1 = (_local1 * _2R_);
            _local3++;
        }
        return (_local2);
    }

    public function _0C_T_():_03Q_ {
        var _local1:_03Q_ = this._k0();
        _lP_._kA_(this, _local1);
        return (_local1);
    }

    public function abs():_03Q_ {
        return ((((this.s) < 0) ? this._0C_T_() : this));
    }

    public function _Y_U_(_arg1:_03Q_):int {
        var _local2:int = (this.s - _arg1.s);
        if (_local2 != 0) {
            return (_local2);
        }
        var _local3:int = this.t;
        _local2 = (_local3 - _arg1.t);
        if (_local2 != 0) {
            return (_local2);
        }
        while (--_local3 >= 0) {
            _local2 = (this.a[_local3] - _arg1.a[_local3]);
            if (_local2 != 0) {
                return (_local2);
            }
        }
        return (0);
    }

    public function _096():int {
        if (this.t <= 0) {
            return (0);
        }
        return (((_o3 * (this.t - 1)) + this._Q_d((this.a[(this.t - 1)] ^ (this.s & _F_i)))));
    }

    public function _ln(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = this._k0();
        this.abs()._gK_(_arg1, null, _local2);
        if ((((this.s < 0)) && ((_local2._Y_U_(_lP_) > 0)))) {
            _arg1._kA_(_local2, _local2);
        }
        return (_local2);
    }

    public function _06b(_arg1:int, _arg2:_03Q_):_03Q_ {
        var _local3:_0E_z;
        if ((((_arg1 < 0x0100)) || (_arg2._05Y_()))) {
            _local3 = new _6F_(_arg2);
        } else {
            _local3 = new _kv(_arg2);
        }
        return (this.exp(_arg1, _local3));
    }

    public function clone():_03Q_ {
        var _local1:_03Q_ = new _03Q_();
        this.copyTo(_local1);
        return (_local1);
    }

    public function _M_s():int {
        if (this.s < 0) {
            if (this.t == 1) {
                return ((this.a[0] - _2R_));
            }
            if (this.t == 0) {
                return (-1);
            }
        } else {
            if (this.t == 1) {
                return (this.a[0]);
            }
            if (this.t == 0) {
                return (0);
            }
        }
        return ((((this.a[1] & ((1 << (32 - _o3)) - 1)) << _o3) | this.a[0]));
    }

    public function _06Y_():int {
        return ((((this.t) == 0) ? this.s : ((this.a[0] << 24) >> 24)));
    }

    public function _G_i():int {
        return ((((this.t) == 0) ? this.s : ((this.a[0] << 16) >> 16)));
    }

    public function _H_A_():int {
        if (this.s < 0) {
            return (-1);
        }
        if ((((this.t <= 0)) || ((((this.t == 1)) && ((this.a[0] <= 0)))))) {
            return (0);
        }
        return (1);
    }

    public function _G_6():ByteArray {
        var _local4:int;
        var _local1:int = this.t;
        var _local2:ByteArray = new ByteArray();
        _local2[0] = this.s;
        var _local3:int = (_o3 - ((_local1 * _o3) % 8));
        var _local5:int;
        if (_local1-- > 0) {
            if ((((_local3 < _o3)) && (!(((_local4 = (this.a[_local1] >> _local3)) == ((this.s & _F_i) >> _local3)))))) {
                var _local6 = _local5++;
                _local2[_local6] = (_local4 | (this.s << (_o3 - _local3)));
            }
            while (_local1 >= 0) {
                if (_local3 < 8) {
                    _local4 = ((this.a[_local1] & ((1 << _local3) - 1)) << (8 - _local3));
                    var _temp1 = _local4;
                    _local3 = (_local3 + (_o3 - 8));
                    _local4 = (_temp1 | (this.a[--_local1] >> _local3));
                } else {
                    _local3 = (_local3 - 8);
                    _local4 = ((this.a[_local1] >> _local3) & 0xFF);
                    if (_local3 <= 0) {
                        _local3 = (_local3 + _o3);
                        _local1--;
                    }
                }
                if ((_local4 & 128) != 0) {
                    _local4 = (_local4 | -256);
                }
                if ((((_local5 == 0)) && (!(((this.s & 128) == (_local4 & 128)))))) {
                    _local5++;
                }
                if ((((_local5 > 0)) || (!((_local4 == this.s))))) {
                    _local6 = _local5++;
                    _local2[_local6] = _local4;
                }
            }
        }
        return (_local2);
    }

    public function equals(_arg1:_03Q_):Boolean {
        return ((this._Y_U_(_arg1) == 0));
    }

    public function min(_arg1:_03Q_):_03Q_ {
        return ((((this._Y_U_(_arg1)) < 0) ? this : _arg1));
    }

    public function max(_arg1:_03Q_):_03Q_ {
        return ((((this._Y_U_(_arg1)) > 0) ? this : _arg1));
    }

    public function _uh(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._X_X_(_arg1, this._0J_Z_, _local2);
        return (_local2);
    }

    public function or(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._X_X_(_arg1, this._ox, _local2);
        return (_local2);
    }

    public function _08u(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._X_X_(_arg1, this._wL_, _local2);
        return (_local2);
    }

    public function _U_E_(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._X_X_(_arg1, this._0D_u, _local2);
        return (_local2);
    }

    public function not():_03Q_ {
        var _local1:_03Q_ = new _03Q_();
        var _local2:int;
        while (_local2 < this.t) {
            _local1[_local2] = (_F_i & ~(this.a[_local2]));
            _local2++;
        }
        _local1.t = this.t;
        _local1.s = ~(this.s);
        return (_local1);
    }

    public function _01l(_arg1:int):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        if (_arg1 < 0) {
            this._A_O_(-(_arg1), _local2);
        } else {
            this._43(_arg1, _local2);
        }
        return (_local2);
    }

    public function _0i(_arg1:int):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        if (_arg1 < 0) {
            this._43(-(_arg1), _local2);
        } else {
            this._A_O_(_arg1, _local2);
        }
        return (_local2);
    }

    public function _0A_q():int {
        var _local1:int;
        while (_local1 < this.t) {
            if (this.a[_local1] != 0) {
                return (((_local1 * _o3) + this._V_b(this.a[_local1])));
            }
            _local1++;
        }
        if (this.s < 0) {
            return ((this.t * _o3));
        }
        return (-1);
    }

    public function _P_l():int {
        var _local1:int;
        var _local2 = (this.s & _F_i);
        var _local3:int;
        while (_local3 < this.t) {
            _local1 = (_local1 + this._0G_C_((this.a[_local3] ^ _local2)));
            _local3++;
        }
        return (_local1);
    }

    public function _yr(_arg1:int):Boolean {
        var _local2:int = Math.floor((_arg1 / _o3));
        if (_local2 >= this.t) {
            return (!((this.s == 0)));
        }
        return (!(((this.a[_local2] & (1 << (_arg1 % _o3))) == 0)));
    }

    public function _V_p(_arg1:int):_03Q_ {
        return (this._09r(_arg1, this._ox));
    }

    public function _9z(_arg1:int):_03Q_ {
        return (this._09r(_arg1, this._0D_u));
    }

    public function _07Z_(_arg1:int):_03Q_ {
        return (this._09r(_arg1, this._wL_));
    }

    public function add(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this.addTo(_arg1, _local2);
        return (_local2);
    }

    public function _b0(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._kA_(_arg1, _local2);
        return (_local2);
    }

    public function _N_H_(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._G_8(_arg1, _local2);
        return (_local2);
    }

    public function _jd(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._gK_(_arg1, _local2, null);
        return (_local2);
    }

    public function _U_o(_arg1:_03Q_):_03Q_ {
        var _local2:_03Q_ = new _03Q_();
        this._gK_(_arg1, null, _local2);
        return (_local2);
    }

    public function _U_V_(_arg1:_03Q_):Array {
        var _local2:_03Q_ = new _03Q_();
        var _local3:_03Q_ = new _03Q_();
        this._gK_(_arg1, _local2, _local3);
        return ([_local2, _local3]);
    }

    public function pow(_arg1:int):_03Q_ {
        return (this.exp(_arg1, new _Y_j()));
    }

    public function _qg(_arg1:_03Q_, _arg2:_03Q_):_03Q_ {
        var _local4:int;
        var _local6:_0E_z;
        var _local12:int;
        var _local15:_03Q_;
        var _local16:_03Q_;
        var _local3:int = _arg1._096();
        var _local5:_03Q_ = _U_1(1);
        if (_local3 <= 0) {
            return (_local5);
        }
        if (_local3 < 18) {
            _local4 = 1;
        } else {
            if (_local3 < 48) {
                _local4 = 3;
            } else {
                if (_local3 < 144) {
                    _local4 = 4;
                } else {
                    if (_local3 < 0x0300) {
                        _local4 = 5;
                    } else {
                        _local4 = 6;
                    }
                }
            }
        }
        if (_local3 < 8) {
            _local6 = new _6F_(_arg2);
        } else {
            if (_arg2._05Y_()) {
                _local6 = new _gb(_arg2);
            } else {
                _local6 = new _kv(_arg2);
            }
        }
        var _local7:Array = [];
        var _local8:int = 3;
        var _local9:int = (_local4 - 1);
        var _local10:int = ((1 << _local4) - 1);
        _local7[1] = _local6._0M_x(this);
        if (_local4 > 1) {
            _local16 = new _03Q_();
            _local6._sb(_local7[1], _local16);
            while (_local8 <= _local10) {
                _local7[_local8] = new _03Q_();
                _local6._05a(_local16, _local7[(_local8 - 2)], _local7[_local8]);
                _local8 = (_local8 + 2);
            }
        }
        var _local11:int = (_arg1.t - 1);
        var _local13:Boolean = true;
        var _local14:_03Q_ = new _03Q_();
        _local3 = (this._Q_d(_arg1.a[_local11]) - 1);
        while (_local11 >= 0) {
            if (_local3 >= _local9) {
                _local12 = ((_arg1.a[_local11] >> (_local3 - _local9)) & _local10);
            } else {
                _local12 = ((_arg1.a[_local11] & ((1 << (_local3 + 1)) - 1)) << (_local9 - _local3));
                if (_local11 > 0) {
                    _local12 = (_local12 | (_arg1.a[(_local11 - 1)] >> ((_o3 + _local3) - _local9)));
                }
            }
            _local8 = _local4;
            while ((_local12 & 1) == 0) {
                _local12 = (_local12 >> 1);
                _local8--;
            }
            _local3 = (_local3 - _local8);
            if (_local3 < 0) {
                _local3 = (_local3 + _o3);
                _local11--;
            }
            if (_local13) {
                _local7[_local12].copyTo(_local5);
                _local13 = false;
            } else {
                while (_local8 > 1) {
                    _local6._sb(_local5, _local14);
                    _local6._sb(_local14, _local5);
                    _local8 = (_local8 - 2);
                }
                if (_local8 > 0) {
                    _local6._sb(_local5, _local14);
                } else {
                    _local15 = _local5;
                    _local5 = _local14;
                    _local14 = _local15;
                }
                _local6._05a(_local14, _local7[_local12], _local5);
            }
            while ((((_local11 >= 0)) && (((_arg1.a[_local11] & (1 << _local3)) == 0)))) {
                _local6._sb(_local5, _local14);
                _local15 = _local5;
                _local5 = _local14;
                _local14 = _local15;
                if (--_local3 < 0) {
                    _local3 = (_o3 - 1);
                    _local11--;
                }
            }
        }
        return (_local6._sh(_local5));
    }

    public function _fa(_arg1:_03Q_):_03Q_ {
        var _local6:_03Q_;
        var _local2:_03Q_ = (((this.s) < 0) ? this._0C_T_() : this.clone());
        var _local3:_03Q_ = (((_arg1.s) < 0) ? _arg1._0C_T_() : _arg1.clone());
        if (_local2._Y_U_(_local3) < 0) {
            _local6 = _local2;
            _local2 = _local3;
            _local3 = _local6;
        }
        var _local4:int = _local2._0A_q();
        var _local5:int = _local3._0A_q();
        if (_local5 < 0) {
            return (_local2);
        }
        if (_local4 < _local5) {
            _local5 = _local4;
        }
        if (_local5 > 0) {
            _local2._A_O_(_local5, _local2);
            _local3._A_O_(_local5, _local3);
        }
        while (_local2._H_A_() > 0) {
            _local4 = _local2._0A_q();
            if (_local4 > 0) {
                _local2._A_O_(_local4, _local2);
            }
            _local4 = _local3._0A_q();
            if (_local4 > 0) {
                _local3._A_O_(_local4, _local3);
            }
            if (_local2._Y_U_(_local3) >= 0) {
                _local2._kA_(_local3, _local2);
                _local2._A_O_(1, _local2);
            } else {
                _local3._kA_(_local2, _local3);
                _local3._A_O_(1, _local3);
            }
        }
        if (_local5 > 0) {
            _local3._43(_local5, _local3);
        }
        return (_local3);
    }

    public function _pV_(_arg1:_03Q_):_03Q_ {
        var _local2:Boolean = _arg1._05Y_();
        if (((((this._05Y_()) && (_local2))) || ((_arg1._H_A_() == 0)))) {
            return (_03Q_._lP_);
        }
        var _local3:_03Q_ = _arg1.clone();
        var _local4:_03Q_ = this.clone();
        var _local5:_03Q_ = _U_1(1);
        var _local6:_03Q_ = _U_1(0);
        var _local7:_03Q_ = _U_1(0);
        var _local8:_03Q_ = _U_1(1);
        while (_local3._H_A_() != 0) {
            while (_local3._05Y_()) {
                _local3._A_O_(1, _local3);
                if (_local2) {
                    if (((!(_local5._05Y_())) || (!(_local6._05Y_())))) {
                        _local5.addTo(this, _local5);
                        _local6._kA_(_arg1, _local6);
                    }
                    _local5._A_O_(1, _local5);
                } else {
                    if (!_local6._05Y_()) {
                        _local6._kA_(_arg1, _local6);
                    }
                }
                _local6._A_O_(1, _local6);
            }
            while (_local4._05Y_()) {
                _local4._A_O_(1, _local4);
                if (_local2) {
                    if (((!(_local7._05Y_())) || (!(_local8._05Y_())))) {
                        _local7.addTo(this, _local7);
                        _local8._kA_(_arg1, _local8);
                    }
                    _local7._A_O_(1, _local7);
                } else {
                    if (!_local8._05Y_()) {
                        _local8._kA_(_arg1, _local8);
                    }
                }
                _local8._A_O_(1, _local8);
            }
            if (_local3._Y_U_(_local4) >= 0) {
                _local3._kA_(_local4, _local3);
                if (_local2) {
                    _local5._kA_(_local7, _local5);
                }
                _local6._kA_(_local8, _local6);
            } else {
                _local4._kA_(_local3, _local4);
                if (_local2) {
                    _local7._kA_(_local5, _local7);
                }
                _local8._kA_(_local6, _local8);
            }
        }
        if (_local4._Y_U_(_03Q_._override) != 0) {
            return (_03Q_._lP_);
        }
        if (_local8._Y_U_(_arg1) >= 0) {
            return (_local8._b0(_arg1));
        }
        if (_local8._H_A_() < 0) {
            _local8.addTo(_arg1, _local8);
        } else {
            return (_local8);
        }
        if (_local8._H_A_() < 0) {
            return (_local8.add(_arg1));
        }
        return (_local8);
    }

    public function _hE_(_arg1:int):Boolean {
        var _local2:int;
        var _local4:int;
        var _local5:int;
        var _local3:_03Q_ = this.abs();
        if ((((_local3.t == 1)) && ((_local3.a[0] <= _P_e[(_P_e.length - 1)])))) {
            _local2 = 0;
            while (_local2 < _P_e.length) {
                if (_local3[0] == _P_e[_local2]) {
                    return (true);
                }
                _local2++;
            }
            return (false);
        }
        if (_local3._05Y_()) {
            return (false);
        }
        _local2 = 1;
        while (_local2 < _P_e.length) {
            _local4 = _P_e[_local2];
            _local5 = (_local2 + 1);
            while ((((_local5 < _P_e.length)) && ((_local4 < _0L_w)))) {
                _local4 = (_local4 * _P_e[_local5++]);
            }
            _local4 = _local3._ha(_local4);
            while (_local2 < _local5) {
                if ((_local4 % _P_e[_local2++]) == 0) {
                    return (false);
                }
            }
        }
        return (_local3._T_a(_arg1));
    }

    public function _js(_arg1:int, _arg2:int):void {
        if (!this._yr((_arg1 - 1))) {
            this._X_X_(_03Q_._override._01l((_arg1 - 1)), this._ox, this);
        }
        if (this._05Y_()) {
            this._u(1, 0);
        }
        while (!(this._hE_(_arg2))) {
            this._u(2, 0);
            while (this._096() > _arg1) {
                this._kA_(_03Q_._override._01l((_arg1 - 1)), this);
            }
        }
    }

    protected function _k0() {
        return (new _03Q_());
    }

    protected function _U_z(_arg1:Number):int {
        return (Math.floor(((Math.LN2 * _o3) / Math.log(_arg1))));
    }

    protected function _00X_(_arg1:uint = 10):String {
        if ((((((this._H_A_() == 0)) || ((_arg1 < 2)))) || ((_arg1 > 32)))) {
            return ("0");
        }
        var _local2:int = this._U_z(_arg1);
        var _local3:Number = Math.pow(_arg1, _local2);
        var _local4:_03Q_ = _U_1(_local3);
        var _local5:_03Q_ = this._k0();
        var _local6:_03Q_ = this._k0();
        var _local7 = "";
        this._gK_(_local4, _local5, _local6);
        while (_local5._H_A_() > 0) {
            _local7 = ((_local3 + _local6._M_s()).toString(_arg1).substr(1) + _local7);
            _local5._gK_(_local4, _local5, _local6);
        }
        return ((_local6._M_s().toString(_arg1) + _local7));
    }

    protected function _6R_(_arg1:String, _arg2:int = 10):void {
        var _local9:int;
        this._et(0);
        var _local3:int = this._U_z(_arg2);
        var _local4:Number = Math.pow(_arg2, _local3);
        var _local5:Boolean;
        var _local6:int;
        var _local7:int;
        var _local8:int;
        while (_local8 < _arg1.length) {
            _local9 = this._M_t(_arg1, _local8);
            if (_local9 < 0) {
                if ((((_arg1.charAt(_local8) == "-")) && ((this._H_A_() == 0)))) {
                    _local5 = true;
                }
            } else {
                _local7 = ((_arg2 * _local7) + _local9);
                if (++_local6 >= _local3) {
                    this._Z_c(_local4);
                    this._u(_local7, 0);
                    _local6 = 0;
                    _local7 = 0;
                }
            }
            _local8++;
        }
        if (_local6 > 0) {
            this._Z_c(Math.pow(_arg2, _local6));
            this._u(_local7, 0);
        }
        if (_local5) {
            _03Q_._lP_._kA_(this, this);
        }
    }

    protected function _X_X_(_arg1:_03Q_, _arg2:Function, _arg3:_03Q_):void {
        var _local4:int;
        var _local5:int;
        var _local6:int = Math.min(_arg1.t, this.t);
        _local4 = 0;
        while (_local4 < _local6) {
            _arg3.a[_local4] = _arg2(this.a[_local4], _arg1.a[_local4]);
            _local4++;
        }
        if (_arg1.t < this.t) {
            _local5 = (_arg1.s & _F_i);
            _local4 = _local6;
            while (_local4 < this.t) {
                _arg3.a[_local4] = _arg2(this.a[_local4], _local5);
                _local4++;
            }
            _arg3.t = this.t;
        } else {
            _local5 = (this.s & _F_i);
            _local4 = _local6;
            while (_local4 < _arg1.t) {
                _arg3.a[_local4] = _arg2(_local5, _arg1.a[_local4]);
                _local4++;
            }
            _arg3.t = _arg1.t;
        }
        _arg3.s = _arg2(this.s, _arg1.s);
        _arg3._F_b();
    }

    protected function _09r(_arg1:int, _arg2:Function):_03Q_ {
        var _local3:_03Q_ = _03Q_._override._01l(_arg1);
        this._X_X_(_local3, _arg2, _local3);
        return (_local3);
    }

    protected function addTo(_arg1:_03Q_, _arg2:_03Q_):void {
        var _local3:int;
        var _local4:int;
        var _local5:int = Math.min(_arg1.t, this.t);
        while (_local3 < _local5) {
            _local4 = (_local4 + (this.a[_local3] + _arg1.a[_local3]));
            var _local6 = _local3++;
            _arg2.a[_local6] = (_local4 & _F_i);
            _local4 = (_local4 >> _o3);
        }
        if (_arg1.t < this.t) {
            _local4 = (_local4 + _arg1.s);
            while (_local3 < this.t) {
                _local4 = (_local4 + this.a[_local3]);
                _local6 = _local3++;
                _arg2.a[_local6] = (_local4 & _F_i);
                _local4 = (_local4 >> _o3);
            }
            _local4 = (_local4 + this.s);
        } else {
            _local4 = (_local4 + this.s);
            while (_local3 < _arg1.t) {
                _local4 = (_local4 + _arg1.a[_local3]);
                _local6 = _local3++;
                _arg2.a[_local6] = (_local4 & _F_i);
                _local4 = (_local4 >> _o3);
            }
            _local4 = (_local4 + _arg1.s);
        }
        _arg2.s = (((_local4) < 0) ? -1 : 0);
        if (_local4 > 0) {
            _local6 = _local3++;
            _arg2.a[_local6] = _local4;
        } else {
            if (_local4 < -1) {
                _local6 = _local3++;
                _arg2.a[_local6] = (_2R_ + _local4);
            }
        }
        _arg2.t = _local3;
        _arg2._F_b();
    }

    protected function _ha(_arg1:int):int {
        var _local4:int;
        if (_arg1 <= 0) {
            return (0);
        }
        var _local2:int = (_2R_ % _arg1);
        var _local3:int = (((this.s) < 0) ? (_arg1 - 1) : 0);
        if (this.t > 0) {
            if (_local2 == 0) {
                _local3 = (this.a[0] % _arg1);
            } else {
                _local4 = (this.t - 1);
                while (_local4 >= 0) {
                    _local3 = (((_local2 * _local3) + this.a[_local4]) % _arg1);
                    _local4--;
                }
            }
        }
        return (_local3);
    }

    protected function _T_a(_arg1:int):Boolean {
        var _local7:_03Q_;
        var _local8:int;
        var _local2:_03Q_ = this._b0(_03Q_._override);
        var _local3:int = _local2._0A_q();
        if (_local3 <= 0) {
            return (false);
        }
        var _local4:_03Q_ = _local2._0i(_local3);
        _arg1 = ((_arg1 + 1) >> 1);
        if (_arg1 > _P_e.length) {
            _arg1 = _P_e.length;
        }
        var _local5:_03Q_ = new _03Q_();
        var _local6:int;
        while (_local6 < _arg1) {
            _local5._et(_P_e[_local6]);
            _local7 = _local5._qg(_local4, this);
            if (((!((_local7._Y_U_(_03Q_._override) == 0))) && (!((_local7._Y_U_(_local2) == 0))))) {
                _local8 = 1;
                while ((((_local8++ < _local3)) && (!((_local7._Y_U_(_local2) == 0))))) {
                    _local7 = _local7._06b(2, this);
                    if (_local7._Y_U_(_03Q_._override) == 0) {
                        return (false);
                    }
                }
                if (_local7._Y_U_(_local2) != 0) {
                    return (false);
                }
            }
            _local6++;
        }
        return (true);
    }

    private function _0J_Z_(_arg1:int, _arg2:int):int {
        return ((_arg1 & _arg2));
    }

    private function _ox(_arg1:int, _arg2:int):int {
        return ((_arg1 | _arg2));
    }

    private function _wL_(_arg1:int, _arg2:int):int {
        return ((_arg1 ^ _arg2));
    }

    private function _0D_u(_arg1:int, _arg2:int):int {
        return ((_arg1 & ~(_arg2)));
    }

    private function _V_b(_arg1:int):int {
        if (_arg1 == 0) {
            return (-1);
        }
        var _local2:int;
        if ((_arg1 & 0xFFFF) == 0) {
            _arg1 = (_arg1 >> 16);
            _local2 = (_local2 + 16);
        }
        if ((_arg1 & 0xFF) == 0) {
            _arg1 = (_arg1 >> 8);
            _local2 = (_local2 + 8);
        }
        if ((_arg1 & 15) == 0) {
            _arg1 = (_arg1 >> 4);
            _local2 = (_local2 + 4);
        }
        if ((_arg1 & 3) == 0) {
            _arg1 = (_arg1 >> 2);
            _local2 = (_local2 + 2);
        }
        if ((_arg1 & 1) == 0) {
            _local2++;
        }
        return (_local2);
    }

    private function _0G_C_(_arg1:int):int {
        var _local2:uint;
        while (_arg1 != 0) {
            _arg1 = (_arg1 & (_arg1 - 1));
            _local2++;
        }
        return (_local2);
    }
    bi_internal var s:int;
    bi_internal var a:Array;

    bi_internal function _Q_d(_arg1:int):int {
        var _local3:int;
        var _local2:int = 1;
        _local3 = (_arg1 >>> 16);
        if (_local3 != 0) {
            _arg1 = _local3;
            _local2 = (_local2 + 16);
        }
        _local3 = (_arg1 >> 8);
        if (_local3 != 0) {
            _arg1 = _local3;
            _local2 = (_local2 + 8);
        }
        _local3 = (_arg1 >> 4);
        if (_local3 != 0) {
            _arg1 = _local3;
            _local2 = (_local2 + 4);
        }
        _local3 = (_arg1 >> 2);
        if (_local3 != 0) {
            _arg1 = _local3;
            _local2 = (_local2 + 2);
        }
        _local3 = (_arg1 >> 1);
        if (_local3 != 0) {
            _arg1 = _local3;
            _local2 = (_local2 + 1);
        }
        return (_local2);
    }

    bi_internal function copyTo(_arg1:_03Q_):void {
        var _local2:int = (this.t - 1);
        while (_local2 >= 0) {
            _arg1.a[_local2] = this.a[_local2];
            _local2--;
        }
        _arg1.t = this.t;
        _arg1.s = this.s;
    }

    bi_internal function _et(_arg1:int):void {
        this.t = 1;
        this.s = (((_arg1) < 0) ? -1 : 0);
        if (_arg1 > 0) {
            this.a[0] = _arg1;
        } else {
            if (_arg1 < -1) {
                this.a[0] = (_arg1 + _2R_);
            } else {
                this.t = 0;
            }
        }
    }

    bi_internal function fromArray(_arg1:ByteArray, _arg2:int, _arg3:Boolean = false):void {
        var _local8:int;
        var _local4:int = _arg1.position;
        var _local5:int = (_local4 + _arg2);
        var _local6:int;
        var _local7:int = 8;
        this.t = 0;
        this.s = 0;
        while (--_local5 >= _local4) {
            _local8 = (((_local5 < _arg1.length)) ? _arg1[_local5] : 0);
            if (_local6 == 0) {
                var _local9 = this.t++;
                this.a[_local9] = _local8;
            } else {
                if ((_local6 + _local7) > _o3) {
                    this.a[(this.t - 1)] = (this.a[(this.t - 1)] | ((_local8 & ((1 << (_o3 - _local6)) - 1)) << _local6));
                    _local9 = this.t++;
                    this.a[_local9] = (_local8 >> (_o3 - _local6));
                } else {
                    this.a[(this.t - 1)] = (this.a[(this.t - 1)] | (_local8 << _local6));
                }
            }
            _local6 = (_local6 + _local7);
            if (_local6 >= _o3) {
                _local6 = (_local6 - _o3);
            }
        }
        if (((!(_arg3)) && (((_arg1[0] & 128) == 128)))) {
            this.s = -1;
            if (_local6 > 0) {
                this.a[(this.t - 1)] = (this.a[(this.t - 1)] | (((1 << (_o3 - _local6)) - 1) << _local6));
            }
        }
        this._F_b();
        _arg1.position = Math.min((_local4 + _arg2), _arg1.length);
    }

    bi_internal function _F_b():void {
        var _local1 = (this.s & _F_i);
        while ((((this.t > 0)) && ((this.a[(this.t - 1)] == _local1)))) {
            this.t--;
        }
    }

    bi_internal function _6(_arg1:int, _arg2:_03Q_):void {
        var _local3:int;
        _local3 = (this.t - 1);
        while (_local3 >= 0) {
            _arg2.a[(_local3 + _arg1)] = this.a[_local3];
            _local3--;
        }
        _local3 = (_arg1 - 1);
        while (_local3 >= 0) {
            _arg2.a[_local3] = 0;
            _local3--;
        }
        _arg2.t = (this.t + _arg1);
        _arg2.s = this.s;
    }

    bi_internal function _Q_Z_(_arg1:int, _arg2:_03Q_):void {
        var _local3:int;
        _local3 = _arg1;
        while (_local3 < this.t) {
            _arg2.a[(_local3 - _arg1)] = this.a[_local3];
            _local3++;
        }
        _arg2.t = Math.max((this.t - _arg1), 0);
        _arg2.s = this.s;
    }

    bi_internal function _43(_arg1:int, _arg2:_03Q_):void {
        var _local8:int;
        var _local3:int = (_arg1 % _o3);
        var _local4:int = (_o3 - _local3);
        var _local5:int = ((1 << _local4) - 1);
        var _local6:int = (_arg1 / _o3);
        var _local7 = ((this.s << _local3) & _F_i);
        _local8 = (this.t - 1);
        while (_local8 >= 0) {
            _arg2.a[((_local8 + _local6) + 1)] = ((this.a[_local8] >> _local4) | _local7);
            _local7 = ((this.a[_local8] & _local5) << _local3);
            _local8--;
        }
        _local8 = (_local6 - 1);
        while (_local8 >= 0) {
            _arg2.a[_local8] = 0;
            _local8--;
        }
        _arg2.a[_local6] = _local7;
        _arg2.t = ((this.t + _local6) + 1);
        _arg2.s = this.s;
        _arg2._F_b();
    }

    bi_internal function _A_O_(_arg1:int, _arg2:_03Q_):void {
        var _local7:int;
        _arg2.s = this.s;
        var _local3:int = (_arg1 / _o3);
        if (_local3 >= this.t) {
            _arg2.t = 0;
            return;
        }
        var _local4:int = (_arg1 % _o3);
        var _local5:int = (_o3 - _local4);
        var _local6:int = ((1 << _local4) - 1);
        _arg2.a[0] = (this.a[_local3] >> _local4);
        _local7 = (_local3 + 1);
        while (_local7 < this.t) {
            _arg2.a[((_local7 - _local3) - 1)] = (_arg2.a[((_local7 - _local3) - 1)] | ((this.a[_local7] & _local6) << _local5));
            _arg2.a[(_local7 - _local3)] = (this.a[_local7] >> _local4);
            _local7++;
        }
        if (_local4 > 0) {
            _arg2.a[((this.t - _local3) - 1)] = (_arg2.a[((this.t - _local3) - 1)] | ((this.s & _local6) << _local5));
        }
        _arg2.t = (this.t - _local3);
        _arg2._F_b();
    }

    bi_internal function _kA_(_arg1:_03Q_, _arg2:_03Q_):void {
        var _local3:int;
        var _local4:int;
        var _local5:int = Math.min(_arg1.t, this.t);
        while (_local3 < _local5) {
            _local4 = (_local4 + (this.a[_local3] - _arg1.a[_local3]));
            var _local6 = _local3++;
            _arg2.a[_local6] = (_local4 & _F_i);
            _local4 = (_local4 >> _o3);
        }
        if (_arg1.t < this.t) {
            _local4 = (_local4 - _arg1.s);
            while (_local3 < this.t) {
                _local4 = (_local4 + this.a[_local3]);
                _local6 = _local3++;
                _arg2.a[_local6] = (_local4 & _F_i);
                _local4 = (_local4 >> _o3);
            }
            _local4 = (_local4 + this.s);
        } else {
            _local4 = (_local4 + this.s);
            while (_local3 < _arg1.t) {
                _local4 = (_local4 - _arg1.a[_local3]);
                _local6 = _local3++;
                _arg2.a[_local6] = (_local4 & _F_i);
                _local4 = (_local4 >> _o3);
            }
            _local4 = (_local4 - _arg1.s);
        }
        _arg2.s = (((_local4) < 0) ? -1 : 0);
        if (_local4 < -1) {
            _local6 = _local3++;
            _arg2.a[_local6] = (_2R_ + _local4);
        } else {
            if (_local4 > 0) {
                _local6 = _local3++;
                _arg2.a[_local6] = _local4;
            }
        }
        _arg2.t = _local3;
        _arg2._F_b();
    }

    bi_internal function am(_arg1:int, _arg2:int, _arg3:_03Q_, _arg4:int, _arg5:int, _arg6:int):int {
        var _local9:int;
        var _local10:int;
        var _local11:int;
        var _local7 = (_arg2 & 32767);
        var _local8 = (_arg2 >> 15);
        while (--_arg6 >= 0) {
            _local9 = (this.a[_arg1] & 32767);
            _local10 = (this.a[_arg1++] >> 15);
            _local11 = ((_local8 * _local9) + (_local10 * _local7));
            _local9 = ((((_local7 * _local9) + ((_local11 & 32767) << 15)) + _arg3.a[_arg4]) + (_arg5 & 1073741823));
            _arg5 = ((((_local9 >>> 30) + (_local11 >>> 15)) + (_local8 * _local10)) + (_arg5 >>> 30));
            var _local12 = _arg4++;
            _arg3.a[_local12] = (_local9 & 1073741823);
        }
        return (_arg5);
    }

    bi_internal function _G_8(_arg1:_03Q_, _arg2:_03Q_):void {
        var _local3:_03Q_ = this.abs();
        var _local4:_03Q_ = _arg1.abs();
        var _local5:int = _local3.t;
        _arg2.t = (_local5 + _local4.t);
        while (--_local5 >= 0) {
            _arg2.a[_local5] = 0;
        }
        _local5 = 0;
        while (_local5 < _local4.t) {
            _arg2.a[(_local5 + _local3.t)] = _local3.am(0, _local4.a[_local5], _arg2, _local5, 0, _local3.t);
            _local5++;
        }
        _arg2.s = 0;
        _arg2._F_b();
        if (this.s != _arg1.s) {
            _lP_._kA_(_arg2, _arg2);
        }
    }

    bi_internal function _R_o(_arg1:_03Q_):void {
        var _local4:int;
        var _local2:_03Q_ = this.abs();
        var _local3:int = (_arg1.t = (2 * _local2.t));
        while (--_local3 >= 0) {
            _arg1.a[_local3] = 0;
        }
        _local3 = 0;
        while (_local3 < (_local2.t - 1)) {
            _local4 = _local2.am(_local3, _local2.a[_local3], _arg1, (2 * _local3), 0, 1);
            if ((_arg1.a[(_local3 + _local2.t)] = (_arg1.a[(_local3 + _local2.t)] + _local2.am((_local3 + 1), (2 * _local2.a[_local3]), _arg1, ((2 * _local3) + 1), _local4, ((_local2.t - _local3) - 1)))) >= _2R_) {
                _arg1.a[(_local3 + _local2.t)] = (_arg1.a[(_local3 + _local2.t)] - _2R_);
                _arg1.a[((_local3 + _local2.t) + 1)] = 1;
            }
            _local3++;
        }
        if (_arg1.t > 0) {
            _arg1.a[(_arg1.t - 1)] = (_arg1.a[(_arg1.t - 1)] + _local2.am(_local3, _local2.a[_local3], _arg1, (2 * _local3), 0, 1));
        }
        _arg1.s = 0;
        _arg1._F_b();
    }

    bi_internal function _gK_(m:_03Q_, q:_03Q_ = null, r:_03Q_ = null):void {
        var qd:int;
        var pm:_03Q_ = m.abs();
        if (pm.t <= 0) {
            return;
        }
        var pt:_03Q_ = this.abs();
        if (pt.t < pm.t) {
            if (q != null) {
                q._et(0);
            }
            if (r != null) {
                this.copyTo(r);
            }
            return;
        }
        if (r == null) {
            r = this._k0();
        }
        var y:_03Q_ = this._k0();
        var ts:int = this.s;
        var ms:int = m.s;
        var nsh:int = (_o3 - this._Q_d(pm.a[(pm.t - 1)]));
        if (nsh > 0) {
            pm._43(nsh, y);
            pt._43(nsh, r);
        } else {
            pm.copyTo(y);
            pt.copyTo(r);
        }
        var ys:int = y.t;
        var y0:int = y.a[(ys - 1)];
        if (y0 == 0) {
            return;
        }
        var yt:Number = ((y0 * (1 << F1)) + (((ys) > 1) ? (y.a[(ys - 2)] >> F2) : 0));
        var d1:Number = (_T_9 / yt);
        var d2:Number = ((1 << F1) / yt);
        var e:Number = (1 << F2);
        var i:int = r.t;
        var j:int = (i - ys);
        var t:_03Q_ = (((q) == null) ? this._k0() : q);
        y._6(j, t);
        if (r._Y_U_(t) >= 0) {
            var _local5 = r.t++;
            r.a[_local5] = 1;
            r._kA_(t, r);
        }
        _override._6(ys, t);
        t._kA_(y, y);
        while (y.t < ys) {
            XML(y).(y.t++, 0); //not popped
        }
        while (--j >= 0) {
            qd = (((r.a[--i]) == y0) ? _F_i : ((Number(r.a[i]) * d1) + ((Number(r.a[(i - 1)]) + e) * d2)));
            if ((r.a[i] = (r.a[i] + y.am(0, qd, r, j, 0, ys))) < qd) {
                y._6(j, t);
                r._kA_(t, r);
                while ((qd = (qd - 1)), r.a[i] < qd) {
                    r._kA_(t, r);
                }
            }
        }
        if (q != null) {
            r._Q_Z_(ys, q);
            if (ts != ms) {
                _lP_._kA_(q, q);
            }
        }
        r.t = ys;
        r._F_b();
        if (nsh > 0) {
            r._A_O_(nsh, r);
        }
        if (ts < 0) {
            _lP_._kA_(r, r);
        }
    }

    bi_internal function _else_():int {
        if (this.t < 1) {
            return (0);
        }
        var _local1:int = this.a[0];
        if ((_local1 & 1) == 0) {
            return (0);
        }
        var _local2 = (_local1 & 3);
        _local2 = ((_local2 * (2 - ((_local1 & 15) * _local2))) & 15);
        _local2 = ((_local2 * (2 - ((_local1 & 0xFF) * _local2))) & 0xFF);
        _local2 = ((_local2 * (2 - (((_local1 & 0xFFFF) * _local2) & 0xFFFF))) & 0xFFFF);
        _local2 = ((_local2 * (2 - ((_local1 * _local2) % _2R_))) % _2R_);
        return ((((_local2) > 0) ? (_2R_ - _local2) : -(_local2)));
    }

    bi_internal function _05Y_():Boolean {
        return (((((this.t) > 0) ? (this.a[0] & 1) : this.s) == 0));
    }

    bi_internal function exp(_arg1:int, _arg2:_0E_z):_03Q_ {
        var _local7:_03Q_;
        if ((((_arg1 > 0xFFFFFFFF)) || ((_arg1 < 1)))) {
            return (_override);
        }
        var _local3:_03Q_ = this._k0();
        var _local4:_03Q_ = this._k0();
        var _local5:_03Q_ = _arg2._0M_x(this);
        var _local6:int = (this._Q_d(_arg1) - 1);
        _local5.copyTo(_local3);
        while (--_local6 >= 0) {
            _arg2._sb(_local3, _local4);
            if ((_arg1 & (1 << _local6)) > 0) {
                _arg2._05a(_local4, _local5, _local3);
            } else {
                _local7 = _local3;
                _local3 = _local4;
                _local4 = _local7;
            }
        }
        return (_arg2._sh(_local3));
    }

    bi_internal function _M_t(_arg1:String, _arg2:int):int {
        return (parseInt(_arg1.charAt(_arg2), 36));
    }

    bi_internal function _Z_c(_arg1:int):void {
        this.a[this.t] = this.am(0, (_arg1 - 1), this, 0, 0, this.t);
        this.t++;
        this._F_b();
    }

    bi_internal function _u(_arg1:int, _arg2:int):void {
        while (this.t <= _arg2) {
            var _local3 = this.t++;
            this.a[_local3] = 0;
        }
        this.a[_arg2] = (this.a[_arg2] + _arg1);
        while (this.a[_arg2] >= _2R_) {
            this.a[_arg2] = (this.a[_arg2] - _2R_);
            if (++_arg2 >= this.t) {
                _local3 = this.t++;
                this.a[_local3] = 0;
            }
            _local3 = this.a;
            var _local4 = _arg2;
            _local3[_local4] = (_local3[_local4] + 1);
        }
    }

    bi_internal function _0E_g(_arg1:_03Q_, _arg2:int, _arg3:_03Q_):void {
        var _local5:int;
        var _local4:int = Math.min((this.t + _arg1.t), _arg2);
        _arg3.s = 0;
        _arg3.t = _local4;
        while (_local4 > 0) {
            var _local6 = --_local4;
            _arg3.a[_local6] = 0;
        }
        _local5 = (_arg3.t - this.t);
        while (_local4 < _local5) {
            _arg3.a[(_local4 + this.t)] = this.am(0, _arg1.a[_local4], _arg3, _local4, 0, this.t);
            _local4++;
        }
        _local5 = Math.min(_arg1.t, _arg2);
        while (_local4 < _local5) {
            this.am(0, _arg1.a[_local4], _arg3, _local4, 0, (_arg2 - _local4));
            _local4++;
        }
        _arg3._F_b();
    }

    bi_internal function _T_t(_arg1:_03Q_, _arg2:int, _arg3:_03Q_):void {
        _arg2--;
        var _local4:int = (_arg3.t = ((this.t + _arg1.t) - _arg2));
        _arg3.s = 0;
        while (--_local4 >= 0) {
            _arg3.a[_local4] = 0;
        }
        _local4 = Math.max((_arg2 - this.t), 0);
        while (_local4 < _arg1.t) {
            _arg3.a[((this.t + _local4) - _arg2)] = this.am((_arg2 - _local4), _arg1.a[_local4], _arg3, 0, 0, ((this.t + _local4) - _arg2));
            _local4++;
        }
        _arg3._F_b();
        _arg3._Q_Z_(1, _arg3);
    }

}
}//package com.hurlant.math

