// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1.CurrentCharacterScreen

package _F_1 {
    import _02t._R_f;
    import _0D_d._T_K_;
    import _0L_C_._4B_;
    import _0L_C_._qO_;
    import _S_K_._u3;
    import _nA_._ax;
    import _qN_.Account;
    import _sp._aJ_;
    import com.company.assembleegameclient.appengine.Server_list;
    import com.company.assembleegameclient.screens.charrects.CharacterRect;
    import com.company.assembleegameclient.ui.TextButton;
    import com.company.assembleegameclient.ui.ui_goldcoin;
    import com.company.assembleegameclient.ui._0K_B_;
import com.company.assembleegameclient.ui._1B_v;
import com.company.googleanalytics.GA;
    import com.company.rotmg.graphics.ScreenGraphic;
    import com.company.ui.SimpleText;
    import flash.display.Graphics;
    import flash.display.Shape;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.filters.DropShadowFilter;
    import flash.geom.Rectangle;
    import flash.text.TextFieldAutoSize;
    import flash.ui.Mouse;

    import spark.primitives.Rect;

    public class CurrentCharacterScreen extends _05p {

        public function CurrentCharacterScreen() {
            addChild(new _charscreen());
            if (Account._get().isRegistered()) {
                this._qR_ = new _H_o("play", 36, true);
                this._0G_N_ = new _H_o("classes", 22, false);
            } else {
                this._qR_ = new _H_o("", 0, true);
                this._0G_N_ = new _H_o("", 0, false);
            }
            this._p6 = new _H_o("main", 22, false);
            super(CurrentCharacterScreen);
            this._n7 = new _aJ_();
            this.newCharacter = new _aJ_();
            this.close = new _u3(this._p6, MouseEvent.CLICK);
            this._1V_ = new _u3(this._0G_N_, MouseEvent.CLICK);
            this.chooseName = new _aJ_();
            this._D_u = new _aJ_();
        }
        public var close:_aJ_;
        public var _n7:_aJ_;
        public var newCharacter:_aJ_;
        public var _1V_:_aJ_;
        public var chooseName:_aJ_;
        public var _D_u:_aJ_;
        public var _lR_:_ax;
        private var model:Server_list;
        private var nameText_:SimpleText;
        private var _0_9:TextButton;
        private var _H_t:ui_goldcoin;
        private var _H_T_:_1B_v;
        private var _G_d:TextButton; //:SimpleText;
        private var _A_e:TextButton; //:SimpleText;
        private var _Q_f:SimpleText;
        private var _X_0:CharsAndNews;
        private var _X_1:CharsAndNews;
        private var _77:Number;
        private var _qR_:_H_o;
        private var _p6:_H_o;
        private var _0G_N_:_H_o;
        private var _dL_:Shape;
        private var _E_k:_0K_B_;
        private var curState:int = 1;

        public function _u_():void {
            this._lR_ = new _ax();
            this._lR_.x = 39;
            this._lR_.y = 33;
            addChild(this._lR_);
        }

        override public function initialize(_arg1:Server_list):void {
            super.initialize(_arg1);
            this.model = _arg1;
            this.buildUI(_arg1);
        }

        private function buildUI(_arg1:Server_list):void{
            this.buildName();
            this.buildCurrencies();
            this.buildNewsText();
            this.buildNewsSection();
            this.buildBoundaries();
            this.buildCharacterText();
            var _local2:News = new News(_arg1, 2);
            if (_local2.isDeath()){
                this.buildGraveText();
            }
            this.buildCharacters();
            this.buildNavBar();
            if (!_arg1._hv) {
                this.buildChooseName();
            }
        }

        function _str7249():Rectangle{
            var _local1:Rectangle = new Rectangle();
            if (stage){
                _local1 = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
            }
            return (_local1);
        }

        private function buildNavBar():void{
            //addChild(new ScreenGraphic());
            this._qR_.addEventListener(MouseEvent.CLICK, this._04P_);
            this._qR_.x = ((800 / 2) - (this._qR_.width / 2));
            this._qR_.y = 545;
            addChild(this._qR_);
            this._p6.x = (((800 / 2) - (this._p6.width / 2)) - 94);
            this._p6.y = 555;
            addChild(this._p6);
            this._0G_N_.x = (((800 / 2) - (this._0G_N_.width / 2)) + 96);
            this._0G_N_.y = 555;
            addChild(this._0G_N_);
        }
        private function buildName():void{
            this.nameText_ = new SimpleText(22, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this.nameText_.setBold(true);
            this.nameText_.text = this.model.name_;
            this.nameText_.updateMetrics();
            this.nameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this.nameText_.y = 24;
            this.nameText_.x = ((this._str7249().width / 2) - (this.nameText_.width / 2));
            addChild(this.nameText_);
        }
        private function buildChooseName():void{
            this._0_9 = new TextButton(16, false, "");
            this._0_9.text_.setBold(true);
            this._0_9.text_.text = "choose name";
            this._0_9.text_.updateMetrics();
            this._0_9.addEventListener(MouseEvent.CLICK, this._fT_);
            this._0_9.y = 50;
            this._0_9.text_.autoSize = TextFieldAutoSize.CENTER;
            this._0_9.x = ((this._str7249().width / 2) - (this._0_9.width / 2));
            addChild(this._0_9);
        }
        private function buildCurrencies():void{
            buildGoldFame();
            buildKeys();
        }
        private function buildGoldFame():void{
            this._H_t = new ui_goldcoin();
            this._H_t.draw(this.model.credits_, this.model.fame_);
            this._H_t.x = this._str7249().width;
            this._H_t.y = 20;
            addChild(this._H_t);
        }
        private function buildKeys():void{
            this._H_T_ = new _1B_v();
            this._H_T_.draw(this.model.keys_);
            this._H_T_.x = this._str7249().width;
            this._H_T_.y = 44;
            addChild(this._H_T_);
        }
        private function buildNewsText():void{
            this._Q_f = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this._Q_f.setBold(true);
            this._Q_f.text = "News";
            this._Q_f.updateMetrics();
            this._Q_f.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this._Q_f.x = 475;
            this._Q_f.y = 79;
            addChild(this._Q_f);
        }
        private function buildBoundaries():void{
            this._dL_ = new Shape();
            this._dL_.graphics.clear();
            this._dL_.graphics.lineStyle(3, 0xFFFFFF);
            this._dL_.graphics.moveTo(0, 106);
            this._dL_.graphics.lineTo(this._str7249().width, 106);
          //  this._dL_.graphics.moveTo(466, 107);
          //  this._dL_.graphics.lineTo(466, 526);
            this._dL_.graphics.lineStyle();
            addChild(this._dL_);
        }
        private function buildCharacterText():void{
            this._A_e = new TextButton(18, false, "", true);
            this._A_e.text_.setBold(true);
            this._A_e.text_.text = "Characters";
            this._A_e.text_.textColor = 0xFFFFFF;
            this._A_e.text_.updateMetrics();
            this._A_e.x = 18;
            this._A_e.y = 79;
            this._A_e.addEventListener(MouseEvent.CLICK, this.selectChar)
            addChild(this._A_e);
        }
        private function buildGraveText():void{
            this._G_d = new TextButton(18, false, "", true);
            this._G_d.text_.setBold(true);
            this._G_d.text_.text = "Graveyard";
            this._G_d.text_.textColor = 0xFFFFFF;
            this._G_d.text_.updateMetrics();
            this._G_d.x = 18 + 150;
            this._G_d.y = 79;
            this._G_d.addEventListener(MouseEvent.CLICK, this.selectGraveyard);
            addChild(this._G_d);
        }
        private function buildScroll():void{
            this._E_k = new _0K_B_(16, 399);
            this._E_k.x = 443;
            this._E_k.y = 113;
            this._E_k._fA_(399, this._X_0.height);
            this._E_k.addEventListener(Event.CHANGE, this._A_E_);
            addChild(this._E_k);
        }

        private function buildCharacters():void{
            this.curState = CharsAndNews.charState;
            this._X_0 = new CharsAndNews(this.model, this, CharsAndNews.charState);
            this._X_0.x = 14;
            this._X_0.y = 108;
            this._77 = this._X_0.height;
            if (this._77 > 400) {
                this.buildScroll();
            }
            addChild(this._X_0);
        }
        private function buildGraveyard():void{
            this.curState = CharsAndNews.graveState;
            this._X_0 = new CharsAndNews(this.model, this, CharsAndNews.graveState);
            this._X_0.x = 10;
            this._X_0.y = 108;
            this._77 = this._X_0.height;
            if (this._77 > 400) {
                this.buildScroll();
            }
            addChild(this._X_0);
        }
        private function buildNewsSection():void{
            this._X_1 = new CharsAndNews(this.model, this, 3);
            this._X_1.x = 460;
            this._X_1.y = 108;
            addChild(this._X_1);
        }

        private function swap():void{
            if (this._X_0 != null) {
                removeChild(this._X_0);
                this._X_0 = null;
            }
            if (this._E_k != null) {
                removeChild(this._E_k);
                this._E_k = null;
            }
        }
        private function selectChar(_arg1:MouseEvent):void{
            if (this.curState != CharsAndNews.charState){
                this.swap();
                this.buildCharacters();
            }
        }
        private function selectGraveyard(_arg1:MouseEvent):void{
            if (this.curState != CharsAndNews.graveState){
                this.swap();
                this.buildGraveyard();
            }
        }

        private function _fT_(_arg1:Event):void {
            var _local3:_4B_;
            if (!Account._get().isRegistered()) {
                _local3 = new _4B_();
                _local3.addEventListener(_qO_.BUTTON1_EVENT, this._4);
                _local3.addEventListener(_qO_.BUTTON2_EVENT, this.onDialogRegister);
                addChild(_local3);
                return;
            }
            var _local2:_T_K_ = new _T_K_();
            _local2.addEventListener(Event.COMPLETE, this._0G_V_);
            addChild(_local2);
        }

        private function _0G_V_(_arg1:Event):void {
            this.chooseName.dispatch();
        }

        private function _4(_arg1:Event):void {
            var _local2:_qO_ = (_arg1.currentTarget as _qO_);
            removeChild(_local2);
        }

        private function onDialogRegister(_arg1:Event):void {
            var _local2:_qO_ = (_arg1.currentTarget as _qO_);
            removeChild(_local2);
            _0j();
        }

        private function _A_E_(_arg1:Event):void {
            this._X_0._0D__((-(this._E_k._Q_D_()) * (this._77 - 400)));
        }

        private function _04P_(_arg1:Event):void {
            if (this.model.numChars_ == 0 && this.model.hasAvailableCharSlot()) {
                this.newCharacter.dispatch();
            } else {
                this._D_u.dispatch();
            }
        }

    }
}//package _F_1

