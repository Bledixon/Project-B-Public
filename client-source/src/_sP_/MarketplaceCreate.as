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

    public class MarketplaceCreate extends Sprite {

        public function MarketplaceCreate(_arg1:GameSprite) {
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
        private var myInv_:MarketplaceInventory;
        private var arrow_:Bitmap;
        private var request_:MarketplaceItemSelect;
        private var createButton_:_7f;

        public function build():void {
            var _local2:Graphics;
            this._P_V_ = new SimpleText(32, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._P_V_.setBold(true);
            this._P_V_.text = "Marketplace";
            this._P_V_._08S_();
            this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this._P_V_.y = 24;
            stage;
            this._P_V_.x = ((800 / 2) - (this._P_V_.width / 2));
            addChild(this._P_V_);
            this._dL_ = new Shape();
            _local2 = this._dL_.graphics;
            _local2.clear();
            _local2.lineStyle(2, 0xEE9327);
            _local2.moveTo(0, 100);
            stage;
            _local2.lineTo(800, 100);
            _local2.lineStyle();
            addChild(this._dL_);
            this._017 = new Sprite();
            this._017.x = 10;
            this._017.y = 101;
            var _local3:Shape = new Shape();
            _local2 = _local3.graphics;
            _local2.beginFill(0);
            _local2.drawRect(0, 0, _5N_.WIDTH, 423);
            _local2.endFill();
            this._017.addChild(_local3);
            this._017.mask = _local3;
            addChild(this._017);
            this._0A_z = new Sprite();
            this.myInv_ = new MarketplaceInventory(this.gs_.map_.player_.equipment_, this.gs_.map_.player_.equipData_, this.gs_, 1);
            this.myInv_.x = 8;
            this.myInv_.y = 8;
            this._0A_z.addChild(this.myInv_);
            this.arrow_ = new TradeArrowEmbed();
            this.arrow_.x = this.myInv_.x + this.myInv_.width + 10;
            this.arrow_.y = this.myInv_.y + (this.myInv_.height / 2) - (this.arrow_.height / 2);
            this._0A_z.addChild(this.arrow_);
            this.request_ = new MarketplaceItemSelect(this.gs_);
            this.request_.setType("marketCreate");
            this.request_.x = 34;
            this.request_.y = this.arrow_.y + (this.arrow_.height / 2) - 50;
            this._0A_z.addChild(this.request_);
            this.request_.addEventListener(Event.CHANGE, checkScroll);
            this.createButton_ = new _7f(24, "Create");
            this.createButton_.x = (((3 * _5N_.WIDTH) / 3.25) - (this.createButton_.width / 2));
            this.createButton_.y = this.myInv_.y + (this.myInv_.height / 2) - (this.arrow_.height / 2);
            this._0A_z.addChild(this.createButton_);
            this.createButton_.addEventListener(MouseEvent.CLICK, this.createTrade);
            this._017.addChild(this._0A_z);
            if (this._0A_z.height > 400) {
                this._E_k = new _0K_B_(16, 400);
                this._E_k.x = ((800 - this._E_k.width) - 4);
                this._E_k.y = 108;
                this._E_k._fA_(400, this._0A_z.height);
                this._E_k.addEventListener(Event.CHANGE, this._A_E_);
                addChild(this._E_k);
            }
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
            this.dispatchEvent(MarketplaceEvent.Create(this.myInv_.getIncludedSlots(), this.request_.inventory_.equipment_, this.request_.inventory_.equipData_));
        }
    }
}
