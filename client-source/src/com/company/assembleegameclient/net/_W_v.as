// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net._W_v

package com.company.assembleegameclient.net {
import com.company.googleanalytics.GA;
import com.company.assembleegameclient.util.Currency;

internal class _W_v {

    public function _W_v(_arg1:String, _arg2:int, _arg3:int, _arg4:Boolean) {
        this.id_ = _arg1;
        this.price_ = _arg2;
        this.currency_ = _arg3;
        this.converted_ = _arg4;
    }
    private var id_:String;
    private var price_:int;
    private var currency_:int;
    private var converted_:Boolean;

    public function _06m():void {
        switch (this.currency_) {
            case Currency._class:
                //GA.global().trackEvent("credits", ((this.converted_) ? "buyConverted" : "buy"), this.id_, this.price_);
                return;
            case Currency.FAME:
                //GA.global().trackEvent("credits", "buyFame", this.id_, this.price_);
                return;
            case Currency._A_h:
                //GA.global().trackEvent("credits", "buyGuildFame", this.id_, this.price_);
                return;
            case Currency.KEYS:
                //GA.global().trackEvent("credits", "buySouls", this.id_, this.price_);
                return;
        }
    }

}
}//package com.company.assembleegameclient.net

