/**
 * Created by club5_000 on 9/21/2014.
 */
package _sP_ {
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.ui._0K_B_;
    import com.company.assembleegameclient.ui._7f;
    import com.company.ui.SimpleText;

    import flash.display.Bitmap;

    import flash.display.Graphics;

    import flash.display.Shape;

    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.filters.DropShadowFilter;

    import spark.primitives.Graphic;

    public class MarketplaceSearch extends Sprite {

        public function MarketplaceSearch(_arg1:GameSprite) {
            super();
            this.gs_ = _arg1;
            this.build();
        }
        private var gs_:GameSprite;
        private var _P_V_:SimpleText;
        private var _dL_:Shape;
        private var _017:Sprite;
        private var _0A_z:Sprite;
        private var _E_k:_0K_B_;
        private var offer_:MarketplaceItemSelect;
        private var arrow_:Bitmap;
        private var request_:MarketplaceItemSelect;
        private var searchButton_:_7f;

        public function build():void {
            this.offer_ = new MarketplaceItemSelect(this.gs_);
            this.offer_.x = 34;
            this.offer_.y = 58;
            addChild(this.offer_);
            this.arrow_ = new TradeArrowEmbed();
            this.arrow_.x = this.offer_.x + this.offer_.width + 10;
            this.arrow_.y = this.offer_.y + 50 - (this.arrow_.height / 2);
            addChild(this.arrow_);
            this.request_ = new MarketplaceItemSelect(this.gs_);
            this.request_.x = this.arrow_.x + this.arrow_.width + 18;
            this.request_.y = 58;
            addChild(this.request_);
            this.searchButton_ = new _7f(24, "Search");
            this.searchButton_.x = (((3 * _5N_.WIDTH) / 3.25) - (this.searchButton_.width / 2));
            this.searchButton_.y = this.arrow_.y + (this.arrow_.height / 2) - (this.searchButton_.height / 2);
            addChild(this.searchButton_);
            this.searchButton_.addEventListener(MouseEvent.CLICK, this.createTrade);
        }

        private function _A_E_(_arg1:Event):void {
            this._0A_z.y = (-(this._E_k._Q_D_()) * (this._0A_z.height - 400));
        }

        private function checkScroll(event:Event):void {
            if(this._E_k != null && this.contains(this._E_k)) {
                this.removeChild(this._E_k);
                this._E_k = null;
            }
            if (this._0A_z.height > 400) {
                this._E_k = new _0K_B_(16, 400);
                this._E_k.x = ((800 - this._E_k.width) - 4);
                this._E_k.y = 108;
                this._E_k._fA_(400, this._0A_z.height);
                this._E_k.addEventListener(Event.CHANGE, this._A_E_);
                addChild(this._E_k);
            }
        }

        private function createTrade(event:MouseEvent):void {
            this.dispatchEvent(MarketplaceEvent.Search(this.offer_, this.request_));
        }
    }
}
