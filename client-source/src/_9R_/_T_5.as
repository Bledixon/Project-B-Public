// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9R_._T_5

package _9R_ {
import flash.events.Event;
import flash.display.BitmapData;

import com.company.assembleegameclient.objects.Player;

public class _T_5 extends Event {

    public static const DEATH:String = "DEATH";

    public function _T_5(_arg1:BitmapData, _arg2:int, _arg3:int) {
        super(DEATH);
        this.background_ = _arg1;
        this.accountId_ = _arg2;
        this.charId_ = _arg3;
    }
    public var background_:BitmapData;
    public var player_:Player;
    public var accountId_:int;
    public var charId_:int;
}
}//package _9R_

