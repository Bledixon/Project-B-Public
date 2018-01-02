// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0L_C_._0G_H_

package _0L_C_ {
import _qN_.Account;

import flash.events.Event;

public class _0G_H_ extends _qO_ {

    public function _0G_H_(_arg1:int) {
        super(((("Another character slot costs " + _arg1) + " Gold.  ") + "Would you like to buy Gold?"), "Not Enough Gold", "Cancel", "Buy Gold", "/charSlotNeedGold");
        Account._get().cacheOffers();
        addEventListener(BUTTON1_EVENT, this.onCancel);
        addEventListener(BUTTON2_EVENT, this._8v);
    }

    public function onCancel(_arg1:Event):void {
        parent.removeChild(this);
    }

    public function _8v(_arg1:Event):void {
        Account._get().showMoneyManagement(stage);
        parent.removeChild(this);
    }

}
}//package _0L_C_

