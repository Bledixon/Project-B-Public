// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.core.OrganicReferrer

package com.google.analytics.core {
public class OrganicReferrer {

    public function OrganicReferrer(_arg1:String, _arg2:String) {
        this.engine = _arg1;
        this.keyword = _arg2;
    }

    private var _engine:String;

    public function get engine():String {
        return (_engine);
    }

    public function set engine(_arg1:String):void {
        _engine = _arg1.toLowerCase();
    }

    private var _keyword:String;

    public function get keyword():String {
        return (_keyword);
    }

    public function set keyword(_arg1:String):void {
        _keyword = _arg1.toLowerCase();
    }

    public function toString():String {
        return (((engine + "?") + keyword));
    }

}
}//package com.google.analytics.core

