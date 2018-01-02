// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_089._W_s

package _089 {
import flash.utils.ByteArray;
import flash.display.BitmapData;

public class _W_s {

    private static const _0G_L_:int = 1229472850;
    private static const _R_G_:int = 1229209940;
    private static const _D_C_:int = 1950701684;
    private static const _lF_:int = 1767135348;
    private static const _uF_:int = 2052348020;
    private static const _T_N_:int = 1229278788;

    private static var _I_U_:uint;
    private static var _Q_L_:uint;
    private static var _P_D_:ByteArray;
    private static var buffer:ByteArray;
    private static var _mk:int;
    private static var _ry:int;

    public static function _80(_arg1:ByteArray):BitmapData {
        var _local4:Boolean;
        var _local5:int;
        if (_arg1 == null) {
            return (null);
        }
        _P_D_ = _arg1;
        buffer = new ByteArray();
        _ry = 4;
        _P_D_.position = 0;
        if (_P_D_.readUnsignedInt() != 2303741511) {
            return (_9v());
        }
        if (_P_D_.readUnsignedInt() != 218765834) {
            return (_9v());
        }
        var _local2:Array = _9b();
        var _local3:int;
        _local5 = 0;
        while (_local5 < _local2.length) {
            _P_D_.position = _local2[_local5].position;
            _local4 = true;
            if (_local2[_local5].type == _0G_L_) {
                _local3++;
                if (_local5 == 0) {
                    _local4 = _Z_R_(_local2[_local5].length);
                } else {
                    _local4 = false;
                }
            }
            if (_local2[_local5].type == _R_G_) {
                buffer.writeBytes(_P_D_, _P_D_.position, _local2[_local5].length);
            }
            if (((!(_local4)) || ((_local3 > 1)))) {
                return (_9v());
            }
            _local5++;
        }
        var _local6:BitmapData = _0F_D_();
        _P_D_ = null;
        buffer = null;
        return (_local6);
    }

    public static function _W_f(_arg1:ByteArray):XML {
        var _local4:int;
        if (_arg1 == null) {
            return (null);
        }
        _P_D_ = _arg1;
        _P_D_.position = 0;
        if (_P_D_.readUnsignedInt() != 2303741511) {
            _P_D_ = null;
            return (null);
        }
        if (_P_D_.readUnsignedInt() != 218765834) {
            _P_D_ = null;
            return (null);
        }
        var _local2:Array = _9b();
        var _local3:XML = <information/>
                ;
        _local4 = 0;
        while (_local4 < _local2.length) {
            if (_local2[_local4].type == _D_C_) {
                _local3.appendChild(_G_3(_local2[_local4].position, _local2[_local4].length));
            }
            if (_local2[_local4].type == _lF_) {
                _local3.appendChild(_2o(_local2[_local4].position, _local2[_local4].length));
            }
            if (_local2[_local4].type == _uF_) {
                _local3.appendChild(_0L_Q_(_local2[_local4].position, _local2[_local4].length));
            }
            _local4++;
        }
        _P_D_ = null;
        return (_local3);
    }

    private static function _G_3(_arg1:int, _arg2:int):XML {
        var _local3:XML = <tEXt/>
                ;
        var _local4 = "";
        var _local5 = "";
        var _local6:int = -1;
        _P_D_.position = _arg1;
        while (_P_D_.position < (_arg1 + _arg2)) {
            _local6 = _P_D_.readUnsignedByte();
            if (_local6 > 0) {
                _local4 = (_local4 + String.fromCharCode(_local6));
            } else {
                break;
            }
        }
        _local5 = _P_D_.readUTFBytes(((_arg1 + _arg2) - _P_D_.position));
        _local3.appendChild(new XML((("<keyword>" + _local4) + "</keyword>")));
        _local3.appendChild(new XML((("<text>" + _local5) + "</text>")));
        return (_local3);
    }

    private static function _0L_Q_(_arg1:int, _arg2:int):XML {
        var _local8:ByteArray;
        var _local3:XML = <zTXt/>
                ;
        var _local4 = "";
        var _local5 = "";
        var _local6:int = -1;
        _P_D_.position = _arg1;
        while (_P_D_.position < (_arg1 + _arg2)) {
            _local6 = _P_D_.readUnsignedByte();
            if (_local6 > 0) {
                _local4 = (_local4 + String.fromCharCode(_local6));
            } else {
                break;
            }
        }
        var _local7:int = _P_D_.readUnsignedByte();
        if (_local7 == 0) {
            _local8 = new ByteArray();
            _local8.writeBytes(_P_D_, _P_D_.position, ((_arg1 + _arg2) - _P_D_.position));
            _local8.uncompress();
            _local5 = _local8.readUTFBytes(_local8.length);
        }
        _local3.appendChild(new XML((("<keyword>" + _local4) + "</keyword>")));
        _local3.appendChild(new XML((("<text>" + _local5) + "</text>")));
        return (_local3);
    }

    private static function _2o(_arg1:int, _arg2:int):XML {
        var _local11:ByteArray;
        var _local3:XML = <iTXt/>
                ;
        var _local4 = "";
        var _local5 = "";
        var _local6 = "";
        var _local7 = "";
        var _local8:int = -1;
        _P_D_.position = _arg1;
        while (_P_D_.position < (_arg1 + _arg2)) {
            _local8 = _P_D_.readUnsignedByte();
            if (_local8 > 0) {
                _local4 = (_local4 + String.fromCharCode(_local8));
            } else {
                break;
            }
        }
        var _local9 = (_P_D_.readUnsignedByte() == 1);
        var _local10:int = _P_D_.readUnsignedByte();
        while (_P_D_.position < (_arg1 + _arg2)) {
            _local8 = _P_D_.readUnsignedByte();
            if (_local8 > 0) {
                _local5 = (_local5 + String.fromCharCode(_local8));
            } else {
                break;
            }
        }
        while (_P_D_.position < (_arg1 + _arg2)) {
            _local8 = _P_D_.readUnsignedByte();
            if (_local8 > 0) {
                _local6 = (_local6 + String.fromCharCode(_local8));
            } else {
                break;
            }
        }
        if (_local9) {
            if (_local10 == 0) {
                _local11 = new ByteArray();
                _local11.writeBytes(_P_D_, _P_D_.position, ((_arg1 + _arg2) - _P_D_.position));
                _local11.uncompress();
                _local7 = _local11.readUTFBytes(_local11.length);
            }
        } else {
            _local7 = _P_D_.readUTFBytes(((_arg1 + _arg2) - _P_D_.position));
        }
        _local3.appendChild(new XML((("<keyword>" + _local4) + "</keyword>")));
        _local3.appendChild(new XML((("<text>" + _local7) + "</text>")));
        _local3.appendChild(new XML((("<languageTag>" + _local5) + "</languageTag>")));
        _local3.appendChild(new XML((("<translatedKeyword>" + _local6) + "</translatedKeyword>")));
        return (_local3);
    }

    private static function _9v():BitmapData {
        _P_D_ = null;
        buffer = null;
        return (null);
    }

    private static function _9b():Array {
        var _local2:uint;
        var _local3:int;
        var _local1:Array = [];
        do
        {
            _local2 = _P_D_.readUnsignedInt();
            _local3 = _P_D_.readInt();
            _local1.push({
                "type": _local3,
                "position": _P_D_.position,
                "length": _local2
            });
            _P_D_.position = (_P_D_.position + (_local2 + 4));
        } while (((!((_local3 == _T_N_))) && ((_P_D_.bytesAvailable > 0))));
        return (_local1);
    }

    private static function _Z_R_(_arg1:int):Boolean {
        if (_arg1 != 13) {
            return (false);
        }
        _I_U_ = _P_D_.readUnsignedInt();
        _Q_L_ = _P_D_.readUnsignedInt();
        var _tb:int = _P_D_.readUnsignedByte();
        var _C_E_:int = _P_D_.readUnsignedByte();
        var _6L_:int = _P_D_.readUnsignedByte();
        var _Z_n:int = _P_D_.readUnsignedByte();
        var _0A_m:int = _P_D_.readUnsignedByte();
        if ((((_I_U_ <= 0)) || ((_Q_L_ <= 0)))) {
            return (false);
        }
        switch (_tb) {
            case 1:
            case 2:
            case 4:
            case 8:
            case 16:
                break;
            default:
                return (false);
        }
        switch (_C_E_) {
            case 0:
                if (((((((((!((_tb == 1))) && (!((_tb == 2))))) && (!((_tb == 4))))) && (!((_tb == 8))))) && (!((_tb == 16))))) {
                    return (false);
                }
                break;
            case 2:
            case 4:
            case 6:
                if (((!((_tb == 8))) && (!((_tb == 16))))) {
                    return (false);
                }
                break;
            case 3:
                if (((((((!((_tb == 1))) && (!((_tb == 2))))) && (!((_tb == 4))))) && (!((_tb == 8))))) {
                    return (false);
                }
                break;
            default:
                return (false);
        }
        if (((!((_6L_ == 0))) || (!((_Z_n == 0))))) {
            return (false);
        }
        if (((!((_0A_m == 0))) && (!((_0A_m == 1))))) {
            return (false);
        }
        return (true);
    }

    private static function _0F_D_():BitmapData {
        var bufferLen:uint;
        var filter:int;
        var i:int;
        var r:uint;
        var g:uint;
        var b:uint;
        var a:uint;
        var bd:BitmapData = new BitmapData(_I_U_, _Q_L_);
        try {
            buffer.uncompress();
        } catch (err) {
            return (null);
        }
        _mk = 0;
        bufferLen = buffer.length;
        while (buffer.position < bufferLen) {
            filter = buffer.readUnsignedByte();
            if (filter == 0) {
                i = 0;
                while (i < _I_U_) {
                    r = (_I_r() << 16);
                    g = (_I_r() << 8);
                    b = _I_r();
                    a = (_I_r() << 24);
                    bd.setPixel32(i, _mk, (((a + r) + g) + b));
                    i = (i + 1);
                }
            } else {
                if (filter == 1) {
                    i = 0;
                    while (i < _I_U_) {
                        r = (_3_() << 16);
                        g = (_3_() << 8);
                        b = _3_();
                        a = (_3_() << 24);
                        bd.setPixel32(i, _mk, (((a + r) + g) + b));
                        i = (i + 1);
                    }
                } else {
                    if (filter == 2) {
                        i = 0;
                        while (i < _I_U_) {
                            r = (_H_j() << 16);
                            g = (_H_j() << 8);
                            b = _H_j();
                            a = (_H_j() << 24);
                            bd.setPixel32(i, _mk, (((a + r) + g) + b));
                            i = (i + 1);
                        }
                    } else {
                        if (filter == 3) {
                            i = 0;
                            while (i < _I_U_) {
                                r = (_au() << 16);
                                g = (_au() << 8);
                                b = _au();
                                a = (_au() << 24);
                                bd.setPixel32(i, _mk, (((a + r) + g) + b));
                                i = (i + 1);
                            }
                        } else {
                            if (filter == 4) {
                                i = 0;
                                while (i < _I_U_) {
                                    r = (_ja() << 16);
                                    g = (_ja() << 8);
                                    b = _ja();
                                    a = (_ja() << 24);
                                    bd.setPixel32(i, _mk, (((a + r) + g) + b));
                                    i = (i + 1);
                                }
                            } else {
                                buffer.position = (buffer.position + (_ry * _I_U_));
                            }
                        }
                    }
                }
            }
            _mk++;
        }
        return (bd);
    }

    private static function _I_r():uint {
        return (buffer[buffer.position++]);
    }

    private static function _3_():uint {
        var _local1:uint = (buffer[buffer.position] + _I_C_());
        _local1 = (_local1 & 0xFF);
        var _local2 = buffer.position++;
        buffer[_local2] = _local1;
        return (_local1);
    }

    private static function _H_j():uint {
        var _local1:uint = (buffer[buffer.position] + _jR_());
        _local1 = (_local1 & 0xFF);
        var _local2 = buffer.position++;
        buffer[_local2] = _local1;
        return (_local1);
    }

    private static function _au():uint {
        var _local1:uint = (buffer[buffer.position] + Math.floor(((_I_C_() + _jR_()) / 2)));
        _local1 = (_local1 & 0xFF);
        var _local2 = buffer.position++;
        buffer[_local2] = _local1;
        return (_local1);
    }

    private static function _ja():uint {
        var _local1:uint = (buffer[buffer.position] + _dr());
        _local1 = (_local1 & 0xFF);
        var _local2 = buffer.position++;
        buffer[_local2] = _local1;
        return (_local1);
    }

    private static function _dr():uint {
        var _local1:uint = _I_C_();
        var _local2:uint = _jR_();
        var _local3:uint = _06z();
        var _local4:int;
        var _local5:int;
        var _local6:int;
        var _local7:int;
        var _local8:int;
        _local4 = ((_local1 + _local2) - _local3);
        _local5 = Math.abs((_local4 - _local1));
        _local6 = Math.abs((_local4 - _local2));
        _local7 = Math.abs((_local4 - _local3));
        if ((((_local5 <= _local6)) && ((_local5 <= _local7)))) {
            _local8 = _local1;
        } else {
            if (_local6 <= _local7) {
                _local8 = _local2;
            } else {
                _local8 = _local3;
            }
        }
        return (_local8);
    }

    private static function _I_C_():uint {
        var _local1:int = (_mk * ((_I_U_ * _ry) + 1));
        var _local2:int = (buffer.position - _ry);
        if (_local2 <= _local1) {
            return (0);
        }
        return (buffer[_local2]);
    }

    private static function _jR_():uint {
        var _local1:int = (buffer.position - ((_I_U_ * _ry) + 1));
        if (_local1 < 0) {
            return (0);
        }
        return (buffer[_local1]);
    }

    private static function _06z():uint {
        var _local1:int = (buffer.position - ((_I_U_ * _ry) + 1));
        if (_local1 < 0) {
            return (0);
        }
        var _local2:int = ((_mk - 1) * ((_I_U_ * _ry) + 1));
        _local1 = (_local1 - _ry);
        if (_local1 <= _local2) {
            return (0);
        }
        return (buffer[_local1]);
    }

}
}//package _089

