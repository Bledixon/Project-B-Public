// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9R_._j_

package _9R_ {
import flash.events.Event;

import com.company.assembleegameclient.net.Server;

import flash.utils.ByteArray;

public class _j_ extends Event {

    public static const RECONNECT:String = "RECONNECT_EVENT";

    public function _j_(_arg1:Server, _arg2:int, _arg3:Boolean, _arg4:int, _arg5:int, _arg6:ByteArray) {
        super(RECONNECT);
        this.server_ = _arg1;
        this.gameId_ = _arg2;
        this._96 = _arg3;
        this.charId_ = _arg4;
        this.keyTime_ = _arg5;
        this.key_ = _arg6;
    }
    public var server_:Server;
    public var gameId_:int;
    public var _96:Boolean;
    public var charId_:int;
    public var keyTime_:int;
    public var key_:ByteArray;

    override public function clone():Event {
        return (new _j_(this.server_, this.gameId_, this._96, this.charId_, this.keyTime_, this.key_));
    }

    override public function toString():String {
        return (formatToString(RECONNECT, "server_", "gameId_", "charId_", "keyTime_", "key_"));
    }

}
}//package _9R_

