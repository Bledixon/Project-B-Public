// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine.Server_list

package com.company.assembleegameclient.appengine {
import _G_A_._8P_;

import _eZ_._08b;

import com.company.assembleegameclient.objects.Player;

import flash.events.Event;

import com.company.util._0K_N_;

import com.company.assembleegameclient.net.Server;

import _qN_.Account;

import com.company.assembleegameclient.util._04d;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.objects.ObjectLibrary;

import com.company.assembleegameclient.net.*;

import _qN_.*;

public class Server_list extends Event {

    public static const SAVED_CHARS_LIST:String = "SAVED_CHARS_LIST";
    private static const _S_O_:int = 86400000;
    private static const _0E_5:_0K_N_ = new _0K_N_(37.4436, -122.412);

    public var _0F_V_:String;
    public var _Q_I_:XML;
    public var accountId_:int;
    public var nextCharId_:int;
    public var maxNumChars_:int;
    public var numChars_:int = 0;
    public var savedChars_:Vector.<SavedCharacter>;
    public var charStats_:Object;
    public var totalFame_:int = 0;
    public var keys_:int = 0;
    public var fame_:int = 0;
    public var credits_:int = 0;
    public var numStars_:int = 0;
    public var nextCharSlotPrice_:int;
    public var guildName_:String;
    public var guildRank_:int;
    public var servers_:Vector.<Server>;
    public var name_:String = null;
    public var _hv:Boolean;
    public var converted_:Boolean;
    public var _V_v:Boolean;
    public var _tZ_:Vector.<_vt>;
    public var _0C_6:_0K_N_;
    public var _0gi:Object;

    public function Server_list(_arg1:String) {
        var _local4:*;
        var _local5:Account;
        this.savedChars_ = new Vector.<SavedCharacter>();
        this.charStats_ = {};
        this.servers_ = new Vector.<Server>();
        this._tZ_ = new Vector.<_vt>();
        super(SAVED_CHARS_LIST);
        this._0F_V_ = _arg1;
        this._Q_I_ = new XML(this._0F_V_);
        var _local2:XML = XML(this._Q_I_.Account);
        this._cb(_local2);
        this._t6(_local2);
        this._09g(_local2);
        this._0E_U_();
        this._G_C_();
        this._5Z_();
        this._09w();
        this._Q_();
        this._0I_M_();
        var _local3:_08b = _8P_._V_O_();
        if (_local3) {
            _local5 = _local3.getInstance(Account);
            _local5.reportIntStat("BestLevel", this._04F_());
            _local5.reportIntStat("BestFame", this._0I_Q_());
            _local5.reportIntStat("NumStars", this.numStars_);
        }
        this._0gi = new Object();
        for each (_local4 in this._Q_I_.ClassAvailabilityList.ClassAvailability) {
            this._0gi[_local4.@id.toString()] = _local4.toString();
        }
    }

    override public function clone():Event {
        return (new Server_list(this._0F_V_));
    }

    override public function toString():String {
        return (((((("[" + " numChars: ") + this.numChars_) + " maxNumChars: ") + this.maxNumChars_) + " ]"));
    }

    public function bestLevel(_arg1:int):int {
        var _local2:_0A_H_ = this.charStats_[_arg1];
        return ((((_local2 == null)) ? 0 : _local2.bestLevel()));
    }

    public function _04F_():int {
        var _local2:_0A_H_;
        var _local1:int;
        for each (_local2 in this.charStats_) {
            if (_local2.bestLevel() > _local1) {
                _local1 = _local2.bestLevel();
            }
        }
        return (_local1);
    }

    public function _0D_E_(_arg1:int):int {
        var _local2:_0A_H_ = this.charStats_[_arg1];
        return ((((_local2 == null)) ? 0 : _local2._0D_E_()));
    }

    public function _0I_Q_():int {
        var _local2:_0A_H_;
        var _local1:int;
        for each (_local2 in this.charStats_) {
            if (_local2._0D_E_() > _local1) {
                _local1 = _local2._0D_E_();
            }
        }
        return (_local1);
    }

    public function isAvailable(_arg1:int):Boolean {
        var _local3:XML;
        var _local4:int;
        var _local2:XML = ObjectLibrary._Q_F_[_arg1];
        for each (_local3 in _local2.UnlockLevel) {
            _local4 = ObjectLibrary._pb[_local3.toString()];
            if (this.bestLevel(_local4) < int(_local3.@level)) {
                return (false);
            }
        }
        return (true);
    }

    public function _rv():int {
        return ((this.maxNumChars_ - this.numChars_));
    }

    public function hasAvailableCharSlot():Boolean {
        return ((this.numChars_ < this.maxNumChars_));
    }

    public function _B_7(_arg1:int, _arg2:int):Array {
        var _local5:XML;
        var _local6:int;
        var _local7:Boolean;
        var _local8:Boolean;
        var _local9:XML;
        var _local10:int;
        var _local11:int;
        var _local3:Array = [];
        var _local4:int;
        while (_local4 < ObjectLibrary._tj.length) {
            _local5 = ObjectLibrary._tj[_local4];
            _local6 = int(_local5.@type);
            if (!this.isAvailable(_local6)) {
                _local7 = true;
                _local8 = false;
                for each (_local9 in _local5.UnlockLevel) {
                    _local10 = ObjectLibrary._pb[_local9.toString()];
                    _local11 = int(_local9.@level);
                    if (this.bestLevel(_local10) < _local11) {
                        if (((!((_local10 == _arg1))) || (!((_local11 == _arg2))))) {
                            _local7 = false;
                            break;
                        }
                        _local8 = true;
                    }
                }
                if (((_local7) && (_local8))) {
                    _local3.push(_local6);
                }
            }
            _local4++;
        }
        return (_local3);
    }

    public function _04D_():Server {
        var _local4:Server;
        var _local5:int;
        var _local6:Number;
        if (!Parameters.isTesting) {
            return (new Server("Ent", "localhost", Parameters.gamePort));
        }
        var _local1:Server;
        var _local2:Number = Number.MAX_VALUE;
        var _local3:int = int.MAX_VALUE;
        for each (_local4 in this.servers_) {
            if (!((_local4._02s()) && (!(this._V_v)))) {
                if (_local4.name_ == Parameters.data_.preferredServer) {
                    return (_local4);
                }
                _local5 = _local4.priority();
                _local6 = _0K_N_.distance(this._0C_6, _local4.latLong_);
                if ((((_local5 < _local3)) || ((((_local5 == _local3)) && ((_local6 < _local2)))))) {
                    _local1 = _local4;
                    _local2 = _local6;
                    _local3 = _local5;
                }
            }
        }
        return (_local1);
    }

    private function _cb(_arg1:XML):void {
        this.accountId_ = _arg1.AccountId;
        this.name_ = _arg1.Name;
        this._hv = _arg1.hasOwnProperty("NameChosen");
        this.converted_ = _arg1.hasOwnProperty("Converted");
        this._V_v = _arg1.hasOwnProperty("Admin");
        Player._e_D = this._V_v;
        this.totalFame_ = int(_arg1.Stats.TotalFame);
        this.fame_ = int(_arg1.Stats.Fame);
        this.credits_ = int(_arg1.Credits);
        this.keys_ = int(_arg1.Keys);
        this.nextCharSlotPrice_ = int(_arg1.NextCharSlotPrice);
    }

    private function _t6(_arg1:XML):void {
        var _local2:int;
        var _local3:Number;
        var _local4:Boolean;
        if (_arg1.hasOwnProperty("BeginnerPackageTimeLeft")) {
            _local2 = _04d._3r(_arg1.BeginnerPackageTimeLeft);
            Parameters.data_.beginnersOfferTimeLeft = _local2;
            _local3 = new Date().time;
            _local4 = (((_local2 > 0)) && ((Parameters.data_.beginnersOfferShowNowTime < _local3)));
            Parameters.data_.beginnersOfferShowNow = _local4;
            if (_local4) {
                Parameters.data_.beginnersOfferShowNowTime = (_local3 + _S_O_);
            }
        }
    }

    private function _09g(_arg1:XML):void {
        var _local2:XML;
        if (_arg1.hasOwnProperty("Guild")) {
            _local2 = XML(_arg1.Guild);
            this.guildName_ = _local2.Name;
            this.guildRank_ = int(_local2.Rank);
        }
    }

    private function _0E_U_():void {
        var _local1:XML;
        this.nextCharId_ = int(this._Q_I_.@nextCharId);
        this.maxNumChars_ = int(this._Q_I_.@maxNumChars);
        for each (_local1 in this._Q_I_.Char) {
            this.savedChars_.push(new SavedCharacter(_local1, this.name_));
            this.numChars_++;
        }
        this.savedChars_.sort(SavedCharacter._N_Q_);
    }

    private function _G_C_():void {
        var _local2:XML;
        var _local3:int;
        var _local4:_0A_H_;
        var _local1:XML = XML(this._Q_I_.Account.Stats);
        for each (_local2 in _local1.ClassStats) {
            _local3 = int(_local2.@objectType);
            _local4 = new _0A_H_(_local2);
            this.numStars_ = (this.numStars_ + _local4._lr());
            this.charStats_[_local3] = _local4;
        }
    }

    private function _5Z_():void {
        var _local2:XML;
        var _local1:XML = XML(this._Q_I_.Servers);
        for each (_local2 in _local1.Server) {
            this.servers_.push(new Server(_local2.Name, _local2.DNS, Parameters.gamePort, new _0K_N_(Number(_local2.Lat), Number(_local2.Long)), Number(_local2.Usage), _local2.hasOwnProperty("AdminOnly")));
        }
    }

    private function _09w():void {
        var _local2:XML;
        var _local1:XML = XML(this._Q_I_.News);
        for each (_local2 in _local1.Item) {
            this._tZ_.push(new _vt(_local2.Icon, _local2.Title, _local2.TagLine, _local2.Link, int(_local2.Date)));
        }
    }

    private function _Q_():void {
        if (((this._Q_I_.hasOwnProperty("Lat")) && (this._Q_I_.hasOwnProperty("Long")))) {
            this._0C_6 = new _0K_N_(Number(this._Q_I_.Lat), Number(this._Q_I_.Long));
        } else {
            this._0C_6 = _0E_5;
        }
    }

    private function _0I_M_():void {
        var _local3:XML;
        var _local4:int;
        var _local1:int;
        var _local2:int;
        while (_local2 < ObjectLibrary._tj.length) {
            _local3 = ObjectLibrary._tj[_local2];
            _local4 = int(_local3.@type);
            if (this.isAvailable(_local4)) {
                Account._get().reportIntStat((_local3.@id + "Unlocked"), 1);
                _local1++;
            }
            _local2++;
        }
        Account._get().reportIntStat("ClassesUnlocked", _local1);
    }

}
}//package com.company.assembleegameclient.appengine

