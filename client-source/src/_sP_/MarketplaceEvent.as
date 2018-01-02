// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._k6

package _sP_ {
import flash.events.Event;

public class MarketplaceEvent extends Event {

    public static const TRADE:String = "TRADE";
    public static const CREATE:String = "CREATE";
    public static const SEARCH:String = "SEARCH";

    public function MarketplaceEvent(_arg1:int, _arg2:String="TRADE") {
        super(_arg2, true);
        this.id_ = _arg1;
    }

    public static function Create(_arg1:Vector.<int>, _arg2:Vector.<int>, _arg3:Vector.<Object>):MarketplaceEvent {
        var ret:MarketplaceEvent = new MarketplaceEvent(0, "CREATE");
        ret.included_ = _arg1;
        ret.requestItems_ = _arg2;
        ret.requestData_ = _arg3;
        return ret;
    }

    public static function Search(_arg1:MarketplaceItemSelect, _arg2:MarketplaceItemSelect) {
        var ret:MarketplaceEvent = new MarketplaceEvent(0, "SEARCH");
        ret.offerItems_ = _arg1.inventory_.equipment_;
        ret.offerData_ = _arg1.inventory_.equipData_;
        ret.requestItems_ = _arg2.inventory_.equipment_;
        ret.requestData_ = _arg2.inventory_.equipData_;
        return ret;
    }

    public var id_:int;
    public var included_:Vector.<int>;
    public var offerItems_:Vector.<int>;
    public var offerData_:Vector.<Object>;
    public var requestItems_:Vector.<int>;
    public var requestData_:Vector.<Object>;
}
}//package _sP_

