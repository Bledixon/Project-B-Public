// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.data.UTMC

package com.google.analytics.data {
public class UTMC extends UTMCookie {

    public function UTMC(_arg1:Number = NaN) {
        super("utmc", "__utmc", ["domainHash"]);
        this.domainHash = _arg1;
    }

    private var _domainHash:Number;

    public function get domainHash():Number {
        return (_domainHash);
    }

    public function set domainHash(_arg1:Number):void {
        _domainHash = _arg1;
        update();
    }

}
}//package com.google.analytics.data

