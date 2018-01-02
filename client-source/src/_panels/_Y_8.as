// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._Y_8

package _panels {
import com.company.assembleegameclient.objects.Portal;
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._7f;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;
import flash.events.Event;

import com.company.assembleegameclient.game.GameSprite;

import flash.events.MouseEvent;
import flash.events.KeyboardEvent;

import com.company.assembleegameclient.ui.ui_chat;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.googleanalytics.GA;
import com.company.assembleegameclient.tutorial.doneAction;
import com.company.assembleegameclient.tutorial.Tutorial;

public class _Y_8 extends Panel {

    public function _Y_8(_arg1:GameSprite, _arg2:Portal) {
        super(_arg1);
        this._iA_ = _arg2;
        this.nameText_ = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.htmlText = '<p align="center">Portal</p>';
        this.nameText_.wordWrap = true;
        this.nameText_.multiline = true;
        this.nameText_.autoSize = TextFieldAutoSize.CENTER;
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this._O_M_ = new _7f(16, "Enter");
        addChild(this._O_M_);
        this._0C_U_ = new SimpleText(18, 0xFF0000, false, WIDTH, 0, "Myriad Pro");
        this._0C_U_.setBold(true);
        if (this._iA_._xq) {
            this._0C_U_.htmlText = '<p align="center">Locked</p>';
        } else {
            this._0C_U_.htmlText = '<p align="center">Full</p>';
        }
        this._0C_U_.autoSize = TextFieldAutoSize.CENTER;
        this._0C_U_.filters = [new DropShadowFilter(0, 0, 0)];
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _iA_:Portal;
    private var nameText_:SimpleText;
    private var _O_M_:_7f;
    private var _0C_U_:SimpleText;

    override public function draw():void {
        var _local1:String = this._iA_._include();
        var _local2 = "Locked ";
        if (((this._iA_._xq) && ((_local1.indexOf(_local2) == 0)))) {
            _local1 = _local1.substr(_local2.length);
        }
        this.nameText_.htmlText = (('<p align="center">' + _local1) + "</p>");
        this.nameText_._08S_();
        if (this.nameText_.height > 30) {
            this.nameText_.y = 0;
        } else {
            this.nameText_.y = 6;
        }
        if (((((!(this._iA_._xq)) && (this._iA_._09S_))) && (contains(this._0C_U_)))) {
            removeChild(this._0C_U_);
            addChild(this._O_M_);
        } else {
            if (((((this._iA_._xq) || (!(this._iA_._09S_)))) && (contains(this._O_M_)))) {
                removeChild(this._O_M_);
                addChild(this._0C_U_);
            }
        }
    }

    private function enterPortal():void {
        var _local1:String = ObjectLibrary._0D_N_[this._iA_.objectType_];
        if (_local1 == "Nexus Portal") {
            //GA.global().trackEvent("enterPortal", _local1);
        } else {
            //GA.global().trackEvent("enterPortal", this._iA_._include());
        }
        doneAction(gs_, Tutorial._Y_5);
        gs_.gsc_.usePortal(this._iA_.objectId_);
    }

    private function onAddedToStage(_arg1:Event):void {
        this.nameText_.y = 6;
        this._O_M_.x = ((WIDTH / 2) - (this._O_M_.width / 2));
        this._O_M_.y = ((HEIGHT - this._O_M_.height) - 4);
        this._0C_U_.y = ((HEIGHT - this._0C_U_.height) - 12);
        this._O_M_.addEventListener(MouseEvent.CLICK, this._xH_);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    private function _xH_(_arg1:MouseEvent):void {
        this.enterPortal();
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        if ((((_arg1.keyCode == Parameters.data_.interact)) && (!(ui_chat._0G_B_)))) {
            this.enterPortal();
        }
    }

}
}//package _panels

