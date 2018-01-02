// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_092._0H_I_

package _092 {
import _qj._0K_d;
import _qj._pn;
import _qj.Description;

public class _0H_I_ extends _0K_d {

    public function _0H_I_(_arg1:Array) {
        this._Z_1 = ((_arg1) || ([]));
    }
    private var _Z_1:Array;

    override protected function matchesOrDescribesMismatch(_arg1:Object, _arg2:Description):Boolean {
        var _local3:_pn;
        for each (_local3 in this._Z_1) {
            if (!_local3.matches(_arg1)) {
                _arg2._ka(_local3).appendText(" ")._zW_(_local3, _arg1);
                return (false);
            }
        }
        return (true);
    }

    override public function describeTo(_arg1:Description):void {
        _arg1._05o("(", " and ", ")", this._Z_1);
    }

}
}//package _092

