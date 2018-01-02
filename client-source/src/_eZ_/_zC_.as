// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_eZ_._zC_

package _eZ_ {
import flash.events.Event;

public class _zC_ extends Event {

    public static const _jD_:String = "postInstantiate";
    public static const _9H_:String = "preConstruct";
    public static const _7O_:String = "postConstruct";

    public function _zC_(_arg1:String, _arg2:Object, _arg3:Class) {
        super(_arg1);
        this.instance = _arg2;
        this._06H_ = _arg3;
    }
    public var instance;
    public var _06H_:Class;

    override public function clone():Event {
        return (new _zC_(type, this.instance, this._06H_));
    }

}
}//package _eZ_

