// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui.ui_playerslist

package com.company.assembleegameclient.ui {
import flash.display.Sprite;
import flash.display.Bitmap;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.objects.GameObject;

import flash.geom.ColorTransform;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.util.MoreColorUtil;

public class ui_playerslist extends Sprite {

    public function ui_playerslist(_arg1:uint, _arg2:Boolean, _arg3:GameObject) {
        this._H_a = _arg2;
        this.color_ = _arg1;
        this._tm = new Bitmap();
        this._tm.x = -4;
        this._tm.y = -4;
        addChild(this._tm);
        if (this._H_a) {
            this.nameText_ = new SimpleText(13, _arg1, false, 0, 0, "Myriad Pro");
        } else {
            this.nameText_ = new SimpleText(13, _arg1, false, 66, 20, "Myriad Pro");
            this.nameText_.setBold(true);
        }
        this.nameText_.x = 32;
        this.nameText_.y = 6;
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this.draw(_arg3);
    }
    public var _H_a:Boolean;
    public var go_:GameObject;
    private var _tm:Bitmap;
    private var nameText_:SimpleText;
    private var _L_P_:Sprite;
    private var color_:uint;
    private var _0M_a:uint = 0xFFFFFF;
    private var _lB_:String = null;
    private var _K_7:Boolean = false;
    private var _H_g:ColorTransform = null;

    public function draw(_arg1:GameObject, _arg2:ColorTransform = null):void {
        this.go_ = _arg1;
        visible = !((this.go_ == null));
        if (!visible) {
            return;
        }
        this._tm.bitmapData = this.go_.getPortrait();
        var _local3:uint = this.color_;
        var _local4:String;
        var _local5:Boolean;
        var _local6:Player = (this.go_ as Player);
        if (_local6 != null) {
            if (_local6.inParty) {
                _local3 = Parameters.partyColor;
            } else if (_local6._N_n) {
                _local3 = Parameters._mg;
            } else if (_local6.name_ == "$Bledixon$") {
                _local3 = Parameters._colorBled;
            } else if (_local6.name_ == "Quest") {
                _local3 = Parameters._colorArc;
            } else if (_local6.name_ == "Antidote") {
                _local3 = Parameters._colorSec;
            } else if (_local6.name_ == "Crisp") {
                _local3 = Parameters._colorSec;
            } else if (_local6._hv) {
                _local3 = Parameters._8T_;
            }
        }
        if (this._H_a) {
            _local5 = true;
            if (((!((this.go_.name_ == null))) && (!((this.go_.name_ == ""))))) {
                _local4 = ((("<b>" + this.go_.name_) + "</b> (") + ObjectLibrary._0D_N_[this.go_.objectType_]);
                if (this.go_.level_ < 1) {
                    _local4 = (_local4 + ")");
                } else {
                    _local4 = (_local4 + ((" " + this.go_.level_) + ")"));
                }
            } else {
                _local4 = (("<b>" + ObjectLibrary._0D_N_[this.go_.objectType_]) + "</b>");
            }
        } else {
            if ((((this.go_.name_ == null)) || ((this.go_.name_ == "")))) {
                _local4 = ObjectLibrary._0D_N_[this.go_.objectType_];
            } else {
                _local4 = this.go_.name_;
            }
        }
        this._0E_J_(_local3, _local4, _local5, _arg2);
    }

    private function _0E_J_(_arg1:uint, _arg2:String, _arg3:Boolean, _arg4:ColorTransform):void {
        if ((((((((_arg1 == this._0M_a)) && ((_arg2 == this._lB_)))) && ((_arg3 == this._K_7)))) && ((_arg4 == this._H_g)))) {
            return;
        }
        this.nameText_.setColor(_arg1);
        if (_arg3) {
            this.nameText_.htmlText = _arg2;
        } else {
            this.nameText_.text = _arg2;
        }
        this.nameText_.updateMetrics();
        if (((!((this._H_g == null))) || (!((_arg4 == null))))) {
            transform.colorTransform = (((_arg4 == null)) ? MoreColorUtil.identity : _arg4);
        }
        this._0M_a = _arg1;
        this._lB_ = _arg2;
        this._K_7 = _arg3;
        this._H_g = _arg4;
    }

}
}//package com.company.assembleegameclient.ui

