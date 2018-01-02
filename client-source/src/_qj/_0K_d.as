// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qj._0K_d

package _qj {
import flash.errors.IllegalOperationError;

public class _0K_d extends _8y {

    override public function matches(_arg1:Object):Boolean {
        return (this.matchesOrDescribesMismatch(_arg1, new _hG_()));
    }

    override public function describeMismatch(_arg1:Object, _arg2:Description):void {
        this.matchesOrDescribesMismatch(_arg1, _arg2);
    }

    protected function matchesOrDescribesMismatch(_arg1:Object, _arg2:Description):Boolean {
        throw (new IllegalOperationError("DiagnosingMatcher#matches is abstract and must be overriden in a subclass"));
    }

}
}//package _qj

