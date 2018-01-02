// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.googleanalytics.GA

package com.company.googleanalytics {
import com.google.analytics.GATracker;

public class GA {

    private static var tracker:GATracker = null;

    public static function global():GATracker {
        return (tracker);
    }

    public static function setTracker(_arg1:GATracker):void {
        GA.tracker = _arg1;
    }

    public function GA() {
        throw (new Error("Don't instance this class"));
    }

}
}//package com.company.googleanalytics

