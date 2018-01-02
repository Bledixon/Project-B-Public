/**
 * Created by club5_000 on 9/13/2014.
 */
package _0D_d {
  import _E_7.EquipmentToolTip;

  import _ke._U_c;

  import com.company.assembleegameclient.ui.MarketplaceSlot;

  import com.company.assembleegameclient.game.GameSprite;
  import com.company.assembleegameclient.objects.ObjectLibrary;
  import com.company.ui.SimpleText;
  import com.company.util.BitmapUtil;
  import com.google.analytics.debug.Margin;

  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.display.Shape;
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.text.TextFormatAlign;

  public class GiveBox extends Frame {

    public function GiveBox(_gs:GameSprite) {
      super("Give Item", "Cancel", "", "/give", 272);
      this.gs_ = _gs;
      this.build();
    }

    private var gs_:GameSprite;
    private var itemSelect_:GiveBoxSearcher;

    private function build() {
      this.h_ += 256;

      var square:Shape = new Shape();
      square.graphics.beginFill(0x610F00);
      square.graphics.drawRect(0, 0, 272, 256);
      square.graphics.endFill();
      square.x = -5;
      square.y = 34;
      this.addChild(square);

      this.itemSelect_ = new GiveBoxSearcher(gs_, this);
      this.itemSelect_.x = 28;
      this.itemSelect_.y = -82;
      this.itemSelect_.mask = square;
      this.itemSelect_.perRow_ = 5;
      this.addChild(itemSelect_);

      Button1.addEventListener(MouseEvent.CLICK, this.onClose);
      this.addEventListener(Event.ADDED_TO_STAGE, this.addedToStage);
    }

    private function onClose(e:Event) {
      this.close();
    }

    public function close() {
      stage.focus = null;
      dispatchEvent(new Event(Event.COMPLETE));
    }

    private function addedToStage(e:Event):void {
      stage.focus = this.itemSelect_.search_.inputText_;
    }
  }
}




