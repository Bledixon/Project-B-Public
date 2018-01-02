// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qj._8y

package _qj {
import flash.errors.IllegalOperationError;

public class _8y implements _pn {

    public function matches(_arg1:Object):Boolean {
        throw (new IllegalOperationError("BaseMatcher#matches must be override by subclass"));
    }

    public function describeMismatch(_arg1:Object, _arg2:Description):void {
        _arg2.appendText("was ")._B_U_(_arg1);
    }

    public function describeTo(_arg1:Description):void {
        throw (new IllegalOperationError("BaseMatcher#describeTo must be override by subclass"));
    }

    public function toString():String {
        return (_ne.toString(this));
    }

}
}//package _qj

