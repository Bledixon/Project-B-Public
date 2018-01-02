// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_lo._vR_

package _lo {
import flash.events.Event;
import flash.display.DisplayObject;

public class _vR_ extends Event {

    public static const _0N_0:String = "configureView";

    public function _vR_(_arg1:String, _arg2:DisplayObject = null) {
        super(_arg1, true, true);
        this._0D_w = _arg2;
    }
    private var _0D_w:DisplayObject;

    public function get view():DisplayObject {
        return (this._0D_w);
    }

    override public function clone():Event {
        return (new _vR_(type, this._0D_w));
    }

}
}//package _lo

