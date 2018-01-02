// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.debug.AlertAction

package com.google.analytics.debug {
public class AlertAction {

    public function AlertAction(_arg1:String, _arg2:String, _arg3:*) {
        this.name = _arg1;
        this.activator = _arg2;
        _callback = _arg3;
    }
    public var container:Alert;
    public var activator:String;
    public var name:String;
    private var _callback;

    public function execute():void {
        if (_callback) {
            if ((_callback is Function)) {
                ((_callback as Function)());
            } else {
                if ((_callback is String)) {
                    var _local1 = container;
                    (_local1[_callback]());
                }
            }
        }
    }

}
}//package com.google.analytics.debug

