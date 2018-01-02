// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.data.UTMX

package com.google.analytics.data {
public class UTMX extends UTMCookie {

    public function UTMX() {
        super("utmx", "__utmx", ["value"], 0);
        _value = "-";
    }

    private var _value:String;

    public function get value():String {
        return (_value);
    }

    public function set value(_arg1:String):void {
        _value = _arg1;
    }

}
}//package com.google.analytics.data

