// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0L_C_._02d

package _0L_C_ {
import _qN_.Account;

import flash.events.Event;

public class _02d extends _qO_ {

    public function _02d() {
        super(("You do not have enough Gold for this item.  " + "Would you like to buy Gold?"), "Not Enough Gold", "Cancel", "Buy Gold", "/notEnoughGold");
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

