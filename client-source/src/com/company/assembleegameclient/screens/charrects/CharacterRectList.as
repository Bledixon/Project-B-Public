// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.screens.charrects.CharacterRectList

package com.company.assembleegameclient.screens.charrects {
import _0L_C_._aZ_;

import flash.display.Sprite;

import com.company.assembleegameclient.appengine.Server_list;

import _F_1._05p;

import _sp._aJ_;

import com.company.assembleegameclient.appengine.SavedCharacter;

import flash.events.MouseEvent;

import _0L_C_._qO_;

import flash.events.Event;

import _0L_C_._tc;

import _qN_.Account;

import _0L_C_._0G_H_;
import _0L_C_._0G_y;

import _zo._mS_;

import _0L_C_._Z_t;

public class CharacterRectList extends Sprite {

    public function CharacterRectList(_arg1:Server_list, _arg2:_05p) {
        var _local5:SavedCharacter;
        var _local6:BuyCharacterRect;
        var _local7:CurrentCharacterRect;
        var _local8:int;
        var _local9:CreateNewCharacterRect;
        super();
        this.charList_ = _arg1;
        this.screen_ = _arg2;
        this.newCharacter = new _aJ_();
        var _local3:int = 4;
        var _local4:int = 4;
        for each (_local5 in _arg1.savedChars_) {
            _local7 = new CurrentCharacterRect(this.charList_.name_, _local5, this.charList_.charStats_[_local5.objectType()]);
            _local7.x = _local3;
            _local7.y = _local4;
            addChild(_local7);
            _local4 = (_local4 + (CharacterRect.HEIGHT + 4));
        }
        if (_arg1.hasAvailableCharSlot() && _arg1.servers_.length != 0) {
            _local8 = 0;
            while (_local8 < _arg1._rv()) {
                _local9 = new CreateNewCharacterRect(_arg1);
                _local9.addEventListener(MouseEvent.MOUSE_DOWN, this.onNewChar);
                _local9.x = _local3;
                _local9.y = _local4;
                addChild(_local9);
                _local4 = (_local4 + (CharacterRect.HEIGHT + 4));
                _local8++;
            }
        }
        _local6 = new BuyCharacterRect(_arg1);
        _local6.addEventListener(MouseEvent.MOUSE_DOWN, this.onBuyCharSlot);
        _local6.x = _local3;
        _local6.y = _local4;
        addChild(_local6);
    }
    public var newCharacter:_aJ_;
    public var deleteCharacter:_aJ_;
    private var charList_:Server_list;
    private var screen_:_05p;

    private function onCancel(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        this.screen_.removeChild(_local2);
    }

    private function onNewChar(_arg1:Event):void {
        this.newCharacter.dispatch();
    }

    private function onBuyCharSlot(_arg1:Event):void {
        var _local3:_tc;
        if (!Account._get().isRegistered()) {
            _local3 = new _tc();
            _local3.addEventListener(_qO_.BUTTON1_EVENT, this.onCancel);
            _local3.addEventListener(_qO_.BUTTON2_EVENT, this.onDialogRegister);
            this.screen_.addChild(_local3);
            return;
        }
        if (this.charList_.fame_ < this.charList_.nextCharSlotPrice_) {
            this.screen_.addChild(new _aZ_());
            return;
        }
        var _local2:_0G_y = new _0G_y(this.charList_.nextCharSlotPrice_);
        _local2.addEventListener(_mS_.TEXT_ERROR, this.onDialogError);
        this.screen_.addChild(_local2);
    }

    private function onDialogRegister(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        ((_local2.parent) && (_local2.parent.removeChild(_local2)));
        this.screen_._0j();
    }

    private function onDialogError(_arg1:_mS_):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        this.screen_.removeChild(_local2);
        var _local3:_Z_t = new _Z_t(_arg1.text_);
        this.screen_.addChild(_local3);
    }

}
}//package com.company.assembleegameclient.screens.charrects

