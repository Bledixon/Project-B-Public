// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.core.EventTracker

package com.google.analytics.core {
import com.google.analytics.v4.GoogleAnalyticsAPI;

public class EventTracker {

    public function EventTracker(_arg1:String, _arg2:GoogleAnalyticsAPI) {
        this.name = _arg1;
        _parent = _arg2;
    }
    public var name:String;
    private var _parent:GoogleAnalyticsAPI;

    public function trackEvent(_arg1:String, _arg2:String = null, _arg3:Number = NaN):Boolean {
        return (_parent.trackEvent(name, _arg1, _arg2, _arg3));
    }

}
}//package com.google.analytics.core

