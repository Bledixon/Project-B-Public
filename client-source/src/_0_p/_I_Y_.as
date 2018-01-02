// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_p._I_Y_

package _0_p {
import flash.events.Event;

public class _I_Y_ extends Event {

    public static const ERROR:String = "error";
    public static const _W_i:String = "preInitialize";
    public static const INITIALIZE:String = "initialize";
    public static const _wv:String = "postInitialize";
    public static const _7J_:String = "preSuspend";
    public static const _05j:String = "suspend";
    public static const _mx:String = "postSuspend";
    public static const _ob:String = "preResume";
    public static const _x8:String = "resume";
    public static const _Y_6:String = "postResume";
    public static const _0G_Z_:String = "preDestroy";
    public static const _8Z_:String = "destroy";
    public static const _0K_I_:String = "postDestroy";

    public function _I_Y_(_arg1:String) {
        super(_arg1);
    }
    public var error:Error;

    override public function clone():Event {
        var _local1:_I_Y_ = new _I_Y_(type);
        _local1.error = this.error;
        return (_local1);
    }

}
}//package _0_p

