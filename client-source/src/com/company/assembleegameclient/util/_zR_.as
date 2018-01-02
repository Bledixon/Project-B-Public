// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util._zR_

package com.company.assembleegameclient.util {

import flash.net.URLVariables;

import _qN_.Account;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.offer.Offer;


public class _zR_ {

    public static const _X__:Vector.<_zR_> = new <_zR_>[/*new (_zR_)("GoogleAnalytics Checkout", "co", ""), */new _zR_("PayPal", "ps", "P3")/*, new (_zR_)("Credit Cards, etc.", "ps", "CH")*/];

    public static function _8N_(_arg1:String):_zR_ {
        var _local2:_zR_;
        for each (_local2 in _X__) {
            if (_local2.label_ == _arg1) {
                return (_local2);
            }
        }
        return (null);
    }

    public function _zR_(_arg1:String, _arg2:String, _arg3:String) {
        this.label_ = _arg1;
        this._q = _arg2;
        this._iV_ = _arg3;
    }
    public var label_:String;
    public var _q:String;
    public var _iV_:String;

    public function _T_R_(_arg1:String, _arg2:String, _arg3:Offer):String {
        var _local4:URLVariables = new URLVariables();
        _local4["tok"] = _arg1;
        _local4["exp"] = _arg2;
        _local4["guid"] = Account._get().guid();
        _local4["provider"] = this._q;
        switch (this._q) {
            /*case "co":
             _local4["jwt"] = _arg3.jwt_;
             break;*/
            case "ps":
                _local4["jwt"] = _arg3.jwt_;
                _local4["price"] = _arg3.price_.toString();
                _local4["paymentid"] = this._iV_;
                break;
        }
        return (((("http://" + Parameters._fK_()) + "/credits/add?") + _local4.toString()));
    }

}
}//package com.company.assembleegameclient.util

