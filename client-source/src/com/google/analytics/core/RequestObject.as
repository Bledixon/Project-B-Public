// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.core.RequestObject

package com.google.analytics.core {
import flash.net.URLRequest;
import flash.utils.getTimer;

public class RequestObject {

    public function RequestObject(_arg1:URLRequest) {
        start = getTimer();
        this.request = _arg1;
    }
    public var start:int;
    public var end:int;
    public var request:URLRequest;

    public function get duration():int {
        if (!hasCompleted()) {
            return (0);
        }
        return ((end - start));
    }

    public function hasCompleted():Boolean {
        return ((end > 0));
    }

    public function toString():String {
        var _local1:Array = [];
        _local1.push((("duration: " + duration) + "ms"));
        _local1.push(("url: " + request.url));
        return ((("{ " + _local1.join(", ")) + " }"));
    }

    public function complete():void {
        end = getTimer();
    }

}
}//package com.google.analytics.core

