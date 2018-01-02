// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_9._B_C_

package _0I_9 {
import _C__._cM_;

import flash.display.DisplayObjectContainer;
import flash.display.LoaderInfo;
import flash.events.IEventDispatcher;

import com.company.assembleegameclient.appengine._vG_;

import flash.events.ErrorEvent;

public class _B_C_ extends _cM_ {

    private const _Y_1:String = "uncaughtErrorEvents";
    private const _04:String = "uncaughtError";

    [Inject]
    public var _fR_:DisplayObjectContainer;
    private var loaderInfo:LoaderInfo;

    override public function initialize():void {
        this.loaderInfo = this._fR_.loaderInfo;
        if (this._zV_()) {
            this._E_P_();
        }
    }

    override public function destroy():void {
        if (this._zV_()) {
            this._0E_s();
        }
    }

    private function _zV_():Boolean {
        return (this.loaderInfo.hasOwnProperty(this._Y_1));
    }

    private function _E_P_():void {
        var _local1:IEventDispatcher = IEventDispatcher(this.loaderInfo[this._Y_1]);
        _local1.addEventListener(this._04, this._79);
    }

    private function _0E_s():void {
        var _local1:IEventDispatcher = IEventDispatcher(this.loaderInfo[this._Y_1]);
        _local1.removeEventListener(this._04, this._79);
    }

    private function _79(_arg1:ErrorEvent):void {
        _arg1.preventDefault();
        _vG_._A_U_(_arg1["error"]);
    }

}
}//package _0I_9

