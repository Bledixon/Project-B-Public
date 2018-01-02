/**
 * Created by club5_000 on 9/20/2014.
 */
package _sP_ {
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.objects.ObjectLibrary;
    import com.company.assembleegameclient.ui._7f;

    import flash.display.Bitmap;

    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class MarketplaceOffer extends Sprite {
        public static const WIDTH:int = 792;
        public static const HEIGHT:int = 108;

        public var gs_:GameSprite;
        public var info_:MarketplaceOfferInfo;
        private var offer_:Sprite;
        private var arrow_:Bitmap;
        private var request_:Sprite;
        private var tradeButton_:_7f;
        private var id_:int;

        public function MarketplaceOffer(_arg1:XML, _arg2:GameSprite) {
            super();
            var _local1:Vector.<int> = Vector.<int>(String(_arg1.OfferItems).split(", "));
            var _local2:Vector.<Object> = new Vector.<Object>();
            for each(var _data:Object in JSON.parse(_arg1.OfferData).datas) {
                _local2.push(_data);
            }
            var _local3:Vector.<int> = Vector.<int>(String(_arg1.RequestItems).split(", "));
            var _local4:Vector.<Object> = new Vector.<Object>();
            for each(var _data:Object in JSON.parse(_arg1.RequestData).datas) {
                _local4.push(_data);
            }
            this.info_ = new MarketplaceOfferInfo(_local1, _local2, _local3, _local4, _arg1.Mine == "true", _arg1.Status);
            this.gs_ = _arg2;
            this.id_ = _arg1.@id;
            this.draw();
        }

        private function draw():void {
            var _local1:int = 0;
            var _local2:MarketplaceSlot;
            this.offer_ = new Sprite();
            while(_local1 < this.info_.offerItems_.length) {
                _local2 = new MarketplaceSlot(this.info_.offerItems_[_local1], this.info_.offerData_[_local1], this.gs_, this.info_.status_ == 0);
                _local2.x = (_local1 % 4) * (MarketplaceSlot.WIDTH + 4);
                _local2.y = (Math.floor(_local1 / 4)) * (MarketplaceSlot.HEIGHT + 4);
                this.offer_.addChild(_local2);
                _local1++;
            }
            this.offer_.x = 4;
            this.offer_.y = (HEIGHT / 2) - (this.offer_.height / 2);
            addChild(this.offer_);
            this.arrow_ = new TradeArrowEmbed();
            this.arrow_.x = this.offer_.x + this.offer_.width + 10;
            this.arrow_.y = (HEIGHT / 2) - (this.arrow_.height / 2) - 4;
            addChild(this.arrow_);
            _local1 = 0;
            this.request_ = new Sprite();
            while(_local1 < this.info_.requestItems_.length) {
                _local2 = new MarketplaceSlot(this.info_.requestItems_[_local1], this.info_.requestData_[_local1], this.gs_, this.info_.status_ == 0);
                _local2.x = (_local1 % 4) * (MarketplaceSlot.WIDTH + 4);
                _local2.y = (Math.floor(_local1 / 4)) * (MarketplaceSlot.HEIGHT + 4);
                this.request_.addChild(_local2);
                _local1++;
            }
            this.request_.x = this.arrow_.x + this.arrow_.width + 18;
            this.request_.y = (HEIGHT / 2) - (this.request_.height / 2);
            addChild(this.request_);
            var _local3:String = "Trade";
            if(this.info_.mine_) {
                if(this.info_.status_ != 0) {
                    _local3 = "Collect";
                } else {
                    _local3 = "Close";
                }
            }
            this.tradeButton_ = new _7f(24, _local3);
            this.tradeButton_.x = (((3 * _5N_.WIDTH) / 3.25) - (this.tradeButton_.width / 2));
            this.tradeButton_.y = (HEIGHT / 2) - (this.tradeButton_.height / 2);
            this.tradeButton_._A_w(false);
            this.usableCheck();
            addChild(this.tradeButton_);
            this.tradeButton_.addEventListener(MouseEvent.CLICK, this.onMouseClick)
        }

        private function usableCheck():void {
            if (!this.info_.mine_) {
                var _pItems:Vector.<int> = this.gs_.map_.player_.equipment_;
                var _usedItems:Vector.<int> = new Vector.<int>();
                var _pData:Vector.<Object> = this.gs_.map_.player_.equipData_;
                for (var i:int = 0; i < this.info_.requestItems_.length; i++) {
                    var _success:Boolean = false;
                    var _rDat:Object = this.info_.requestData_[i];
                    for (var p:int = 0; p < _pItems.length; p++) {
                        if (_pItems[p] == -1 || _pItems[p] != this.info_.requestItems_[i] || _usedItems.indexOf(p) != -1) {
                            continue;
                        }
                        var _pDat:Object = _pData[p];
                        var _xml:XML = ObjectLibrary._Q_F_[_pItems[p]];
                        if (_xml.hasOwnProperty("Soulbound") || (_hD(_pDat, "Soulbound") && _pDat.Soulbound)) {
                            continue;
                        }
                        if (_hD(_rDat, "Strange") && _rDat.Strange) {
                            if(_hD(_pDat, "Strange") && !_rDat.Strange) {
                                continue;
                            }
                            if(!_hD(_pDat, "Strange")) {
                                continue;
                            }
                        } else {
                            if (_hD(_rDat, "NamePrefix")) {
                                if (_rDat.NamePrefix != "" && ((_hD(_pDat, "NamePrefix") && _pDat.NamePrefix != _rDat.NamePrefix) || !_hD(_pDat, "NamePrefix"))) {
                                    continue;
                                }
                                if (_rDat.NamePrefix == "" && (_hD(_pDat, "NamePrefix") && _pDat.NamePrefix != "")) {
                                    continue;
                                }
                            } else if (_hD(_pDat, "NamePrefix") && _pDat.NamePrefix != "") {
                                continue;
                            }
                            if (_hD(_rDat, "Effect")) {
                                if (_rDat.Effect != "" && ((_hD(_pDat, "Effect") && _pDat.Effect != _rDat.Effect) || !_hD(_pDat, "Effect"))) {
                                    continue;
                                }
                                if (_rDat.Effect == "" && (_hD(_pDat, "Effect") && _pDat.Effect != "")) {
                                    continue;
                                }
                            } else if (_hD(_pDat, "Effect") && _pDat.Effect != "") {
                                continue;
                            }
                        }
                        _usedItems.push(p);
                        _success = true;
                        break;
                    }
                    if (!_success) {
                        this.tradeButton_._A_w(false);
                        return;
                    }
                }
                var _availableSlots:int = 0;
                for (var i:int = 4; i < _pItems.length; i++) {
                    if (_pItems[i] == -1 || _usedItems.indexOf(i) != -1) {
                        _availableSlots++;
                    }
                }
                if (_availableSlots < this.info_.offerItems_.length) {
                    this.tradeButton_._A_w(false);
                } else {
                    this.tradeButton_._A_w(true);
                }
            } else if (!this.info_.status_) {
                this.tradeButton_._A_w(true);
            } else {
                var available:int = 0;
                for(var i:int = 4; i < this.gs_.map_.player_.equipment_.length; i++) {
                    if(this.gs_.map_.player_.equipment_[i] == -1) {
                        available++;
                    }
                }
                var maxLen:int = 0;
                if(this.info_.status_ == 1) {
                    maxLen = this.info_.offerItems_.length;
                } else if (this.info_.status_ == 2) {
                    maxLen = this.info_.requestItems_.length;
                }
                if(available < this.info_.offerItems_.length ) {
                    this.tradeButton_._A_w(false);
                } else {
                    this.tradeButton_._A_w(true);
                }
            }
        }

        private function _hD(_arg1:Object, _arg2:String):Boolean {
            return _arg1 != null && _arg1.hasOwnProperty(_arg2);
        }

        private function onMouseClick(e:MouseEvent):void {
            this.dispatchEvent(new MarketplaceEvent(this.id_, MarketplaceEvent.TRADE));
        }
    }
}
