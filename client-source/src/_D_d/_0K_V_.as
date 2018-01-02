// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._0K_V_

package _D_d {
import _02t._R_f;

import _F_1._05p;

import _4K_.Stats;

import _0D_n._throw;
import _0D_n._P_I_;

import _060._03X_;

import _zm._01c;

import flash.net.FileReference;

import _060._rp;

import flash.events.Event;

import com.company.util.IntPoint;

import _060._8M_;

import com.company.util._O_m;

import flash.geom.Rectangle;
import flash.utils.ByteArray;

import com.hurlant.util.Base64;
import com.company.assembleegameclient.map._pf;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.map._sn;

import flash.net.FileFilter;
import flash.events.IOErrorEvent;


public class _0K_V_ extends _05p {

    private static const _r0:int = ((600 - _N_g._0K_6) - 10);
    public static const _086:Stats = new Stats();
    private static const _N_G_:_throw = _P_I_._dJ_();

    public function _0K_V_() {
        addChild(new _charscreen());
        super(null);
        this._kg = new _H_4();
        this._kg.x = 15;
        this._kg.y = _r0;
        this._kg.addEventListener(_rp.UNDO_COMMAND_EVENT, this._ck);
        this._kg.addEventListener(_rp.REDO_COMMAND_EVENT, this._0I_x);
        this._kg.addEventListener(_rp.CLEAR_COMMAND_EVENT, this._hm);
        this._kg.addEventListener(_rp.LOAD_COMMAND_EVENT, this._0E_o);
        this._kg.addEventListener(_rp.SAVE_COMMAND_EVENT, this._na);
        this._kg.addEventListener(_rp.TEST_COMMAND_EVENT, this._W_o);
        addChild(this._kg);
        this._G_T_ = new _03X_();
        this._09l = new _N_g();
        this._09l.addEventListener(_xQ_.TILES_EVENT, this._0M_0);
        this._09l.x = ((800 / 2) - (_N_g._0K_6 / 2));
        this._09l.y = _r0;
        addChild(this._09l);
        this._mL_ = new _wY_(this._09l);
        this._mL_.x = 4;
        this._mL_.y = ((600 - _wY_.HEIGHT) - 10);
        addChild(this._mL_);
        this._mu = new _01c(new <String>["Ground", "Objects", "Regions"], _E_m.WIDTH, 26);
        this._mu.x = ((this._09l.x + _N_g._0K_6) + 4);
        this._mu.y = _r0;
        this._mu.addEventListener(Event.CHANGE, this._W_L_);
        addChild(this._mu);
        this._D_F_ = new _0H_J_();
        this._D_F_.x = this._mu.x;
        this._D_F_.y = ((this._mu.y + this._mu.height) + 4);
        this._X_4 = this._D_F_;
        addChild(this._D_F_);
        this._qS_ = new _02i();
        this._qS_.x = this._mu.x;
        this._qS_.y = ((this._mu.y + this._mu.height) + 4);
        this._2u = new _4g();
        this._2u.x = this._mu.x;
        this._2u.y = ((this._mu.y + this._mu.height) + 4);

        super._0_4.x = ((800 - super._0_4.width) - 10);
        super._0_4.y = 2;
    }
    public var _kg:_H_4;
    public var _09l:_N_g;
    public var _mL_:_wY_;
    public var _mu:_01c;
    public var _D_F_:_0H_J_;
    public var _qS_:_02i;
    public var _2u:_4g;
    public var _X_4:_E_m;
    public var filename_:String = null;
    private var _G_T_:_03X_;
    private var _E_s:FileReference = null;

    private function _qX_(_arg1:Vector.<IntPoint>, _arg2:int, _arg3:int):void {
        var _local5:IntPoint;
        var _local6:int;
        var _local4:_8M_ = new _8M_();
        for each (_local5 in _arg1) {
            _local6 = this._09l.getType(_local5.x_, _local5.y_, _arg2);
            if (_local6 != _arg3) {
                _local4._0_h(new _N_2(this._09l, _local5.x_, _local5.y_, _arg2, _local6, _arg3));
            }
        }
        if (_local4._0D_J_()) {
            return;
        }
        this._G_T_._D_1(_local4);
    }

    private function _A_(_arg1:Vector.<IntPoint>, _arg2:String):void {
        var _local4:IntPoint;
        var _local5:String;
        var _local3:_8M_ = new _8M_();
        for each (_local4 in _arg1) {
            _local5 = this._09l._wa(_local4.x_, _local4.y_);
            if (_local5 != _arg2) {
                _local3._0_h(new _R_1(this._09l, _local4.x_, _local4.y_, _local5, _arg2));
            }
        }
        if (_local3._0D_J_()) {
            return;
        }
        this._G_T_._D_1(_local3);
    }

    private function _4S_():String {
        var _local7:int;
        var _local8:_11;
        var _local9:Object;
        var _local10:String;
        var _local11:int;
        var _local1:Rectangle = this._09l._0J_S_();
        if (_local1 == null) {
            return (null);
        }
        var _local2:Object = {};
        _local2["width"] = int(_local1.width);
        _local2["height"] = int(_local1.height);
        var _local3:Object = {};
        var _local4:Array = [];
        var _local5:ByteArray = new ByteArray();
        var _local6:int = _local1.y;
        while (_local6 < _local1.bottom) {
            _local7 = _local1.x;
            while (_local7 < _local1.right) {
                _local8 = this._09l._p_(_local7, _local6);
                _local9 = this._0J_h(_local8);
                _local10 = _N_G_._I_7(_local9);
                if (!_local3.hasOwnProperty(_local10)) {
                    _local11 = _local4.length;
                    _local3[_local10] = _local11;
                    _local4.push(_local9);
                } else {
                    _local11 = _local3[_local10];
                }
                _local5.writeShort(_local11);
                _local7++;
            }
            _local6++;
        }
        _local2["dict"] = _local4;
        _local5.compress();
        _local2["data"] = Base64.encodeByteArray(_local5);
        return (_N_G_._I_7(_local2));
    }

    private function _0J_h(_arg1:_11):Object {
        var _local3:Vector.<int>;
        var _local4:String;
        var _local5:Object;
        var _local2:Object = {};
        if (_arg1 != null) {
            _local3 = _arg1._5F_;
            if (_local3[_M_u._6h] != -1) {
                _local4 = _pf._6H_(_local3[_M_u._6h]);
                _local2["ground"] = _local4;
            }
            if (_local3[_M_u._S_E_] != -1) {
                _local4 = ObjectLibrary._6H_(_local3[_M_u._S_E_]);
                _local5 = {"id": _local4};
                if (_arg1._fi != null) {
                    _local5["name"] = _arg1._fi;
                }
                _local2["objs"] = [_local5];
            }
            if (_local3[_M_u._0G_m] != -1) {
                _local4 = _sn._6H_(_local3[_M_u._0G_m]);
                _local2["regions"] = [
                    {"id": _local4}
                ];
            }
        }
        return (_local2);
    }

    private function _0M_0(_arg1:_xQ_):void {
        var _local2:IntPoint;
        var _local3:int;
        var _local4:String;
        var _local5:_0I__;
        _local2 = _arg1.tiles_[0];
        switch (this._kg._P_b()) {
            case _H_4._3O_:
                this._qX_(_arg1.tiles_, this._X_4._09V_, this._X_4._N_T_());
                break;
            case _H_4._001:
                this._qX_(_arg1.tiles_, this._X_4._09V_, -1);
                break;
            case _H_4._mt:
                _local3 = this._09l.getType(_local2.x_, _local2.y_, this._X_4._09V_);
                if (_local3 == -1) {
                    return;
                }
                this._X_4._mB_(_local3);
                this._kg._0G_A_(_H_4._3O_);
                break;
            case _H_4._X_V_:
                _local4 = this._09l._wa(_local2.x_, _local2.y_);
                _local5 = new _0I__(_arg1.tiles_, _local4);
                _local5.addEventListener(Event.COMPLETE, this._P_c);
                addChild(_local5);
                break;
        }
        this._09l.draw();
    }

    private function _P_c(_arg1:Event):void {
        var _local2:_0I__ = (_arg1.currentTarget as _0I__);
        this._A_(_local2.tiles_, _local2._wa());
    }

    private function _W_L_(_arg1:Event):void {
        switch (this._mu.getValue()) {
            case "Ground":
                _O_m._041(this, this._D_F_);
                _O_m._03d(this, this._qS_);
                _O_m._03d(this, this._2u);
                this._X_4 = this._D_F_;
                return;
            case "Objects":
                _O_m._03d(this, this._D_F_);
                _O_m._041(this, this._qS_);
                _O_m._03d(this, this._2u);
                this._X_4 = this._qS_;
                return;
            case "Regions":
                _O_m._03d(this, this._D_F_);
                _O_m._03d(this, this._qS_);
                _O_m._041(this, this._2u);
                this._X_4 = this._2u;
                return;
        }
    }

    private function _ck(_arg1:_rp):void {
        this._G_T_._G_l();
        this._09l.draw();
    }

    private function _0I_x(_arg1:_rp):void {
        this._G_T_._K_N_();
        this._09l.draw();
    }

    private function _hm(_arg1:_rp):void {
        var _local4:IntPoint;
        var _local5:_11;
        var _local2:Vector.<IntPoint> = this._09l._09x();
        var _local3:_8M_ = new _8M_();
        for each (_local4 in _local2) {
            _local5 = this._09l._p_(_local4.x_, _local4.y_);
            if (_local5 != null) {
                _local3._0_h(new _04H_(this._09l, _local4.x_, _local4.y_, _local5));
            }
        }
        if (_local3._0D_J_()) {
            return;
        }
        this._G_T_._D_1(_local3);
        this._09l.draw();
        this.filename_ = null;
    }

    private function _na(_arg1:_rp):void {
        var _local2:String = this._4S_();
        if (_local2 == null) {
            return;
        }
        new FileReference().save(_local2, (((this.filename_ == null)) ? "map.jm" : this.filename_));
    }

    private function _0E_o(_arg1:_rp):void {
        this._E_s = new FileReference();
        this._E_s.addEventListener(Event.SELECT, this._0C_s);
        this._E_s.browse([new FileFilter("JSON Map (*.jm)", "*.jm")]);
    }

    private function _0C_s(event:Event):void {
        var loadedFile:FileReference = (event.target as FileReference);
        loadedFile.addEventListener(Event.COMPLETE, this._E_f);
        loadedFile.addEventListener(IOErrorEvent.IO_ERROR, this._3D_);
        try {
            loadedFile.load();
        } catch (e:Error) {
        }
    }

    private function _E_f(_arg1:Event):void {
        var _local9:int;
        var _local11:int;
        var _local12:Object;
        var _local13:Array;
        var _local14:Array;
        var _local15:Object;
        var _local16:Object;
        var _local2:FileReference = (_arg1.target as FileReference);
        this.filename_ = _local2.name;
        var _local3:Object = _N_G_.parse(_local2.data.toString());
        var _local4:int = _local3["width"];
        var _local5:int = _local3["height"];
        var _local6:Rectangle = new Rectangle(int(((_N_g._kM_ / 2) - (_local4 / 2))), int(((_N_g._kM_ / 2) - (_local5 / 2))), _local4, _local5);
        this._09l.clear();
        this._G_T_.clear();
        var _local7:Array = _local3["dict"];
        var _local8:ByteArray = Base64.decodeToByteArray(_local3["data"]);
        _local8.uncompress();
        var _local10:int = _local6.y;
        while (_local10 < _local6.bottom) {
            _local11 = _local6.x;
            while (_local11 < _local6.right) {
                _local12 = _local7[_local8.readShort()];
                if (_local12.hasOwnProperty("ground")) {
                    _local9 = _pf._pb[_local12["ground"]];
                    this._09l._2F_(_local11, _local10, _M_u._6h, _local9);
                }
                _local13 = _local12["objs"];
                if (_local13 != null) {
                    for each (_local15 in _local13) {
                        if (ObjectLibrary._pb.hasOwnProperty(_local15["id"])) {
                            _local9 = ObjectLibrary._pb[_local15["id"]];
                            this._09l._2F_(_local11, _local10, _M_u._S_E_, _local9);
                            if (_local15.hasOwnProperty("name")) {
                                this._09l._N_F_(_local11, _local10, _local15["name"]);
                            }
                        }
                    }
                }
                _local14 = _local12["regions"];
                if (_local14 != null) {
                    for each (_local16 in _local14) {
                        _local9 = _sn._pb[_local16["id"]];
                        this._09l._2F_(_local11, _local10, _M_u._0G_m, _local9);
                    }
                }
                _local11++;
            }
            _local10++;
        }
        this._09l.draw();
    }

    private function _3D_(_arg1:Event):void {
    }

    private function _W_o(_arg1:Event):void {
        dispatchEvent(new _0C_r(this._4S_()));
    }

}
}//package _D_d

