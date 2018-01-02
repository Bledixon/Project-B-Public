// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_j._2i

package _0_j {
import _zm._01c;

import com.company.util.IntPoint;


public class _2i extends _01c {

    public function _2i(_arg1:Vector.<IntPoint>) {
        var _local3:IntPoint;
        this._wh = _arg1;
        var _local2:Vector.<String> = new Vector.<String>();
        for each (_local3 in this._wh) {
            _local2.push(((("" + _local3.x_) + " x ") + _local3.y_));
        }
        super(_local2, 120, 26, "Size");
    }
    protected var _wh:Vector.<IntPoint>;

    public function _H_9(_arg1:int, _arg2:int):void {
        var _local3:int;
        while (_local3 < this._wh.length) {
            if ((((this._wh[_local3].x_ == _arg1)) && ((this._wh[_local3].y_ == _arg2)))) {
                _0L_M_(_local3);
                return;
            }
            _local3++;
        }
    }

    public function _0M_t():IntPoint {
        return (this._wh[_0K_M_()]);
    }

}
}//package _0_j

