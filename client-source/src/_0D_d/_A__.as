// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_d._A__

package _0D_d {
import flash.display.Sprite;

import _5H_._xY_;

import com.company.assembleegameclient.util.offer.Offer;

import _5H_._R_h;
import _5H_._ii;

import flash.display.BitmapData;

import com.company.ui.SimpleText;

import flash.events.MouseEvent;
import flash.display.Bitmap;

import com.company.util.AssetLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.util.BitmapUtil;

import flash.filters.DropShadowFilter;

public class _A__ extends Sprite implements _xY_ {

    private static const _K_A_:int = 0x721100;
    private static const _00O_:int = 0x4C0C00;
    private static const _9O_:int = 0x340800;

    public function _A__(_arg1:Offer, _arg2:String, _arg3:String) {
        this.offer = _arg1;
        this._yI_ = _arg2;
        this._Q_W_ = _arg3;
        this._A_q();
        this._hA_();
        this._k_();
        this._o();
        this._O_u();
        this._M_M_();
        this._L_6();
        this._th();
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }
    public var offer:Offer;
    public var _yI_:String;
    public var _Q_W_:String;
    private var background:_R_h;
    private var container:Sprite;
    private var _01X_:_ii;
    private var _zZ_:BitmapData;
    private var _i6:SimpleText;
    private var _fu:SimpleText;
    private var _E_n:SimpleText;
    private var taglineText:SimpleText;
    private var _O_e:Boolean;
    private var _052:Boolean;

    public function getValue():String {
        return (this.offer.realmGold_.toString());
    }

    public function _P_Y_(_arg1:Boolean):void {
        this._052 = _arg1;
        this._06f();
    }

    public function setSelected(_arg1:Boolean):void {
        this._O_e = _arg1;
        this._01X_.setSelected(_arg1);
        this._06f();
    }

    public function showBonus(_arg1:Boolean):void {
        if (this._E_n) {
            this._E_n.visible = _arg1;
        }
    }

    private function _A_q():void {
        this.background = new _R_h();
        this.background._H_9(520, 36);
        this._06f();
        addChild(this.background);
    }

    private function _hA_():void {
        this.container = new Sprite();
        this.container.x = (this.container.y = 3);
        addChild(this.container);
    }

    private function _k_():void {
        this._01X_ = new _ii();
        this._01X_.x = 3;
        this.container.addChild(this._01X_);
    }

    private function _o():void {
        var _local1:Bitmap;
        this._zZ_ = AssetLibrary._xK_("lofiObj3", 225);
        this._zZ_ = TextureRedrawer.redraw(this._zZ_, 50, true, 0, 0, false);
        this._zZ_ = BitmapUtil._Y_d(this._zZ_, 8, 8, (this._zZ_.width - 16), (this._zZ_.height - 16));
        _local1 = new Bitmap(this._zZ_);
        _local1.x = (this._01X_.x + 35);
        this.container.addChild(_local1);
    }

    private function _O_u():void {
        this._i6 = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._i6.text = (this.offer.realmGold_ + " Gold");
        this._i6.setBold(true);
        this._i6.updateMetrics();
        this._i6.x = (this._01X_.x + 70);
        this._i6.y = ((this._zZ_.height / 2) - (this._i6.height / 2));
        this._i6.filters = [new DropShadowFilter(0, 0, 0)];
        this.container.addChild(this._i6);
    }

    private function _M_M_():void {
        this._fu = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._fu.text = ((this._yI_ + this.offer.price_) + this._Q_W_);
        this._fu.setBold(true);
        this._fu.updateMetrics();
        this._fu.x = 200;
        this._fu.y = ((this._zZ_.height / 2) - (this._fu.height / 2));
        this._fu.filters = [new DropShadowFilter(0, 0, 0)];
        this.container.addChild(this._fu);
    }

    private function _L_6():void {
        if (this.offer.bonus == 0) {
            return;
        }
        this._E_n = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._E_n.text = (this.offer.bonus + "% Bonus");
        this._E_n.setBold(true);
        this._E_n.updateMetrics();
        this._E_n.x = 280;
        this._E_n.y = ((this._zZ_.height / 2) - (this._E_n.height / 2));
        this._E_n.filters = [new DropShadowFilter(0, 0, 0)];
        this.container.addChild(this._E_n);
    }

    private function _th():void {
        if (this.offer.tagline != null) {
            this.makeTaglineText();
        }
    }

    private function makeTaglineText():void {
        this.taglineText = new SimpleText(18, 8891485, false, 0, 0, "Myriad Pro");
        this.taglineText.text = this.offer.tagline;
        this.taglineText.updateMetrics();
        this.taglineText.x = 400;
        this.taglineText.y = ((this._zZ_.height / 2) - (this.taglineText.height / 2));
        this.taglineText.filters = [new DropShadowFilter(0, 0, 0)];
        this.container.addChild(this.taglineText);
    }

    private function _06f():void {
        var _local1:int = ((this._O_e) ? _K_A_ : ((this._052) ? _00O_ : _9O_));
        this.background._gp(_local1);
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this._P_Y_(true);
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this._P_Y_(false);
    }

}
}//package _0D_d

