// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0L_C_._aZ_

package _0L_C_ {
import flash.events.Event;

public class _aZ_ extends _qO_ {

    public function _aZ_() {
        super((("You do not have enough Fame for this item.  " + "You gain Fame when your character dies after having ") + "accomplished great things."), "Not Enough Fame", "Ok", null, "/notEnoughFame");
        addEventListener(BUTTON1_EVENT, this._A_I_);
    }

    public function _A_I_(_arg1:Event):void {
        parent.removeChild(this);
    }

}
}//package _0L_C_

