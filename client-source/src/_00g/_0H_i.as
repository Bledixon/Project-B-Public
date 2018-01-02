// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_00g._0H_i

package _00g {
import flash.events.EventDispatcher;

import com.company.assembleegameclient.util.offer.Offers;
import com.company.assembleegameclient.util.offer.Offer;

import _qN_._px;

import flash.events.Event;

public class _0H_i extends EventDispatcher {

    public var _0J_E_:Offers;
    public var _02Z_:Boolean;
    public var _d0:Boolean;
    public var _yI_:String;
    public var _Q_W_:String;
    public var offer:Offer;
    public var paymentMethod:String;
    public var _04Z_:_px;

    public function _8i():void {
        this._04Z_._0J_E_ = this._0J_E_;
        this._04Z_.offer = this.offer;
        this._04Z_.paymentMethod = this.paymentMethod;
        this._04Z_.mediator = this;
        this._04Z_.execute();
    }

    public function complete():void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    public function cancel():void {
        dispatchEvent(new Event(Event.CANCEL));
    }

}
}//package _00g

