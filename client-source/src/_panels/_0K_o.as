// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._0K_o

package _panels {
import com.company.ui.SimpleText;

import flash.display.Sprite;

import com.company.assembleegameclient.ui._u5;
import com.company.assembleegameclient.objects.Player;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.Currency;

import flash.events.MouseEvent;

import com.company.assembleegameclient.ui._0G_h;
import com.company.assembleegameclient.ui._7f;
import com.company.assembleegameclient.game.GameSprite;

import _qN_.Account;

import com.company.assembleegameclient.ui.FrameHolder;

import _0D_d._8x;

import _0L_C_._2k;

public class _0K_o extends Panel {

    public function _0K_o(_arg1:GameSprite, _arg2:int) {
        var _local5:_u5;
        var _local6:Sprite;
        var _local7:SimpleText;
        var _local8:Sprite;
        super(_arg1);
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local3:Player = gs_.map_.player_;
        this._B_E_ = _local3._hv;
        var _local4:String = gs_.charList_.name_;
        this._O_k = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this._O_k.setBold(true);
        this._O_k.wordWrap = true;
        this._O_k.multiline = true;
        this._O_k.autoSize = TextFieldAutoSize.CENTER;
        this._O_k.filters = [new DropShadowFilter(0, 0, 0)];
        if (this._B_E_) {
            this._O_k.htmlText = (('<p align="center">Your name is: \n' + _local4) + "</p>");
            this._O_k.y = 0;
            addChild(this._O_k);
            _local5 = new _u5("Change ", 16, Parameters._0u, Currency._class);
            _local5.addEventListener(MouseEvent.CLICK, this.onButtonClick);
            _local5.x = ((WIDTH / 2) - (_local5.w_ / 2));
            _local5.y = ((HEIGHT - (_local5.height / 2)) - 10);
            addChild(_local5);
            this._ek = _local5;
        } else {
            if (_local3.numStars_ < _arg2) {
                this._O_k.htmlText = '<p align="center">Choose Account Name</p>';
                addChild(this._O_k);
                _local6 = new Sprite();
                _local7 = new SimpleText(16, 0xFFFFFF, false, 0, 0, "Myriad Pro");
                _local7.setBold(true);
                _local7.text = "Rank Required:";
                _local7.updateMetrics();
                _local7.filters = [new DropShadowFilter(0, 0, 0)];
                _local6.addChild(_local7);
                _local8 = new _0G_h(_arg2, false, false);
                _local8.x = (_local7.width + 4);
                _local8.y = ((_local7.height / 2) - (_local8.height / 2));
                _local6.addChild(_local8);
                _local6.x = ((WIDTH / 2) - (_local6.width / 2));
                _local6.y = ((HEIGHT - (_local6.height / 2)) - 20);
                addChild(_local6);
            } else {
                this._O_k.htmlText = '<p align="center">Choose Account Name</p>';
                this._O_k.y = 6;
                addChild(this._O_k);
                this._ek = new _7f(16, "Choose");
                this._ek.addEventListener(MouseEvent.CLICK, this.onButtonClick);
                this._ek.x = ((WIDTH / 2) - (this._ek.width / 2));
                this._ek.y = ((HEIGHT - this._ek.height) - 4);
                addChild(this._ek);
            }
        }
    }
    private var _B_E_:Boolean;
    private var _O_k:SimpleText;
    private var _ek:Sprite;

    private function onButtonClick(_arg1:MouseEvent):void {
        var _local2:Sprite;
        if (Account._get().isRegistered()) {
            _local2 = new FrameHolder(new _8x(gs_, this._B_E_));
            visible = false;
        } else {
            _local2 = new _2k(("In order to choose an " + "account name, you must be registered"));
        }
        stage.addChild(_local2);
    }

}
}//package _panels

