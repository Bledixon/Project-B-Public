// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_02b._6E_

package _02b {
import com.google.analytics.GATracker;
import com.company.googleanalytics.GA;

import flash.display.Stage;

public class _6E_ {

    private var tracker:GATracker;

    public function init(_arg1:Stage, _arg2:String):void {
        this.tracker = new GATracker(_arg1, _arg2);
        GA.setTracker(this.tracker);
    }

    public function trackEvent(_arg1:String, _arg2:String, _arg3:String, _arg4:Number):Boolean {
        return (this.tracker.trackEvent(_arg1, _arg2, _arg3, _arg4));
    }

    public function _M_x(_arg1:String):void {
        this.tracker.trackPageview(_arg1);
    }

}
}//package _02b

