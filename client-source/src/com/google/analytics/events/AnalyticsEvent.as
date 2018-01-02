// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.events.AnalyticsEvent

package com.google.analytics.events {
import flash.events.Event;

import com.google.analytics.AnalyticsTracker;

public class AnalyticsEvent extends Event {

    public static const READY:String = "ready";

    public function AnalyticsEvent(_arg1:String, _arg2:AnalyticsTracker, _arg3:Boolean = false, _arg4:Boolean = false) {
        super(_arg1, _arg3, _arg4);
        this.tracker = _arg2;
    }
    public var tracker:AnalyticsTracker;

    override public function clone():Event {
        return (new AnalyticsEvent(type, tracker, bubbles, cancelable));
    }

}
}//package com.google.analytics.events

