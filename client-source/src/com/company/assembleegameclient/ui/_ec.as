// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._eb

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import _E_7._for_;

import com.company.assembleegameclient.game.GameSprite;
import com.company.ui.SimpleText;

import com.company.assembleegameclient.net.messages.data._35;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;

import _E_7.EquipmentToolTip;

import _ke._U_c;


public class _ec extends Sprite {

    private static const _pm:Array = [0, 0, 0, 0];
    private static const _xV_:Array = [
        [1, 0, 0, 1],
        _pm,
        _pm,
        [0, 1, 1, 0],
        [1, 0, 0, 0],
        _pm,
        _pm,
        [0, 1, 0, 0],
        [0, 0, 0, 1],
        _pm,
        _pm,
        [0, 0, 1, 0]
    ];
    public static const _0G_E_:int = 0;
    public static const _Q_p:int = 1;
    public static const _iR_:int = 2;

    private static var _fO_:_for_ = null;

    public function _ec(_arg1:GameSprite, _arg2:String, _arg3:Vector.<_35>, _arg4:Boolean) {
        var _local6:_35;
        var _local7:_2j;
        this.slots_ = new Vector.<_2j>();
        super();
        this.gs_ = _arg1;
        this._9y = _arg2;
        this.nameText_ = new SimpleText(20, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.x = 0;
        this.nameText_.y = 0;
        this.nameText_.text = this._9y;
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this.taglineText_ = new SimpleText(12, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.taglineText_.x = 0;
        this.taglineText_.y = 22;
        this.taglineText_.text = "";
        this.taglineText_.updateMetrics();
        this.taglineText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.taglineText_);
        var _local5:int;
        while (_local5 < _arg3.length) {
            _local6 = _arg3[_local5];
            _local7 = new _2j(_local6.item_, _local6._var, _local6.included_, _local6._01T_, (_local5 - 3), _xV_[_local5], _local5, JSON.parse(_local6.data_));
            _local7.x = (int((_local5 % 4)) * (Slot.WIDTH + 4));
            _local7.y = ((int((_local5 / 4)) * (Slot.HEIGHT + 4)) + 46);
            if (_local6.item_ != -1) {
                _local7.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
                _local7.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
            }
            if (((_arg4) && (_local6._var))) {
                _local7.addEventListener(MouseEvent.MOUSE_DOWN, this.__do);
            }
            this.slots_.push(_local7);
            addChild(_local7);
            _local5++;
        }
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var gs_:GameSprite;
    public var _9y:String;
    public var slots_:Vector.<_2j>;
    public var selected_:_2j;
    private var _0_G_:int;
    private var nameText_:SimpleText;
    private var taglineText_:SimpleText;

    public function _ao():int {
        if(this.selected_ == null) {
            return -1;
        } else {
            return this.selected_.id;
        }
    }

    public function _0K_s(_arg1:Vector.<Boolean>):void {
        var _local2:int;
        while (_local2 < this.slots_.length) {
            this.slots_[_local2].setIncluded(_arg1[_local2]);
            _local2++;
        }
    }

    public function _02S_(_arg1:Vector.<Boolean>):Boolean {
        var _local2:int;
        while (_local2 < this.slots_.length) {
            if (_arg1[_local2] != this.slots_[_local2].included_) {
                return (false);
            }
            _local2++;
        }
        return (true);
    }

    public function _07c():int {
        var _local1:int;
        var _local2:int;
        while (_local2 < this.slots_.length) {
            if (this.slots_[_local2].included_) {
                _local1++;
            }
            _local2++;
        }
        return (_local1);
    }

    public function _91():int {
        var _local1:int;
        var _local2:int = 4;
        while (_local2 < this.slots_.length) {
            if (this.slots_[_local2].item_ == -1) {
                _local1++;
            }
            _local2++;
        }
        return (_local1);
    }

    public function _07t(_arg1:int):void {
        switch (_arg1) {
            case _0G_E_:
                this.nameText_.setColor(0xB3B3B3);
                this.taglineText_.setColor(0xB3B3B3);
                this.taglineText_.text = "Click item you want to use";
                this.taglineText_.updateMetrics();
                return;
            case _Q_p:
                this.nameText_.setColor(9022300);
                this.taglineText_.setColor(9022300);
                this.taglineText_.text = "Using item...";
                this.taglineText_.updateMetrics();
                return;
            case _iR_:
                this.nameText_.setColor(0xB3B3B3);
                this.taglineText_.setColor(0xB3B3B3);
                this.taglineText_.text = "Player is selecting items";
                this.taglineText_.updateMetrics();
                return;
        }
    }

    private function _V_B_(_arg1:_for_):void {
        this._X_S_();
        _fO_ = _arg1;
        if (_fO_ != null) {
            stage.addChild(_fO_);
        }
    }

    private function _X_S_():void {
        if (_fO_ != null) {
            if (_fO_.parent != null) {
                _fO_.parent.removeChild(_fO_);
            }
            _fO_ = null;
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this._X_S_();
    }

    private function onMouseOver(_arg1:Event):void {
        var _local2:_2j = (_arg1.currentTarget as _2j);
        this._V_B_(new EquipmentToolTip(_local2.item_, this.gs_.map_.player_, -1, _U_c.OTHER_PLAYER, _local2.id, false, _local2.data_));
    }

    private function onRollOut(_arg1:Event):void {
        this._X_S_();
    }

    private function __do(_arg1:MouseEvent):void {
        var _local2:_2j = (_arg1.currentTarget as _2j);
        _local2.setIncluded(!(_local2.included_));
        if(_local2.included_) {
            this.selected_ = _local2;
        } else {
            this.selected_ = null;
        }
        for each (var _local1:_2j in this.slots_) {
            if(_local1 == _local2) continue;
            _local1.setIncluded(false);
        }
        dispatchEvent(new Event(Event.CHANGE));
    }

}
}//package com.company.assembleegameclient.ui

