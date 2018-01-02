// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.data.UTMB

package com.google.analytics.data {
import com.google.analytics.utils.Timespan;

public class UTMB extends UTMCookie {

    public static var defaultTimespan:Number = Timespan.thirtyminutes;

    public function UTMB(_arg1:Number = NaN, _arg2:Number = NaN, _arg3:Number = NaN, _arg4:Number = NaN) {
        super("utmb", "__utmb", ["domainHash", "trackCount", "token", "lastTime"], (defaultTimespan * 1000));
        this.domainHash = _arg1;
        this.trackCount = _arg2;
        this.token = _arg3;
        this.lastTime = _arg4;
    }

    private var _trackCount:Number;

    public function get trackCount():Number {
        return (_trackCount);
    }

    public function set trackCount(_arg1:Number):void {
        _trackCount = _arg1;
        update();
    }

    private var _lastTime:Number;

    public function get lastTime():Number {
        return (_lastTime);
    }

    public function set lastTime(_arg1:Number):void {
        _lastTime = _arg1;
        update();
    }

    private var _domainHash:Number;

    public function get domainHash():Number {
        return (_domainHash);
    }

    public function set domainHash(_arg1:Number):void {
        _domainHash = _arg1;
        update();
    }

    private var _token:Number;

    public function get token():Number {
        return (_token);
    }

    public function set token(_arg1:Number):void {
        _token = _arg1;
        update();
    }

}
}//package com.google.analytics.data

