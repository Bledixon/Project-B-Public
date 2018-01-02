// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0M_m._0E_v

package _0M_m {
import com.company.assembleegameclient.util.offer.Offers;

import _sp._aJ_;

import com.company.assembleegameclient.util.offer.Offer;
import com.company.assembleegameclient.appengine._02k;

import _zo._8C_;

import _qN_.Account;

import _00g.WebAccount;

public class _0E_v implements _j5 {

    private static const _Q_3:int = 2600;

    private var _0J_E_:Offers;
    private var _U_k:_aJ_;
    private var _Z_r:Offer;

    public function get _Z_8():_aJ_ {
        return ((this._U_k = ((this._U_k) || (new _aJ_()))));
    }

    public function _002():void {
        _02k._U_t(this._E_A_(), this._y6);
    }

    public function _U_t():Offers {
        return (this._0J_E_);
    }

    private function _E_A_():String {
        switch (Account._get().gameNetwork()) {
            case WebAccount._000:
            default:
                return ("/credits");
        }
    }

    private function _y6(_arg1:_8C_):void {
        this._0J_E_ = new Offers(XML(_arg1.data_));
        this._Z_8.dispatch();
    }

}
}//package _0M_m

