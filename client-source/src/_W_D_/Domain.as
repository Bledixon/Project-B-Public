// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_W_D_.Domain

package _W_D_ {
import _yn._07Y_;

import flash.system.Security;
import flash.net.LocalConnection;

public class Domain {

    private const _jC_:String = "localhost";
    private const _V_w:Array = ["bledixon.com"];
    private const _eg:Array = ["bledixon.github.io"];
    private const _V_k:Array = _V_w.concat(_eg);

    [Inject]
    public var _0K_y:_B_d;
    private var _04V_:String;

    public function _B_r():void {
        var _local1:String;
        for each (_local1 in this._V_k) {
            Security.allowDomain(_local1);
        }
    }

    public function _F_N_():Boolean {
       // return true;
        return (this._0K_y._H_z() || this._Q_E_());
    }

    public function _H_n():Boolean {
        var _local1:String = this._T_g();
        return (!((this._V_w.indexOf(_local1) == -1)));
    }

    private function _Q_E_():Boolean {
        var _local3:String;
        var _local1:String = this._T_g();
        var _local2:* = (_local1 == this._jC_);
        for each (_local3 in this._V_k) {
            _local2 = ((_local2) || ((_local1 == _local3)));
        }
        return (_local2);
    }

    private function _T_g():String {
        return ((this._04V_ = ((this._04V_) || (new LocalConnection().domain))));
    }

}
}//package _W_D_

