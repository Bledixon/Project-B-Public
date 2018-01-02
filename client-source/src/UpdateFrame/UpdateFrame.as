/**
 * Created by Mike on 24.04.2016.
 */
package UpdateFrame {

  import _0D_d.*;
  import com.company.assembleegameclient.game.GameSprite;
  import flash.events.Event;
  import flash.events.MouseEvent;

  public class UpdateFrame extends Frame {

    private var gs_:GameSprite;

    public function UpdateFrame(gameSprite:GameSprite, width:int, height:int) {
      super("Title", "Button1", "Button2", ""); //The empty string is for google analytics
      this.gs_ = gameSprite;
      this.w_ = width;
      this.h_ = height;
      Button1.addEventListener(MouseEvent.CLICK, this.close_);
      Button2.addEventListener(MouseEvent.CLICK, this.close_);
    }

    private function close_(_arg1:Event): void {
      dispatchEvent(new Event(Event.COMPLETE));
    }
  }
}
