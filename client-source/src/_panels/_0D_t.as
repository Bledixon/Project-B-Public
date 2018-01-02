// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._0D_t

package _panels {
import _qN_.Account;

import flash.events.Event;

import com.company.assembleegameclient.game.GameSprite;

import flash.events.MouseEvent;
import flash.events.KeyboardEvent;

import com.company.assembleegameclient.ui.ui_chat;
import com.company.assembleegameclient.parameters.Parameters;

public class _0D_t extends _X_i {

    public function _0D_t(_arg1:GameSprite) {
        super(_arg1, "Buy Realm Gold", "Buy");
        Account._get().cacheOffers();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    override protected function onButtonClick(_arg1:MouseEvent):void {
        Account._get().showMoneyManagement(stage);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    private function onAddedToStage(_arg1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        if ((((_arg1.keyCode == Parameters.data_.interact)) && (!(ui_chat._0G_B_)))) {
            Account._get().showMoneyManagement(stage);
        }
    }

}
}//package _panels

