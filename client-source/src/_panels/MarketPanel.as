// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._f

package _panels {
    import _sP_.MarketplaceContainerUI;

    import com.company.assembleegameclient.game.GameSprite;

import _sP_._07x;

import flash.events.MouseEvent;

public class MarketPanel extends _X_i {

    public function MarketPanel(_arg1:GameSprite) {
        super(_arg1, "Marketplace", "View");
    }

    override protected function onButtonClick(_arg1:MouseEvent):void {
        gs_.mui_.clearInput();
        gs_.addChild(new MarketplaceContainerUI(gs_));
    }

}
}//package _panels

