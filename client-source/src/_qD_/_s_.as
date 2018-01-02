// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._s_

package _qD_ {
import flash.display.Sprite;

import _4x._0I_y;

import com.company.util.MoreColorUtil;

public class _s_ extends Sprite {

    public function _s_(_arg1:int, _arg2:Boolean) {
        this.size_ = _arg1;
        this._M_b = _arg2;
        this.redraw();
    }
    public var size_:int;
    public var _U_d:_0I_y = null;
    private var _M_b:Boolean;

    public function _L_V_(_arg1:_0I_y):void {
        this._U_d = (((_arg1) != null) ? this._U_d = _arg1.clone() : null);
        this.redraw();
    }

    public function getColor():uint {
        return ((((this._U_d == null)) ? 0 : MoreColorUtil._nL_(this._U_d.h_, this._U_d._ew, this._U_d._fz)));
    }

    public function redraw():void {
        graphics.clear();
        if (this._U_d == null) {
            graphics.beginFill(0, ((this._M_b) ? 0 : 1));
        } else {
            graphics.beginFill(MoreColorUtil._nL_(this._U_d.h_, this._U_d._ew, this._U_d._fz));
        }
        graphics.drawRect(0, 0, this.size_, this.size_);
        graphics.endFill();
    }

}
}//package _qD_

