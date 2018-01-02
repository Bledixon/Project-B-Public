// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_aD_._G_a

package _aD_ {
import _0M_m._j5;

import _sp._aJ_;

import com.company.assembleegameclient.util._zR_;
import com.company.assembleegameclient.util.offer.Offers;
import com.company.assembleegameclient.parameters.Parameters;

import flash.net.navigateToURL;
import flash.net.URLRequest;

public class _G_a implements _09h {

    [Inject]
    public var _iq:_j5;
    private var _0G_z:_aJ_;

    public function get complete():_aJ_ {
        return ((this._0G_z = ((this._0G_z) || (new _aJ_()))));
    }

    public function _U_Z_(_arg1:_sv):void {
        var _local3:_zR_;
        var _local2:Offers = this._iq._U_t();
        Parameters.data_.paymentMethod = _local3;
        Parameters.save();
        _local3 = _zR_._8N_(_arg1.paymentMethod);
        var _local4:String = _local3._T_R_(_local2.tok, _local2.exp, _arg1.offer);
        navigateToURL(new URLRequest(_local4), "_blank");
        this.complete.dispatch();
    }

}
}//package _aD_

