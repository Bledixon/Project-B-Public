﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.debug.SuccessAlert

package com.google.analytics.debug {
public class SuccessAlert extends Alert {

    public function SuccessAlert(_arg1:DebugConfiguration, _arg2:String, _arg3:Array) {
        var _local4:Align = Align.bottomLeft;
        var _local5:Boolean = true;
        var _local6:Boolean;
        if (_arg1.verbose) {
            _arg2 = ((('<u><span class="uiAlertTitle">Success</span>' + spaces(18)) + "</u>\n\n") + _arg2);
            _local4 = Align.center;
            _local5 = false;
            _local6 = true;
        }
        super(_arg2, _arg3, "uiSuccess", Style.successColor, _local4, _local5, _local6);
    }
}
}//package com.google.analytics.debug

