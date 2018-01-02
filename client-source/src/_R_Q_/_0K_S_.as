// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_R_Q_._0K_S_

package _R_Q_ {
import _0_p._v;
import _0_p._L_y;

import _A_G_._v1;

import _0I_9._0J_r;

import _6r._0F_X_;
import _6r._iy;

public class _0K_S_ implements _v {

    [Inject]
    public var context:_L_y;
    [Inject]
    public var mediatorMap:_v1;
    [Inject]
    public var _Q_l:_0J_r;

    public function configure():void {
        this.mediatorMap.map(_0F_X_)._Y_u(_iy);
        this.context._iL_._3a(this.init);
    }

    private function init():void {
        this._Q_l.tooltips.addChild(new _0F_X_());
    }

}
}//package _R_Q_

