// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GuildMerchant

package com.company.assembleegameclient.objects {
import com.company.assembleegameclient.util.Currency;
import com.company.assembleegameclient.util._07E_;

import _E_7._aS_;
import _E_7._for_;

import flash.display.BitmapData;

public class GuildMerchant extends SellableObject implements _G_4 {

    public function GuildMerchant(_arg1:XML) {
        super(_arg1);
        price_ = int(_arg1.Price);
        currency_ = Currency._A_h;
        this.description_ = _arg1.Description;
        _0F_S_ = _07E_._tS_;
    }
    public var description_:String;

    override public function soldObjectName():String {
        return (ObjectLibrary._0D_N_[objectType_]);
    }

    override public function soldObjectInternalName():String {
        var _local1:XML = ObjectLibrary._Q_F_[objectType_];
        return (_local1.@id.toString());
    }

    override public function getTooltip():_for_ {
        return (new _aS_(0x2A2A2A, 0x9B9B9B, this.soldObjectName(), this.description_, 200));
    }

    override public function getIcon():BitmapData {
        return (ObjectLibrary.getRedrawnTextureFromType(objectType_, 80, true));
    }

}
}//package com.company.assembleegameclient.objects

