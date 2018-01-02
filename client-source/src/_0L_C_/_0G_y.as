// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0L_C_._0G_y

package _0L_C_ {
import com.company.assembleegameclient.appengine._0B_u;
import com.company.assembleegameclient.parameters.Parameters;

import _zo._8C_;
import _zo._mS_;

import _qN_.Account;

import com.company.googleanalytics.GA;

import flash.events.Event;

public class _0G_y extends _qO_ {

    public function _0G_y(_arg1:int) {
        super("Buying Character Slot...", null, null, null, "/buyingCharSlot");
        this.price_ = _arg1;
        var _local2:_0B_u = new _0B_u(Parameters._fK_(), "/account", true, 2);
        _local2.addEventListener(_8C_.GENERIC_DATA, this._F_Q_);
        _local2.addEventListener(_mS_.TEXT_ERROR, this._ix);
        _local2.sendRequest("purchaseCharSlot", Account._get().credentials());
    }
    public var price_:int;

    private function _F_Q_(_arg1:Event):void {
        //GA.global().trackEvent("credits", "buyConverted", "Character Slot", this.price_);
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _ix(_arg1:_mS_):void {
        dispatchEvent(_arg1.clone());
    }

}
}//package _0L_C_

