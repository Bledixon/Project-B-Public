// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_9._C_6

package _0I_9 {
import flash.display.Sprite;

public class _C_6 extends Sprite {

    private var _S_m:Sprite;
    private var _0L_U_:Sprite;

    public function _T__(_arg1:Sprite):void {
        if (this._S_m == _arg1) {
            return;
        }
        this._V_n();
        this._S_m = _arg1;
        addChild(_arg1);
    }

    public function _bM_():Sprite {
        return (this._0L_U_);
    }

    private function _V_n():void {
        if (((this._S_m) && (contains(this._S_m)))) {
            this._0L_U_ = this._S_m;
            removeChild(this._S_m);
        }
    }

}
}//package _0I_9

