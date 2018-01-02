// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_j._kW_

package _0_j {
import _02t._R_f;

import _F_1._05p;

import _060._03X_;

import _qD_._E_b;

import _df.Preview;

import _0G_l._in;

import _qD_._Q_8;

import _060._rp;

import flash.events.Event;

import _tg._07k;

import com.company.util.IntPoint;

import _qD_._03Y_;
import _qD_._X_K_;
import _qD_._eF_;

import _df._04M_;
import _df._f5;
import _df._R_y;

import _060._8M_;

import _qD_._L_e;

import flash.display.BitmapData;

import _D_H_._J_U_;


public class _kW_ extends _05p {

    private static const _0B_Q_:int = 240;
    private static const _04e:int = 32;

    public function _kW_() {
        addChild(new _charscreen());
        super(null);
        this._kg = new _nh();
        this._kg.x = 15;
        this._kg.y = 40;
        this._kg.addEventListener(_rp.UNDO_COMMAND_EVENT, this._ck);
        this._kg.addEventListener(_rp.REDO_COMMAND_EVENT, this._0I_x);
        this._kg.addEventListener(_rp.CLEAR_COMMAND_EVENT, this._hm);
        this._kg.addEventListener(_rp.LOAD_COMMAND_EVENT, this._0E_o);
        this._kg.addEventListener(_rp.SAVE_COMMAND_EVENT, this._na);
        addChild(this._kg);
        this._G_T_ = new _03X_();
        this._0M_P_ = new _cZ_();
        this._0M_P_.x = 20;
        this._0M_P_.y = 480;
        this._0M_P_.addEventListener(Event.CHANGE, this._008);
        addChild(this._0M_P_);
        this._cv = new _P_8();
        this._cv.x = _0B_Q_;
        this._cv.y = _04e;
        this._cv.addEventListener(Event.CHANGE, this._0M_T_);
        addChild(this._cv);
        this._fb = new _in();
        this._fb.addEventListener(_07k.LOAD_COMPLETE_EVENT, this._set_);
        this._pO_();
        this._xw();
        this._03e();
    }
    private var _kg:_nh;
    private var _G_T_:_03X_;
    private var _0M_P_:_cZ_;
    private var _cv:_P_8;
    private var _kq:_2i;
    private var _P_M_:_E_b;
    private var preview_:Preview;
    private var _fb:_in;
    private var name_:String = "";
    private var type_:int = 0;
    private var _0D_z:String = "";
    private var _cG_:_Q_8 = null;

    protected function _A_J_():void {
        this.name_ = "";
        this.type_ = 0;
        this._0D_z = "";
    }

    private function _pO_():void {
        if (this._kq != null) {
            removeChild(this._kq);
        }
        var _local1:String = this._cv.getValue();
        switch (_local1) {
            case _P_8._0D_a:
                this._kq = new _b1_T_();
                break;
            case _P_8._hM_:
                this._kq = new _B_T_();
                break;
            case _P_8._C_a:
                this._kq = new _0G_g();
                break;
        }
        this._kq.x = (_0B_Q_ + 190);
        this._kq.y = _04e;
        this._kq.addEventListener(Event.CHANGE, this._5X_);
        addChild(this._kq);
    }

    private function _xw():void {
        this._A_J_();
        if (this._P_M_ != null) {
            removeChild(this._P_M_);
        }
        var _local1:String = this._cv.getValue();
        var _local2:IntPoint = this._kq._0M_t();
        switch (_local1) {
            case _P_8._0D_a:
                this._P_M_ = new _03Y_(360, 360, _local2.x_, _local2.y_, true);
                break;
            case _P_8._hM_:
                this._P_M_ = new _X_K_(360, 360, _local2.x_, _local2.y_);
                break;
            case _P_8._C_a:
                this._P_M_ = new _03Y_(360, 360, _local2.x_, _local2.y_, false);
                break;
        }
        this._P_M_.x = 110;
        this._P_M_.y = 100;
        this._P_M_.addEventListener(_Q_8.PIXEL_EVENT, this._09Z_);
        this._P_M_.addEventListener(_Q_8.TEMP_PIXEL_EVENT, this._05S_);
        this._P_M_.addEventListener(_Q_8.UNDO_TEMP_EVENT, this._M_v);
        this._P_M_.addEventListener(_eF_.SET_PIXELS_EVENT, this._se);
        this._P_M_.addEventListener(Event.CHANGE, this._sG_);
        addChild(this._P_M_);
        if (this.preview_ != null) {
            this.preview_._I_D_(this._P_M_.getBitmapData());
        }
        this._G_T_.clear();
    }

    private function _03e():void {
        if (this.preview_ != null) {
            removeChild(this.preview_);
        }
        var _local1:String = this._cv.getValue();
        switch (_local1) {
            case _P_8._0D_a:
                this.preview_ = new _04M_(300, 360);
                break;
            case _P_8._hM_:
                this.preview_ = new _f5(300, 360);
                break;
            case _P_8._C_a:
                this.preview_ = new _R_y(300, 360);
                break;
        }
        this.preview_.x = 485;
        this.preview_.y = 100;
        this.preview_._I_D_(this._P_M_.getBitmapData());
        addChild(this.preview_);
    }

    private function _008(_arg1:Event):void {
        this._kg._0G_A_(_nh._3O_);
    }

    private function _5X_(_arg1:Event):void {
        this._xw();
    }

    private function _0M_T_(_arg1:Event):void {
        this._pO_();
        this._xw();
        this._03e();
    }

    private function _sG_(_arg1:Event):void {
        this.preview_._I_D_(this._P_M_.getBitmapData());
    }

    private function _09Z_(_arg1:_Q_8):void {
        var _local2:_8M_;
        switch (this._kg._P_b()) {
            case _nh._3O_:
                if (this._0M_P_.getColor().equals(_arg1._fD_._U_d)) {
                    return;
                }
                _local2 = new _8M_();
                _local2._0_h(new _M_V_(_arg1._fD_, _arg1._fD_._U_d, this._0M_P_.getColor()));
                this._G_T_._D_1(_local2);
                break;
            case _nh._001:
                if (_arg1._fD_._U_d == null) {
                    return;
                }
                _local2 = new _8M_();
                _local2._0_h(new _M_V_(_arg1._fD_, _arg1._fD_._U_d, null));
                this._G_T_._D_1(_local2);
                break;
            case _nh._mt:
                if (_arg1._fD_._U_d == null) {
                    return;
                }
                this._0M_P_._gp(_arg1._fD_._U_d);
                break;
        }
        this.preview_._I_D_(this._P_M_.getBitmapData());
    }

    private function _05S_(_arg1:_Q_8):void {
        switch (this._kg._P_b()) {
            case _nh._3O_:
                if (this._0M_P_.getColor().equals(_arg1._fD_._U_d)) {
                    return;
                }
                _arg1._fD_._L_V_(this._0M_P_.getColor());
                break;
            case _nh._001:
                if (_arg1._fD_._U_d == null) {
                    return;
                }
                _arg1._fD_._L_V_(null);
                break;
        }
        this._cG_ = _arg1;
        this.preview_._I_D_(this._P_M_.getBitmapData());
    }

    private function _M_v(_arg1:_Q_8):void {
        if (this._cG_ == null) {
            return;
        }
        this._cG_._fD_._L_V_(this._cG_._0_a);
        this.preview_._I_D_(this._P_M_.getBitmapData());
        this._cG_ = null;
    }

    private function _se(_arg1:_eF_):void {
        var _local3:_L_e;
        var _local2:_8M_ = new _8M_();
        for each (_local3 in _arg1._R_D_) {
            _local2._0_h(new _M_V_(_local3._fD_, _local3._fD_._U_d, _local3._U_d));
        }
        if (_local2._0D_J_()) {
            return;
        }
        this._G_T_._D_1(_local2);
        this.preview_._I_D_(this._P_M_.getBitmapData());
    }

    private function _ck(_arg1:_rp):void {
        this._G_T_._G_l();
        this.preview_._I_D_(this._P_M_.getBitmapData());
    }

    private function _0I_x(_arg1:_rp):void {
        this._G_T_._K_N_();
        this.preview_._I_D_(this._P_M_.getBitmapData());
    }

    private function _hm(_arg1:_rp):void {
        this._P_M_.clear();
    }

    private function _0E_o(_arg1:_rp):void {
        stage.addChild(this._fb);
    }

    private function _set_(_arg1:_07k):void {
        var _local2:BitmapData = _arg1.bitmapData_;
        switch (_arg1.type_) {
            case _D_Z_._04B_:
                this._cv.setValue(_P_8._hM_);
                break;
            case _D_Z_._xU_:
                this._cv.setValue(_P_8._C_a);
                break;
            default:
                this._cv.setValue(_P_8._0D_a);
        }
        var _local3:int = _local2.width;
        if (_local3 > 16) {
            _local3 = (_local3 / 7);
        }
        this._kq._H_9(_local3, _local2.height);
        this.name_ = _arg1.name_;
        this.type_ = _arg1.type_;
        this._0D_z = _arg1._0D_z;
        this._P_M_.loadBitmapData(_local2);
    }

    private function _na(_arg1:_rp):void {
        var _local2:Vector.<int>;
        switch (this._cv.getValue()) {
            case _P_8._0D_a:
                _local2 = new <int>[_D_Z_.INVALID, _D_Z_._04B_, _D_Z_._tA_, _D_Z_._U_a, _D_Z_._yX_, _D_Z_._each, _D_Z_._00i];
                break;
            case _P_8._hM_:
                _local2 = new <int>[_D_Z_._04B_];
                break;
            case _P_8._C_a:
                _local2 = new <int>[_D_Z_._xU_];
                break;
        }
        var _local3:_J_U_ = new _J_U_(this.name_, this.type_, this._0D_z, this._P_M_.getBitmapData(), _local2);
        stage.addChild(_local3);
    }

}
}//package _0_j

