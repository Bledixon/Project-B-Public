// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._3V_

package _F_1 {
import flash.display.Sprite;

import com.company.assembleegameclient.ui._00A_;
import com.company.ui.SimpleText;

import flash.display.Shape;

import com.company.assembleegameclient.ui._0K_B_;

import _sp._aJ_;

import _02t._R_f;

import flash.filters.DropShadowFilter;
import flash.display.Graphics;

import com.company.assembleegameclient.ui._Q_y;
import com.company.rotmg.graphics.ScreenGraphic;

import flash.events.MouseEvent;

import _S_K_._u3;

import com.company.googleanalytics.GA;

import flash.events.Event;


public class _3V_ extends Sprite {

    private static const _F_D_:Array = ["Week", "Month", "All Time"];
    private static const _Q_J_:Object = {
        "Week": "week",
        "Month": "month",
        "All Time": "all"
    };

    private static var selected_:_00A_;

    public function _3V_() {
        var _local4:_00A_;
        this.cache_ = {};
        this._C_F_ = new Vector.<_00A_>();
        super();
        this._8m = new _aJ_();
        this._T_c = new _aJ_();
        addChild(new _charscreen());
        this._P_V_ = new SimpleText(32, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.text = "Legends";
        this._P_V_.updateMetrics();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        addChild(this._P_V_);
        this._j7 = new SimpleText(22, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._j7.setBold(true);
        this._j7.text = "Loading...";
        this._j7._08S_();
        this._j7.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._j7.x = ((800 / 2) - (this._j7.width / 2));
        this._j7.y = ((600 / 2) - (this._j7.height / 2));
        this._j7.visible = false;
        addChild(this._j7);
        this._017 = new Sprite();
        this._017.x = 10;
        this._017.y = 110;
        var _local1:Shape = new Shape();
        var _local2:Graphics = _local1.graphics;
        _local2.beginFill(0);
        _local2.drawRect(0, 0, _Q_y.WIDTH, 430);
        _local2.endFill();
        this._017.addChild(_local1);
        this._017.mask = _local1;
        addChild(this._017);
        //addChild(new ScreenGraphic());
        this._dL_ = new Shape();
        addChild(this._dL_);
        this._E_k = new _0K_B_(16, 400);
        this._E_k.x = ((800 - this._E_k.width) - 4);
        this._E_k.y = 104;
        addChild(this._E_k);
        var _local3:int;
        while (_local3 < _F_D_.length) {
            _local4 = new _00A_(_F_D_[_local3]);
            _local4.x = (20 + (_local3 * 90));
            _local4.y = 70;
            _local4.addEventListener(MouseEvent.MOUSE_DOWN, this._qi);
            addChild(_local4);
            this._C_F_.push(_local4);
            _local3++;
        }
        this._045 = new _H_o("done", 36, false);
        addChild(this._045);
        this.setSelected(((selected_) || (this._C_F_[0])));
        this.close = new _u3(this._045, MouseEvent.CLICK);
    }
    public var close:_aJ_;
    public var _8m:_aJ_;
    public var _T_c:_aJ_;
    private var cache_:Object;
    private var _P_V_:SimpleText;
    private var _j7:SimpleText;
    private var _017:Sprite;
    private var _045:_H_o;
    private var _dL_:Shape;
    private var _E_k:_0K_B_;
    private var _C_F_:Vector.<_00A_>;
    private var _0A_z:Sprite;
    private var accountId_:int;
    private var charId_:int;

    public function initialize():void {
        this._P_V_.y = 24;
        stage;
        this._P_V_.x = ((800 / 2) - (this._P_V_.width / 2));
        var _local1:Graphics = this._dL_.graphics;
        _local1.clear();
        _local1.lineStyle(2, 0xFFFFFF);
        _local1.moveTo(0, 100);
        stage;
        _local1.lineTo(800, 100);
        _local1.lineStyle();
        stage;
        this._045.x = ((800 / 2) - (this._045.width / 2));
        this._045.y = 524;
        //GA.global().trackPageview("/legendsScreen");
    }

    public function _0d(_arg1:XML):void {
        var _local2:Sprite;
        var _local3:_Q_y;
        var _local6:XML;
        var _local7:Boolean;
        var _local8:XML;
        this._j7.visible = false;
        _local2 = new Sprite();
        var _local4:int = 1;
        var _local5:Number = Number.MIN_VALUE;
        for each (_local6 in _arg1.FameListElem) {
            _local7 = (int(_local6.@accountId) == this.accountId_);
            _local3 = new _Q_y(_local7, _local4, _local6);
            _local3.y = ((_local4 - 1) * _Q_y.HEIGHT);
            if (((_local7) && ((int(_local6.@charId) == this.charId_)))) {
                _local5 = (_local3.y + (_Q_y.HEIGHT / 2));
            }
            _local3.addEventListener(MouseEvent.MOUSE_DOWN, this._6P_);
            _local2.addChild(_local3);
            _local4++;
        }
        if (_local5 == Number.MIN_VALUE) {
            for each (_local8 in _arg1.MyFameListElem) {
                _local3 = new _Q_y(true, -1, _local8);
                _local3.y = ((_local4 - 1) * _Q_y.HEIGHT);
                _local5 = (_local3.y + (_Q_y.HEIGHT / 2));
                _local3.addEventListener(MouseEvent.MOUSE_DOWN, this._6P_);
                _local2.addChild(_local3);
                _local4++;
            }
        }
        this.cache_[String(_arg1.@timespan)] = {
            "listSprite": _local2,
            "charY": _local5
        };
        this._3J_(_local2, _local5);
    }

    public function _cC_(_arg1:String):void {
    }

    private function setSelected(_arg1:_00A_):void {
        var _local2:_00A_;
        if (_arg1 == selected_) {
            return;
        }
        for each (_local2 in this._C_F_) {
            _local2.setSelected(false);
        }
        selected_ = _arg1;
        selected_.setSelected(true);
        this._gB_(_Q_J_[selected_.label_]);
    }

    private function _gB_(_arg1:String):void {
        var _local2:Object;
        if (this._0A_z != null) {
            this._017.removeChild(this._0A_z);
            this._0A_z = null;
        }
        this._E_k.visible = false;
        if (this.cache_.hasOwnProperty(_arg1)) {
            _local2 = this.cache_[_arg1];
            this._3J_(_local2["listSprite"], _local2["charY"]);
        } else {
            this._8m.dispatch(_arg1);
            this._j7.visible = true;
        }
    }

    private function _3J_(_arg1:Sprite, _arg2:Number):void {
        this._0A_z = _arg1;
        this._017.addChild(this._0A_z);
        if (this._0A_z.height > 400) {
            this._E_k.visible = true;
            this._E_k._fA_(400, this._0A_z.height);
            this._E_k.addEventListener(Event.CHANGE, this._A_E_);
            if (_arg2 != Number.MIN_VALUE) {
                this._E_k._0D__(((_arg2 - 200) / (this._0A_z.height - 400)));
            }
        } else {
            this._E_k.visible = false;
        }
    }

    private function _qi(_arg1:MouseEvent):void {
        this.setSelected((_arg1.currentTarget as _00A_));
    }

    private function _A_E_(_arg1:Event):void {
        this._0A_z.y = (-(this._E_k._Q_D_()) * (this._0A_z.height - 400));
    }

    private function _6P_(_arg1:MouseEvent):void {
        if (this._0A_z != null) {
            this._017.removeChild(this._0A_z);
            this._0A_z = null;
        }
        var _local2:_Q_y = (_arg1.currentTarget as _Q_y);
        this._T_c.dispatch(_local2.accountId_, _local2.charId_);
    }

}
}//package _F_1

