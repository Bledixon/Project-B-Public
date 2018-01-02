// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui.ui_chat_colors

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import com.company.assembleegameclient.util._Z_B_;

import flash.text.engine.ContentElement;

import flash.text.engine.ElementFormat;

import com.company.assembleegameclient.parameters.Parameters;

import flash.text.engine.TextElement;
import flash.text.engine.GraphicElement;
import flash.text.engine.GroupElement;
import flash.text.engine.TextBlock;


public class ui_chat_colors {

    private static var _0I_T_:_vi = new _vi();

    public function ui_chat_colors(_arg1:int, _arg2:String, _arg3:int, _arg4:int, _arg5:String, _arg6:Boolean, _arg7:String) {
        this.time_ = _arg1;
        this.name_ = _arg2;
        if (_arg4 >= 0) {
            this._L_P_ = _Z_B_._0M_r(_arg4);
        }
        this.recipient_ = _arg5;
        this._E_B_ = _arg6;
        this.text_ = _arg7;
    }
    public var time_:int;
    public var name_:String;
    public var _L_P_:Sprite = null;
    public var recipient_:String;
    public var _E_B_:Boolean;
    public var text_:String;

    public function _0H_u():TextBlock {
        var _local1:Vector.<ContentElement> = new <ContentElement>[];
        var _local2:ElementFormat = _0I_T_.PlayerColour;
        var _local3:ElementFormat = _0I_T_._cK_;
        var _local4:ElementFormat = _0I_T_.TextColour;
        var _local5:String = this.name_;
        switch (this.name_) {
            case Parameters.SendInfo:
                _local5 = "";
                _local4 = _0I_T_.InfoColour;
                break;
            case Parameters.SendClient:
                _local5 = "";
                _local4 = _0I_T_.ClientColour;
                break;
            case Parameters.SendHelp:
                _local5 = "";
                _local4 = _0I_T_.HelpColour;
                break;
            case Parameters.SendError:
                _local4 = _0I_T_.ErrorColour;
                _local5 = "";
                break;
        }
        if (this.name_.charAt(0) == "#") {
            _local5 = this.name_.substr(1);
            _local2 = _0I_T_.EnemyColour;
        }
        if (this.name_.charAt(0) == "@") {
            _local5 = this.name_.substr(1);
            _local2 = _0I_T_.AdminColour;
        }
        if (this.name_.charAt(0) == "!") {
          _local5 = this.name_.substr(1);
          _local2 = _0I_T_.BledixonColour;
        }
        if (this.recipient_ == Parameters.SendGuild) {
            _local4 = _0I_T_.GuildColour;
        } else if (this.recipient_ == Parameters.SendParty) {
            _local2 = _0I_T_.PartyNameColour;
            _local4 = _0I_T_.PartyTextColour;
        } else {
            if (this.recipient_ != "") {
                _local2 = _0I_T_.TellColour;
                _local4 = _0I_T_.TellColour;
                if (!this._E_B_) {
                    _local1.push(new TextElement("To: ", _0I_T_.TellColour));
                    _local2 = _0I_T_.TellColour;
                    _local5 = this.recipient_;
                    this._L_P_ = null;
                }
            }
        }
        if (this._L_P_ != null) {
            this._L_P_.y = 3;
            _local1.push(new GraphicElement(this._L_P_, (this._L_P_.width + 2), this._L_P_.height, _0I_T_.TextColour));
        }
        if (_local5 != "") {
            _local1.push(new TextElement((("<" + _local5) + ">"), _local2), new TextElement(" ", _local3));
        }
        if (_local5 == "") {
            var _local7:Array = this.text_.split("{c}");
            for each (var _local8:String in _local7) {
                if (_local8.indexOf("{/c}") != -1) {
                    var _local9:String = _local8.substr(0, _local8.indexOf("{/c}"));
                    _local4 = _vi.createColor(uint(_local9));
                    _local8 = _local8.substr(_local8.indexOf("{/c}") + 4);
                }
                _local1.push(new TextElement(_local8, _local4));
            }
        } else {
            _local1.push(new TextElement(this.text_, _local4));
        }
        var _local6:GroupElement = new GroupElement(_local1);
        return (new TextBlock(_local6));
    }

}
}//package com.company.assembleegameclient.ui

