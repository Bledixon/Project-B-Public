// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_015._0C_Q_

package _015 {
import flash.display.Sprite;
import flash.utils.Dictionary;

import com.company.assembleegameclient.map._0D_v;

public class _0C_Q_ extends Sprite {

    private static var _sX_:Dictionary = new Dictionary();

    public function _0C_Q_() {
        this._oX_ = new Dictionary();
        super();
        mouseEnabled = false;
        mouseChildren = false;
    }
    public var _oX_:Dictionary;

    public function addSpeechBalloon(_arg1:_6T_):void {
        var _local2:_6T_ = _sX_[_arg1.go_.objectId_];
        if (((!((_local2 == null))) && (contains(_local2)))) {
            removeChild(_local2);
        }
        _sX_[_arg1.go_.objectId_] = _arg1;
        addChild(_arg1);
    }

    public function draw(_arg1:_0D_v, _arg2:int):void {
        var _local4:_0J_p;
        var _local3:int;
        while (_local3 < numChildren) {
            _local4 = (getChildAt(_local3) as _0J_p);
            if (_local4 == null) {
                _local3++;
            } else {
                if (!_local4.draw(_arg1, _arg2)) {
                    removeChildAt(_local3);
                } else {
                    _local3++;
                }
            }
        }
    }

}
}//package _015

