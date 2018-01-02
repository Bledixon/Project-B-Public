// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_A_G_._0H_c

package _A_G_ {
import flash.events.Event;

public class _0H_c extends Event {

    public static const _00Q_:String = "mediatorCreate";
    public static const _0J__:String = "mediatorRemove";

    public function _0H_c(_arg1:String, _arg2:Object, _arg3:Object, _arg4:_08I_, _arg5:_07A_) {
        super(_arg1);
        this._09U_ = _arg2;
        this._0D_w = _arg3;
        this._X_5 = _arg4;
        this._factory = _arg5;
    }
    private var _09U_:Object;
    private var _0D_w:Object;
    private var _X_5:_08I_;

    private var _factory:_07A_;

    public function get factory():_07A_ {
        return (this._factory);
    }

    public function get mediator():Object {
        return (this._09U_);
    }

    public function get view():Object {
        return (this._0D_w);
    }

    public function get mapping():_08I_ {
        return (this._X_5);
    }

    override public function clone():Event {
        return (new _0H_c(type, this._09U_, this._0D_w, this._X_5, this._factory));
    }

}
}//package _A_G_

