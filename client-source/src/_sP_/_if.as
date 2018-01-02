// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._if

package _sP_ {
import flash.display.Sprite;

import com.company.assembleegameclient.appengine._0B_u;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.Shape;

import com.company.assembleegameclient.ui._0K_B_;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.util._H_U_;

import _qN_.Account;

import _zo._8C_;
import _zo._mS_;

import flash.display.Graphics;

import com.company.assembleegameclient.util._07E_;

import flash.events.Event;

public class _if extends Sprite {

    public function _if(_arg1:int, _arg2:int, _arg3:String = "", _arg4:int = 0) {
        this._09O_ = _arg1;
        this._9U_ = _arg2;
        this._var_ = _arg3;
        this._I_8 = _arg4;
        this._j7 = new SimpleText(22, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._j7.setBold(true);
        this._j7.text = "Loading...";
        this._j7._08S_();
        this._j7.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._j7.x = ((800 / 2) - (this._j7.width / 2));
        this._j7.y = ((600 / 2) - (this._j7.height / 2));
        addChild(this._j7);
        this._3v = new _0B_u(Parameters._fK_(), "/guild", true, 2);
        var _local5:Object = {
            "num": _arg1,
            "offset": _arg2
        };
        _H_U_._t2(_local5, Account._get().credentials());
        this._3v.addEventListener(_8C_.GENERIC_DATA, this._L_5);
        this._3v.addEventListener(_mS_.TEXT_ERROR, this._ix);
        this._3v.sendRequest("listMembers", _local5);
    }
    private var _09O_:int;
    private var _9U_:int;
    private var _var_:String;
    private var _I_8:int;
    private var _3v:_0B_u;
    private var _j7:SimpleText;
    private var _P_V_:SimpleText;
    private var _Q_R_:SimpleText;
    private var _0F_Z_:Bitmap;
    private var _dL_:Shape;
    private var _017:Sprite;
    private var _0A_z:Sprite;
    private var _yT_:SimpleText;
    private var _E_k:_0K_B_;

    private function build(_arg1:XML):void {
        var _local2:Graphics;
        var _local5:XML;
        var _local6:int;
        var _local7:Boolean;
        var _local8:int;
        var _local9:_5N_;
        removeChild(this._j7);
        this._P_V_ = new SimpleText(32, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.text = _arg1.@name;
        this._P_V_._08S_();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._P_V_.y = 24;
        stage;
        this._P_V_.x = ((800 / 2) - (this._P_V_.width / 2));
        addChild(this._P_V_);
        this._Q_R_ = new SimpleText(22, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._Q_R_.text = _arg1.CurrentFame;
        this._Q_R_._08S_();
        this._Q_R_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._Q_R_.x = (0x0300 - this._Q_R_.width);
        this._Q_R_.y = ((32 / 2) - (this._Q_R_.height / 2));
        addChild(this._Q_R_);
        this._0F_Z_ = new Bitmap(_07E_._oO_(40));
        this._0F_Z_.x = 760;
        this._0F_Z_.y = ((32 / 2) - (this._0F_Z_.height / 2));
        addChild(this._0F_Z_);
        this._dL_ = new Shape();
        _local2 = this._dL_.graphics;
        _local2.clear();
        _local2.lineStyle(2, 0x545454);
        _local2.moveTo(0, 100);
        stage;
        _local2.lineTo(800, 100);
        _local2.lineStyle();
        addChild(this._dL_);
        this._017 = new Sprite();
        this._017.x = 10;
        this._017.y = 110;
        var _local3:Shape = new Shape();
        _local2 = _local3.graphics;
        _local2.beginFill(0);
        _local2.drawRect(0, 0, _5N_.WIDTH, 430);
        _local2.endFill();
        this._017.addChild(_local3);
        this._017.mask = _local3;
        addChild(this._017);
        this._0A_z = new Sprite();
        var _local4:int;
        for each (_local5 in _arg1.Member) {
            _local7 = (this._var_ == _local5.Name);
            _local8 = _local5.Rank;
            _local9 = new _5N_(((this._9U_ + _local4) + 1), _local5.Name, _local5.Rank, _local5.Fame, _local7, this._I_8);
            _local9.y = (_local4 * _5N_.HEIGHT);
            this._0A_z.addChild(_local9);
            _local4++;
        }
        _local6 = (_07E_._27 - (this._9U_ + _local4));
        this._yT_ = new SimpleText(22, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._yT_.text = (_local6 + " open slots");
        this._yT_._08S_();
        this._yT_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._yT_.x = ((_5N_.WIDTH / 2) - (this._yT_.width / 2));
        this._yT_.y = (_local4 * _5N_.HEIGHT);
        this._0A_z.addChild(this._yT_);
        this._017.addChild(this._0A_z);
        if (this._0A_z.height > 400) {
            this._E_k = new _0K_B_(16, 400);
            this._E_k.x = ((800 - this._E_k.width) - 4);
            this._E_k.y = 104;
            this._E_k._fA_(400, this._0A_z.height);
            this._E_k.addEventListener(Event.CHANGE, this._A_E_);
            addChild(this._E_k);
        }
    }

    private function _L_5(_arg1:_8C_):void {
        this.build(XML(_arg1.data_));
    }

    private function _ix(_arg1:_mS_):void {
    }

    private function _A_E_(_arg1:Event):void {
        this._0A_z.y = (-(this._E_k._Q_D_()) * (this._0A_z.height - 400));
    }

}
}//package _sP_

