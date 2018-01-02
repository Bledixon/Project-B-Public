// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui.Stats

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import _E_7._aS_;

import flash.events.Event;

import com.company.assembleegameclient.objects.Player;

import flash.events.MouseEvent;

public class Stats extends Sprite {

    public static const _att_stat:int = 0;
    public static const _def_stat:int = 1;
    public static const _spd_stat:int = 2;
    public static const _dex_stat:int = 3;
    public static const _vit_stat:int = 4;
    public static const _wis_stat:int = 5;
    public static const _luck_stat:int = 6;
    public static const _crit_stat:int = 7;
    //public static const _7Z_:int = 6; wtf is this

    public function Stats(_arg1:int, _arg2:int) {
        var _local3:XML;
        var _local4:Stat;
        this._086 = new Vector.<Stat>();
        this.toolTip_ = new _aS_(0x2A2A2A, 0x9B9B9B, "", "", 200);
        super();
        this.w_ = _arg1;
        this.h_ = _arg2;
        var _xj:XML = <Stats>
            <Stat>
                <Abbr>ATT</Abbr>
                <Name>Attack</Name>
                <Description>This stat increases the amount of damage done.</Description>
                <RedOnZero/>
            </Stat>
            <Stat>
                <Abbr>DEF</Abbr>
                <Name>Defense</Name>
                <Description>This stat decreases the amount of damage taken.</Description>
            </Stat>
            <Stat>
                <Abbr>SPD</Abbr>
                <Name>Speed</Name>
                <Description>This stat increases the speed at which the character moves.</Description>
                <RedOnZero/>
            </Stat>
            <Stat>
                <Abbr>DEX</Abbr>
                <Name>Dexterity</Name>
                <Description>This stat increases the speed at which the character attacks.</Description>
                <RedOnZero/>
            </Stat>
            <Stat>
                <Abbr>VIT</Abbr>
                <Name>Vitality</Name>
                <Description>This stat increases the speed at which hit points are recovered.</Description>
                <RedOnZero/>
            </Stat>
            <Stat>
                <Abbr>WIS</Abbr>
                <Name>Wisdom</Name>
                <Description>This stat increases the speed at which magic points are recovered.</Description>
                <RedOnZero/>
            </Stat>
            <Stat>
                <Abbr>LUCK</Abbr>
                <Name>Luck</Name>
                <Description>This stat increases the chance to obtain loot.</Description>
                <RedOnZero/>
            </Stat>
            <Stat>
                <Abbr>CRIT</Abbr>
                <Name>Critical</Name>
                <Description>This stat increases the possibility of making critical damage.</Description>
                <RedOnZero/>
            </Stat>
        </Stats>;
        for each (_local3 in _xj.Stat) {
            _local4 = new Stat(_local3.Abbr, _local3.Name, _local3.Description, _local3.hasOwnProperty("RedOnZero"));
            _local4.x = ((8 + 26) + (int((this._086.length % 2)) * ((this.w_ / 2) - 4)));
            _local4.y = ((8 + (this.h_ / 6)) + ((int((this._086.length / 2)) * this.h_) / 3));
            addChild(_local4);
            this._086.push(_local4);
        }
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var w_:int;
    public var h_:int;
    public var _086:Vector.<Stat>;
    public var toolTip_:_aS_;

    public function draw(_arg1:Player):void {
        this._086[_att_stat].draw(_arg1.attack_, _arg1._05s, _arg1._X_2);
        this._086[_def_stat].draw(_arg1.defense_, _arg1._07f, _arg1._0B_S_);
        this._086[_spd_stat].draw(_arg1.speed_, _arg1._065, _arg1._b8);
        this._086[_dex_stat].draw(_arg1.dexterity_, _arg1._cu, _arg1._07C_);
        this._086[_vit_stat].draw(_arg1.vitality_, _arg1._pP_, _arg1._N_s);
        this._086[_wis_stat].draw(_arg1.wisdom_, _arg1._B_e, _arg1._05Q_);
        this._086[_luck_stat].draw(_arg1.luck_, _arg1.stat_luck, _arg1.stat_luckI);
        this._086[_crit_stat].draw(_arg1.crit_, _arg1.stat_crit, _arg1.stat_critI);
    }

    private function onAddedToStage(_arg1:Event):void {
        var _local2:Stat;
        for each (_local2 in this._086) {
            _local2.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            _local2.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        var _local2:Stat;
        if (this.toolTip_.parent != null) {
            this.toolTip_.parent.removeChild(this.toolTip_);
        }
        for each (_local2 in this._086) {
            _local2.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            _local2.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        }
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        var _local2:Stat = (_arg1.target as Stat);
        this.toolTip_._N_k(_local2.fullName_);
        this.toolTip_._02C_(_local2.description_);
        if (!stage.contains(this.toolTip_)) {
            stage.addChild(this.toolTip_);
        }
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        var _local2:Stat = (_arg1.target as Stat);
        if (this.toolTip_.parent != null) {
            this.toolTip_.parent.removeChild(this.toolTip_);
        }
    }

}
}//package com.company.assembleegameclient.ui

import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.text.TextFormat;

class Stat extends Sprite {

    public var fullName_:String;
    public var description_:String;
    public var nameText_:SimpleText;
    public var valText_:SimpleText;
    public var redOnZero_:Boolean;
    public var val_:int = -1;
    public var boost_:int = -1;
    public var valColor_:uint = 0xB3B3B3;

    public function Stat(_arg1:String, _arg2:String, _arg3:String, _arg4:Boolean) {
        this.fullName_ = _arg2;
        this.description_ = _arg3;
        this.nameText_ = new SimpleText(12, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.text = _arg1;
        this.nameText_.updateMetrics();
        this.nameText_.x = -(this.nameText_.width);
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this.valText_ = new SimpleText(12, this.valColor_, false, 0, 0, "Myriad Pro");
        this.valText_.setBold(true);
        this.valText_.text = "-";
        this.valText_.updateMetrics();
        this.valText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.valText_);
        this.redOnZero_ = _arg4;
    }

    public function draw(_arg1:int, _arg2:int, _arg3:int):void {
        var _local4:uint;
        var _local5:TextFormat;
        if ((((_arg1 == this.val_)) && ((_arg2 == this.boost_)))) {
            return;
        }
        this.val_ = _arg1;
        this.boost_ = _arg2;
        if ((_arg1 - _arg2) >= _arg3) {
            _local4 = 0xFCDF00;
        } else {
            if (((((this.redOnZero_) && ((this.val_ <= 0)))) || ((this.boost_ < 0)))) {
                _local4 = 16726072;
            } else {
                if (this.boost_ > 0) {
                    _local4 = 6206769;
                } else {
                    _local4 = 0xB3B3B3;
                }
            }
        }
        if (this.valColor_ != _local4) {
            this.valColor_ = _local4;
            _local5 = this.valText_.defaultTextFormat;
            _local5.color = this.valColor_;
            this.valText_.setTextFormat(_local5);
            this.valText_.defaultTextFormat = _local5;
        }
        this.valText_.text = this.val_.toString();
        if (this.boost_ != 0) {
            this.valText_.text = (this.valText_.text + (((" (" + (((this.boost_ > 0)) ? "+" : "")) + this.boost_.toString()) + ")"));
        }
        this.valText_.updateMetrics();
    }

}

