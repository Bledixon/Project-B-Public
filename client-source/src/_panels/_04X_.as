// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._04X_

package _panels {
import com.company.ui.SimpleText;

import flash.display.Sprite;

import com.company.assembleegameclient.ui._u5;
import com.company.assembleegameclient.objects.Player;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._07E_;
import com.company.assembleegameclient.ui._7f;

import flash.events.MouseEvent;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.Currency;
import com.company.assembleegameclient.game.GameSprite;

import _0L_C_._qO_;

import flash.events.Event;

import com.company.assembleegameclient.ui.FrameHolder;

import _0D_d._lx;

public class _04X_ extends Panel {

    public function _04X_(_arg1:GameSprite) {
        var _local3:String;
        var _local4:_u5;
        super(_arg1);
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local2:Player = gs_.map_.player_;
        this._O_k = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this._O_k.setBold(true);
        this._O_k.wordWrap = true;
        this._O_k.multiline = true;
        this._O_k.autoSize = TextFieldAutoSize.CENTER;
        this._O_k.filters = [new DropShadowFilter(0, 0, 0)];
        if (((!((_local2.guildName_ == null))) && ((_local2.guildName_.length > 0)))) {
            _local3 = _07E_._0C_n(_local2.guildRank_);
            this._O_k.htmlText = (((('<p align="center">' + _local3) + " of \n") + _local2.guildName_) + "</p>");
            this._O_k.y = 0;
            addChild(this._O_k);
            this._ek = new _7f(16, "Renounce");
            this._ek.addEventListener(MouseEvent.CLICK, this._38);
            this._ek.x = ((WIDTH / 2) - (this._ek.width / 2));
            this._ek.y = ((HEIGHT - this._ek.height) - 4);
            addChild(this._ek);
        } else {
            this._O_k.htmlText = '<p align="center">Create a Guild</p>';
            this._O_k.y = 0;
            addChild(this._O_k);
            _local4 = new _u5("Create ", 16, Parameters._0H_m, Currency.FAME);
            _local4.addEventListener(MouseEvent.CLICK, this._0M_n);
            _local4.x = ((WIDTH / 2) - (_local4.w_ / 2));
            _local4.y = ((HEIGHT - (_local4.height / 2)) - 10);
            addChild(_local4);
            this._ek = _local4;
        }
    }
    private var _O_k:SimpleText;
    private var _ek:Sprite;

    public function _38(_arg1:MouseEvent):void {
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local2:Player = gs_.map_.player_;
        var _local3:_qO_ = new _qO_(("Are you sure you want to quit:\n" + _local2.guildName_), "Renounce Guild", "No, I'll stay", "Yes, I'll quit", "/renounceGuild");
        _local3.addEventListener(_qO_.BUTTON1_EVENT, this._S_V_);
        _local3.addEventListener(_qO_.BUTTON2_EVENT, this._J_2);
        stage.addChild(_local3);
    }

    public function _0M_n(_arg1:MouseEvent):void {
        var _local2:Sprite = new FrameHolder(new _lx(gs_));
        stage.addChild(_local2);
        visible = false;
    }

    private function _S_V_(_arg1:Event):void {
        stage.removeChild((_arg1.currentTarget as _qO_));
    }

    private function _J_2(_arg1:Event):void {
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local2:Player = gs_.map_.player_;
        gs_.gsc_.guildRemove(_local2.name_);
        stage.removeChild((_arg1.currentTarget as _qO_));
        visible = false;
    }

}
}//package _panels

