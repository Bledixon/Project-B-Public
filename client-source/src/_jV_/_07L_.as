// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_jV_._07L_

package _jV_ {
import flash.events.IEventDispatcher;

public class _07L_ {

    public function _07L_(_arg1:IEventDispatcher, _arg2:String, _arg3:Function, _arg4:Class, _arg5:Function, _arg6:Boolean) {
        this._0L_4 = _arg1;
        this._0E_Y_ = _arg2;
        this._0M_e = _arg3;
        this._1j = _arg4;
        this._callback = _arg5;
        this._0C_Y_ = _arg6;
    }
    private var _0L_4:IEventDispatcher;
    private var _0E_Y_:String;
    private var _0M_e:Function;
    private var _1j:Class;
    private var _0C_Y_:Boolean;

    private var _callback:Function;

    public function get callback():Function {
        return (this._callback);
    }

    public function get dispatcher():IEventDispatcher {
        return (this._0L_4);
    }

    public function get eventString():String {
        return (this._0E_Y_);
    }

    public function get listener():Function {
        return (this._0M_e);
    }

    public function get eventClass():Class {
        return (this._1j);
    }

    public function get useCapture():Boolean {
        return (this._0C_Y_);
    }

}
}//package _jV_

