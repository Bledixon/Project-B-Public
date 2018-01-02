package com.company.assembleegameclient.objects {

  import _011.Text;

  import _panels.Panel;
  import _panels.TextPanel;
  import _panels._sc;

  import com.company.assembleegameclient.game.GameSprite;

  public class ClosedGiftChest extends GameObject implements _G_4 {

    public function ClosedGiftChest(_arg_1:XML) {
      super(_arg_1);
    }

    public function getPanel(_arg_1:GameSprite):Panel {
      return (new TextPanel(_arg_1));
    }

  }
}//package com.company.assembleegameclient.objects