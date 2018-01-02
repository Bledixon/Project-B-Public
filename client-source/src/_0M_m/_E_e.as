// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0M_m._E_e

package _0M_m {
import _sp._aJ_;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.appengine._0B_u;

import _zo._8C_;

import com.company.util._H_U_;

import _qN_.Account;

import com.company.assembleegameclient.util._04d;
import com.company.assembleegameclient.util.offer.Offer;
import com.company.assembleegameclient.util.offer.Offers;

public class _E_e implements _00V_ {

    private static const _Q_3:int = 2600;

    [Inject]
    public var _0J_E_:_j5;
    private var _08t:int;
    private var _0H_C_:Boolean;
    private var _0B_8:_aJ_;
    private var _0e:_aJ_;

    public function get _J_1():_aJ_ {
        return ((this._0B_8 = ((this._0B_8) || (new _aJ_()))));
    }

    public function get _Q_o():_aJ_ {
        return ((this._0e = ((this._0e) || (new _aJ_()))));
    }

    public function isAvailable():Boolean {
        return ((this._tT_() > 0));
    }

    public function _li():Boolean {
        return (Parameters.data_.beginnersOfferShowNow);
    }

    public function _14():void {
        Parameters.data_.beginnersOfferShowNow = false;
    }

    public function _03K_():void {
        var _local1:_0B_u = new _0B_u(Parameters._fK_(), "/account", true);
        _local1.addEventListener(_8C_.GENERIC_DATA, this._0L_8);
        var _local2:Object = {};
        _H_U_._t2(_local2, Account._get().credentials());
        _local1.sendRequest("getBeginnerPackageTimeLeft", _local2);
    }

    public function _tT_():int {
        return (((this._0H_C_) ? this._08t : Parameters.data_.beginnersOfferTimeLeft));
    }

    public function _ao():Offer {
        var _local2:Offer;
        var _local1:Offers = this._0J_E_._U_t();
        if (!_local1) {
            return (null);
        }
        for each (_local2 in _local1.offerList) {
            if (_local2.realmGold_ == _Q_3) {
                return (_local2);
            }
        }
        return (null);
    }

    public function _xh():void {
        this._08t = 0;
        Parameters.data_.showBeginningsOffer = false;
        ((this._0e) && (this._0e.dispatch()));
    }

    private function _0L_8(_arg1:_8C_):void {
        var _local2:XML = new XML(_arg1.data_);
        this._0H_C_ = true;
        this._08t = _04d._3r(_local2.text());
        this._J_1.dispatch();
    }

}
}//package _0M_m

