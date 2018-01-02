// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G__._V_i

package _0G__ {
import _02b._6E_;
import _02b._fn;

public class _V_i {

    [Inject]
    public var analytics:_6E_;
    [Inject]
    public var _4f:_fn;

    public function execute():void {
        this.analytics.trackEvent(this._4f.category, this._4f._lC_, this._4f._9g, this._4f.value);
    }

}
}//package _0G__

