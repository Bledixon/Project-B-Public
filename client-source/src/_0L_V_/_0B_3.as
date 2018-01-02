// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0L_V_._0B_3

package _0L_V_ {
import flash.display.Sprite;

import _sp._aJ_;

import com.company.ui.SimpleText;

import _S_K_._u3;

import flash.events.MouseEvent;

public class _0B_3 extends Sprite {

    public static const _get_:String = "${TIME} day${PLURAL} left!";

    public static var _099:Class = _aq;

    public function _0B_3() {
        this._044();
        this._L_z();
        this._Q_G_();
        this._cn();
    }
    public var close:_aJ_;
    public var buy:_aJ_;
    private var _w2:SimpleText;

    public function _sj(_arg1:int):void {
        this._w2.text = _get_.replace("${TIME}", _arg1).replace("${PLURAL}", (((_arg1 > 1)) ? "s" : ""));
    }

    private function _044():void {
        addChild(new _099());
    }

    private function _L_z():void {
        this._w2 = new SimpleText(14, 0xE3C900, false, 0, 0, "Myriad Pro");
        this._w2.setBold(true);
        this._w2.x = 307;
        this._w2.y = 380;
        addChild(this._w2);
    }

    private function _cn():void {
        var _local1:Sprite = this._jW_(270, 400, 150, 40);
        this.buy = new _u3(_local1, MouseEvent.CLICK);
    }

    private function _Q_G_():void {
        var _local1:Sprite = this._jW_(550, 30, 30, 30);
        this.close = new _u3(_local1, MouseEvent.CLICK);
    }

    private function _jW_(_arg1:int, _arg2:int, _arg3:int, _arg4:int):Sprite {
        var _local5:_A_V_ = new _A_V_(_arg1, _arg2, _arg3, _arg4);
        addChild(_local5);
        return (_local5);
    }

}
}//package _0L_V_

