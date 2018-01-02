// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.AnalyticsTracker

package com.google.analytics {
import com.google.analytics.v4.GoogleAnalyticsAPI;

import flash.events.IEventDispatcher;

import com.google.analytics.v4.Configuration;
import com.google.analytics.debug.DebugConfiguration;

public interface AnalyticsTracker extends GoogleAnalyticsAPI, IEventDispatcher {

    function get config():Configuration;

    function set config(_arg1:Configuration):void;

    function get mode():String;

    function set mode(_arg1:String):void;

    function get visualDebug():Boolean;

    function set visualDebug(_arg1:Boolean):void;

    function get account():String;

    function set account(_arg1:String):void;

    function get debug():DebugConfiguration;

    function set debug(_arg1:DebugConfiguration):void;

    function isReady():Boolean;

}
}//package com.google.analytics

