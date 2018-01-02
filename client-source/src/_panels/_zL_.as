// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._zL_

package _panels {
import com.company.assembleegameclient.game.GameSprite;

import flash.events.Event;
import flash.events.MouseEvent;

public class _zL_ extends _X_i {

    public function _zL_(_arg1:GameSprite) {
        super(_arg1, "Change Characters", "Change");
    }

    override protected function onButtonClick(_arg1:MouseEvent):void {
        gs_.dispatchEvent(new Event(Event.COMPLETE));
    }

}
}//package _panels

