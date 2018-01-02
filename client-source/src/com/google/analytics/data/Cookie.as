// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.data.Cookie

package com.google.analytics.data {
public interface Cookie {

    function get creation():Date;

    function set creation(_arg1:Date):void;

    function get expiration():Date;

    function set expiration(_arg1:Date):void;

    function fromSharedObject(_arg1:Object):void;

    function toURLString():String;

    function toSharedObject():Object;

    function isExpired():Boolean;

}
}//package com.google.analytics.data

