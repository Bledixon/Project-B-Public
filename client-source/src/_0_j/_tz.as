// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_j._tz

package _0_j {
import flash.display.Sprite;

import _4x._0I_y;

import com.company.util.MoreColorUtil;

public class _tz extends Sprite {

    public function _tz(_arg1:int, _arg2:_0I_y, _arg3:Boolean) {
        this.size_ = _arg1;
        this._U_d = new _0I_y();
        this._gp(_arg2);
        this._7r = _arg3;
    }
    public var size_:int;
    public var _U_d:_0I_y;
    public var _7r:Boolean = false;

    public function _gp(_arg1:_0I_y):void {
        if (this._7r) {
            return;
        }
        this._U_d.h_ = _arg1.h_;
        this._U_d._ew = _arg1._ew;
        this._U_d._fz = _arg1._fz;
        var _local2:uint = MoreColorUtil._nL_(this._U_d.h_, this._U_d._ew, this._U_d._fz);
        graphics.beginFill(_local2);
        graphics.drawRect(0, 0, this.size_, this.size_);
        graphics.endFill();
    }

}
}//package _0_j

