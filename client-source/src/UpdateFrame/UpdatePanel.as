/**
 * Created by Mike on 24.04.2016.
 */
package UpdateFrame {

  import _panels.*;
  import com.company.assembleegameclient.game.GameSprite;
  import com.company.assembleegameclient.parameters.Parameters;
  import com.company.assembleegameclient.ui.FrameHolder;
  import com.company.assembleegameclient.ui.ui_chat;
  import flash.events.Event;
  import flash.events.KeyboardEvent;
  import flash.events.MouseEvent;

  public class UpdatePanel extends _X_i  {

    public function UpdatePanel(_arg1:GameSprite) {
      super(_arg1, "Display Name", "Button Text");
      addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
      addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    override protected function onButtonClick(_arg1:MouseEvent):void {
      this.gs_.addChild(new FrameHolder(new UpdateFrame(gs_, 300, 100))); //Width & Height
    }

    private function onRemovedFromStage(_arg1:Event):void{
      stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.Interact);
    }

    private function onAddedToStage(_arg1:Event):void{
      stage.addEventListener(KeyboardEvent.KEY_DOWN, this.Interact);
    }

    private function Interact(_arg1:KeyboardEvent):void {   //Opens panel if interact key is pressed
      if ((_arg1.keyCode == Parameters.data_.interact) && (!(ui_chat._0G_B_))) {
        this.OpenPanel();
      }
    }
    private function OpenPanel() :void {
      this.gs_.addChild(new FrameHolder(new UpdateFrame(gs_, 300, 100)));  //Width & Height
    };
  }
}
