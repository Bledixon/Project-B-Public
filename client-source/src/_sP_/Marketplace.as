// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._if

package _sP_ {
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.ui.TextButton;

    import flash.display.Sprite;

import com.company.assembleegameclient.appengine._0B_u;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.Shape;

import com.company.assembleegameclient.ui._0K_B_;

    import flash.events.MouseEvent;

    import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.util._H_U_;

import _qN_.Account;

import _zo._8C_;
import _zo._mS_;

import flash.display.Graphics;

import com.company.assembleegameclient.util._07E_;

import flash.events.Event;

    import spark.components.supportClasses.TextBase;

    public class Marketplace extends Sprite {

    public function Marketplace(_arg1:int, _arg2:int, _arg3:GameSprite, _arg4:String) {
        this.num_ = _arg1;
        this.offset_ = _arg2;
        this.gs_ = _arg3;
        this.category_ = _arg4;
        this._j7 = new SimpleText(22, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._j7.setBold(true);
        this._j7.text = "Loading...";
        this._j7._08S_();
        this._j7.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._j7.x = ((800 / 2) - (this._j7.width / 2));
        this._j7.y = ((600 / 2) - (this._j7.height / 2));
        addChild(this._j7);
        this._3v = new _0B_u(Parameters._fK_(), "/market", true, 2);
        var _local5:Object = {
            "num": _arg1,
            "offset": _arg2,
            "filter": _arg4
        };
        _H_U_._t2(_local5, Account._get().credentials());
        this._3v.addEventListener(_8C_.GENERIC_DATA, this._L_5);
        this._3v.addEventListener(_mS_.TEXT_ERROR, this._ix);
        this._3v.sendRequest("list", _local5);
    }

    public var allButton_:TextButton;
    public var mineButton_:TextButton;
    public var searchButton_:TextButton;
    private var gs_:GameSprite;
    private var _3v:_0B_u;
    private var _j7:SimpleText;
    private var _P_V_:SimpleText;
    private var _dL_:Shape;
    private var _017:Sprite;
    private var _0A_z:Sprite;
    private var _E_k:_0K_B_;
    private var num_:int;
    private var offset_:int;
    public var category_:String;
    public var search_:MarketplaceSearch;

    private function build(_arg1:XML):void {
        var _local2:Graphics;
        var _local5:XML;
        var _local9:MarketplaceOffer;
        removeChild(this._j7);
        this._P_V_ = new SimpleText(32, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.text = "Marketplace";
        this._P_V_._08S_();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._P_V_.y = 24;
        this._P_V_.x = ((800 / 2) - (this._P_V_.width / 2));
        addChild(this._P_V_);
        this.buildCategoryButtons();
        this._dL_ = new Shape();
        _local2 = this._dL_.graphics;
        _local2.clear();
        _local2.lineStyle(2, 0xEE9327);
        _local2.moveTo(0, 100);
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
        var _local4:int = 8;
        for each (_local5 in _arg1.Offer) {
            _local9 = new MarketplaceOffer(_local5, this.gs_);
            _local9.x = 4;
            _local9.y = _local4;
            this._0A_z.addChild(_local9);
            _local4 += MarketplaceOffer.HEIGHT + 4;
        }
        this._017.addChild(this._0A_z);
        if (this._0A_z.height > 400) {
            this._E_k = new _0K_B_(16, 400);
            this._E_k.x = ((800 - this._E_k.width) - 4);
            this._E_k.y = 110;
            this._E_k._fA_(400, this._0A_z.height);
            this._E_k.addEventListener(Event.CHANGE, this._A_E_);
            addChild(this._E_k);
        }
    }

    public function rebuild():void {
        if(this.category_ == "search") {
            if(this._E_k != null && contains(this._E_k)) {
                removeChild(this._E_k);
                this._E_k = null;
            }
            this._0A_z.y = 0;
            this._0A_z.removeChildren();
            this.search_ = new MarketplaceSearch(this.gs_);
            this._0A_z.addChild(this.search_);
            this.search_.addEventListener(MarketplaceEvent.SEARCH, this.searchRebuild);
            this.search_.addEventListener(Event.CHANGE, this.checkScroll);
        } else {
            removeChild(this._P_V_);
            this._P_V_ = null;
            removeChild(this._dL_);
            this._dL_ = null;
            removeChild(this._017);
            this._017 = null;
            this._0A_z = null;
            removeChild(this.allButton_);
            this.allButton_ = null;
            removeChild(this.mineButton_);
            this.mineButton_ = null;
            removeChild(this.searchButton_);
            this.searchButton_ = null;
            if(this._E_k != null && contains(this._E_k)) {
                removeChild(this._E_k);
                this._E_k = null;
            }

            this._j7 = new SimpleText(22, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._j7.setBold(true);
            this._j7.text = "Loading...";
            this._j7._08S_();
            this._j7.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this._j7.x = ((800 / 2) - (this._j7.width / 2));
            this._j7.y = ((600 / 2) - (this._j7.height / 2));
            addChild(this._j7);
            this._3v = new _0B_u(Parameters._fK_(), "/market", true, 2);
            var _local5:Object = {
                "num": this.num_,
                "offset": this.offset_,
                "filter": this.category_
            };
            _H_U_._t2(_local5, Account._get().credentials());
            this._3v.addEventListener(_8C_.GENERIC_DATA, this._L_5);
            this._3v.addEventListener(_mS_.TEXT_ERROR, this._ix);
            this._3v.sendRequest("list", _local5);
        }
    }

    public function searchRebuild(e:MarketplaceEvent):void {
        this.category_ = "searched";

        removeChild(this._P_V_);
        this._P_V_ = null;
        removeChild(this._dL_);
        this._dL_ = null;
        removeChild(this._017);
        this._017 = null;
        this._0A_z = null;
        this.search_ = null;
        removeChild(this.allButton_);
        this.allButton_ = null;
        removeChild(this.mineButton_);
        this.mineButton_ = null;
        removeChild(this.searchButton_);
        this.searchButton_ = null;
        if(this._E_k != null && contains(this._E_k)) {
            removeChild(this._E_k);
            this._E_k = null;
        }

        this._j7 = new SimpleText(22, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._j7.setBold(true);
        this._j7.text = "Loading...";
        this._j7._08S_();
        this._j7.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._j7.x = ((800 / 2) - (this._j7.width / 2));
        this._j7.y = ((600 / 2) - (this._j7.height / 2));
        addChild(this._j7);
        this._3v = new _0B_u(Parameters._fK_(), "/market", true, 2);
        var _local5:Object = {
            "num": this.num_,
            "offset": this.offset_,
            "filter": this.category_,
            "offerItems": e.offerItems_.join(),
            "offerData": JSON.stringify({datas:e.offerData_}),
            "requestItems": e.requestItems_.join(),
            "requestData": JSON.stringify({datas:e.requestData_})
        };
        _H_U_._t2(_local5, Account._get().credentials());
        this._3v.addEventListener(_8C_.GENERIC_DATA, this._L_5);
        this._3v.addEventListener(_mS_.TEXT_ERROR, this._ix);
        this._3v.sendRequest("list", _local5);
    }

    private function buildCategoryButtons(){
        this.allButton_ = new TextButton(18, false, "", true);
        this.allButton_.text_.setBold(true);
        this.allButton_.text_.text = "All Trades";
        this.allButton_.text_.textColor = 0xB3B3B3;
        this.allButton_.text_.updateMetrics();
        this.allButton_.x = 18;
        this.allButton_.y = 75;
        this.allButton_.addEventListener(MouseEvent.CLICK, this.categoryAll);
        addChild(this.allButton_);
        this.mineButton_ = new TextButton(18, false, "", true);
        this.mineButton_.text_.setBold(true);
        this.mineButton_.text_.text = "My Trades";
        this.mineButton_.text_.textColor = 0xB3B3B3;
        this.mineButton_.text_.updateMetrics();
        this.mineButton_.x = 18 + 150;
        this.mineButton_.y = 75;
        this.mineButton_.addEventListener(MouseEvent.CLICK, this.categoryMine);
        addChild(this.mineButton_);
        this.searchButton_ = new TextButton(18, false, "", true);
        this.searchButton_.text_.setBold(true);
        this.searchButton_.text_.text = "Search";
        this.searchButton_.text_.textColor = 0xB3B3B3;
        this.searchButton_.text_.updateMetrics();
        this.searchButton_.x = 18 + 150 + 150;
        this.searchButton_.y = 75;
        this.searchButton_.addEventListener(MouseEvent.CLICK, this.categorySearch);
        addChild(this.searchButton_);
    }

    private function _L_5(_arg1:_8C_):void {
        this.build(XML(_arg1.data_));
    }

    private function _ix(_arg1:_mS_):void {
        this._j7.text = _arg1.text_;
    }

    private function _A_E_(_arg1:Event):void {
        this._0A_z.y = (-(this._E_k._Q_D_()) * ((this._0A_z.height + 12) - 400));
    }

    private function _B_E_(_arg1:Event):void {
        this._0A_z.y = (-(this._E_k._Q_D_()) * ((this._0A_z.height + 70) - 400));
    }

    private function checkScroll(event:Event):void {
        if(this._E_k != null && this.contains(this._E_k)) {
            this.removeChild(this._E_k);
            this._E_k = null;
        }
        if (this._0A_z.height > 400) {
            this._E_k = new _0K_B_(16, 400);
            this._E_k.x = ((800 - this._E_k.width) - 4);
            this._E_k.y = 110;
            this._E_k._fA_(400, this._0A_z.height + 70);
            this._E_k.addEventListener(Event.CHANGE, this._B_E_);
            addChild(this._E_k);
        }
    }

    private function categoryAll(event:MouseEvent):void {
        if(this.category_ != "all") {
            this.category_ = "all";
            this.rebuild();
        }
    }

    private function categoryMine(event:MouseEvent):void {
        if(this.category_ != "mine") {
            this.category_ = "mine";
            this.rebuild();
        }
    }

    private function categorySearch(event:MouseEvent):void {
        if(this.category_ != "search") {
            this.category_ = "search";
            this.rebuild();
        }
    }
}
}//package _sP_

