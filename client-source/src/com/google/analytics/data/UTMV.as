// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.data.UTMV

package com.google.analytics.data {
import com.google.analytics.utils.Timespan;

public class UTMV extends UTMCookie {

    public function UTMV(_arg1:Number = NaN, _arg2:String = "") {
        super("utmv", "__utmv", ["domainHash", "value"], (Timespan.twoyears * 1000));
        this.domainHash = _arg1;
        this.value = _arg2;
    }

    private var _domainHash:Number;

    public function get domainHash():Number {
        return (_domainHash);
    }

    public function set domainHash(_arg1:Number):void {
        _domainHash = _arg1;
        update();
    }

    private var _value:String;

    public function get value():String {
        return (_value);
    }

    public function set value(_arg1:String):void {
        _value = _arg1;
        update();
    }

}
}//package com.google.analytics.data

