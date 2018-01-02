/**
 * Created by club5_000 on 9/20/2014.
 */
package _sP_ {
    public class MarketplaceOfferInfo {
        public var mine_:Boolean;
        public var status_:int;

        public var offerItems_:Vector.<int>;
        public var offerData_:Vector.<Object>;

        public var requestItems_:Vector.<int>;
        public var requestData_:Vector.<Object>;

        public function MarketplaceOfferInfo(_arg1:Vector.<int>, _arg2:Vector.<Object>, _arg3:Vector.<int>, _arg4:Vector.<Object>, _arg5:Boolean, _arg6:int) {
            this.offerItems_ = _arg1;
            this.offerData_ = _arg2;
            this.requestItems_ = _arg3;
            this.requestData_ = _arg4;
            this.mine_ = _arg5;
            this.status_ = _arg6;
        }
    }
}
