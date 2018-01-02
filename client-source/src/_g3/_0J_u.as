// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_g3._0J_u

package _g3 {
import _qj._8y;

import flash.utils.getQualifiedClassName;

import _qj.Description;

public class _0J_u extends _8y {

    public function _0J_u(_arg1:Class) {
        this._0E_h = _arg1;
        this._06T_ = getQualifiedClassName(_arg1);
    }
    private var _0E_h:Class;
    private var _06T_:String;

    override public function matches(_arg1:Object):Boolean {
        return ((_arg1 is this._0E_h));
    }

    override public function describeTo(_arg1:Description):void {
        _arg1.appendText("an instance of ").appendText(this._06T_);
    }

}
}//package _g3

