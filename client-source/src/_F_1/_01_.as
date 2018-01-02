// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._01_

package _F_1 {
import com.company.ui.SimpleText;

import flash.display.Shape;
import flash.display.Sprite;

import com.company.assembleegameclient.ui._0K_B_;

import _sp._aJ_;

import _02t._R_f;

import flash.events.Event;
import flash.filters.DropShadowFilter;

import com.company.rotmg.graphics.ScreenGraphic;

import flash.events.MouseEvent;
import flash.display.Graphics;

import com.company.googleanalytics.GA;
import com.company.assembleegameclient.appengine.Server_list;

public class _01_ extends _05p {

    public function _01_() {
        addChild(new _charscreen());
        this._4s = new _aJ_();
        super(_C_Q_);
    }
    public var _4s:_aJ_;
    private var _045:_H_o;
    private var _S_w:SimpleText;
    private var _dL_:Shape;
    private var _cc:Sprite;
    private var _I_d:_0M_L_;
    private var _E_k:_0K_B_;

    override public function initialize(_arg1:Server_list):void {
        super.initialize(_arg1);
        this._S_w = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._S_w.setBold(true);
        this._S_w.text = "Select Server";
        this._S_w.updateMetrics();
        this._S_w.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._S_w.x = 18;
        this._S_w.y = 72;
        addChild(this._S_w);
        this._dL_ = new Shape();
        addChild(this._dL_);
        this._cc = new Sprite();
        this._cc.x = 4;
        this._cc.y = 100;
        var _local2:Shape = new Shape();
        _local2.graphics.beginFill(0xFFFFFF);
        _local2.graphics.drawRect(0, 0, 776, 430);
        _local2.graphics.endFill();
        this._cc.addChild(_local2);
        this._cc.mask = _local2;
        addChild(this._cc);
        this._I_d = new _0M_L_(_arg1.servers_);
        this._I_d.y = 8;
        this._I_d.addEventListener(Event.COMPLETE, this._F_H_);
        this._cc.addChild(this._I_d);
        if (this._I_d.height > 400) {
            this._E_k = new _0K_B_(16, 400);
            this._E_k.x = ((800 - this._E_k.width) - 4);
            this._E_k.y = 104;
            this._E_k._fA_(400, this._I_d.height);
            this._E_k.addEventListener(Event.CHANGE, this._A_E_);
            addChild(this._E_k);
        }
        //addChild(new ScreenGraphic());
        this._045 = new _H_o("done", 36, false);
        this._045.addEventListener(MouseEvent.CLICK, this._F_H_);
        addChild(this._045);
        var _local3:Graphics = this._dL_.graphics;
        _local3.clear();
        _local3.lineStyle(2, 0xEE9327);
        _local3.moveTo(0, 100);
        stage;
        _local3.lineTo(800, 100);
        _local3.lineStyle();
        stage;
        this._045.x = ((800 / 2) - (this._045.width / 2));
        this._045.y = 545;
        //GA.global().trackPageview("/serversScreen");
    }

    private function _A_E_(_arg1:Event):void {
        this._I_d.y = (8 - (this._E_k._Q_D_() * (this._I_d.height - 400)));
    }

    private function _F_H_(_arg1:Event):void {
        this._4s.dispatch();
    }

}
}//package _F_1

