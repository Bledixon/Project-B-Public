// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_W_D_._B_d

package _W_D_ {
import flash.display.DisplayObjectContainer;
import flash.system.Capabilities;
import flash.display.LoaderInfo;

public class _B_d {

    private const _C_J_:String = "Desktop";
    private static var platform:_0I_z;
    [Inject]
    public var root:DisplayObjectContainer;

    public function _0B_z():Boolean {
        return (!((Capabilities.playerType == this._C_J_)));
    }

    public function _H_z():Boolean {
        return ((Capabilities.playerType == this._C_J_));
    }

    public function _R_K_():_0I_z {
        return ((platform = ((platform) || (this._gQ_()))));
    }

    private function _gQ_():_0I_z {
        return (_0I_z._kj);
    }

}
}//package _W_D_

