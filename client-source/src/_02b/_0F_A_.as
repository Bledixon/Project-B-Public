// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_02b._0F_A_

package _02b {
import _4X_._zU_;

import com.company.assembleegameclient.appengine.SavedCharacter;
import com.company.assembleegameclient.appengine._2n;

import flash.events.Event;

import _zo._mS_;

public class _0F_A_ extends _zU_ {

    [Inject]
    public var character:SavedCharacter;

    override protected function startTask():void {
        var _local1:_2n = new _2n(2);
        _local1.addEventListener(Event.COMPLETE, this._Q_M_);
        _local1.addEventListener(_mS_.TEXT_ERROR, this._ix);
        _local1.deleteCharacter(this.character.charId());
    }

    private function _Q_M_(_arg1:Event):void {
        _C_t(true, "");
    }

    private function _ix(_arg1:_mS_):void {
        _C_t(false, "error: Unable to delete character");
    }

}
}//package _02b

