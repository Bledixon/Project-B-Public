// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels.Panel

package _panels {
import flash.display.Sprite;

import com.company.assembleegameclient.game.GameSprite;

public class Panel extends Sprite {

    public static const WIDTH:int = 188;
    public static const HEIGHT:int = 84;

    public function Panel(_arg1:GameSprite) {
        this.gs_ = _arg1;
    }
    public var gs_:GameSprite;

    public function draw():void {
    }

}
}//package _panels

