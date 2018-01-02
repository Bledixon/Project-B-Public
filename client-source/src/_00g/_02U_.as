// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_00g._02U_

package _00g {
import _qN_._px;

import com.company.assembleegameclient.util._zR_;
import com.company.assembleegameclient.parameters.Parameters;

import flash.net.navigateToURL;
import flash.net.URLRequest;
import flash.events.Event;

public class _02U_ extends _px {

    override public function execute():void {
        var _local1:_zR_;
        Parameters.data_.paymentMethod = _local1;
        Parameters.save();
        _local1 = _zR_._8N_(paymentMethod);
        var _local2:String = _local1._T_R_(_0J_E_.tok, _0J_E_.exp, offer);
        navigateToURL(new URLRequest(_local2), "_blank");
        if (mediator) {
            mediator.dispatchEvent(new Event(Event.COMPLETE));
        }
    }

}
}//package _00g

