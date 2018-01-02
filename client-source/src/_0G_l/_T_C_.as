// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G_l._T_C_

package _0G_l {
import flash.display.Sprite;

import flash.events.MouseEvent;

import _tg._07k;


public class _T_C_ extends Sprite {

    public function _T_C_(_arg1:XML, _arg2:int, _arg3:int) {
        var _local7:XML;
        var _local8:_0w;
        this._P_Z_ = new Vector.<_0w>();
        super();
        this._9U_ = int(_arg1.@offset);
        this._09O_ = 0;
        this._04s = _arg2;
        this._l_ = _arg3;
        var _local4:int;
        var _local5:int;
        var _local6:Boolean = _arg1.hasOwnProperty("Admin");
        for each (_local7 in _arg1.Pic) {
            _local8 = new _0w(_local7, _local6);
            _local8.x = (_local4 * _0w.WIDTH);
            _local8.y = (_local5 * _0w.HEIGHT);
            _local8.addEventListener(MouseEvent.CLICK, this._09t);
            addChild(_local8);
            this._09O_++;
            _local4 = ((_local4 + 1) % _arg2);
            if (_local4 == 0) {
                if (++_local5 >= _arg3) break;
            }
        }
    }
    public var _9U_:int;
    public var _09O_:int;
    protected var _P_Z_:Vector.<_0w>;
    protected var _04s:int;
    protected var _l_:int;

    private function _09t(_arg1:MouseEvent):void {
        var _local2:_0w = (_arg1.target as _0w);
        if (_local2.bitmapData_ == null) {
            return;
        }
        dispatchEvent(new _07k(_local2.name_, _local2._Y_9, _local2._0D_z, _local2.bitmapData_));
    }

}
}//package _0G_l

