// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._L_N_

package com.company.assembleegameclient.ui {
import flash.display.Sprite;
import flash.display.Bitmap;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

import com.company.util._O_m;
import com.company.assembleegameclient.util._07E_;

public class _L_N_ extends Sprite {

    public function _L_N_(_arg1:String, _arg2:int, _arg3:int = 0) {
        this._5U_ = new Bitmap(null);
        this._5U_.y = -8;
        this._5U_.x = -8;
        var _local4:int = (((_arg3 == 0)) ? 0 : (_arg3 - (this._5U_.width - 16)));
        this.guildName_ = new SimpleText(16, 0xFFFFFF, false, _local4, 0, "Myriad Pro");
        this.guildName_.filters = [new DropShadowFilter(0, 0, 0)];
        this.guildName_.x = 24;
        this.draw(_arg1, _arg2);
    }
    private var name_:String;
    private var _S_e:int;
    private var _5U_:Bitmap;
    private var guildName_:SimpleText;

    public function draw(_arg1:String, _arg2:int):void {
        if ((((this.name_ == _arg1)) && ((_arg2 == _arg2)))) {
            return;
        }
        this.name_ = _arg1;
        this._S_e = _arg2;
        if ((((this.name_ == null)) || ((this.name_ == "")))) {
            _O_m._03d(this, this._5U_);
            _O_m._03d(this, this.guildName_);
        } else {
            this._5U_.bitmapData = _07E_._wS_(this._S_e, 10);
            _O_m._041(this, this._5U_);
            this.guildName_.text = this.name_;
            this.guildName_._08S_();
            _O_m._041(this, this.guildName_);
        }
    }

}
}//package com.company.assembleegameclient.ui

