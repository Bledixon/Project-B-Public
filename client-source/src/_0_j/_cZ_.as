// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_j._cZ_

package _0_j {
import flash.display.Sprite;

import flash.display.Bitmap;
import flash.display.BitmapData;

import com.company.ui.SimpleText;

import _4x._0K_P_;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.events.Event;

import _4x._0I_y;

import com.company.util.MoreColorUtil;


public class _cZ_ extends Sprite {

    private static const _qH_:int = 6;
    private static const _0B_N_:int = 2;
    private static const _0K_v:int = 19;
    private static const _0K_x:int = 8;
    private static const _6n:Vector.<uint> = new <uint>[16245355, 0, 0xFFFFFF, 7291927, 10839330, 12461619, 3389995, 5777425, 7113244, 0x980001, 4013116, 12873770, 15436081, 8805672, 0xEE0000, 7368395, 3252978, 10735143, 16383286, 13982555, 6969880, 12566461, 2534694, 7573493];

    private static var _N_z:Class = _i8;
    private static var _Z_7:Class = _V_S_;
    private static var _00U_:Class = _cB_;

    public function _cZ_() {
        var _local1:Bitmap;
        var _local3:int;
        var _local4:int;
        var _local5:_0K_P_;
        var _local6:_tz;
        this._0F_p = new Vector.<_tz>();
        super();
        var _local2:int;
        while (_local2 < _qH_) {
            _local3 = 0;
            while (_local3 < _0B_N_) {
                _local4 = ((_local3 * _qH_) + _local2);
                _local5 = _0K_P_._am(_6n[_local4]);
                _local6 = new _tz(_0K_v, _local5._025(), false);
                _local6.x = (_local2 * (_0K_v + _0K_x));
                _local6.y = (_local3 * (_0K_v + _0K_x));
                addChild(_local6);
                _local6.addEventListener(MouseEvent.MOUSE_DOWN, this._08s);
                this._0F_p.push(_local6);
                _local3++;
            }
            _local2++;
        }
        this._h4 = new _N_z();
        addChild(this._h4);
        this._0D_r = new _0L_X_();
        this._0D_r.x = 172;
        this._0D_r.y = 2;
        this._0D_r.addEventListener(_00K_.COLOR_EVENT, this._9w);
        addChild(this._0D_r);
        this._W_7 = new BitmapData(360, 100, false, 0xFF0000);
        _local1 = new Bitmap(this._W_7);
        this._G_g = new Sprite();
        this._G_g.addChild(_local1);
        this._G_g.x = 380;
        addChild(this._G_g);
        this._G_g.addEventListener(MouseEvent.MOUSE_DOWN, this._E_z);
        this._Z_G_ = new _Z_7();
        this._G_g.addChild(this._Z_G_);
        this._M_P_ = new BitmapData(1, 100, false, 0xFF00);
        _local1 = new Bitmap(this._M_P_);
        _local1.width = 20;
        this._yc = new Sprite();
        this._yc.addChild(_local1);
        this._yc.x = 750;
        addChild(this._yc);
        this._yc.addEventListener(MouseEvent.MOUSE_DOWN, this._oV_);
        this._mq = new _00U_();
        this._mq.x = -3;
        this._yc.addChild(this._mq);
        this._xu = new SimpleText(18, 0xFFFFFF, true, 100, 26, "Myriad Pro");
        this._xu.text = "FFFFFF";
        this._xu.restrict = "0123456789aAbBcCdDeEfF";
        this._xu.maxChars = 6;
        this._xu._08S_();
        this._xu.filters = [new DropShadowFilter(0, 0, 0)];
        this._xu.y = 60;
        this._xu.x = ((154 / 2) - (this._xu.width / 2));
        this._xu.addEventListener(Event.CHANGE, this._008);
        addChild(this._xu);
        this.setSelected(this._0F_p[0]);
    }
    private var _0F_p:Vector.<_tz>;
    private var selected_:_tz = null;
    private var _h4:Bitmap;
    private var _0D_r:_0L_X_;
    private var _W_7:BitmapData;
    private var _G_g:Sprite;
    private var _Z_G_:Bitmap;
    private var _M_P_:BitmapData;
    private var _yc:Sprite;
    private var _mq:Bitmap;
    private var _xu:SimpleText;
    private var _E_4:Sprite = null;

    public function getColor():_0I_y {
        return (this.selected_._U_d);
    }

    public function _gp(_arg1:_0I_y):void {
        this._09n(_arg1.h_, _arg1._ew, _arg1._fz);
    }

    private function setSelected(_arg1:_tz):void {
        this.selected_ = _arg1;
        this._h4.x = this.selected_.x - 1;
        this._h4.y = this.selected_.y - 1;
        this._U_P_();
        this._R_R_();
        this._1Z_();
        this._0J_e();
        dispatchEvent(new Event(Event.CHANGE));
    }

    private function _09n(_arg1:Number, _arg2:Number, _arg3:Number):void {
        var _local4:_0I_y = new _0I_y(_arg1, _arg2, _arg3);
        var _local5:Boolean = ((!((_local4.h_ == this.selected_._U_d.h_))) || (!((_local4._ew == this.selected_._U_d._ew))));
        var _local6 = !((_local4._fz == this.selected_._U_d._fz));
        this.selected_._gp(_local4);
        if (_local6) {
            this._U_P_();
        }
        if (_local5) {
            this._R_R_();
        }
        this._1Z_();
        this._0J_e();
        dispatchEvent(new Event(Event.CHANGE));
    }

    private function _0J_e():void {
        if (((!((stage == null))) && ((stage.focus == this._xu)))) {
            return;
        }
        this._xu.text = this.selected_._U_d._N_u().toString();
    }

    private function _U_P_():void {
        var _local2:int;
        var _local3:uint;
        var _local1:int;
        while (_local1 < this._W_7.width) {
            _local2 = 0;
            while (_local2 < this._W_7.height) {
                _local3 = MoreColorUtil._nL_(_local1, ((this._W_7.height - _local2) / this._W_7.height), this.selected_._U_d._fz);
                this._W_7.setPixel(_local1, _local2, _local3);
                _local2++;
            }
            _local1++;
        }
    }

    private function _R_R_():void {
        var _local2:uint;
        var _local1:int;
        while (_local1 < this._M_P_.height) {
            _local2 = MoreColorUtil._nL_(this.selected_._U_d.h_, this.selected_._U_d._ew, ((this._M_P_.height - _local1) / this._M_P_.height));
            this._M_P_.setPixel(0, _local1, _local2);
            _local1++;
        }
    }

    private function _1Z_():void {
        this._Z_G_.x = (this.selected_._U_d.h_ - int((this._Z_G_.width / 2)));
        this._Z_G_.y = (((1 - this.selected_._U_d._ew) * this._W_7.height) - int((this._Z_G_.height / 2)));
        this._mq.y = (((1 - this.selected_._U_d._fz) * this._M_P_.height) - int((this._mq.height / 2)));
    }

    private function _9w(_arg1:_00K_):void {
        this._gp(_arg1._U_d);
    }

    private function _08s(_arg1:MouseEvent):void {
        var _local2:_tz = (_arg1.target as _tz);
        this.setSelected(_local2);
        var _local3:_tz = new _tz((_0K_v / 2), _local2._U_d, true);
        _local3.x = (-(_local3.width) / 2);
        _local3.y = (-(_local3.height) / 2);
        this._E_4 = new Sprite();
        this._E_4.addChild(_local3);
        stage.addEventListener(MouseEvent.MOUSE_UP, this._ru);
        stage.addChild(this._E_4);
        this._E_4.startDrag(true, null);
    }

    private function _ru(_arg1:MouseEvent):void {
        this._E_4.stopDrag();
        this._E_4.parent.removeChild(this._E_4);
        stage.removeEventListener(MouseEvent.MOUSE_UP, this._ru);
        var _local2:_tz = (this._E_4.dropTarget as _tz);
        this._E_4 = null;
        var _local3:_tz = (_arg1.target as _tz);
        if ((((_local2 == null)) || ((_local3 == null)))) {
            return;
        }
        _local2._gp(_local3._U_d);
    }

    private function _008(_arg1:Event):void {
        this._gp(_0K_P_._am(uint(("0x" + this._xu.text)))._025());
    }

    private function _E_z(_arg1:MouseEvent):void {
        this._09n(this._G_g.mouseX, ((this._G_g.height - this._G_g.mouseY) / 100), this.selected_._U_d._fz);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, this._B_f);
        stage.addEventListener(MouseEvent.MOUSE_UP, this._A_1);
    }

    private function _B_f(_arg1:MouseEvent):void {
        this._09n(this._G_g.mouseX, ((this._G_g.height - this._G_g.mouseY) / 100), this.selected_._U_d._fz);
    }

    private function _A_1(_arg1:MouseEvent):void {
        this._09n(this._G_g.mouseX, ((this._G_g.height - this._G_g.mouseY) / 100), this.selected_._U_d._fz);
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._B_f);
        stage.removeEventListener(MouseEvent.MOUSE_UP, this._A_1);
    }

    private function _oV_(_arg1:MouseEvent):void {
        this._09n(this.selected_._U_d.h_, this.selected_._U_d._ew, ((this._yc.height - this._yc.mouseY) / 100));
        stage.addEventListener(MouseEvent.MOUSE_MOVE, this._6w);
        stage.addEventListener(MouseEvent.MOUSE_UP, this._O_o);
    }

    private function _6w(_arg1:MouseEvent):void {
        this._09n(this.selected_._U_d.h_, this.selected_._U_d._ew, ((this._yc.height - this._yc.mouseY) / 100));
    }

    private function _O_o(_arg1:MouseEvent):void {
        this._09n(this.selected_._U_d.h_, this.selected_._U_d._ew, ((this._yc.height - this._yc.mouseY) / 100));
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._6w);
        stage.removeEventListener(MouseEvent.MOUSE_UP, this._O_o);
    }

}
}//package _0_j

