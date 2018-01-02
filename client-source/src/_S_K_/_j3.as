// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_S_K_._j3

package _S_K_ {
import _sp._L_A_;

import flash.events.IEventDispatcher;
import flash.events.Event;

public interface _j3 extends _L_A_ {

    function get _S_b():String;

    function get eventClass():Class;

    function get target():IEventDispatcher;

    function set target(_arg1:IEventDispatcher):void;

    function dispatchEvent(_arg1:Event):Boolean;

}
}//package _S_K_

