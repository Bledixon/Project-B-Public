// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.data.UTMK

package com.google.analytics.data {
public class UTMK extends UTMCookie {

    public function UTMK(_arg1:Number = NaN) {
        super("utmk", "__utmk", ["hash"]);
        this.hash = _arg1;
    }

    private var _hash:Number;

    public function get hash():Number {
        return (_hash);
    }

    public function set hash(_arg1:Number):void {
        _hash = _arg1;
        update();
    }

}
}//package com.google.analytics.data

