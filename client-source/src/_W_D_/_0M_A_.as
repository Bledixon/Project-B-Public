// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_W_D_._0M_A_

package _W_D_ {
import flash.display.DisplayObjectContainer;
import flash.display.LoaderInfo;

public class _0M_A_ {

    private const _Y_n:String = "Production";

    [Inject]
    public var root:DisplayObjectContainer;
    [Inject]
    public var _0K_y:_B_d;
    [Inject]
    public var domain:Domain;

    public function _I_O_():Boolean {
        return (!(this._B_z()));
    }

    public function _B_z():Boolean {
        if (this._0K_y._H_z()) {
            return (this._0B_P_());
        }
        return (this.domain._H_n());
    }

    private function _0B_P_():Boolean {
        var _local1:LoaderInfo = this.root.loaderInfo;
        return ((_local1.parameters.deployment == this._Y_n));
    }

}
}//package _W_D_

