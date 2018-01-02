// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._yo

package _panels {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GuildHallPortal;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.ui_chat;
import com.company.assembleegameclient.ui._7f;
import com.company.ui.SimpleText;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;

public class _yo extends Panel {

    public function _yo(_arg1:GameSprite, _arg2:GuildHallPortal) {
        super(_arg1);
        this._iA_ = _arg2;
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local3:Player = gs_.map_.player_;
        this.nameText_ = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.htmlText = '<p align="center">Guild Hall</p>';
        this.nameText_.wordWrap = true;
        this.nameText_.multiline = true;
        this.nameText_.autoSize = TextFieldAutoSize.CENTER;
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.nameText_.y = 6;
        addChild(this.nameText_);
        if (((!((_local3.guildName_ == null))) && ((_local3.guildName_.length > 0)))) {
            this._O_M_ = new _7f(16, "Enter");
            this._O_M_.addEventListener(MouseEvent.CLICK, this._xH_);
            this._O_M_.x = ((WIDTH / 2) - (this._O_M_.width / 2));
            this._O_M_.y = ((HEIGHT - this._O_M_.height) - 4);
            addChild(this._O_M_);
            addEventListener(Event.ADDED_TO_STAGE, this._W_Z_);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        } else {
            this._0J_T_ = new SimpleText(18, 0xFF0000, false, WIDTH, 0, "Myriad Pro");
            this._0J_T_.setBold(true);
            this._0J_T_.htmlText = '<p align="center">Not In Guild</p>';
            this._0J_T_.autoSize = TextFieldAutoSize.CENTER;
            this._0J_T_.filters = [new DropShadowFilter(0, 0, 0)];
            this._0J_T_.y = ((HEIGHT - this._0J_T_.height) - 12);
            addChild(this._0J_T_);
        }
    }
    private var _iA_:GuildHallPortal;
    private var nameText_:SimpleText;
    private var _O_M_:_7f;
    private var _0J_T_:SimpleText;

    private function enterPortal():void {
        gs_.gsc_.usePortal(this._iA_.objectId_);
    }

    private function _W_Z_(_arg1:Event):void {
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

