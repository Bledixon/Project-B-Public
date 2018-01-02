// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._0B_X_

package com.company.assembleegameclient.ui {
    import _011.ItemSelectStart;

  import com.company.assembleegameclient.parameters.Parameters;

  import flash.display.BitmapData;

  import flash.display.Sprite;

    import com.company.assembleegameclient.game.GameSprite;

    import flash.display.Shape;

    import _panels._Q_V_;

    import flash.events.Event;

    import _011._S_M_;
    import _011._Z_J_;
    import _011._qe;

    import com.company.util._O_m;
    import com.company.assembleegameclient.objects.Player;

    import flash.display.Graphics;

    public class _0B_X_ extends Sprite {

      [Bindable]
      [Embed(source="/assets/GUI.png")]
      private var GUI:Class;
      [Embed(source="/assets/GUI_Dark.png")]
      private var GUI_Dark:Class;
      [Embed(source="/assets/GUI_Dark_Pink.png")]
      private var GUI_Dark_Pink:Class;
      [Embed(source="/assets/GUI_Darker_Pink.png")]
      private var GUI_Darker_Pink:Class;

        private static const _08A_:int = 4;
        private static const _0D_Q_:int = 8;

        public function _0B_X_(_arg1:GameSprite, _arg2:int, _arg3:int) {
            this._3S_ = new _return(184, 0x2D2D2D);
            super();
            this.gs_ = _arg1;
            this.w_ = _arg2;
            this.h_ = _arg3;
            this._L_C_ = false;
            mouseEnabled = true;
            mouseChildren = true;
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        public var _F_:_ej = null;
        public var _02y:InvTabs;
        public var _U_T_:_Q_V_;
        public var _6K_:_zg = null;
        public var itemSelect_:ItemSelect = null;
        private var gs_:GameSprite;
        private var w_:int;
        private var h_:int;
        private var _L_C_:Boolean;
        private var background_:Shape;
        private var _3S_:_return;

        public function initialize():void {
            this._4T_();
        }

        public function dispose():void {
            if (this._F_ != null) {
                if (contains(this._F_)) {
                    removeChild(this._F_);
                }
                this._F_.dispose();
                this._F_ = null;
            }
            if (this._02y != null) {
                if (contains(this._02y)) {
                    removeChild(this._02y);
                }
                this._02y = null;
            }
        }

        public function _0L_v(_arg1:_S_M_):void {
            if (this._6K_ != null) {
                return;
            }
            this._6K_ = new _zg(this.gs_, _arg1);
            this._6K_.y = 200;
            this._6K_.addEventListener(Event.CANCEL, this._05I_);
        }

        public function selectItem(_arg1:ItemSelectStart):void {
            if(this._02y == null) {
                return;
            }
            this._02y.selectItems(_arg1);
        }

        public function _ss(_arg1:_Z_J_):void {
            if (this._6K_ == null) {
                return;
            }
            this._6K_._hf(_arg1.offer_);
        }

        public function _A_a():void {
            this._0L_A_();
        }

        public function _mH_(_arg1:_qe):void {
            if (this._6K_ == null) {
                return;
            }
            this._6K_._C_D_(_arg1.myOffer_, _arg1.yourOffer_);
        }

        public function draw():void {
            if (this.gs_.map_.player_ == null) {
                return;
            }
            if (!this._L_C_) {
                this._loadGUIBG();
                _O_m._041(this, this._F_);
                this._0J_s();
                this._L_C_ = true;
            }
            this._F_.draw();
            if (this._6K_ != null) {
                this._3S_.visible = false;
                _O_m._03d(this, this._02y);
                _O_m._03d(this, this._U_T_);
                _O_m._041(this, this._6K_);
            } else {
                this._3S_.visible = false;
                _O_m._041(this, this._02y);
                _O_m._041(this, this._U_T_);
                this._02y.draw();
                this._U_T_.draw();
            }
        }

        private function _0L_A_():void {
            if (this._6K_ != null) {
                this._6K_.removeEventListener(Event.CANCEL, this._05I_);
                _O_m._03d(this, this._6K_);
                this._6K_ = null;
            } else if (this._02y != null && this._02y.itemSelect_ != null) {
                this._02y.cancelSelect();
            }
        }

        private function _4T_():void {
            this._F_ = new _ej(this.gs_.map_, (200 - (2 * _08A_)), (200 - (2 * _08A_)));
            this._F_.x = _08A_;
            this._F_.y = _08A_;
        }

        private function _0J_s():void {
            var _local1:Player;
            _local1 = this.gs_.map_.player_;
            this._02y = new InvTabs(this.gs_, _local1, 200, 300);
            this._02y.y = 200;
            this._U_T_ = new _Q_V_(this.gs_, _local1, 200, 135);
            this._U_T_.x = 0;
            this._U_T_.y = 475;
        }

        public function _loadGUIBG():void {
            this.background_ = new Shape();
            var _local1:Graphics = this.background_.graphics;
            var _GUI:BitmapData = new GUI().bitmapData;
            var _GUI_Dark:BitmapData = new GUI_Dark().bitmapData;
            var _GUI_Dark_Pink:BitmapData = new GUI_Dark_Pink().bitmapData;
            var _GUI_Darker_Pink:BitmapData = new GUI_Darker_Pink().bitmapData;
            _local1.clear();
            switch (Parameters.data_.GUI_screen)
            {
              case 0: _local1.beginFill(0x2A2A2A); break;
              case 1: _local1.beginBitmapFill(_GUI); break;
              case 2: _local1.beginBitmapFill(_GUI_Dark); break;
              case 3: _local1.beginBitmapFill(_GUI_Dark_Pink); break;
              case 4: _local1.beginBitmapFill(_GUI_Darker_Pink); break;
            }
            _local1.drawRect(0, 0, this.w_, this.h_);
            _local1.endFill();
            addChild(this.background_);
            this._3S_.x = 8;
            this._3S_.y = 500;
            //addChild(this._3S_); //Disable if adding HP/MP pot buttons
        }

        private function _05I_(_arg1:Event):void {
            this._0L_A_();
        }

        private function onEnterFrame(_arg1:Event):void {
            this.draw();
        }

        private function onAddedToStage(_arg1:Event):void {
            stage.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }

        private function onRemovedFromStage(_arg1:Event):void {
            stage.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }

    }
}//package com.company.assembleegameclient.ui

